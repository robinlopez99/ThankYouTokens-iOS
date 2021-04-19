//
//  SendTokensCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 11/2/20.
//

import UIKit

protocol SendTokensCoordinatorDelegate {
    func closePressed()
}

class SendTokensCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    let firestore = FirestoreService()
    var viewcontroller: SendTokensViewController?
    
    var delegate: SendTokensCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        viewcontroller = SendTokensViewController.instantiate()
        if let vc = viewcontroller {
            vc.coordinator = self
            vc.delegate = self
            navigationController.pushViewController(vc, animated: true)
        }
    }
}

extension SendTokensCoordinator: SendTokensViewControllerDelegate {
    func tokensSent(amount: Int) {
        let post = firestore.postTransaction(userId: "cRAu3MBPD1ggcIkkDhGZBKIZx0J3", amount: amount)
        
        if !post {
            guard let qr = generateQRCode(from: "this is a test") else {
                return
            }
            viewcontroller?.configureQr(qrCode: qr)
        }
    }
    
    func closePressed() {
        delegate?.closePressed()
    }
}
