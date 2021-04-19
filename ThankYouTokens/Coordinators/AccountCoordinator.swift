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
    var user: UserModel
    
    init(navigationController:UINavigationController, user: UserModel) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
        self.user = user
    }
    
    func start() {
        let viewModel = AccountViewControllerViewModel(tokenBalance: user.token_balance)
        let vc = AccountViewController.instantiate()
        vc.viewModel = viewModel
        vc.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }
}

extension AccountCoordinator: AccountViewControllerDelegate {
    func sendTokensPressed() {
        let sendTokensCoord = SendTokensCoordinator(navigationController: navigationController, user: user)
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
