//
//  AboutUsCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 10/22/20.
//

import UIKit

class AboutUsCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        let vc = AboutUsViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}

