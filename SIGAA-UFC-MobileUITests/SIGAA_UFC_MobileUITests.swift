//
//  SIGAA_UFC_MobileUITests.swift
//  SIGAA-UFC-MobileUITests
//
//  Created by Tales Conrado on 11/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import XCTest
@testable import SIGAA_UFC_Mobile

class SIGAA_UFC_MobileUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func test_Login_Procedure() {
        let app = XCUIApplication()
        app.launchArguments = ["-reset", "-noAnimations"]
        app.launch()

        login()

        let coursesList = app.tables.matching(identifier: "coursesList")
        XCTAssert(coursesList.count == 1)

    }
    
    func test_tap_course() {
        let app = XCUIApplication()
        app.launchArguments = ["-reset", "-noAnimations"]
        app.launch()

        login()
        
        let coursesList = app.tables.matching(identifier: "coursesList")
        coursesList.cells.element(boundBy: 0).tap()
        
        let segmented = app.segmentedControls.element(boundBy: 0)
        XCTAssert(segmented.exists)
    }
    
    func test_taskModal() {
        let app = XCUIApplication()
        app.launchArguments = ["-reset", "-noAnimations"]
        app.launch()

        login()
        
        let coursesList = app.tables.matching(identifier: "coursesList")
        coursesList.cells.element(boundBy: 0).tap()
        
        let modal = app.navigationBars.buttons.element(boundBy: 1)
        _ = modal.waitForExistence(timeout: 1)
        modal.tap()
        
        app.sheets.buttons["Nova Tarefa"].tap()
        sleep(1)
        
        XCTAssert(app.textFields.element(boundBy: 0).exists)
    }
    
    func test_NoteModal() {
        let app = XCUIApplication()
        app.launchArguments = ["-reset", "-noAnimations"]
        app.launch()

        login()
        
        let coursesList = app.tables.matching(identifier: "coursesList")
        coursesList.cells.element(boundBy: 0).tap()
        
        app.navigationBars.buttons.element(boundBy: 1).tap()
        
        app.sheets.buttons["Nova Anotação"].tap()
        sleep(1)
        
        XCTAssert(app.textFields.element(boundBy: 0).exists)
    }
    
    func login() {
        let app = XCUIApplication()
        app.launchArguments = ["-reset", "-noAnimations"]
        app.launchArguments += ["-isUserLoggedIn", "0"]
        app.launch()

        let login = app.textFields.element(boundBy: 0)
        let password = app.secureTextFields.element(boundBy: 0)
        login.tap()
        login.typeText(ProcessInfo.processInfo.environment["user"]!)
        login.swipeDown()
        
        password.tap()
        password.typeText(ProcessInfo.processInfo.environment["sigaa"]!)
        login.tap()
        
        app.buttons["Entrar"].tap()
        sleep(4)
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
