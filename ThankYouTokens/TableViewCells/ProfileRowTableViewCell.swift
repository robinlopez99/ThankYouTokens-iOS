//
//  ProfileRowTableViewCell.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 10/19/20.
//

import UIKit

struct ProfileRowTableViewCellViewModel: CellViewModel {
    let rowDescription: String
    let rowValue: String
    let textColor: UIColor
    
    init(rowDescription: String, rowValue: String, textColor: UIColor) {
        self.rowDescription = rowDescription
        self.rowValue = rowValue
        self.textColor = textColor
    }
}

class ProfileRowTableViewCell: UITableViewCell {

    @IBOutlet weak var rowDescriptionLabel: UILabel!
    @IBOutlet weak var rowValueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel: ProfileRowTableViewCellViewModel) {
        self.backgroundColor = UIColor.appColors.darkGray
        
        rowDescriptionLabel.text = viewModel.rowDescription
        rowDescriptionLabel.textColor = viewModel.textColor
        
        rowValueLabel.text = viewModel.rowValue
        rowValueLabel.textColor = viewModel.textColor
    }

}
