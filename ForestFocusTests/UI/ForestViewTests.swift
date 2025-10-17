import XCTest

class ForestViewTests: XCTestCase {

    func testForestView() throws {
        let app = XCUIApplication()
        app.launch()

        app.tabBars.buttons["Forest"].tap()
        
        XCTAssert(app.staticTexts["Your Forest"].waitForExistence(timeout: 2))
    }
}
