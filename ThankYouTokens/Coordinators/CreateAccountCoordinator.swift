//
//  CreateAccountCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 11/2/20.
//

import UIKit

protocol CreateAccountCoordinatorDelegate {
    func closePressed()
}

class CreateAccountCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var delegate: CreateAccountCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        vc.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
}

extension CreateAccountCoordinator: CreateAccountViewControllerDelegate {
    func closePressed() {
        self.delegate?.closePressed()
    }
}
