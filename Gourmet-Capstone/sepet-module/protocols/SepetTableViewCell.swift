//
//  SepetTableViewCell.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 31.05.2022.
//

import UIKit

class SepetTableViewCell: UITableViewCell {

   
    @IBOutlet weak var sepetYemekAdi: UILabel!
    @IBOutlet weak var sepetYemekFiyat: UILabel!
    @IBOutlet weak var sepetYemekAdet: UILabel!
    @IBOutlet weak var YemekImageView: UIImageView!
    @IBOutlet weak var sepetHucreArkaPlan: UIView!
    
    let cellSpacingHeight: CGFloat = 5
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
