import XCTest
@testable import ForestFocus
import SwiftData

class PersistenceServiceTests: XCTestCase {

    var persistenceService: PersistenceService!
    var container: ModelContainer!

    @MainActor
    override func setUp() {
        super.setUp()
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            container = try ModelContainer(for: Session.self, Tree.self, UserStats.self, configurations: config)
            persistenceService = PersistenceService()
        } catch {
            fatalError("Could not initialize ModelContainer: \(error)")
        }
    }

    override func tearDown() {
        persistenceService = nil
        super.tearDown()
    }

    @MainActor
    func testSaveSession() {
        let session = Session(startTime: Date(), endTime: Date(), duration: 1500, status: .completed, tree: nil)
        persistenceService.save(session)
        let descriptor = FetchDescriptor<Session>()
        let sessions = try! container.mainContext.fetch(descriptor)
        XCTAssertEqual(sessions.count, 1)
        XCTAssertEqual(sessions.first?.id, session.id)
    }
}
