//
//  AccountViewController.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/24/20.
//

import UIKit

protocol AccountViewControllerDelegate {
    func sendTokensPressed()
}

class AccountViewController: UIViewController, Storyboarded {
    
    weak var coordinator: AccountCoordinator?
    var delegate: AccountViewControllerDelegate?

    @IBOutlet weak var topLabel: UILabel!
    
    //Balance Container
    @IBOutlet weak var balanceContainer: UIView!
    @IBOutlet weak var yourBalanceLabel: UILabel!
    @IBOutlet weak var tokensLabel: UILabel!
    
    //Transactions Container
    @IBOutlet weak var transactionsContainer: UIView!
    @IBOutlet weak var recentTransLabel: UILabel!
    @IBOutlet weak var moreTransButton: UIButton!
    
    
    @IBOutlet weak var sendTokensButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.appColors.darkGray
        
        configureTopLabel()
        configureBalance()
        configureTransactions()
        configureSendTokensButton()
    }
    
    func configureTopLabel() {
        topLabel.text = "Welcome Back Robin!"
        topLabel.textColor = .white
        topLabel.backgroundColor = .clear
        topLabel.layer.masksToBounds = true
        topLabel.layer.cornerRadius = 15
    }
    
    func configureBalance() {
        balanceContainer.backgroundColor = UIColor.appColors.purple
        balanceContainer.layer.cornerRadius = 15
        yourBalanceLabel.backgroundColor = .clear
        yourBalanceLabel.textColor = .white
        tokensLabel.backgroundColor = .clear
        tokensLabel.textColor = .white
    }
    
    func configureTransactions() {
        transactionsContainer.backgroundColor = UIColor.appColors.purple
        transactionsContainer.layer.cornerRadius = 15
        recentTransLabel.backgroundColor = .clear
        recentTransLabel.textColor = .white
        
        moreTransButton.backgroundColor = UIColor.appColors.yellow
        moreTransButton.setTitleColor(.black, for: .normal)
        moreTransButton.layer.cornerRadius = 15
        
    }
    
    func configureSendTokensButton() {
        sendTokensButton.backgroundColor = UIColor.appColors.yellow
        sendTokensButton.setTitle("Send Tokens", for: .normal)
        sendTokensButton.setTitleColor(.black, for: .normal)
        sendTokensButton.layer.cornerRadius = 15
    }
    
    
    @IBAction func sendTokensPressed(_ sender: Any) {
        delegate?.sendTokensPressed()
    }
    

}
