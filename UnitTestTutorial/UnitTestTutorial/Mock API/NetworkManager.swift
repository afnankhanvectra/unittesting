//
//  NetworkManager.swift
//  UnitTestTutorial
//
//  Created by Afnan Khan on 9/27/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import Foundation

 

enum NetworkResult: Equatable {
    static func == (lhs: NetworkResult, rhs: NetworkResult) -> Bool {
        switch (lhs, rhs) {
        case let (.success(data), .success(data1)): return data == data1
        case let (.failure(err), .failure(err1)): return err?.localizedDescription == err1?.localizedDescription
        case (.success, _), (.failure, _): return false
        }
    }
    
    case success(Data)
    case failure(Error?)
}


class NetworkManager {
    // Stores the session used in this class
    private let session: URLSession

    
    // Dependency Injection + default argument for normal initializ
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func loadData(from url: URL, completionHandler: @escaping (NetworkResult) -> Void) {
        let task = session.dataTask(with: url) { data, _, error in
            let result = data.map(NetworkResult.success) ?? .failure(error)
            completionHandler(result)
        }
        
        task.resume()
    }
}
