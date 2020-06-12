//
//  imgCollectionViewCell.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 5/28/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class BannerCell: UICollectionViewCell {
    static let identifier :String = "BannerCell"
    @IBOutlet weak var bannerImg: UIImageView!
    @IBOutlet weak var bannerTF: UITextField!
    func set(_ bannerInfo:BannerInfo){
        bannerImg.imageFromUrl(bannerInfo.image, defaultImgPath: "AppIcon")
        bannerTF.text = bannerInfo.title

    }
}
