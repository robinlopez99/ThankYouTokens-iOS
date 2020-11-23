//
//  CreateAccountViewController.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 11/2/20.
//

import UIKit

protocol CreateAccountViewControllerDelegate {
    func closePressed()
    func signupPressed(email: String, password: String, firstName: String, lastName: String)
}

class CreateAccountViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    

    @IBOutlet weak var signUpButton: UIButton!
    
    weak var coordinator: CreateAccountCoordinator?
    var delegate: CreateAccountViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appColors.darkGray
        setupNavBar()
        setupTextFields()
        setupLabels()
        setupButton()
    }
    
    private func setupLabels() {
        firstNameLabel.textColor = .white
        firstNameLabel.textAlignment = .left
        
        lastNameLabel.textColor = .white
        lastNameLabel.textAlignment = .left
        
        emailLabel.textColor = .white
        emailLabel.textAlignment = .left
        
        passwordLabel.textColor = .white
        passwordLabel.textAlignment = .left
    }
    
    private func setupTextFields() {
        firstNameField.placeholder = "John"
        firstNameField.backgroundColor = .white
        firstNameField.textColor = .black
        
        lastNameField.placeholder = "John"
        lastNameField.backgroundColor = .white
        lastNameField.textColor = .black
        
        emailField.placeholder = "john@smith.com"
        emailField.backgroundColor = .white
        emailField.textColor = .black
        
        passwordField.placeholder = "******"
        passwordField.backgroundColor = .white
        passwordField.textColor = .black
    }
    
    private func setupNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.appColors.purple
        navigationItem.title = "Create Account"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closePressed))
    }
    
    private func setupButton() {
        signUpButton.backgroundColor = UIColor.appColors.yellow
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.layer.cornerRadius = 5
    }
    
    @IBAction func signupPressed(_ sender: Any) {
        delegate?.signupPressed(email: emailField.text ?? "",
                                password: passwordField.text ?? "",
                                firstName: firstNameField.text ?? "",
                                lastName: lastNameField.text ?? "")
    }
    
    
    @objc func closePressed() {
        delegate?.closePressed()
    }

}
