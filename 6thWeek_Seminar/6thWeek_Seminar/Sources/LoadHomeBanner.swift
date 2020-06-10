//
//  LoadHomeBanner.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 6/11/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import Foundation
import Alamofire

struct LoadHomeBanner{
    static let shared = LoadHomeBanner()
    
    func homeBanner(completion:@escaping (NetworkResult<Any>) -> Void){
        let header: HTTPHeaders = ["Content-Type":"application/json"]
        let dataRequest = Alamofire.request(APIConstants.homeBannerURL,method: .get,parameters:nil,encoding: JSONEncoding.default, headers: header)
        
    }
}
