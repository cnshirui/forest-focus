import SwiftUI

struct StatsView: View {
    @StateObject private var viewModel = StatsViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text("Total Trees: \(viewModel.userStats.totalTrees)")
                    .accessibilityLabel(Text("Total Trees"))
                    .accessibilityValue(Text("\(viewModel.userStats.totalTrees)"))
                Text("Total Focus Time: \(viewModel.totalFocusTimeFormatted)")
                    .accessibilityLabel(Text("Total Focus Time"))
                    .accessibilityValue(Text("\(viewModel.totalFocusTimeFormatted)"))
                Text("Daily Streak: \(viewModel.userStats.dailyStreak)")
                    .accessibilityLabel(Text("Daily Streak"))
                    .accessibilityValue(Text("\(viewModel.userStats.dailyStreak)"))
            }
            .navigationTitle("Your Stats")
            .onAppear {
                viewModel.fetchUserStats()
            }
        }
    }
}
