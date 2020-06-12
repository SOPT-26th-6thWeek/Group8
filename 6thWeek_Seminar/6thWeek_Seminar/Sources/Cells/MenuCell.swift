//
//  MenuCell.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 6/10/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    var index : Int = 0
    static let identifier : String = "MenuCell"
    
    
    @IBOutlet weak var menuButton: UIButton!
    func setCategory(_ categoryInfo : CategoryInfo){
        menuButton.setTitle(categoryInfo.categoryName,for: .normal)
        self.index = categoryInfo.categoryIdx
    }
}
