//
//  swifty_companionTests.swift
//  swifty-companionTests
//
//  Created by Gordon RASS-KWASI on 7/28/16.
//  Copyright © 2016 Gordon RASS-KWASI. All rights reserved.
//

import XCTest
@testable import swifty_companion

class swifty_companionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testStundentInitialization() {
        let gordon = Student(login: "grass-kw", photo: nil, email: "grass-kw@student.42.fr", mobile: "0660637534", niveau: 12.42)
        XCTAssertNotNil(gordon, "gordon succeful create")
    }
}
