//
//  AlgorithmRequest.swift
//  Mr. Algorithm
//
//  Created by Richard Blanchard on 5/16/19.
//  Copyright © 2019 Richard Blanchard. All rights reserved.
//

import Foundation
import Einstein

struct AlgorithmsRequest: APIRequest {
    enum QuestionType: String {
        case leetcode = "leet_code_questions"
    }
    
    let requestPayload: QuestionType
    
    var api: API {
        return MrAlgorithmAPI.shared
    }
    
    var path: String {
        return "\(requestPayload.rawValue)/.json"
    }
    
    typealias RequestDataType = QuestionType
    typealias ResponseDataType = [Algorithm]
    
    func parseResponse(from data: Data) throws -> [Algorithm] {
        let jsonObject = try JSONSerialization.jsonObject(from: data)
        
        var mutableAlgorithms: [Algorithm] = []

        for (key, value) in jsonObject where ((value as? JSONObject) != nil) {
            if let algo = Algorithm(from: value as! JSONObject, id: key) {
                mutableAlgorithms.append(algo)
            }
        }
        
        return mutableAlgorithms
    }
}
