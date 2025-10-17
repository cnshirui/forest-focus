import Foundation
import SwiftData

@Model
final class Tree {
    var id: UUID
    var growthStage: Int
    var isWithered: Bool
    var session: Session?

    init(id: UUID = UUID(), growthStage: Int, isWithered: Bool, session: Session? = nil) {
        self.id = id
        self.growthStage = growthStage
        self.isWithered = isWithered
        self.session = session
    }
}
