//
//  URLSessionDataTaskMock.swift
//  UnitTestTutorial
//
//  Created by Afnan Khan on 9/27/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import Foundation

// We create a partial mock by subclassing the original class
class URLSessionDataTaskMock: URLSessionDataTask {
    
    private let closure: () -> Void
    
    // We have to give the Data Task a closure on initialization.
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    // We override the 'resume' method and simply call our closure
    // instead of actually resuming any task.
    override func resume() {
        closure()
    }
}
