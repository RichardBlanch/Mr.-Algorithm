//
//  PostAlgorithmRequest.swift
//  Mr. Algorithm
//
//  Created by Richard Blanchard on 5/16/19.
//  Copyright © 2019 Richard Blanchard. All rights reserved.
//

import Foundation
import Einstein

struct PostAlgorithmRequest: APIRequest {
    typealias RequestDataType = Algorithm
    typealias ResponseDataType = Algorithm

    var api: API {
        return SlackHookAPI.shared
    }
    
    let requestPayload: Algorithm
    let path: String

    var method: HTTPMethod {
        return .post
    }
    
    var headers: [HTTPHeader]? {
        return [HTTPHeader.JSONApplicationContentType]
    }
    
    var body: Data? {
        return requestPayload.data
    }
    
    func parseResponse(from data: Data) throws -> Algorithm {
        return requestPayload
    }
}
