//
//  CreateAccountCoordinator.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 11/2/20.
//

import UIKit
import FirebaseAuth

protocol CreateAccountCoordinatorDelegate {
    func closePressed()
    func goToHome(user: UserModel)
}

class CreateAccountCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var delegate: CreateAccountCoordinatorDelegate?
    var user: UserModel
    
    let firestore = FirestoreService()
    
    init(navigationController: UINavigationController, user: UserModel) {
        self.navigationController = navigationController
        self.user = user
    }
    
    func start() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        vc.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
}

extension CreateAccountCoordinator: CreateAccountViewControllerDelegate {
    func signupPressed(email: String, password: String, firstName: String, lastName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                self.showAlertDialogue(title: "Error", message: "There was an error creating your account. Please retry")
            } else {
                if let userId = authResult?.user.uid {
                    self.user.userId = userId
                    self.user.first_name = firstName
                    self.user.last_name = lastName
                    self.user.isLoggedIn = true
                    let postUserDataError = self.firestore.postData(userId: self.user.userId, firstName: firstName, lastName: lastName, tokens: 500.00, floating_tokens: 0.00)
                    if postUserDataError == true {
                        Auth.auth().currentUser?.delete()
                        self.showAlertDialogue(title: "Error", message: "There was an error creating your account. Please retry")
                    }
                    self.delegate?.goToHome(user: self.user)
                }
            }
        }
    }
    
    func closePressed() {
        self.delegate?.closePressed()
    }
}
