//
//  AccountCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/24/20.
//

import UIKit

class AccountCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var user: UserModel
    let qrGenerator = QRGenerator()
    
    init(navigationController:UINavigationController, user: UserModel) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
        self.user = user
    }
    
    func start() {
        let viewModel = AccountViewControllerViewModel(tokenBalance: user.token_balance)
        let vc = AccountViewController.instantiate()
        vc.viewModel = viewModel
        vc.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }
}

extension AccountCoordinator: AccountViewControllerDelegate {
    func sendTokensPressed() {
        let sendTokensCoord = SendTokensCoordinator(navigationController: navigationController, user: user)
        childCoordinators.append(sendTokensCoord)
        sendTokensCoord.delegate = self
        sendTokensCoord.start()
    }
    
    func receiveTokensPressed() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        navigationController.present(imagePicker, animated: true)
    }
}

extension AccountCoordinator: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
           let features = qrGenerator.detectQRCode(image),
           !features.isEmpty {
                for case let row as CIQRCodeFeature in features {
                    print(row.messageString ?? "nope")
                }
            }
        navigationController.dismiss(animated: true)
    }
    
}

extension AccountCoordinator: SendTokensCoordinatorDelegate {
    func closePressed() {
        self.dismiss(showNavBar: false)
    }
}
