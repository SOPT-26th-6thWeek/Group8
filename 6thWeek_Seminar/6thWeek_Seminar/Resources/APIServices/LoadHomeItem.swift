//
//  LoadHomeItem.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 6/12/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import Foundation
import Alamofire

struct LoadHomeItem{
    static let shared = LoadHomeItem()
    
    func homeItem(categoryIdx:Int,completion:@escaping (NetworkResult<Any>) -> Void){
//        var bannerList : [BannerInfo] = []
        let header: HTTPHeaders = ["Content-Type":"application/json"]
        let dataRequest = Alamofire.request(APIConstants.homeCategoryURL+"/\(categoryIdx)",method: .get,parameters:nil,encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return}
                print(statusCode)
                guard let value = dataResponse.result.value else {return}
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
            case .failure: completion(.serverErr)
            }
        }
        
    }
    private func judge(by statusCode:Int,_ data:Data) -> NetworkResult<Any>{
        switch statusCode {
        case 200: return decodingHomeItem(by: data)
        default: return .serverErr
        }
    }
    private func decodingHomeItem(by data:Data)->NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(HomeItemData.self,from: data) else {
            return .serverErr}
        guard let homeItemInfo = decodedData.data else {
            
            return .requestErr(decodedData.message)}
        return .success(homeItemInfo.result)
    }
}
