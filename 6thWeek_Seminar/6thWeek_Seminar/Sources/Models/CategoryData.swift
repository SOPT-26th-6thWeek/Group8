//
//  CategoryData.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 6/11/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import Foundation

struct CategoryData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: CategoryResult?
    
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
        data = (try? values.decode(CategoryResult?.self, forKey: .data)) ?? nil
    }
}
// MARK: - Datum
struct CategoryResult: Codable{
    var result : [CategoryInfo]
}
struct CategoryInfo: Codable {
    var categoryIdx: Int
    var categoryName: String
}
