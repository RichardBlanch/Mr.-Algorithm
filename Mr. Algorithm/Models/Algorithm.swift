//
//  Algorithm.swift
//  Mr. Algorithm
//
//  Created by Richard Blanchard on 5/17/19.
//  Copyright © 2019 Richard Blanchard. All rights reserved.
//

import Foundation
import Einstein

struct Algorithm: Decodable {
    let question: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case question
        case id
    }
    
    init?(from jsonObject: JSONObject, id: String) {
        guard let question =  jsonObject[CodingKeys.question.rawValue] as? String else { return nil }
        self.question = question
        self.id = id
    }
    
    var data: Data? {
        let slackDictionaryForm = ["text": question]
        let data = try? JSONSerialization.data(withJSONObject: slackDictionaryForm, options: .prettyPrinted)
        
        return data
    }
}
