//
//  URLSessionMock.swift
//  UnitTestTutorial
//
//  Created by Afnan Khan on 9/27/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import Foundation



class URLSessionMock: URLSession {
    
    // Data and Error properties that we set ourselves in our test cases.
    var data: Data?
    var error: Error?
    
    // Our custom dataTask function.
    // Same properties as URLSession.shared.dataTask
    override func dataTask(with url: URL,
                           completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
        -> URLSessionDataTask {
            // What to put here?
            let data = self.data
            let error = self.error
            
            return URLSessionDataTaskMock {
                completionHandler(data, nil, error)
            }
    }
}

