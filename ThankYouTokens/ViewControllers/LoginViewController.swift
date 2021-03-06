//
//  LoginViewController.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/21/20.
//

import UIKit

protocol LoginViewControllerDelegate {
    func loginButtonPressed(username: String, password:String)
    func createNewAccount()
}

class LoginViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var spacerView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    weak var coordinator: LoginCoordinator?
    var delegate: LoginViewControllerDelegate?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSpacerView()
        configureButtons()
        configureTextFields()
        self.view.backgroundColor = UIColor.appColors.darkGray
    }
    
    func configureTextFields() {
        usernameTextField.backgroundColor = UIColor.appColors.lightGray
        passwordTextField.backgroundColor = UIColor.appColors.lightGray
        
        usernameTextField.layer.cornerRadius = 15
        passwordTextField.layer.cornerRadius = 15
        
        usernameTextField.textColor = .black
        passwordTextField.textColor = .black
        
        passwordTextField.isSecureTextEntry = true
    }
    
    func configureSpacerView() {
        spacerView.backgroundColor = UIColor.appColors.darkGray
    }
    
    func configureButtons() {
        loginButton.backgroundColor = UIColor.appColors.purple
        loginButton.layer.cornerRadius = 15
        
        createAccountButton.backgroundColor = UIColor.appColors.darkGray
        createAccountButton.setTitle(AppStrings.loginStrings.createAccountString, for: .normal)
        createAccountButton.setTitleColor(UIColor.appColors.yellow, for: .normal)
    }

    @IBAction func loginPressed(_ sender: Any) {
        print("here 1")
        self.delegate?.loginButtonPressed(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        delegate?.createNewAccount()
    }
    
}
