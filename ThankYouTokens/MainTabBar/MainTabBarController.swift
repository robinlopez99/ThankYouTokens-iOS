//
//  MainTabBarController.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/21/20.
//

import UIKit

class MainTabBarController: UITabBarController, Storyboarded {
    
    var user: UserModel
    var home: HomeCoordinator = HomeCoordinator(navigationController: UINavigationController())
    var profile: ProfileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
    var account: AccountCoordinator = AccountCoordinator(navigationController: UINavigationController())
    var aboutUs: AboutUsCoordinator = AboutUsCoordinator(navigationController: UINavigationController())
    
    init(user: UserModel) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCoordinators()
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
    
    private func initCoordinators() {
        home.start()
        profile.start()
        account.start()
        aboutUs.start()
    }
}
