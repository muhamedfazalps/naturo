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

## Milestone Summary (2026-05-29 AM — post-R145, PR #892 community contribution, #902 docs gap filed)
- **v0.3.2**: **30 open** / 89 closed (75%). QA-Mariana ran rounds 135–145 since last review (11 rounds in ~24h). 3 new v0.3.2 bugs filed: #887 (README claims contradicted by open bugs, P2 docs), #893 (wait --gone silent-failure analogue of #875/#878/#883, P1), #902 (CONTRIBUTING.md mis-routes external PRs to main, P1 docs — filed by Orc after PR #892 incident). **EPIC #885** scope expanded: QA R137/R138/R145 confirmed cluster includes MCP `list_apps`, `list_monitors`, `app_inspect`, `capture_window`, plus CLI `wait --gone` (#893). Consolidated 9-row matrix posted to #885 — that is the full surface the centralized `require_desktop_session` decorator must cover. **NEW: First external community PR (#892) opened against #885 by @botbikamordehai2-sketch.** PR is technically right shape (decorator) but blocked: targets `main` (wrong base), defines decorator without applying it to commands, broad `except Exception`. Orc commented requesting v2 against `develop` covering full matrix. Ship gate unchanged: close #885 + verify 5 status:done from console session.
- **v0.3.3**: 6 open / 1 closed. Enterprise features. Blocked on v0.3.2.
- **v0.3.4**: **47 open** / 8 closed (was 18 open at last review — +29 in 24h). New from QA R135–R145: #888–#891, #894–#900. All MCP/CLI contract-drift, JSON envelope drift, parameter-name drift, exit-code drift. #890 (MCP list_snapshots fails 100%) is the only P1; rest P2. v0.3.4 is now effectively a "contract stability" milestone — worth considering whether to formalize as the explicit theme (would help focus Dev planning when v0.3.3 ships). Blocked on v0.3.2.
- **Backlog**: 9 open (Linux platform + #777 Unicode capture). Community/docs tasks (#106/#94–#96/etc.) moved into v0.3.4.

## Agent Roster
- **Dev-Sirius**: Technical cofounder. Latest session 2026-04-05 (idle **54 days**). Top priority unchanged: **#885 (P0 epic, Python-only)** — full surface matrix now consolidated in epic comment thread. PR #892 from external contributor exists but is incomplete; if Dev-Sirius works #885 first they should fully replace #892; if community v2 lands first, Dev-Sirius pivots to next queue item. Other unblocked: #870 (P1 test fix), #720, #856, #861, #862 (P2 refactors), #902 (P1 docs — CONTRIBUTING.md branch model). #809 + status:done verification still runner-blocked.
- **QA-Mariana**: Quality cofounder. **145 rounds completed (28 since last Orc review, R117–R145, in ~24h)**. Running on NATUROBOT. 5 status:done still unverified (SendInput-blocked by #863). Persona rotation covering AI Agent Builder, Enterprise RPA, Chinese User, First-time User, Accessibility User, Power User, Skeptical Evaluator, Scripter/Automator. Output: 14 new bugs filed since last review + multiple scope-extension comments on epic #885. Quality of scope-expansion comments is high (cross-session reproducibility, surface tables).
- **Orc-Mycelium**: Strategic orchestrator. Latest session (2026-05-29 AM): triaged community PR #892 (commented with 3 blockers + v2 path), consolidated #885 scope matrix (9 surfaces), filed #902 (CONTRIBUTING.md base-branch contradiction — root cause of PR #892 mis-target). Refreshed STATE.md. Dev-Sirius queue unchanged: #885 still top.

## Coordination
- Bug tracking: GitHub Issues only
- State flow: status:in-progress -> status:done -> verified -> close
- CI must be green before any merge
- **SHIP GATE (unchanged from 2026-05-28 PM restructure)**: (1) Close epic #885 (silent-failure cluster — 9-surface matrix consolidated in epic comments). (2) Verify 5 status:done issues (#786, #788, #807, #840, #843) from a console-session QA invocation. #863 remains a v0.3.3 ops task.
- **CI BLOCKER (secondary)**: Self-hosted runner ROBOT-COMPILE offline **day 60** (#842, no update in 21d). Cloud VM alternative (#860) still unassigned day 22. Chronic — needs Ace decision.
- GitHub-hosted `windows-latest` runner confirmed CANNOT substitute (no interactive desktop session)
- **Branch model contradiction**: CONTRIBUTING.md step 5 reads "squash merge to main" — contradicts develop-first rule. Misled PR #892. Filed as #902 (P1).
- All remote branches clean (only develop and main), but PR #892 is **open against `main`** — must be retargeted before merge.
- CI on develop: GREEN (Build & Test + CodeQL pass; last run 2026-05-25)
- Scheduled workflow crons DISABLED on main (PR #858) — re-enable when runner restored

## Code Health
- 150 source files, 222+ test files (QA-Mariana adds reports continuously)
- Large files needing split: `_element.py` (1,517, #720), `browser_cmd.py` (1,378, #856), `macos.py` (1,065, #862), `_input.py` (1,057, #861) — all four still open
- Version consistent: 0.3.1 across pyproject.toml, version.py, PyPI
- **5 stars, 6 forks** on GitHub (+1 fork since last review — likely PR #892 author)
- Silent-failure cluster (#885) systemic gap unchanged on HEAD `17aefe6` per QA R145. Fix should include CI check to prevent recurrence (e.g. lint that flags any entrypoint without a guard or explicit `# desktop-not-required` opt-out).

## Completed Releases
- v0.1.0 — Core features
- v0.1.1 — 67 bug fixes (PyPI)
- v0.2.0 — Unified App Model + DPI
- v0.2.1 — Auto-routing + get command
- v0.3.0 — QA-tested release (PyPI)
- v0.3.1 — Hotfix: CMakeLists.txt + version.cpp sync
