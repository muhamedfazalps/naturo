# NEEDS-ACE — Human-Decision Queue

> The autonomous naturo loop (Dev / QA / Orch) runs unattended and self-closes everything it can.
> This file is the short list of things **only Ace can decide**. Refreshed by the Orchestrator each
> review cycle. Read this first on a check-in. Each item also has a GitHub issue labelled `needs:ace`.

_Last refreshed: 2026-06-17 19:40 (Orc autonomous cycle — **LIVE input-safety incident: QA hard-disabled;
new top needs:ace item #975**. Since the 18:20 cycle a serious safety event occurred: even after #972/#973
hardened the input guard with a sentinel lock, a QA cycle **typed the command-like sentinel `$(echo INJECTED)`
into a live Notepad window — R-SEC-012 reproduced LIVE**. Dev hard-disabled the QA role in `runner.ps1`
(`610412d`); every `runner:qa` cycle now no-ops (Dev/Orch unaffected). **Orc this cycle: filed #975**
(`needs:ace`, P0 — re-enabling QA is your security sign-off) **and #976** (P0, Dev-actionable, v0.3.4 — the
code-only root-cause fix: make the injection/sanitization test pytest-only/in-process + a runner guard so QA
can never type metacharacters into a live window). Also did the **post-merge handoff for #876** (PR #974
`381701c` merged — `selector/record list -j` success envelope — flipped → `status:done`; branch deleted).
**Live needs:ace queue now #975/#969/#935/#915/#914/#860/#842** (#975 is the new top item — it blocks all QA
verification). `develop` CI **GREEN** (Build & Test + CodeQL success on HEAD `610412d`). v0.3.2 ship-gate
unchanged (FULLY MET — release is your call, #914). Weekly competitiveness step not due (<7d since 06-16
baseline)._

