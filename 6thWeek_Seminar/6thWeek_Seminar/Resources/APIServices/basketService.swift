//
//  basketService.swift
//  6thWeek_Seminar
//
//  Created by 이윤진 on 2020/06/12.
//  Copyright © 2020 이예슬. All rights reserved.
//

import Foundation
import Alamofire

struct basketService{
    
   static let shared = basketService()
       
       func getBasketService(completion:@escaping (NetworkResult<Any>) -> Void){
   //        var bannerList : [BannerInfo] = []
           let header: HTTPHeaders = ["Content-Type":"application/json"]
           let dataRequest = Alamofire.request(APIConstants.shoppingbagURL,method: .get,parameters:nil,encoding: JSONEncoding.default, headers: header)
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
           case 200: return decodingCart(by: data)
           default: return .serverErr
           }
       }
       private func decodingCart(by data:Data)->NetworkResult<Any>{
           let decoder = JSONDecoder()
           guard let decodedData = try? decoder.decode(Basket.self,from: data) else {//print("?")
               return .serverErr}
           guard let itemInfo = decodedData.data else {
               //print("여기")
               return .requestErr(decodedData.message)}
        return .success(itemInfo.result1)
       }
    
    
}
