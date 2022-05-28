//
//  TableViewCell.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 26.05.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var yemekAdıLabel: UILabel!
    @IBOutlet weak var yemekFiyatıLabel: UILabel!
    @IBOutlet weak var yemekResimImageView: UIImageView!

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


