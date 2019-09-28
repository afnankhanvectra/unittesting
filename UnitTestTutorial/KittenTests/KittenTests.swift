//
//  KittenTests.swift
//  KittenTests
//
//  Created by Afnan Khan on 9/28/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import XCTest

@testable import UnitTestTutorial


class KittenTests: XCTestCase {

    
    func test001_KittenHasAName() {
        let kitten = Kitten(name: "Uncle Fester")
        XCTAssertEqual(kitten.name, "Uncle Fester", "Kitten name should be set in initializer")
    }

}
