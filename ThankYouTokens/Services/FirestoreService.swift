//
//  FirestoreService.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 11/18/20.
//

import Foundation
import Firebase

public struct FirestoreService {
    
    let db = Firestore.firestore()
    
    func getUserData(userId: String, completion: @escaping (UserModel) -> Void) {
        var curr_user: UserModel = UserModel(isLoggedIn: false, userId: "", email: "")
        let doc = db.collection("users").document(userId)
        
        doc.getDocument { (document, error) in
            if error != nil {
                return
            }
            
            if let document = document {
                let data = document.data()
                curr_user.token_balance = data?["tokens"] as? Int ?? 0
                curr_user.email = data?["email"] as? String ?? ""
                curr_user.first_name = data?["first_name"] as? String ?? ""
                curr_user.last_name = data?["last_name"] as? String ?? ""
                curr_user.isLoggedIn = true
            }
            completion(curr_user)
        }
    }
    
    // This function will post to Firestore and return true if no isses
    func postData(userId: String, firstName: String, lastName: String, tokens: Int, email: String) -> Bool {
        var errorEncountered: Bool = false
        
        db.collection("users").document(userId).setData([
            "first_name" : firstName,
            "last_name" : lastName,
            "tokens" : tokens,
            "email" : email
        ]) { (error) in
            if let _ = error {
                errorEncountered = true
            }
        }
        
        return errorEncountered
    }
    

    func postTransaction(userId: String, amount: Int) -> Bool {
        var errorEncountered = false
        let today = Date()
        let expTime = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        
        db.collection("float-accounts").document(userId).setData([
            "amount" : amount,
            "expiry-data-time" : expTime,
            "spent" : false,
            "transaction" : 55
        ]) { (error) in
            if let _ = error {
                errorEncountered = true
            }
        }
        return errorEncountered
    }
    
}
