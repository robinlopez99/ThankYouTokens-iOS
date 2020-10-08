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
        navigationController.pushViewController(vc, animated: false)
    }
    
    
}
