# Naturo Project Status
> Auto-maintained by Orc-Mycelium. Agents: read on every startup.

## Current Version
v0.3.1 (PyPI + GitHub Release)

## Active Work
Query live data — do not rely on this section for specific issue numbers:
```bash
gh issue list --state open --limit 100 --json milestone,number,title,labels \
  --jq 'group_by(.milestone.title // "backlog") | sort_by(.[0].milestone.title // "z") |
  .[] | "\n### \(.[0].milestone.title // "Backlog")\n\(.[] | "- #\(.number) [\(.labels | map(.name) | join(","))] \(.title)")"'
```

## Milestone Summary (2026-05-25 review — Day 57, +12 days since last review)
- **v0.3.2**: **27 open** / 82 closed (75%). **No progress since Apr 5** — project stalled **50 days** on offline runner. 13 issues `status:done` awaiting QA verification (all have merged PRs). Categorization carried over: 8 of 13 are credibly unit-test-verifiable (#781, #783, #810, #832, #833, #834, #840, #844); 5 require a real desktop session (#786, #788, #807, #841, #843). Dev issues: #809 (unified find, P1, needs runner), **#720, #856, #861, #862 UNBLOCKED** (4 pure-Python refactors). **NEW (2026-05-25)**: filed #861 (split `windows/_input.py`, 1,057 lines) and #862 (split `backends/macos.py`, 1,065 lines) — both pure Python, runner-independent, fit existing #720/#856 pattern. **BLOCKER**: self-hosted runner offline **day 57** (#842). #860 (cloud VM proposal) day 18 — 0 assignees, 0 comments. **Proposal held**: ship v0.3.2 = 8 unit-testable issues, defer 5 desktop-required to v0.3.3 — requires explicit Ace authorization. Escalation suppression continues — no fresh #842 comment posted (last 2026-05-08, 17 days ago). 12-day review gap (cron appears to have stopped firing 2026-05-14 to 2026-05-24); this run looks manually invoked.
- **v0.3.3**: 6 open / 1 closed. Enterprise features. Blocked on v0.3.2.
- **v0.3.4**: 18 open / 8 closed. Community, docs, marketing. Blocked on v0.3.2.
- **Backlog**: 9 open (Linux platform, #777 Unicode capture).

## Agent Roster
- **Dev-Sirius**: Technical cofounder. Latest session (2026-04-05): pushed 12 branches — all merged as PRs #845-#855. Idle **50 days**. **UNBLOCKED tasks: #720 (split _element.py), #856 (split browser_cmd.py), #861 (split _input.py), #862 (split macos.py)** — all pure Python, no runner needed. #809 (unified find) still blocked on runner.
- **QA-Mariana**: Quality cofounder. 115 rounds completed. Self-hosted runner offline ~57 days — QA fully blocked. 13 issues awaiting verification. **CRITICAL**: QA is the primary bottleneck for v0.3.2 release.
- **Orc-Mycelium**: Strategic orchestrator. Latest session (2026-05-25): first invocation in 12 days (cron appears to have effectively paused 2026-05-14 → 2026-05-24). Day 57. Escalation suppression continues — last #842 comment 2026-05-08, 17 days ago, no fresh post (Ace has not responded; conditions for breaking suppression unchanged). **Value-add this session**: gap-analysis identified 2 large files >1000 lines with no split issues filed → created #861 (`windows/_input.py`, 1,057 lines) and #862 (`backends/macos.py`, 1,065 lines). Both runner-independent, give Dev-Sirius concrete work on next session restart. State machine still deadlocked pending Ace decision on #842 / #860 / Path-1 ship proposal.

## Coordination
- Bug tracking: GitHub Issues only
- State flow: status:in-progress -> status:done -> verified -> close
- CI must be green before any merge
- **BLOCKER**: Self-hosted runner ROBOT-COMPILE offline day 57 (#842). **ALTERNATIVE**: #860 (cloud Windows VM) — P1, awaiting Ace decision since 2026-05-07 (18 days unassigned)
- GitHub-hosted `windows-latest` runner confirmed CANNOT substitute (no interactive desktop session)
- All remote branches clean (only develop and main)
- CI on develop: GREEN (Build & Test + CodeQL pass)
- Scheduled workflow crons DISABLED on main (PR #858) — re-enable when runner restored

## Code Health
- 150 source files, 222 test files
- Large files needing split: `_element.py` (1,517, #720), `browser_cmd.py` (1,378, #856), `macos.py` (1,065, #862), `_input.py` (1,057, #861) — all four now have tracking issues
- Version consistent: 0.3.1 across pyproject.toml, version.py, PyPI
- 5 stars, 5 forks on GitHub

## Completed Releases
- v0.1.0 — Core features
- v0.1.1 — 67 bug fixes (PyPI)
- v0.2.0 — Unified App Model + DPI
- v0.2.1 — Auto-routing + get command
- v0.3.0 — QA-tested release (PyPI)
- v0.3.1 — Hotfix: CMakeLists.txt + version.cpp sync
