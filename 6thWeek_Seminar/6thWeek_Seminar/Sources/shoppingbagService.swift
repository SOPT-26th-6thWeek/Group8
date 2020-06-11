//
//  shoppingbagService.swift
//  6thWeek_Seminar
//
//  Created by 이윤진 on 2020/06/10.
//  Copyright © 2020 이예슬. All rights reserved.
//

import Foundation
import Alamofire

struct shoppingbagService{
    
    static let shared = shoppingbagService()
    
    private func makeParameter(_ result1: [Result], _ result2: [Result])-> Parameters{ return["result1": result1, "result2":result2]
    }
    
    func showBag(result1: [Result], result2: [Result], completion: @escaping(NetworkResult<Any>)->Void){
        
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = Alamofire.request(APIConstants.shoppingbagURL, method: .get, parameters: makeParameter(result1,result2), encoding:JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in switch dataResponse.result { // result 값에 따른 분기 처리 진행
        case .success: // 통신 성공
            guard let statusCode = dataResponse.response?.statusCode else { return }
            guard let value = dataResponse.result.value else { return }
            let networkResult = self.judge(by: statusCode, value) // 받아온 값에 대하여 decode 진행하기
            completion(networkResult)
            
        case .failure: completion(.networkFail) // 통신 실패
            
            }
        
    }
}
    
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isUser(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
            
        }
    }

    private func isUser(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(shoppingbagData.self, from: data) else { return .pathErr }
        //print("\(decodedData)")
        if decodedData.success {
            print("\(decodedData)")
            return .success(data)
            
        }
        return .requestErr(decodedData.message)
    
    }
}
