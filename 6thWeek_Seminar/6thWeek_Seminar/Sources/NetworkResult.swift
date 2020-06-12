//
//  NetworkResult.swift
//  6thWeek_Seminar
//
//  Created by 이윤진 on 2020/06/09.
//  Copyright © 2020 이예슬. All rights reserved.
//

enum NetworkResult<T>{
    case success (T?)
    case requestErr(T)
    case serverErr
<<<<<<< HEAD
    case pathErr
    case networkFail
    
=======
>>>>>>> master
}
