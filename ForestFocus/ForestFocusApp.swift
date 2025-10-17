import SwiftUI

@main
struct ForestFocusApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Text("Session View")
                    .tabItem {
                        Label("Session", systemImage: "timer")
                    }

                Text("Forest View")
                    .tabItem {
                        Label("Forest", systemImage: "tree")
                    }

                Text("Stats View")
                    .tabItem {
                        Label("Stats", systemImage: "chart.bar")
                    }
            }
        }
    }
}
