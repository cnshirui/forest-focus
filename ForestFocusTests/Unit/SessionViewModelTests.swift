import XCTest
@testable import ForestFocus

class SessionViewModelTests: XCTestCase {

    var viewModel: SessionViewModel!

    override func setUp() {
        super.setUp()
        viewModel = SessionViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testStartSession() {
        viewModel.startSession()
        XCTAssertTrue(viewModel.isSessionActive)
        XCTAssertEqual(viewModel.timeRemaining, 1500)
    }

    func testPauseSession() {
        viewModel.startSession()
        viewModel.pauseSession()
        XCTAssertFalse(viewModel.isSessionActive)
    }
}
