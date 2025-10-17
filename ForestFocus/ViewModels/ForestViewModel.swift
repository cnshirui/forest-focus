import Foundation

class ForestViewModel: ObservableObject {
    @Published var trees: [Tree] = []
    private let persistenceService = PersistenceService()

    @MainActor
    func fetchTrees() {
        trees = persistenceService.fetchAllTrees()
    }
}
