import Foundation
import SwiftData

@Model
final class UserStats {
    var id: UUID
    var totalTrees: Int
    var totalFocusTime: TimeInterval
    var dailyStreak: Int
    var lastSessionDate: Date?

    init(id: UUID = UUID(), totalTrees: Int = 0, totalFocusTime: TimeInterval = 0, dailyStreak: Int = 0, lastSessionDate: Date? = nil) {
        self.id = id
        self.totalTrees = totalTrees
        self.totalFocusTime = totalFocusTime
        self.dailyStreak = dailyStreak
        self.lastSessionDate = lastSessionDate
    }
}
