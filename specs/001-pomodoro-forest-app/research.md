# Research: Forest-style Pomodoro App

## Decisions

- **UI Framework**: SwiftUI
  - **Rationale**: The user explicitly requested SwiftUI. It is the modern, declarative UI framework for iOS development.
- **Data Persistence**: SwiftData
  - **Rationale**: The user explicitly requested SwiftData. It is a modern, Swift-native persistence framework that integrates well with SwiftUI.
- **Timer**: Combine
  - **Rationale**: The user explicitly requested Combine. It is a powerful framework for handling asynchronous events and data streams, making it ideal for managing the Pomodoro timer.
- **Notifications**: UNUserNotificationCenter
  - **Rationale**: The user explicitly requested UNUserNotificationCenter. It is the standard framework for handling local notifications on iOS.
- **Testing**: XCTest / XCUITest
  - **Rationale**: The user explicitly requested XCTest and XCUITest. These are the standard testing frameworks for iOS development.

## Alternatives Considered

- **UI Framework**: UIKit was considered but rejected in favor of the user's preference for the more modern SwiftUI.
- **Data Persistence**: Core Data was considered, but SwiftData is a more modern and simpler alternative that aligns with the project's tech stack.
- **Timer**: `Timer` class was considered, but Combine provides a more robust and declarative way to handle the timer logic.
