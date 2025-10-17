# Data Model: Forest-style Pomodoro App

## Entities

### Session
Represents a single focus session.

**Attributes**:
- `id`: UUID - Unique identifier for the session.
- `startTime`: Date - The time the session started.
- `endTime`: Date - The time the session ended.
- `duration`: TimeInterval - The duration of the session in seconds.
- `status`: String (Enum: `completed`, `abandoned`) - The status of the session.
- `tree`: Relationship to Tree (one-to-one)

### Tree
Represents the virtual tree planted during a session.

**Attributes**:
- `id`: UUID - Unique identifier for the tree.
- `growthStage`: Int - The current growth stage of the tree (1-5).
- `isWithered`: Bool - Whether the tree is withered (session abandoned).
- `session`: Relationship to Session (one-to-one)

### UserStats
Represents the user's statistics.

**Attributes**:
- `id`: UUID - Unique identifier for the user stats.
- `totalTrees`: Int - The total number of successfully grown trees.
- `totalFocusTime`: TimeInterval - The total focus time in seconds.
- `dailyStreak`: Int - The current daily streak of completed sessions.
- `lastSessionDate`: Date - The date of the last completed session.
