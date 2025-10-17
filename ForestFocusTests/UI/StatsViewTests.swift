import XCTest

class StatsViewTests: XCTestCase {

    func testStatsView() throws {
        let app = XCUIApplication()
        app.launch()

        app.tabBars.buttons["Stats"].tap()
        
        XCTAssert(app.staticTexts["Your Stats"].waitForExistence(timeout: 2))
    }
}
