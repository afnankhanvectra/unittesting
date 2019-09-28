//
//  UnitTestTutorialUITests.swift
//  UnitTestTutorialUITests
//
//  Created by Afnan Khan on 9/27/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import XCTest

class UnitTestTutorialUITests: XCTestCase {

    var app: XCUIApplication!

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app = XCUIApplication()

        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launchArguments.append("--uitesting")
        app.launch()


        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test00_Example() {
        app = XCUIApplication()
 
        // Button
        app.buttons["Done"].tap()
        
        // Label test
        // fpor label  remeber dontset accessibilityLabel ELSE IT WONT WORK
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "testingLabel").label, "Its done")
        
        
        // UIText Feild
        app.textFields.element.tap()
        let textField = app.textFields["testingTextField"]
        textField.typeText("text_user_typed_in")
        XCTAssertEqual(textField.value as! String, "text_user_typed_in")

        // Image View
        XCTAssert(app.images["testingImageView"].exists)

        // Tableview
        
 
         debugPrint("test")

 
     }

}
