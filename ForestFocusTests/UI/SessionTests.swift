import XCTest

class SessionTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testStartSession() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["Start"].tap()
        
        XCTAssert(app.staticTexts["24:59"].waitForExistence(timeout: 2))
    }

    func testCancelSession() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["Start"].tap()
        app.buttons["Cancel"].tap()

        XCTAssert(app.staticTexts["25:00"].waitForExistence(timeout: 2))
    }
}
