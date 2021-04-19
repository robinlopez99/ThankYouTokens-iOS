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
    let firestore = FirestoreService()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
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
                    var user = UserModel(isLoggedIn: true, userId: userId, email: email)
                    user.first_name = firstName
                    user.last_name = lastName
                    let postUserDataError = self.firestore.postNewData(userId: user.userId, firstName: firstName, lastName: lastName, tokens: 500, email: email)
                    if postUserDataError == true {
                        Auth.auth().currentUser?.delete()
                        self.showAlertDialogue(title: "Error", message: "There was an error creating your account. Please retry")
                    }
                    self.delegate?.goToHome(user: user)
                }
            }
        }
    }
    
    func closePressed() {
        self.delegate?.closePressed()
    }
}
