//
//  SendTokensCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 11/2/20.
//

import UIKit

protocol SendTokensCoordinatorDelegate {
    func closePressed()
}

class SendTokensCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    var delegate: SendTokensCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SendTokensViewController.instantiate()
        vc.coordinator = self
        vc.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
}

extension SendTokensCoordinator: SendTokensViewControllerDelegate {
    func closePressed() {
        delegate?.closePressed()
    }
}
