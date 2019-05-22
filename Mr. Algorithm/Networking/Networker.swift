//
//  Networker.swift
//  Mr. Algorithm
//
//  Created by Richard Blanchard on 5/17/19.
//  Copyright © 2019 Richard Blanchard. All rights reserved.
//

import Foundation
import Einstein

class Networker {

    func fetchAlgorithms(_ completionHandler: @escaping (Result<[Algorithm], GrioError>) -> Void) {
        let leetcodeAPIRequest = AlgorithmsRequest(requestPayload: .leetcode)
        
        APIRequestLoader.loadAPIRequest(leetcodeAPIRequest) { (result) in
            completionHandler(result)
        }
    }
    
    func pickAlgorithm(from algorithms: [Algorithm]) throws -> Algorithm {
        guard !algorithms.isEmpty else { fatalError("No problems") }
        
        let randomIndex = Int.random(in: 0 ..< algorithms.count)
        return algorithms[randomIndex]
    }
    
    func postAlgorithm(_ algorithm: Algorithm, completionHandler: @escaping (Result<Algorithm, GrioError>) -> Void) {
        APIRequestLoader.loadAPIRequest(FetchSlackEndpointRequest()) { (result) in
            do {
                let endpoint = try result.get().slackURL
                let postAlgorithmRequest = PostAlgorithmRequest(requestPayload: algorithm, path: endpoint)
                APIRequestLoader.loadAPIRequest(postAlgorithmRequest) { (result) in
                    completionHandler(result)
                }
            } catch {
                completionHandler(.failure(.genericError(error)))
            }
        }
    }
    
    func deleteAlgorithm(_ algorithm: Algorithm, completionHandler: @escaping (Result<EmptyAPIResponse, GrioError>) -> Void) {
        let payload = DeleteAlgorithmRequest.Payload(questionType: .leetcode, algorithm: algorithm)
        let deleteAlgorithmRequest = DeleteAlgorithmRequest(requestPayload: payload)
        
        APIRequestLoader.loadAPIRequest(deleteAlgorithmRequest, completionHandler: completionHandler)
    }
    
    func postErrorMessage() {
        let postErrorMessageRequest = PostErrorMessageRequest(requestPayload: ())
        
        APIRequestLoader.loadAPIRequest(postErrorMessageRequest) { (_) in
        }
    }
}
