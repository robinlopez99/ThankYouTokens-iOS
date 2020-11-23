//
//  AppCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/22/20.
//

import UIKit
import FirebaseAuth


class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    var user: UserModel
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: true)
        self.user = UserModel(isLoggedIn: false, userId: "")
    }
    
    func start() {
        showLogin()
    }
    
    func showLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: self.navigationController, user: self.user)
        self.childCoordinators.append(loginCoordinator)
        loginCoordinator.delegate = self
        loginCoordinator.start()
    }
    
    func showMain(user: UserModel) {
        let tabBar = MainTabBarController()
        navigationController.pushViewController(tabBar, animated: true)
    }
    
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func goToHome(user: UserModel) {
        self.dismiss(showNavBar: false)
        self.user = user
        showMain(user: user)
    }
}
