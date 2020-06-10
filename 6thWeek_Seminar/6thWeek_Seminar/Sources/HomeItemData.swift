//
//  HomeItemData.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 6/11/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import Foundation

struct HomeItemData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: [HomeItemInfo]
}

// MARK: - Datum
struct HomeItemInfo: Codable {
    var name, content: String
    var like: Int
    var image: String
    var subProduct: [SubProduct]
}

// MARK: - SubProduct
struct SubProduct: Codable {
    var dName: String
    var dPrice: Int
    var dSale, dImage: String

    enum CodingKeys: String, CodingKey {
        case dName = "d_name"
        case dPrice = "d_price"
        case dSale = "d_sale"
        case dImage = "d_image"
    }
}
