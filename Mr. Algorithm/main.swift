//
//  main.swift
//  Mr. Algorithm
//
//  Created by Richard Blanchard on 5/16/19.
//  Copyright © 2019 Richard Blanchard. All rights reserved.
//

import Foundation
import Einstein

private let networker = Networker()
private let semaphore = DispatchSemaphore(value: 0)

func main() {
    networker.fetchAlgorithms(handleFetchedAlgorithmsResult)
    timeout(after: .now() + 30.0)
    semaphore.wait()
    
}

private func timeout(after time: DispatchTime) {
    DispatchQueue.global().asyncAfter(deadline: time) {
        semaphore.signal()
    }
}

private func handleFetchedAlgorithmsResult(_ result: Result<[Algorithm], GrioError>) {
    do {
        let algorithms = try result.get()
        let pickedAlgorithm = try networker.pickAlgorithm(from: algorithms)
        networker.postAlgorithm(pickedAlgorithm, completionHandler: handlePostedAlgorithmResult)
    } catch {
        networker.postErrorMessage()
    }
}

private func handlePostedAlgorithmResult(_ result: Result<Algorithm, GrioError>) {
    do {
        let postedAlgorithm = try result.get()
        // networker.deleteAlgorithm(postedAlgorithm, completionHandler: handleDeletedAlgorithmResult)
    } catch {
        networker.postErrorMessage()
    }
}

private func handleDeletedAlgorithmResult(_ result: Result<EmptyAPIResponse, GrioError>) {
    do {
        _ = try result.get()
        print("Success :)")
    } catch {
        print("Couldn't delete with error: \(error)")
        print("")
    }
}

main()



