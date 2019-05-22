//
//  FetchSlackEndpointRequest.swift
//  Mr. Algorithm
//
//  Created by Richard Blanchard on 5/22/19.
//  Copyright © 2019 Richard Blanchard. All rights reserved.
//

import Foundation
import Einstein

struct FetchSlackEndpointRequest: APIRequest {
    typealias RequestDataType = EmptyPayload
    typealias ResponseDataType = Endpoint
    
    let requestPayload: EmptyPayload = EmptyPayload()
    
    var api: API {
        return MrAlgorithmAPI.shared
    }

    var path: String {
        return "endpoints/.json"
    }
}

struct Endpoint: Codable {
    let slackURL: String
    
    enum CodingKeys: String, CodingKey {
        case slackURL = "slack_url"
    }
}
