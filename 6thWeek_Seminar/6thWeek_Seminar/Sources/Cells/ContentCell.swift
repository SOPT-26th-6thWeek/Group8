//
//  ContentCell.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 5/29/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit



class ContentCell: UITableViewCell{
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var like: UIButton!
    var buttonActive = false
    
    @IBAction func likeButton(_ sender: Any) {
        if buttonActive {
            like.setImage(UIImage(named: "loveAndRomance"), for: .normal)
        } else {
            like.setImage(UIImage(named: "favorite24Px"), for: .normal)
        }
        buttonActive = !buttonActive
    }
 
    @IBOutlet weak var productInfoTV: UITextView!
    @IBOutlet weak var divideLine: UIImageView!
    @IBOutlet weak var marketBLabel: UILabel!
    @IBOutlet weak var subProductName: UILabel!
    
    @IBOutlet weak var cartButton: UIButton!
    @objc func cartAction(_ sender : Any){
        let cartAlert = UIAlertController(title:"",message:"장바구니에 상품이 담겼습니다",preferredStyle:.alert)
        cartAlert.addAction(UIAlertAction(title:"확인",style:.default))
    }
    @IBOutlet weak var dcLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    static let identifier :String = "ContentCell"
    func set(_ homeItemInfo: HomeItemInfo,_ idxPath:Int){
        print(homeItemInfo)
        self.productName.text = homeItemInfo.name
        self.productImg.imageFromUrl(homeItemInfo.image, defaultImgPath: "AppIcon")
        self.productInfoTV.text = homeItemInfo.content
        self.dcLabel.text = String(Int(homeItemInfo.option[0].dSale*100))+"%"
        self.priceLabel.text = String(homeItemInfo.option[0].dPrice)+"원"
        self.subProductName.text = homeItemInfo.option[0].dName
        self.divideLine.image = UIImage(named:"imgDivideLine")
        self.marketBLabel.text = "marketB"
        
    }   
}
