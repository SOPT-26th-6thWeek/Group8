//
//  shoppingbagData.swift
//  6thWeek_Seminar
//
//  Created by 이윤진 on 2020/06/09.
//  Copyright © 2020 이예슬. All rights reserved.
//

struct shoppingbagData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: DataClass?

}

struct DataClass: Codable {
    let result1, result2: [Result]
}

struct Result: Codable {
    let productIdx: Int
    let img:String
    let name: String
    let deliveryCharge, savings, price, quantity: Int
    let option: [String]

    enum CodingKeys: String, CodingKey {
        case productIdx, img, name
        case deliveryCharge = "delivery_charge"
        case savings, price, quantity, option
    }
}
