//
//  LoginCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/21/20.
//

import UIKit

protocol LoginCoordinatorDelegate {
    func loginPressed()
}

class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var delegate: LoginCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LoginViewController.instantiate()
        vc.coordinator = self
        vc.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func loginButtonPressed() {
        delegate?.loginPressed()
    }
}
