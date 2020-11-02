//
//  LoginCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/21/20.
//

import UIKit

protocol LoginCoordinatorDelegate {
    func loginPressed(username: String, password:String)
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
        delegate?.loginPressed(username: username, password: password)
    }
    
    func createNewAccount() {
        let createAccountCoord = CreateAccountCoordinator(navigationController: navigationController)
        self.childCoordinators.append(createAccountCoord)
        createAccountCoord.delegate = self
        createAccountCoord.start()
    }
}

extension LoginCoordinator: CreateAccountCoordinatorDelegate {
    func closePressed() {
        self.dismiss(showNavBar: false)
    }
}
