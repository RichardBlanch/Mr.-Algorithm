//
//  ErrorRequest.swift
//  Mr. Algorithm
//
//  Created by Richard Blanchard on 5/17/19.
//  Copyright © 2019 Richard Blanchard. All rights reserved.
//

import Foundation
import Einstein

struct PostErrorMessageRequest: APIRequest {
    typealias RequestDataType = Void
    typealias ResponseDataType = EmptyAPIResponse
    
    var api: API {
        return SlackHookAPI.shared
    }
    
    let requestPayload: Void
    
    var path: String {
        return "services/T037H4WNU/BJULSAJG7/Ebj36iLACCw2uJyhmRoG5KrT"
    }
    
    
    
    var method: HTTPMethod {
        return .post
    }
    
    var headers: [HTTPHeader]? {
        return [HTTPHeader.JSONApplicationContentType]
    }
    
    var body: Data? {
        let errorMessage = ErrorMessage(text: "Whoops. We made an error. Will fix shortly. Sorry :(")
        return try? JSONEncoder().encode(errorMessage)
    }
    
    private struct ErrorMessage: Encodable {
        let text: String
    }
}
