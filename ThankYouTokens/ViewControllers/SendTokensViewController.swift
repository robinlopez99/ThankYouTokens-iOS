//
//  SendTokensViewController.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 11/2/20.
//

import UIKit

protocol SendTokensViewControllerDelegate {
    func closePressed()
    func tokensSent(amount: Int)
}

class SendTokensViewController: UIViewController, Storyboarded {
    
    weak var coordinator: SendTokensCoordinator?
    var delegate: SendTokensViewControllerDelegate?

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var qrImage: UIImageView!
    @IBOutlet weak var qrLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appColors.darkGray
        setupNavBar()
        configure()
        qrImage.isHidden = true
        qrLabel.isHidden = true
    }
    
    private func setupNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.appColors.purple
        navigationItem.title = "Send Tokens"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closePressed))
    }
    
    func configure() {
        stackView.spacing = 15.0
        
        qrLabel.backgroundColor = .clear
        qrLabel.textColor = .white
        qrLabel.numberOfLines = 2
        
        amountTextField.keyboardType = .numberPad
        amountTextField.placeholder = "Token Amount"
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.items = [doneBtn]
        amountTextField.inputAccessoryView = toolbar
        
        sendButton.layer.cornerRadius = 15
        sendButton.backgroundColor = UIColor.appColors.yellow
    }
    
    @objc func donePressed() {
        view.endEditing(true)
    }
    
    func configureQr(qrCode: UIImage) {
        qrImage.isHidden = false
        qrImage.image = qrCode
        
        qrLabel.isHidden = false
    }
    
    @objc func closePressed() {
        delegate?.closePressed()
    }
    
    @IBAction func sendPressed(_ sender: Any) {
        if let val = amountTextField.text {
            delegate?.tokensSent(amount: Int(val)!)
        }
    }
}
