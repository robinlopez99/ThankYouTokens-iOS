//
//  Strings.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 10/8/20.
//

import Foundation

enum AppStrings {
    enum loginStrings {
        static let createAccountString = "Create A New Account"
        
        enum errors {
            static let missingField = "Missing Field"
            static let addUserAndPass = "Make sure there is a username and password"
        }
    }
    
    enum accountStrings {
        static let tokensBalance = "Your Balance"
        static let sendTokens = "Send Tokens"
        static let recentTransactions = "Recent Transactions"
    }
}
