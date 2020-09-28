//
//  NIBM_COVID19UITests.swift
//  NIBM COVID19UITests
//
//  Created by Mohamed Minsaf on 8/22/20.
//  Copyright © 2020 Mohamed Minsaf. All rights reserved.
//

import XCTest

class NIBM_COVID19UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func LoginTesting(){
        
        let email = "Bibb@gmail.com"
        let password = "M@mnf.dev7"
        
        let app = XCUIApplication()
        app.launch()
        
        let emailText = app.textFields["Email"]
        XCTAssert(emailText.exists)
        emailText.tap()
        emailText.typeText(email)
        
        
        let pwordText = app.secureTextFields["Password"]
        XCTAssert(pwordText.exists)
        emailText.tap()
        emailText.typeText(password)
        
        let loginBtn = app.buttons["Login"]
        loginBtn.tap()
        
    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
