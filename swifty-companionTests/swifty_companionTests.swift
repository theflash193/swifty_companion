//
//  swifty_companionTests.swift
//  swifty-companionTests
//
//  Created by Gordon RASS-KWASI on 7/28/16.
//  Copyright © 2016 Gordon RASS-KWASI. All rights reserved.
//

import XCTest
import Alamofire
import Foundation

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
        print("hello world")
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testApirequest() {
        print("hello world")
        Alamofire.request(.GET, "http://date.jsontest.com", parameters: ["one": "two"]).responseJSON { response in
                print(response.request)
                print(response.response)
                print(response.data)
                print(response.result)
            
            
                if let JSON = response.result.value {
                    print("JSOON: \(JSON)")
                }
        }
        
    }
    
    func testRequestClassMethodWithMethodAndURL() {
        // Given
        let URLString = "https://httpbin.org/"
        
        // When
        let request = Alamofire.request(.GET, URLString)
        
        // Then
        XCTAssertNotNil(request.request, "request URL request should not be nil")
        XCTAssertEqual(request.request?.HTTPMethod ?? "", "GET", "request HTTP method should match expected value")
        XCTAssertEqual(request.request?.URLString ?? "", URLString, "request URL string should be equal")
        XCTAssertNil(request.response, "request response should be nil")
    }
    
    func testRequestClassMethodWithMethodAndURLAndParameters() {
        // Given
        let URLString = "https://httpbin.org/get"
        
        // When
        let request = Alamofire.request(.GET, URLString, parameters: ["foo": "bar"])
        
        // Then
        XCTAssertNotNil(request.request, "request URL request should not be nil")
        XCTAssertEqual(request.request?.HTTPMethod ?? "", "GET", "request HTTP method should match expected value")
        XCTAssertNotEqual(request.request?.URLString ?? "", URLString, "request URL string should be equal")
        XCTAssertEqual(request.request?.URL?.query ?? "", "foo=bar", "query is incorrect")
        XCTAssertNil(request.response, "request response should be nil")
    }
    
    func testRequestClassMethodWithMethodURLParametersAndHeaders() {
        // Given
        let URLString = "https://httpbin.org/get"
        let headers = ["Authorization": "123456"]
        
        // When
        let request = Alamofire.request(.GET, URLString, parameters: ["foo": "bar"], headers: headers)
        
        // Then
        XCTAssertNotNil(request.request, "request should not be nil")
        XCTAssertEqual(request.request?.HTTPMethod ?? "", "GET", "request HTTP method should match expected value")
        XCTAssertNotEqual(request.request?.URLString ?? "", URLString, "request URL string should be equal")
        XCTAssertEqual(request.request?.URL?.query ?? "", "foo=bar", "query is incorrect")
        
        let authorizationHeader = request.request?.valueForHTTPHeaderField("Authorization") ?? ""
        XCTAssertEqual(authorizationHeader, "123456", "Authorization header is incorrect")
        
        XCTAssertNil(request.response, "response should be nil")
    }

    func testRequestResponse() {
        // Given
        let URLString = "https://httpbin.org/get"
        
        let expectation = expectationWithDescription("GET request should succeed: \(URLString)")
        
        var request: NSURLRequest?
        var response: NSHTTPURLResponse?
        var data: NSData?
        var error: NSError?
        
        // When
        Alamofire.request(.GET, URLString, parameters: ["foo": "bar"])
            .response { responseRequest, responseResponse, responseData, responseError in
                request = responseRequest
                response = responseResponse
                data = responseData
                error = responseError
                
                expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(timeout, handler: nil)
        
        // Then
        XCTAssertNotNil(request, "request should not be nil")
        XCTAssertNotNil(response, "response should not be nil")
        XCTAssertNotNil(data, "data should not be nil")
        XCTAssertNil(error, "error should be nil")
    }
}
