//
//  ProfileCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/21/20.
//

import UIKit

class ProfileCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var user: UserModel
    
    init(navigationController: UINavigationController, user: UserModel) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
        self.user = user
    }
    
    func start() {
        let profileViewModel = ProfileViewControllerViewModel(email: user.email,
                                                              first_name: user.first_name,
                                                              last_name: user.last_name)
        let vc = ProfileViewController.instantiate()
        vc.coordinator = self
        vc.viewModel = profileViewModel
        navigationController.pushViewController(vc, animated: false)
    }
    
    
}
