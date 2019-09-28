//
//  PartialMockUnitTestTutorialTests.swift
//  PartialMockUnitTestTutorialTests
//
//  Created by Afnan Khan on 9/27/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import XCTest
@testable import UnitTestTutorial

class PartialMockUnitTestTutorialTests: XCTestCase {
    
    var sut : ViewController?


    
    override func setUp() {
        super.setUp()
        sut = UIStoryboard(name: "Main", bundle: nil)
            .instantiateInitialViewController() as? ViewController
        
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
        
    }
    
    
    func testSuccessfulResponse() {
        
        let url = NSURL(string: "https://jsonplaceholder.typicode.com/todos")

         // Initializing our NetworkManager class instance
        // Arbitrary Data object for the purpose of this test
        let data = Data(bytes: [0, 1, 0, 1])
        
        // Create our URLSession subclass instance
        // Let the session know about our data instance
        let session = URLSessionMock()
        session.data = data
        
        // Create our NetworkManager instance, and pass it along our URLSession instance
        let manager = NetworkManager(session: session)
        
        // Set up a NetworkResult, call loadData on our NetworkManager, and store the resulting data in result
        var result: NetworkResult?
        manager.loadData(from: url! as URL) { result = $0 }
        XCTAssertEqual(result, .success(data))
        
    }

   
}
