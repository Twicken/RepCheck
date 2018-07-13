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
        continueAfterFailure = true
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testElementsScenes() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // Get a reference to the app
        let app = XCUIApplication()
        
        // Step 1 Testing
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

        // Test of the picker wheel - Pre test and Action Test
        
        let pickerWheel = app.pickers["countrypicker"].children(matching: .pickerWheel).element
        XCTAssertEqual(pickerWheel.value as! String, "")
        
        // Add test data to the picker
        app.pickerWheels.element.adjust(toPickerWheelValue: "Australia")
        XCTAssertEqual(pickerWheel.value as! String, "Australia")
        
        
        // Test that there are 7 Static texts on the screen
        XCTAssertEqual(app.staticTexts.count, 7)
        
        // Test that there are 8 buttons on the screen
        XCTAssertEqual(app.buttons.count,8)
    
        // Test that there are only 1 image on the screen
        XCTAssertEqual(app.images.count,1)
        
        // Test the Reset button
        app.buttons["Reset"].tap()
        
        // Post Reset Button Test - Expecting no values stored in the text boxes
        XCTAssertEqual(firstnamebox.value as! String, "")
        XCTAssertEqual(middlenamebox.value as! String, "")
        XCTAssertEqual(surnamebox.value as! String, "")

        // Post Reset Button - Expecting No Value in the picker wheel
        XCTAssertEqual(pickerWheel.value as! String, "")

        // Test the Next button
        app.buttons["Next →"].tap()
        
        // Step 2 Scene Testing
        
        // use the identifier of the textboxes for to establish testing
        let townbox=app.textFields["townbox"]
        let workbox=app.textFields["workbox"]
        let schoolbox=app.textFields["schoolbox"]
        let otherbox=app.textFields["otherbox"]
        
        // Pre Conditions of the text boxes Scene 2
        // Expecting no value inititally before input
        XCTAssertEqual(townbox.value as! String, "")
        XCTAssertEqual(workbox.value as! String, "")
        XCTAssertEqual(schoolbox.value as! String, "")
        XCTAssertEqual(otherbox.value as! String, "")
        
        // Action Tests
        // Test that the first text box (Town) is found and accepts user inputs
        townbox.tap()
        
        // Input of text
        townbox.typeText("Sydney")
        
        // Test that the second text box (Work) is found and accepts user inputs
        workbox.tap()
        
        // Input of text
        workbox.typeText("Big Company")
        
        // Test that the third text box (School) is found and accepts user inputs
        schoolbox.tap()
        
        schoolbox.typeText("RMIT")
        
        // Test that the fourth text box (Other) is found and accepts user inputs
        otherbox.tap()
        
        otherbox.typeText("kelso")
        
        // Navigation button testing between scenes
        app.buttons["← Back"].tap()
        app.buttons["Next →"].tap()
        
        // Post Conditions of the text boxes Scene 2
        // Expecting no value inititally before input
        XCTAssertEqual(townbox.value as! String, "Sydney")
        XCTAssertEqual(workbox.value as! String, "Big Company")
        XCTAssertEqual(schoolbox.value as! String, "RMIT")
        XCTAssertEqual(otherbox.value as! String, "kelso")
        
        // Navigation button testing between scenes
        
        app.buttons["Reset"].tap()
        
        // Test correct Static texts quantity on the screen
        XCTAssertEqual(app.staticTexts.count, 7)
        
        // Test correct buttons quantity on the screen
        XCTAssertEqual(app.buttons.count,6)
        
        // Test correct images quantity on the screen
        XCTAssertEqual(app.images.count,1)
        
        // Navigate to Step 3 Scene
        app.buttons["Next →"].tap()
        
        // Step 4 Scene Testing
        
    }
    
    
    
}
