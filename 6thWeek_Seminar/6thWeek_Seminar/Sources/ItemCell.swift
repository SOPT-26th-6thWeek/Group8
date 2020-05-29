//
//  ItemCell.swift
//  6thWeek_Seminar
//
//  Created by 이윤진 on 2020/05/29.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    static let identfier: String = "ItemCell"
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setItemInfo(itemname: String){
        
        itemImageView.image = UIImage(named: itemname)
        itemName.text = itemname
    }

}
