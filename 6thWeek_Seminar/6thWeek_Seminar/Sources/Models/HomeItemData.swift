//
//  HomeItemData.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 6/11/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

struct HomeItemData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: HomeItemResult?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(HomeItemResult?.self, forKey: .data)) ?? nil
    }
}

// MARK: - DataClass
struct HomeItemResult: Codable {
    var result: [HomeItemInfo]
}

// MARK: - Result
struct HomeItemInfo: Codable {
    var idx: Int
    var name, content: String
    var like: Int
    var image: String
    var categoryIdx: Int
    var option: [HomeItemOption]

    enum CodingKeys: String, CodingKey {
        case idx = "Idx"
        case name, content, like, image, categoryIdx, option
    }
}

// MARK: - Option
struct HomeItemOption: Codable {
    var dName: String
    var dPrice: Int
    var dSale: Double

    enum CodingKeys: String, CodingKey {
        case dName = "d_name"
        case dPrice = "d_price"
        case dSale = "d_sale"
    }
}
