//
//  LogOutTableViewCell.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 10/22/20.
//

import UIKit

struct LogOutTableViewCellViewModel: CellViewModel {
    let title: String
    let titleColor: UIColor
    let buttonColor: UIColor
    
    init(title: String, titleColor: UIColor, buttonColor: UIColor) {
        self.title = title
        self.titleColor = titleColor
        self.buttonColor = buttonColor
    }
}

class LogOutTableViewCell: UITableViewCell {

    @IBOutlet weak var logoutButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel: LogOutTableViewCellViewModel) {
        self.backgroundColor = UIColor.appColors.darkGray
        
        logoutButton.layer.cornerRadius = 15
        logoutButton.backgroundColor = viewModel.buttonColor
        logoutButton.setTitle(viewModel.title, for: .normal)
        logoutButton.setTitleColor(viewModel.titleColor, for: .normal)
    }

}
