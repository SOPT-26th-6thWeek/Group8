//
//  banner.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 5/28/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

struct Banner{
    var bannerImage: UIImage?
    init(imgName:String)
    {
        self.bannerImage = UIImage(named:imgName)
        
    }
}
