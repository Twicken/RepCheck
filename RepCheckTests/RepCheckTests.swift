//
//  RepCheckTests.swift
//  RepCheckTests
//
//  Created by Joel Wall on 12/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import XCTest
@testable import RepCheck

// For Unit Testing purposes, main Model() could not be tested due to being Private

class RepCheckTests: XCTestCase {
    
    var result: Result = Result(title: "", displayLink: "", snippet:"" )
    
    
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
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
   
    func testResult()
    {
        XCTAssertNotNil(Result.init(title: "", displayLink: "", snippet:""))
        
        
    }
    
    
}
