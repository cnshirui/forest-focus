import SwiftUI

struct ForestView: View {
    @StateObject private var viewModel = ForestViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(viewModel.trees) { tree in
                        Text(tree.isWithered ? "🥀" : "🌳")
                            .font(.largeTitle)
                            .accessibilityLabel(Text(tree.isWithered ? "Withered Tree" : "Grown Tree"))
                    }
                }
            }
            .navigationTitle("Your Forest")
            .onAppear {
                viewModel.fetchTrees()
            }
        }
    }
}
