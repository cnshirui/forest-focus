import SwiftUI

struct SessionView: View {
    @StateObject private var viewModel = SessionViewModel()

    var body: some View {
        VStack {
            Text(viewModel.treeGrowth)
                .font(.system(size: 100))
                .padding()
                .accessibilityLabel(Text("Growing Tree"))

            Text("\(viewModel.timeRemainingFormatted)")
                .font(.largeTitle)
                .padding()
                .accessibilityLabel(Text("Time Remaining"))
                .accessibilityValue(Text("\(viewModel.timeRemainingFormatted)"))

            Button(viewModel.isSessionActive ? "Pause" : "Start") {
                if viewModel.isSessionActive {
                    viewModel.pauseSession()
                } else {
                    viewModel.startSession()
                }
            }
            .padding()
            .accessibilityHint(Text(viewModel.isSessionActive ? "Pauses the current session" : "Starts a new session"))

            if viewModel.isSessionActive {
                Button("Cancel") {
                    viewModel.cancelSession()
                }
                .padding()
                .accessibilityHint(Text("Cancels the current session"))
            }
        }
    }
}
