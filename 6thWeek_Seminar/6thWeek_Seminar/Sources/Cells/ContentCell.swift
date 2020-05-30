//
//  ContentCell.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 5/29/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell {
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var like: UIButton!
    var buttonActive = false
    
    @IBAction func likeButton(_ sender: Any) {
        if buttonActive {
            like.setImage(UIImage(named: "favorite24Px"), for: .normal)
        } else {
            like.setImage(UIImage(named: "loveAndRomance"), for: .normal)
        }
        buttonActive = !buttonActive
    }
 
    @IBOutlet weak var productInfoTV: UITextView!
    @IBOutlet weak var divideLine: UIImageView!
    @IBOutlet weak var marketBLabel: UILabel!
    @IBOutlet weak var subProductName: UILabel!
    @IBAction func cartButton(_ sender: Any) {
    }
    @IBOutlet weak var dcLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    static let identifier :String = "ContentCell"
    func set(productName:String,productImgName:String,productInfo:String,dcLabel_:String,priceLabel:String,divideLine:String,marketB:String){
        self.productName.text = productName
        self.productImg.image = UIImage(named:productImgName)
        self.productInfoTV.text = productInfo
        self.dcLabel.text = dcLabel_
        self.priceLabel.text = priceLabel
        self.subProductName.text = productName
        self.divideLine.image = UIImage(named:divideLine)
        self.marketBLabel.text = marketB
        
    }
}