import Foundation
import SwiftData

class PersistenceService {
    private let modelContainer: ModelContainer

    init() {
        do {
            modelContainer = try ModelContainer(for: Session.self, Tree.self, UserStats.self)
        } catch {
            fatalError("Could not initialize ModelContainer: \(error)")
        }
    }

    @MainActor
    func save(_ session: Session) {
        modelContainer.mainContext.insert(session)
        updateUserStats(for: session)
    }

    @MainActor
    func fetchUserStats() -> UserStats {
        let descriptor = FetchDescriptor<UserStats>()
        if let userStats = try? modelContainer.mainContext.fetch(descriptor).first {
            return userStats
        } else {
            let userStats = UserStats()
            modelContainer.mainContext.insert(userStats)
            return userStats
        }
    }
    
    @MainActor
    func fetchAllTrees() -> [Tree] {
        let descriptor = FetchDescriptor<Tree>()
        return (try? modelContainer.mainContext.fetch(descriptor)) ?? []
    }

    @MainActor
    private func updateUserStats(for session: Session) {
        let userStats = fetchUserStats()
        if session.status == .completed {
            userStats.totalTrees += 1
            userStats.totalFocusTime += session.duration
            if let lastSessionDate = userStats.lastSessionDate, Calendar.current.isDateInYesterday(lastSessionDate) {
                userStats.dailyStreak += 1
            } else {
                userStats.dailyStreak = 1
            }
            userStats.lastSessionDate = session.endTime
        }
    }
}
