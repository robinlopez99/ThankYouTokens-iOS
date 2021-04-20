//
//  AccountViewController.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/24/20.
//

import UIKit

struct AccountViewControllerViewModel {
    var tokenBalance: Int
}

protocol AccountViewControllerDelegate {
    func sendTokensPressed()
    func receiveTokensPressed()
}

class AccountViewController: UIViewController, Storyboarded {
    
    var delegate: AccountViewControllerDelegate?
    var viewModel: AccountViewControllerViewModel?

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
    @IBOutlet weak var receiveTokensButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.appColors.darkGray
        
        configureTopLabel()
        configureBalance()
        configureTransactions()
        configureTokensButtons()
    }
    
    private func configureTopLabel() {
        topLabel.text = "Account Details"
        topLabel.textColor = .white
        topLabel.textAlignment = .left
        topLabel.backgroundColor = .clear
        topLabel.layer.masksToBounds = true
        topLabel.layer.cornerRadius = 15
    }
    
    private func configureBalance() {
        balanceContainer.backgroundColor = UIColor.appColors.purple
        balanceContainer.layer.cornerRadius = 15
        yourBalanceLabel.backgroundColor = .clear
        yourBalanceLabel.textColor = .white
        tokensLabel.backgroundColor = .clear
        tokensLabel.textColor = .white
        
        if let balance = viewModel?.tokenBalance {
            tokensLabel.text = "\(balance) Tokens"
        }
    }
    
    private func configureTransactions() {
        transactionsContainer.backgroundColor = UIColor.appColors.purple
        transactionsContainer.layer.cornerRadius = 15
        recentTransLabel.backgroundColor = .clear
        recentTransLabel.textColor = .white
        
        moreTransButton.backgroundColor = UIColor.appColors.yellow
        moreTransButton.setTitleColor(.black, for: .normal)
        moreTransButton.layer.cornerRadius = 15
        
    }
    
    private func configureTokensButtons() {
        sendTokensButton.backgroundColor = UIColor.appColors.yellow
        sendTokensButton.setTitle("Send Tokens", for: .normal)
        sendTokensButton.setTitleColor(.black, for: .normal)
        sendTokensButton.layer.cornerRadius = 15
        
        receiveTokensButton.backgroundColor = UIColor.appColors.yellow
        receiveTokensButton.setTitle("Receive Tokens", for: .normal)
        receiveTokensButton.setTitleColor(.black, for: .normal)
        receiveTokensButton.layer.cornerRadius = 15
    }
    
    
    @IBAction func sendTokensPressed(_ sender: Any) {
        delegate?.sendTokensPressed()
    }
    
    @IBAction func receiveTokensPressed(_ sender: Any) {
        delegate?.receiveTokensPressed()
    }
}
