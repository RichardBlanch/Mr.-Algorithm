//
//  DeleteAlgoritmRequest.swift
//  Mr. Algorithm
//
//  Created by Richard Blanchard on 5/16/19.
//  Copyright © 2019 Richard Blanchard. All rights reserved.
//

import Foundation
import Einstein

struct DeleteAlgorithmRequest: APIRequest {
    
    typealias RequestDataType = Payload
    typealias ResponseDataType = EmptyAPIResponse
    
    struct Payload {
        let questionType: AlgorithmsRequest.QuestionType
        let algorithm: Algorithm
    }

    var api: API {
        return MrAlgorithmAPI.shared
    }
    
    var requestPayload: Payload
    
    
    var path: String {
        return ""
        return "\(requestPayload.questionType.rawValue)/\(requestPayload.algorithm.id).json"
    }
    
    var method: HTTPMethod {
        return .delete
    }

    func parseResponse(from data: Data) throws -> EmptyAPIResponse {
        return EmptyAPIResponse()
    }
}
