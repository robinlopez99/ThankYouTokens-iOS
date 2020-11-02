//
//  CreateAccountViewController.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 11/2/20.
//

import UIKit

protocol CreateAccountViewControllerDelegate {
    func closePressed()
}

class CreateAccountViewController: UIViewController, Storyboarded {
    
    weak var coordinator: CreateAccountCoordinator?
    var delegate: CreateAccountViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appColors.darkGray
        setupNavBar()
    }
    
    private func setupNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Create Account"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closePressed))
    }
    
    @objc func closePressed() {
        self.delegate?.closePressed()
    }

}
