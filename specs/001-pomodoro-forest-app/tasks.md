# Tasks: Forest-style Pomodoro App

**Input**: Design documents from `/specs/001-pomodoro-forest-app/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), data-model.md

## Phase 1: Setup (Shared Infrastructure)

- [ ] T001 Create Xcode project `ForestFocus`
- [ ] T002 [P] Configure basic project settings and signing
- [ ] T003 [P] Set up SwiftLint for code quality

## Phase 2: Foundational (Blocking Prerequisites)

- [ ] T004 [P] Create `Session`, `Tree`, and `UserStats` models in `ForestFocus/Models/`
- [ ] T005 [P] Implement `PersistenceService` in `ForestFocus/Services/PersistenceService.swift` to manage SwiftData
- [ ] T006 [P] Implement `NotificationService` in `ForestFocus/Services/NotificationService.swift` to handle local notifications
- [ ] T007 Create basic UI structure with `TabView` for `SessionView`, `ForestView`, and `StatsView` in `ForestFocus/ForestFocusApp.swift`

## Phase 3: User Story 1 - Start a Focus Session (Priority: P1) 🎯 MVP

**Goal**: Allow users to start a 25-minute focus session.

**Independent Test**: A user can start a session, see the countdown timer, and a tree should start growing.

### Tests for User Story 1

- [ ] T008 [P] [US1] Write unit tests for `SessionViewModel` in `ForestFocusTests/Unit/SessionViewModelTests.swift`
- [ ] T009 [P] [US1] Write UI tests for starting a session in `ForestFocusTests/UI/SessionTests.swift`

### Implementation for User Story 1

- [ ] T010 [P] [US1] Implement `SessionView` in `ForestFocus/Views/SessionView.swift` with a "Start" button
- [ ] T011 [P] [US1] Implement `SessionViewModel` in `ForestFocus/ViewModels/SessionViewModel.swift` to handle the timer logic using Combine
- [ ] T012 [US1] Implement the tree growth animation (5 stages) in `SessionView`
- [ ] T013 [US1] Integrate `NotificationService` to schedule a notification on session completion

## Phase 4: User Story 2 - Complete a Focus Session (Priority: P2)

**Goal**: Save the completed session and update stats.

**Independent Test**: A user can complete a session, and the tree is added to their forest view.

### Tests for User Story 2

- [ ] T014 [P] [US2] Write unit tests for `PersistenceService` saving a session in `ForestFocusTests/Unit/PersistenceServiceTests.swift`

### Implementation for User Story 2

- [ ] T015 [US2] Implement logic in `SessionViewModel` to save the completed session using `PersistenceService`
- [ ] T016 [US2] Update `UserStats` when a session is completed

## Phase 5: User Story 3 - Cancel a Focus Session (Priority: P2)

**Goal**: Allow users to cancel a session.

**Independent Test**: A user can cancel a session, and the tree is marked as "killed".

### Tests for User Story 3

- [ ] T017 [P] [US3] Write UI tests for canceling a session in `ForestFocusTests/UI/SessionTests.swift`

### Implementation for User Story 3

- [ ] T018 [US3] Implement "Cancel" button in `SessionView`
- [ ] T019 [US3] Implement logic in `SessionViewModel` to handle session cancellation and mark the tree as withered

## Phase 6: User Story 4 - View Forest and Stats (Priority: P3)

**Goal**: Display the user's forest and stats.

**Independent Test**: A user can navigate to a "Forest" or "Stats" screen and see their completed trees and statistics.

### Tests for User Story 4

- [ ] T020 [P] [US4] Write UI tests for `ForestView` and `StatsView` in `ForestFocusTests/UI/`

### Implementation for User Story 4

- [ ] T021 [P] [US4] Implement `ForestView` in `ForestFocus/Views/ForestView.swift` to display a grid of grown trees
- [ ] T022 [P] [US4] Implement `ForestViewModel` in `ForestFocus/ViewModels/ForestViewModel.swift` to fetch data from `PersistenceService`
- [ ] T023 [P] [US4] Implement `StatsView` in `ForestFocus/Views/StatsView.swift` to display user statistics
- [ ] T024 [P] [US4] Implement `StatsViewModel` in `ForestFocus/ViewModels/StatsViewModel.swift` to fetch data from `PersistenceService`

## Phase 7: Polish & Cross-Cutting Concerns

- [ ] T025 [P] Implement accessibility features (VoiceOver, Dynamic Type) for all views
- [ ] T026 [P] Perform memory and performance profiling to ensure the app meets the <50MB and 60fps requirements
- [ ] T027 [P] Final code cleanup and refactoring
- [ ] T028 [P] Update `README.md` with final instructions

## Dependencies & Execution Order

- **Phase 1 & 2** must be completed before any user story implementation.
- **User Stories** can be implemented in parallel after Phase 2 is complete.

## Parallel Opportunities

- Most tasks within each user story phase are marked with `[P]` and can be worked on in parallel.
- Different user stories can be worked on in parallel by different team members.

## Implementation Strategy

### MVP First (User Story 1 Only)

1.  Complete Phase 1 & 2.
2.  Complete Phase 3 (User Story 1).
3.  The app is now a functional MVP that allows users to complete a focus session.

### Incremental Delivery

1.  Deliver MVP (US1).
2.  Add US2 (session completion and stats).
3.  Add US3 (session cancellation).
4.  Add US4 (forest and stats view).
