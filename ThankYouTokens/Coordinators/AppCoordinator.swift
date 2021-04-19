//
//  AppCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/22/20.
//

import UIKit
import FirebaseAuth


class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var firestore = FirestoreService()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        showLogin()
    }
    
    func showLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: self.navigationController)
        self.childCoordinators.append(loginCoordinator)
        loginCoordinator.delegate = self
        loginCoordinator.start()
    }
    
    func showMain(user: UserModel) {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController, user: user)
        self.childCoordinators.append(tabBarCoordinator)
        tabBarCoordinator.start()
    }
    
    func fetch(userId: String) {

        firestore.getUserData(userId: userId, completion: { user in
            self.showMain(user: user)
        })
    }
    
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func loginAttempt(username: String, password: String) {
        Auth.auth().signIn(withEmail: username, password: password) { [weak self] authResult, error in
            if error != nil {
                self?.showAlertDialogue(title: AppStrings.loginStrings.errors.wrongEmailPass,
                                        message: AppStrings.loginStrings.errors.wrongEmailPass)
            } else {
                if let id = authResult?.user.uid {
                    self?.fetch(userId: id)
                } else {
                    self?.showAlertDialogue(title: "Error",
                                            message: "There was an error retrieving your account. Please try again.")
                }
            }
        }
    }
    
    func goToHomeAfterCreate(user: UserModel) {
        self.dismiss(showNavBar: false)
        showMain(user: user)
    }
}
