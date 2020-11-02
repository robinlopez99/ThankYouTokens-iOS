//
//  SendTokensViewController.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 11/2/20.
//

import UIKit

protocol SendTokensViewControllerDelegate {
    func closePressed()
}

class SendTokensViewController: UIViewController, Storyboarded {
    
    weak var coordinator: SendTokensCoordinator?
    var delegate: SendTokensViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appColors.darkGray
        setupNavBar()
    }
    
    private func setupNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Send Tokens"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closePressed))
    }
    
    @objc func closePressed() {
        delegate?.closePressed()
    }
    
}
