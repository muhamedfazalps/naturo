# Naturo Project Status
> Maintained by Orc-Mycelium. Agents: read on every startup.
> Last refreshed: 2026-06-16 17:24 (Orc autonomous cycle — QA still 403 at 16:00 round; CI green, no PRs; filed loop-watchdog gap #917).

## Current Version
v0.3.1 (PyPI + GitHub Release). `develop` CI green.

## Operating Mode — LOCAL multi-agent loop (NEW, 2026-06-15)
The project now runs as a machine-local 3-role loop on NATUROBOT (real Windows desktop),
defined in `agents/local/` (PR #908). This supersedes the old cloud-cron design for daily work.

| Role | Who | Worktree | Cadence |
|------|-----|----------|---------|
| **Orch** | live interactive session (Orc-Mycelium) | main checkout on `develop` | interactive |
| **Dev** | hourly background agent (Dev-Sirius) | `../naturo-dev` (dev-work) | cron :07 |
| **QA**  | hourly background agent (QA-Mariana) | `../naturo-qa` (qa-work) | cron :37 |

- Orch also runs a **PR-triage sweep at :22** (allow/merge team dev→develop PRs, bottom out
  stuck ones, review external PRs). Machine-local state log lives **outside the repo** at
  `C:\Users\Naturobot\naturo-loop-state.log`.
- Crons are **session-only** — they fire only while the Orch Claude session is alive, and
  auto-expire after 7 days. Persistent (survives-session-close) scheduling is an open Ace decision.
- Dev/QA here have a real desktop + working DLL + `gh` CLI → they run `@pytest.mark.desktop`
  tests and manage their own PRs/labels (no `pr-requests.md` handoff).

## Active Work — query live, do not trust hardcoded numbers
```bash
gh issue list --state open --limit 100 --json milestone,number,title,labels \
  --jq 'group_by(.milestone.title // "backlog") | sort_by(.[0].milestone.title // "z") |
  .[] | "\n### \(.[0].milestone.title // "Backlog")\n\(.[] | "- #\(.number) [\(.labels | map(.name) | join(","))] \(.title)")"'
```

## Milestone Summary (2026-06-15)
- **v0.3.2**: ~31 open / 89 closed. **Ship gate unchanged**: (1) close epic **#885** (P0 silent-
  failure cluster — NO_DESKTOP_SESSION guard bypassed on ~9 CLI+MCP surfaces, returns fabricated
  success); (2) verify 5 `status:done` issues (#786, #788, #807, #840, #843) from a real desktop
  session (now possible — QA loop runs on NATUROBOT).
  - **#885 fix MERGED (2026-06-15, PR #911):** the Dev loop completed it — `require_desktop_session`
    wired onto all 11 CLI+MCP surfaces + a 23-case regression matrix (`tests/test_no_desktop_guard_885.py`),
    built on community PR #892's decorator (contributor co-credited). Closes #868/#875/#878/#883/#893.
    Now `status:done`, awaiting QA desktop verification before the epic closes.
  - **QA-verify aging — ROOT CAUSE FOUND (Orc 2026-06-16):** the 5 ship-gate bugs (#786, #788,
    #807, #840, #843) + #885 sit `status:done` with no QA pickup because **the QA loop itself has
    been dead ~5 days**. Every hourly round since **2026-06-11 20:00** exits immediately with
    `Failed to authenticate. API Error: 403 Request not allowed` (139 consecutive QA logs; also a
    burst 05-29→05-30). The QA `claude -p` session (driven by `runner.ps1`/Task Scheduler) cannot
    authenticate — it never runs a single test. Filed **`needs:ace` #915 (P1)** — this outranks the
    desktop-runner decision (#842/#860): desktop CI is moot while the QA agent can't auth at all.
    Fix is credential/auth (human-only). Until #915 is resolved the ship gate cannot advance.
    Still failing as of the **2026-06-16 16:00** round (117+ consecutive 403s in June logs alone).
  - **Detection gap filed — #917 (NEW, Orc 2026-06-16, P1 `silent-failure`):** `runner.ps1` has no
    watchdog, so the loop hammered the API hourly for ~5 days with zero alert; only an Orc cycle caught
    it. #917 adds failure-streak detection/escalation so a stuck role surfaces automatically. Code-only
    (NOT the 403 fix itself, which stays human-only in #915).
- **v0.3.3**: 6 open / 1 closed. Enterprise features. Blocked on v0.3.2.
- **v0.3.4**: ~46 open / 8+ closed. Effectively a "contract stability" milestone (MCP/CLI envelope,
  param-name, exit-code drift from QA R135–R153). #890 (MCP list_snapshots) closed via PR #909.
  - **#912 (NEW, Orc 2026-06-16):** auto-enumerate CLI/MCP surfaces so a future command/tool can't
    silently bypass the desktop-session guard — converts #885's hand-maintained regression matrix
    (`tests/test_no_desktop_guard_885.py`) into a self-maintaining coverage contract. Test-only, P2.
  Blocked on v0.3.2.
- **Backlog**: ~10 open (Linux platform + #777 Unicode capture + migrated community/docs tasks).

## Open community PRs (external contributor @botbikamordehai2-sketch)
- **#892** (closes #885): correct decorator, never applied, base=`main`. Team carrying forward.
- **#904** (closes #844): right direction, breaks `errors.py` (mis-spliced helper), no wiring,
  unrelated workflow churn, base=develop. Team carrying forward.
- Both: warm "we'll complete + co-credit you" notes posted 2026-06-15; close when the team PR lands.
- **Disposition is now queued as `needs:ace` #913** (closing/taking over a community PR is human-only).
  #892 is superseded by merged PR #911; recommend close-with-thanks. Hold #904 until its replacement lands.

## Coordination
- Bug tracking: GitHub Issues only. State flow: `status:in-progress` → `status:done` → `verified` → close.
- One issue = one commit = one PR. English-only on GitHub. CI red → stop all new dev work.
- Never push directly to `main`/`develop` (only release tags → `main`); Orch may push
  operational files (STATE.md, queue) to develop with `[skip ci]`.
- **Human-decision items (Ace only):** **QA loop auth #915 (403 — TOP blocker)**; self-hosted
  runner #842 (offline) / cloud-VM #860; persistent cron scheduling; ship-gate timing (#914);
  public-API changes; superseding community PRs (#913).

## Code Health
- Large files still open for split: `_element.py` (#720), `browser_cmd.py` (#856),
  `macos.py` (#862), `_input.py` (#861).
- Version consistent at 0.3.1 across pyproject/version.py/PyPI.

## Completed Releases
- v0.1.0 core · v0.1.1 (67 fixes) · v0.2.0 (Unified App Model + DPI) · v0.2.1 (auto-routing + get)
- v0.3.0 (QA-tested) · v0.3.1 (hotfix: CMakeLists + version.cpp sync)