## Open decisions
| # | Decision | Why it's yours | Orc recommendation |
|---|----------|----------------|--------------------|
| [#975](https://github.com/AcePeak/naturo/issues/975) | **Re-enable the QA role after a LIVE input-safety reproduction.** QA is **hard-disabled** in `runner.ps1` (`610412d`): even after the #972/#973 sentinel guard, a QA cycle **typed `$(echo INJECTED)` into a live Notepad window — R-SEC-012 reproduced LIVE**. Content harmless, but typing shell-metacharacter strings into a live focused window violates policy (focus race). | **security / safety sign-off** — the loop must not unilaterally re-enable a role that typed metacharacters into a live window (3rd disable/re-enable churn: `49a0104`→`205dd54`→`610412d`) | **Land the code-only fix #976** (make the injection test pytest-only/in-process + runner guard), **verify**, then **you** re-enable QA by removing the EMERGENCY block in `runner.ps1`. QA stays correctly hard-stopped until then — #972/#876 and any ship-gate re-verification stall meanwhile. |
| [#914](https://github.com/AcePeak/naturo/issues/914) | **v0.3.2 ship-gate sign-off** | release / tag to `main` = PyPI publish | **READY TO CUT — this is now the top actionable item.** Both ship-gate requirements are met: req (1) (epic #885 cluster) verified+closed; req (2) **all 5 status:done bugs verified+closed** (#786/#788/#807/#840 @01:15Z + #843 @02:42Z). `develop` CI green on `d3cfe92`. **Cutting / tagging v0.3.2 (tag→main = PyPI publish) is your call — the loop cannot and will not do it (Rule 2).** |
| [#969](https://github.com/AcePeak/naturo/issues/969) | **QA-harness integrity hazard** — the `naturo-qa` worktree's editable install (egg-link/`.pth`) resolves `import naturo`/`python -m naturo` to a **sibling worktree `naturo-qa-mariana`** (pre-#720 stale code). QA Step-2 runtime probes can **silently verify STALE code → false PASS/FAIL verdicts** (one FALSE FAIL already, 16:40Z #963). | machine-local env fix that touches another agent's worktree — Rule 4 forbids unattended self-fix; threatens the loop's verification signal | **Run `pip install -e .` from the `naturo-qa` worktree** (or fix the egg-link/`.pth`) so QA's import resolves to the worktree under test. The code-only loud-failure guard (assert `naturo.__file__` under the active worktree, fail loudly otherwise) is now tracked as **[#971](https://github.com/AcePeak/naturo/issues/971)** — Dev-actionable, the loop will ship it; this row remains the **env fix** which is human-only (Rule 4). Pairs with the #917 watchdog. |
| [#935](https://github.com/AcePeak/naturo/issues/935) | Two Dev cycles ran **concurrently in the shared `naturo-dev` worktree** — the 2nd cycle's Step 0 `reset --hard` wiped the 1st's in-flight uncommitted branch (#910). **Rule 4 violation at the orchestration layer.** | orchestration / scheduling policy (runner.ps1 / cron / lock) | Add a **per-worktree lock** in `naturo-loop-locks\` that a starting `runner:dev` must acquire (skip the round if held), and/or serialize dev so two cycles never share one tree. Self-fixing is unsafe — concurrent git ops would corrupt the peer cycle. |
| [#842](https://github.com/AcePeak/naturo/issues/842) / [#860](https://github.com/AcePeak/naturo/issues/860) | Desktop CI: self-hosted runner ROBOT-COMPILE offline (#842) vs fund a cloud Windows VM (#860) | infra spend | Decide: revive the runner, fund a cloud Windows VM, or accept GitHub-hosted-only CI. (No longer needed for input verification — see #863 below — but still the only path to desktop-marked CI jobs.) |

## Recommended for closure (Orc cannot close needs:ace/QA items unattended — your confirm)
| # | What changed | Orc recommendation |
|---|--------------|--------------------|
| [#915](https://github.com/AcePeak/naturo/issues/915) | "QA loop down ~5 days / 403". **Fully recovered.** QA has run **many** clean rounds since the proxy auto-detect fix (`2ccbcf0`) — 16:43/17:42/18:50/20:45/21:40/22:40 on 06-16, then 00:45Z and a full **real-input ship-gate verification round at 01:15Z** that closed 4 P0/P1 bugs. The 403 era is over. | **Close #915.** Durability is demonstrated across a day+ of rounds incl. live input. |
| [#863](https://github.com/AcePeak/naturo/issues/863) | "SendInput blocked in agent session — runtime verification impossible." **Premise disproven.** QA's 01:15Z probe-first gate (launch throwaway notepad → `type "QA_PROBE"` → confirm window title) showed **input works on this no-RDP console** and verified all 4 input-family bugs end-to-end. Capability landed in `19a72cd`. | **QA to close #863** (it owns the `from:qa` issue). No human input-session provisioning is needed. Orc left it for QA rather than closing cross-domain. |

_Resolved earlier: **#913** (dispose community PRs #892 / #904) — closed 2026-06-16; both community PRs closed._

## Ship-gate status — v0.3.2  →  **FULLY MET (release is Ace's call, #914)**
- (1) Epic **#885** (silent-failure cluster): **CLOSED + verified 2026-06-16** (with #868/#875/#878/#883/#893).
  **Requirement (1) MET.**
- (2) QA-verify the 5 `status:done` bugs on a real desktop: **#786, #788, #807, #840** → **VERIFIED + CLOSED
  2026-06-17 01:15Z**; **#843** → **VERIFIED + CLOSED 2026-06-17 02:42Z** (runtime composite check confirms
  the #948 Z-order fix; `test_capture_popup_843.py` 12/12). **Requirement (2) MET — `status:done` ship-gate
  queue empty.**
- **Both requirements satisfied. The only remaining action is cutting / tagging the release (#914) —
  human-only (Rule 2); the loop will not tag `main`.**

## Blocks
- **QA verification BLOCKED — QA role hard-disabled (#975).** After the LIVE R-SEC-012 reproduction, the
  QA role is stopped at the runner level (`610412d`); no issue can be QA-verified/closed until Ace re-enables
  it (gated on the #976 fix). This stalls #972 / #876 verification and any further ship-gate re-checks.
- **None blocking the ship-gate itself.** #843 (capture popup compositing) **verified+closed 2026-06-17
  02:42Z** — the last v0.3.2 ship-gate item is cleared. v0.3.2 awaits only Ace's release sign-off (#914).
- `develop` CI: **green** (Build & Test + CodeQL success on HEAD `610412d`).
- Desktop CI runner **#842** offline (chronic; infra decision above).
- _Cleared this cycle:_ **#863** (input verification — proven possible) and **#915** (QA auth — recovered)
  are no longer blocks; both recommended for closure above.
- _Related (not a human decision):_ [#917](https://github.com/AcePeak/naturo/issues/917) (P1,
  `silent-failure`) — `runner.ps1` still has no failure-streak watchdog. Code-only for Dev.

---
_How this works: anything irreversible or human-only is queued here instead of acted on. Everything else
the loop does itself — opens PRs, merges green ones to develop, verifies on the real desktop, closes issues,
files new work. See `agents/local/README.md`._
