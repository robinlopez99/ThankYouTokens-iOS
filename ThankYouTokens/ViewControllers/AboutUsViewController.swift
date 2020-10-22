//
//  AboutUsViewController.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 10/22/20.
//

import UIKit

class AboutUsViewController: UIViewController, Storyboarded {
    
    weak var coordinator: AboutUsCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appColors.darkGray
    }
    

}
