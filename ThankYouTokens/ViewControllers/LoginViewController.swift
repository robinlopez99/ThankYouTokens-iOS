//
//  LoginViewController.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/21/20.
//

import UIKit

protocol LoginViewControllerDelegate {
    func loginButtonPressed()
}

class LoginViewController: UIViewController, Storyboarded {
    
    let tempUsername = "thankyou"
    let tempPassword = "tokens"
    weak var coordinator: LoginCoordinator?
    var delegate: LoginViewControllerDelegate?
    
    @IBOutlet weak var loginButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.appColors.darkGray
    }

    @IBAction func loginPressed(_ sender: Any) {
        delegate?.loginButtonPressed()
    }
}
