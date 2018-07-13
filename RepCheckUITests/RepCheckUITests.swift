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
        
        // Pre Conditions of the text boxes Scene 1
        // Expecting no value inititally before input
        XCTAssertEqual(firstnamebox.value as! String, "")
        XCTAssertEqual(middlenamebox.value as! String, "")
        XCTAssertEqual(surnamebox.value as! String, "")
        
        // Action Tests
        // Test that the first text box (first name) is found and accepts user inputs
        firstnamebox.tap()
        
        // Input of text
        firstnamebox.typeText("Bob")
        
        // Test that the second text box (middle name) is found and accepts user inputs
        middlenamebox.tap()
        
        // Input of text
        middlenamebox.typeText("Jones")
        
        // Test that the third text box (surname) is found and accepts user inputs
        surnamebox.tap()
        
        surnamebox.typeText("Miller")
        
        // Post Conditions Test
        // Test to ensure the is what we expected
        XCTAssertEqual(firstnamebox.value as! String, "Bob")
        XCTAssertEqual(middlenamebox.value as! String, "Jones")
        XCTAssertEqual(surnamebox.value as! String, "Miller")

        // Test of the picker wheel
        app.pickerWheels.element.adjust(toPickerWheelValue: "Australia")
        
        // Test that there are 7 Static texts on the screen
        XCTAssertEqual(app.staticTexts.count, 7)
        
        // Test that there are 8 buttons on the screen
        XCTAssertEqual(app.buttons.count,8)
    
        // Test that there are only 1 image on the screen
        XCTAssertEqual(app.images.count,1)
        
        // Test the Reset button
        app.buttons["Reset"].tap()
        
        // Expecting no values stored in the text boxes
        XCTAssertEqual(firstnamebox.value as! String, "")
        XCTAssertEqual(middlenamebox.value as! String, "")
        XCTAssertEqual(surnamebox.value as! String, "")
        
        // Test the Next button
        app.buttons["Next →"].tap()
        
        
        
        
        
        
        
    }
    
    
    
}
