//
//  TableViewUnitTest.swift
//  TableViewUnitTest
//
//  Created by Afnan Khan on 9/28/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import XCTest
@testable import UnitTestTutorial

class TableViewUnitTest: XCTestCase {
    
    var controller: KittenViewController!
    var tableView: UITableView!
    var dataSource: KittenDataSource!
    var delegate: UITableViewDelegate!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        guard let vc = UIStoryboard(name: "Main", bundle: Bundle(for: KittenViewController.self)).instantiateInitialViewController() as? KittenViewController else {
            return XCTFail("Could not instantiate ViewController from main storyboard")
        }
        
        controller = vc
        controller.loadViewIfNeeded()
        
        tableView = controller.tableView
        guard let ds = tableView.dataSource as? KittenDataSource else {
            return XCTFail("Controller's table view should have a kitten data source")
        }
        dataSource = ds
        delegate = tableView.delegate
        
    }

    override func tearDown() {
        controller = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test001_ControllerHasTableView() {
        
         XCTAssertNotNil(controller.tableView, "Controller should have a tableview")
    }
    
    
    func test002_TableViewDataSourceIsKittenDataSource() {
       
        
        XCTAssertTrue(controller.tableView.dataSource is KittenDataSource,
                      "TableView's data source should be a KittenDataSource")
    }
    
    
    func test003_KittenIsNotAdoptableByDefault() {
        let kitten = Kitten(name: "Uncle Fester")
        XCTAssertFalse(kitten.isAdoptable,
                       "Kitten should not be adoptable by default")
    }
    
    
    func test004_TableViewHasCells() {
        
        let cell = controller.tableView.dequeueReusableCell(withIdentifier: "Cell")
        XCTAssertNotNil(cell,
                        "TableView should be able to dequeue cell with identifier: 'Cell'")
    }
    
    func test005_KittenCellHasDisclosureIndicatorWhenAdoptable() {
        guard let dataSource = controller.tableView.dataSource as? KittenDataSource else {
            return XCTFail("Controller's table view should have a kitten data source")
        }
        let kitten = Kitten(name: "Adopt Me")
        kitten.isAdoptable = true
        
        dataSource.kittens.append(kitten)
        
        let cell = dataSource.tableView(controller.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.accessoryType, .disclosureIndicator,
                       "Cell should have disclosure indicator for adoptable kitten")
    }
    
    
    func test006_KittenCellDoesNotHaveDisclosureIndicatorWhenNotAdoptable() {
        guard let dataSource = controller.tableView.dataSource as? KittenDataSource else {
            return XCTFail("Controller's table view should have a kitten data source")
        }
        
        let kitten = Kitten(name: "Cannot Adopt Me")
        dataSource.kittens.append(kitten)
        
        let cell = dataSource.tableView(controller.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.accessoryType, .none,
                       "Cell should have no indicator for a non-adoptable kitten")
    }
    
    func test007_TableViewDelegateIsViewController() {
        XCTAssertTrue(controller.tableView.delegate === controller,
                      "Controller should be delegate for the table view")
    }
    
    func test008_CannotSelectCellWhenNotAdoptable() {
        let kitten = Kitten(name: "Cannot Adopt Me")
        dataSource.kittens.append(kitten)
        
        XCTAssertNil(delegate.tableView?(tableView, willSelectRowAt: IndexPath(row: 0, section: 0)),
                     "Delegate should not allow cell selection for non-adoptable kittens")
    }
    
    /// For this ,add code of will select in view controller , delegate
    func test009_CanSelectCellWhenAdoptable() {
        let kitten = Kitten(name: "Adopt Me")
        kitten.isAdoptable = true
        dataSource.kittens.append(kitten)
        XCTAssertEqual(delegate.tableView?(tableView, willSelectRowAt: IndexPath(row: 0, section: 0)), IndexPath(row: 0, section: 0),
                       "Delegate should allow cell selection for adoptable kittens")
    }
    
    
    //MARK:  Unit test of URL
    ////Now add someURL
    func test010_URLOpenerProtocol() {
        XCTAssertTrue(UIApplication.shared is URLOpener,
                      "UIApplication.shared should conform to URLOpener")
    }
    
    
    
    func test011_DefaultOpenerForDelegate() {
        XCTAssertTrue(controller.opener === UIApplication.shared,
                      "Shared application should be default opener for delegate")
    }
    
    
    func test012_SelectingCellOpensUrl() {
        let kitten = Kitten(name: "AdoptableKitten")
        kitten.isAdoptable = true
        dataSource.kittens.append(kitten)
        
        let mockURLOpener = MockURLOpener()
        controller.opener = mockURLOpener
        
        delegate.tableView?(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        guard mockURLOpener.openURLCalled,
            let url = mockURLOpener.openURLURL else {
                return XCTFail("Should have called openURL on url opener")
        }
        
        
        //Check below URL for testing because adobtable kitten is not valid url for
        XCTAssertEqual(url, URL(string: "https://www.google.com/search?q=Kitten0"),
                       "Should attempt to open correct url")
    }
    

    
}


private class MockURLOpener: URLOpener {
    var openURLCalled = false
    var openURLURL: URL?
    
    func openURL(_ url: URL) -> Bool {
        openURLCalled = true
        openURLURL = url
        return true
    }
}
