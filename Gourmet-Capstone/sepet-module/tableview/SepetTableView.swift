//
//  SepetTableViewCell.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 28.05.2022.
//

import UIKit

class SepetTableView: UITableViewCell {

    
    
    let cellSpacingHeight: CGFloat = 5
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        contentView.layer.cornerRadius = 5
    }
}
