//
//  ItemInfo.swift
//  6thWeek_Seminar
//
//  Created by 이윤진 on 2020/05/29.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

struct ItemInfo{
    
    var itemname: String
    var itemimage: UIImage?
    
    init(itemlabel: String){
        
        self.itemimage = UIImage(named: itemlabel)
        self.itemname = itemlabel
    }
    
    
}
