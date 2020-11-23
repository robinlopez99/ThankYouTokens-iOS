//
//  LoginCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/21/20.
//

import UIKit
import FirebaseAuth

protocol LoginCoordinatorDelegate {
    func goToHome(user: UserModel)
}

class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var delegate: LoginCoordinatorDelegate?
    let firestore = FirestoreService()
    var user: UserModel
    
    init(navigationController: UINavigationController, user: UserModel) {
        self.navigationController = navigationController
        self.user = user
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        let vc = LoginViewController.instantiate()
        vc.coordinator = self
        vc.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func loginButtonPressed(username: String, password: String) {
        Auth.auth().signIn(withEmail: username, password: password) { [weak self] authResult, error in
            if error != nil {
                self?.showAlertDialogue(title: AppStrings.loginStrings.errors.wrongEmailPass,
                                        message: AppStrings.loginStrings.errors.wrongEmailPass)
            } else {
                if let uid = authResult?.user.uid {
                    self?.user.userId = uid
                    self?.user.isLoggedIn = true
                    self?.firestore.getData(userId: uid)
                } else {
                    self?.showAlertDialogue(title: "Error",
                                            message: "There was an error retrieving your account. Please try again.")
                }
            }
        }
    }
    
    func createNewAccount() {
        let createAccountCoord = CreateAccountCoordinator(navigationController: self.navigationController, user: self.user)
        self.childCoordinators.append(createAccountCoord)
        createAccountCoord.delegate = self
        createAccountCoord.start()
    }
}

extension LoginCoordinator: CreateAccountCoordinatorDelegate {
    func goToHome(user: UserModel) {
        self.dismiss(showNavBar: false)
        delegate?.goToHome(user: user)
    }
    
    func closePressed() {
        self.dismiss(showNavBar: false)
    }
}
