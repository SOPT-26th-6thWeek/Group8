//
//  imgCollectionViewCell.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 5/28/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class imgCollectionViewCell: UICollectionViewCell {
    static let identifier :String = "ImgCell"
    @IBOutlet weak var bannerImg: UIImageView!
    func set(_ imgInfo:Banner){
        bannerImg.image = imgInfo.bannerImage
    }
}
