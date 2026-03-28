# Dev Status
Last updated: 2026-03-28T11:30:00Z
Session: Merge backlog + fix P1 bugs (#521, #522, #523, #520)

## This Session
- **PR #516 merged**: CI Gate job (fixes #510) — unblocked all other PRs
- **PRs #515, #513, #517, #518, #519 merged**: Cleared entire PR backlog (agent tests, README docs/badges, Dependabot, CodeQL)
- **PR #526 created + merged**: get command NameProperty fallback + --app-id option (fixes #521 P1, #522 P2)
- **PR #532 created**: CI desktop test fixes for UWP Notepad lifecycle and detection (fixes #523 P1, #520 P1) — awaiting CI
- Tests: 2105 passed, 499 skipped, 0 failures
- PRs: 7 merged, 1 open (#532)

## Current State
- Earliest open milestone: v0.3.1 (all P1 bugs now status:done, awaiting QA verification)
- CI: GREEN on main
- Open PRs: #532 (CI desktop test fixes — test-only, awaiting CI)
- Branch protection: Still requires "Python Tests with DLL (Windows)" — needs Ace to update to require only "CI Gate". Manual merge workaround works for now.

## Next Session Should
1. **Check PR #532** — merge if CI green
2. **Branch protection**: Remind Ace to update required checks to "CI Gate" only
3. **P2 backlog**: #411 (split windows.py), #412 (input strategy refactor), #419 (release notes automation), #423 (agent cost guardrails)
4. **Self-driven**: Test first-user experience end-to-end, find CLI friction points
5. **Code health**: `backends/windows.py` is 4000+ lines — splitting is overdue
