//
//  AppCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/22/20.
//

import UIKit


class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        showLogin()
    }
    
    func showLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: self.navigationController)
        self.childCoordinators.append(loginCoordinator)
        loginCoordinator.delegate = self
        loginCoordinator.start()
    }
    
    func showMain() {
        let tabBar = MainTabBarController()
        navigationController.pushViewController(tabBar, animated: false)
    }
    
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func loginPressed() {
        self.showMain()
    }
}