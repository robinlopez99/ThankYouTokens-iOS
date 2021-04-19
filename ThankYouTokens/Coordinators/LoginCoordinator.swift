//
//  LoginCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/21/20.
//

import UIKit
import FirebaseAuth

protocol LoginCoordinatorDelegate {
    func goToHomeAfterCreate(user: UserModel)
    func loginAttempt(username: String, password: String)
}

class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var delegate: LoginCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
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
        print("here 2")
        delegate?.loginAttempt(username: username, password: password)
    }
    
    func createNewAccount() {
        let createAccountCoord = CreateAccountCoordinator(navigationController: self.navigationController)
        self.childCoordinators.append(createAccountCoord)
        createAccountCoord.delegate = self
        createAccountCoord.start()
    }
}

extension LoginCoordinator: CreateAccountCoordinatorDelegate {
    func goToHome(user: UserModel) {
        self.dismiss(showNavBar: false)
        delegate?.goToHomeAfterCreate(user: user)
    }
    
    func closePressed() {
        self.dismiss(showNavBar: false)
    }
}
