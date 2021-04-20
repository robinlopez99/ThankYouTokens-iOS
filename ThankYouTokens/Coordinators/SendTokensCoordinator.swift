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
    var user: UserModel
    let imageSaver = ImageSaver()
    let qrGenerator = QRGenerator()
    
    var delegate: SendTokensCoordinatorDelegate?
    
    init(navigationController: UINavigationController, user: UserModel) {
        self.navigationController = navigationController
        self.user = user
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
        let post = firestore.postTransaction(userId: "\(user.userId)", amount: amount)
        let qr = qrGenerator.generateQRCode(from: "[\(user.userId),\(post)]")
        if let qr = qr {
            viewcontroller?.configureQr(qrCode: qr)
            imageSaver.writeToPhotoAlbum(image: qr)
        }
    }
    
    func closePressed() {
        delegate?.closePressed()
    }
}
