import Foundation

class StatsViewModel: ObservableObject {
    @Published var userStats: UserStats = UserStats()
    private let persistenceService = PersistenceService()

    var totalFocusTimeFormatted: String {
        let hours = Int(userStats.totalFocusTime) / 3600
        let minutes = (Int(userStats.totalFocusTime) % 3600) / 60
        return "\(hours)h \(minutes)m"
    }

    @MainActor
    func fetchUserStats() {
        userStats = persistenceService.fetchUserStats()
    }
}
