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
    let aboutUs = AboutUsCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()
        startCoordinators()
        configureTabBar()
    }
    
    private func configureTabBar() {
        tabBar.barTintColor = UIColor.appColors.darkGray
        
        home.navigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 1)
        account.navigationController.tabBarItem = UITabBarItem(title: "Account", image: UIImage(named: "account"), tag: 2)
        profile.navigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 3)
        aboutUs.navigationController.tabBarItem = UITabBarItem(title: "About", image: UIImage(named: "aboutUs"), tag: 4)
        
        viewControllers = [home.navigationController, account.navigationController, profile.navigationController, aboutUs.navigationController]
    }
    
    private func startCoordinators() {
        home.start()
        profile.start()
        account.start()
        aboutUs.start()
    }
}
