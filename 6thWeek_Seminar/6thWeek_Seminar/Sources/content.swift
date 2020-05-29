//
//  content.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 5/29/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import Foundation
import UIKit

struct Content{
    var productName : String
    var productImageName : String
    var productInfo :String
    let marketB :String = "marketB"
    let divideLine : String = "imgDivideLine"
    var discount : String
    var price : String
    
    init(productName: String, productImageName: String, productInfo: String, discount: String, price: String){
        self.productName = productName
        self.productImageName = productImageName
        self.productInfo = productInfo
        self.discount = discount
        self.price = price
    }
    
}
