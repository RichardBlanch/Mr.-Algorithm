//
//  SlackHookAPI.swift
//  Mr. Algorithm
//
//  Created by Richard Blanchard on 5/16/19.
//  Copyright © 2019 Richard Blanchard. All rights reserved.
//

import Foundation
import Einstein

class SlackHookAPI: API {
    static let shared = SlackHookAPI()

    var baseURL: URL {
        return URL(string: "https://hooks.slack.com")!
    }
}
