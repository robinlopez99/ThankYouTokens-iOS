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
    
    func getData(userId: String) {
        var encounteredError: Bool = false
        let doc = db.collection("users").document(userId)
        doc.getDocument { (document, error) in
            if let document = document {
                let docData = document.data()
            }
        }
    }
    
    // This function will post to Firestore and return true is no isses
    func postData(userId: String, firstName: String, lastName:String, tokens: Double, floating_tokens: Double) -> Bool {
        var errorEcountered: Bool = false
        
        db.collection("users").document(userId).setData([
            "first_name" : firstName,
            "last_name" : lastName,
            "tokens" : tokens,
            "floating_tokens" : floating_tokens
        ]) { (error) in
            if let _ = error {
                errorEcountered = true
            }
        }
        
        return errorEcountered
    }
    
}
