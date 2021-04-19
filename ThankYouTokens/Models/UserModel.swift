//
//  AppState.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 11/11/20.
//

import Foundation

public struct UserModel {
    var isLoggedIn: Bool
    var userId: String
    var first_name: String
    var last_name: String
    var token_balance: Int
    var email: String
    
    init(isLoggedIn: Bool, userId: String, email: String) {
        self.isLoggedIn = isLoggedIn
        self.userId = userId
        self.first_name = ""
        self.last_name = ""
        self.token_balance = 0
        self.email = email
    }
}
