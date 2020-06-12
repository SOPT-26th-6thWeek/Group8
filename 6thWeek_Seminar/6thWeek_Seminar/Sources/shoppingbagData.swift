//
//  shoppingbagData.swift
//  6thWeek_Seminar
//
//  Created by 이윤진 on 2020/06/09.
//  Copyright © 2020 이예슬. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Basket: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DataClass?
    
    
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(DataClass?.self, forKey: .data)) ?? nil
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let result1, result2: [Delivery]
}

// MARK: - Delivery
struct Delivery: Codable {
    let productIdx: Int
    let img, name: String
    let delivery_Charge, savings, price, quantity: Int
    let option: [String]

    enum CodingKeys: String, CodingKey {
        case productIdx, img, name
        case delivery_Charge = "delivery_charge"
        case savings, price, quantity, option
    }
}
