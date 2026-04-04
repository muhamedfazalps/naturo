# QA Status
Last updated: 2026-04-04 18:30
Current round: 108
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 1 failed (known #777 Unicode), 14 passed, 18 skipped (commit a140e8b)
- Issues verified: #787, #789, #785, #725, #719, #105, #104 (all pass — closed)
- E2E tests: Notepad (pass), Explorer (pass)
- Regression: 9/9 passed, 0 retired
- New test cases created: TC-0050
- Test cases cleaned up: none
- New issues created: #840
- Total active test cases: ~25
- Tests run: 9 regression + 2 E2E + 5 exploratory

## Top 3 Risks
1. **Multi-line type broken** (#840) — default mode drops newlines, impacts enterprise data entry workflows
2. **UWP menu click regression** (#786) — click eN on Notepad menu highlights but doesn't open dropdown
3. **Unicode capture path** (#777) — naturo_core.dll still fails with Unicode file paths, in backlog
