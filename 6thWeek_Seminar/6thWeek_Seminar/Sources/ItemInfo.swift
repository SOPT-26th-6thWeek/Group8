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
    var itempoint: String
    var itemcost: String
    
    init(itemlabel: String, point: String, cost: String){
        
        self.itemimage = UIImage(named: itemlabel)
        self.itemname = itemlabel
        self.itempoint = point
        self.itemcost = cost
    }
    
    
}
