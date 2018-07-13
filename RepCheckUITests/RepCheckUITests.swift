//
//  RepCheckUITests.swift
//  RepCheckUITests
//
//  Created by Joel Wall on 12/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import XCTest

class RepCheckUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testElementsScene1() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // Get a reference to the app
        let app = XCUIApplication()
        
        
        // use the identifier of the textboxes for to establish testing
        let firstnamebox=app.textFields["firstnamebox"]
        let middlenamebox=app.textFields["middlenamebox"]
        let surnamebox=app.textFields["surnamebox"]

        // Below line Used in identifying elements
        // print(app.debugDescription)
        
        // Test that the first text box (first name) is found and accepts user inputs
        firstnamebox.tap()
        firstnamebox.typeText("Bob")
        
        // Test that the second text box (middle name) is found and accepts user inputs
        middlenamebox.tap()
        middlenamebox.typeText("Jones")
        
        // Test that the third text box (surname) is found and accepts user inputs
        surnamebox.tap()
        surnamebox.typeText("Miller")
        
        // Test of the picker wheel
        let pickerWheel = app.pickers["countrypicker"].children(matching: .pickerWheel).element
        pickerWheel.swipeUp()
        pickerWheel.tap()
        
        // Test that there are 7 Static texts on the screen
        
        XCTAssertEqual(app.staticTexts.count, 7)
        
        // Test that there are 8 buttons on the screen
        XCTAssertEqual(app.buttons.count,8)
    
        // Test that there are only 1 image on the screen
        XCTAssertEqual(app.images.count,1)
        
        // Test the Reset button
        app.buttons["Reset"].tap()
        
                // Test the Next button
        app.buttons["Next →"].tap()
        
        
        
        
        
        
        
    }
    
    
    
}
