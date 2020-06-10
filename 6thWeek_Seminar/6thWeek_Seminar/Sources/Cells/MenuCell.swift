//
//  MenuCell.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 6/10/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    static let identifier : String = "MenuCell"
    
    @IBOutlet weak var menuButton: UIButton!
    func setMenu(_ menuInfo:Menu){
        menuButton.setTitle(menuInfo.menuTitle,for: .normal)
    }
}
