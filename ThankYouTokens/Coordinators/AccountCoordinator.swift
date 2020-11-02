//
//  AccountCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/24/20.
//

import UIKit

class AccountCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        let vc = AccountViewController.instantiate()
        vc.coordinator = self
        vc.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }
}

extension AccountCoordinator: AccountViewControllerDelegate {
    func sendTokensPressed() {
        let sendTokensCoord = SendTokensCoordinator(navigationController: navigationController)
        childCoordinators.append(sendTokensCoord)
        sendTokensCoord.delegate = self
        sendTokensCoord.start()
    }
}

extension AccountCoordinator: SendTokensCoordinatorDelegate {
    func closePressed() {
        self.dismiss(showNavBar: false)
    }
}
