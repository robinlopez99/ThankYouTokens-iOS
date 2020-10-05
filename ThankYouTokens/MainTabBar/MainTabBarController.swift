//
//  MainTabBarController.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/21/20.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let home = HomeCoordinator(navigationController: UINavigationController())
    let profile = ProfileCoordinator(navigationController: UINavigationController())
    let account = AccountCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()
        startCoordinators()
        configureTabBar()
    }
    
    private func configureTabBar() {
        tabBar.barTintColor = UIColor.appColors.black
        home.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        profile.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        account.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 3)
        
        viewControllers = [home.navigationController, account.navigationController, profile.navigationController]
    }
    
    private func startCoordinators() {
        home.start()
        profile.start()
        account.start()
    }
}
