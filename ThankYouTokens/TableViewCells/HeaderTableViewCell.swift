//
//  HeaderTableViewCell.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 10/19/20.
//

import UIKit

struct HeaderTableViewCellViewModel {
    let title: String
    let titleColor: UIColor
    
    init(title: String, titleColor: UIColor) {
        self.title = title
        self.titleColor = titleColor
    }
}

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel:HeaderTableViewCellViewModel) {
        self.backgroundColor = UIColor.appColors.darkGray
        
        headerLabel.text = viewModel.title
        headerLabel.textColor = viewModel.titleColor
    }

}
