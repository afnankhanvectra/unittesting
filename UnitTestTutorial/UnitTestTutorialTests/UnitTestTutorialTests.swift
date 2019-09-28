//
//  UnitTestTutorialTests.swift
//  UnitTestTutorialTests
//
//  Created by Afnan Khan on 9/19/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import XCTest

@testable import UnitTestTutorial



class UnitTestTutorialTests: XCTestCase {

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
    func test001_Guess() {
        
        // Given
        let guesss = 10
        // When
        let resut = sut?.check(guess : guesss)
        
        // Then
        XCTAssertEqual(resut,1000, "Score computed from guess is wrong")
        
    }
    

}
