//
//  Coordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/21/20.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}

extension Coordinator {
    func dismiss(showNavBar: Bool) {
        navigationController.popViewController(animated: true)
        self.childCoordinators.removeLast()
        navigationController.isNavigationBarHidden = !showNavBar
    }
}
