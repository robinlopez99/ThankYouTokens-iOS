//
//  TabBarCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 4/18/21.
//

import UIKit

class TabBarCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var user: UserModel
    
    init(navigationController: UINavigationController, user: UserModel) {
        self.navigationController = navigationController
        self.user = user
    }
    
    func start() {
        let vc = MainTabBarController(user: user)
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
