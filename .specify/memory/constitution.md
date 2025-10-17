<!--
Sync Impact Report:
- Version change: 1.0.0 -> 2.0.0
- Modified principles:
  - `I. Code Quality` -> `I. Simplicity and Offline-First`
  - `II. Testing Standards` -> `II. Test-First Development`
  - `III. User Experience Consistency` -> `III. Performance`
  - `IV. Performance Requirements` -> `IV. Accessibility`
- Added sections: None
- Removed sections: None
- Templates requiring updates:
  - `.specify/templates/plan-template.md` (✅ updated)
  - `.specify/templates/spec-template.md` (✅ updated)
  - `.specify/templates/tasks-template.md` (✅ updated)
- Follow-up TODOs: None
-->
# Forest Focus Constitution
<!-- Example: Spec Constitution, TaskFlow Constitution, etc. -->

## Core Principles

### I. Simplicity and Offline-First
The iOS app must be radically simple and fully functional offline. Complexity must be justified and approved.

### II. Test-First Development
All new features and bug fixes must be implemented using Test-Driven Development (TDD). No production code is written without a failing test.

### III. Performance
The application must be highly performant, with all animations running at a consistent 60fps and a cold start time of less than 2 seconds.

### IV. Accessibility
The app must be accessible to everyone. Full support for VoiceOver and Dynamic Type is non-negotiable.

## Development Workflow

All code changes must be submitted through a pull request and receive at least one approval from another team member before being merged.

## Governance

This constitution is the single source of truth for project standards. Any amendments must be proposed and agreed upon by the team, with a clear migration plan for existing code if necessary.

**Version**: 2.0.0 | **Ratified**: 2025-10-16 | **Last Amended**: 2025-10-16
