//
//  MrAlgorithmAPI.swift
//  Mr. Algorithm
//
//  Created by Richard Blanchard on 5/16/19.
//  Copyright © 2019 Richard Blanchard. All rights reserved.
//

import Foundation
import Einstein

class MrAlgorithmAPI: API {
    static let shared = MrAlgorithmAPI()

    var baseURL: URL {
        return URL(string: "https://algorithms-1c2f3.firebaseio.com")!
    }
}
