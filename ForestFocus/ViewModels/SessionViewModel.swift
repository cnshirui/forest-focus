import Foundation
import Combine

class SessionViewModel: ObservableObject {
    @Published var timeRemaining: TimeInterval = 1500
    @Published var isSessionActive = false

    private var timer: AnyCancellable?
    private let notificationService = NotificationService()
    private let persistenceService = PersistenceService()

    var timeRemainingFormatted: String {
        let minutes = Int(timeRemaining) / 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    var treeGrowth: String {
        switch timeRemaining {
        case 1200...1500:
            return "🌱"
        case 900...1199:
            return "🌿"
        case 600...899:
            return "🌳"
        case 300...599:
            return "🌲"
        case 0...299:
            return "🎄"
        default:
            return ""
        }
    }

    func startSession() {
        isSessionActive = true
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect().sink { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.isSessionActive = false
                self.timer?.cancel()
                self.notificationService.scheduleNotification(title: "Session Complete!", body: "You've grown a new tree!", timeInterval: 1)
                self.saveSession(status: .completed)
            }
        }
    }

    func pauseSession() {
        isSessionActive = false
        timer?.cancel()
    }

    func cancelSession() {
        isSessionActive = false
        timer?.cancel()
        saveSession(status: .abandoned)
        timeRemaining = 1500
    }

    private func saveSession(status: SessionStatus) {
        let tree = Tree(growthStage: 5, isWithered: status == .abandoned)
        let session = Session(startTime: Date().addingTimeInterval(-1500), endTime: Date(), duration: 1500, status: status, tree: tree)
        persistenceService.save(session)
    }
}
