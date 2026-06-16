# Competitive Position — Windows Desktop Automation for AI Agents

> Living competitive analysis for naturo. **Goal: become the #1 Windows RPA OSS engine on GitHub.**
> Tracked by the competitiveness program (epic #919). Orc re-evaluates **weekly** (see the tracker below).
> Full visual report regenerated each week: `C:\Users\Naturobot\naturo-competitive-report-*.html`.

## Verdict (2026-06-16)
**Not yet competitive.** By adoption, naturo is a near-unknown newcomer. Its true peer group is
*AI-facing Windows automation **engines***, and within it naturo is last.

## The landscape

| Tier | Projects | Note |
|------|----------|------|
| **Agent framework / AgentOS** (a layer above engines) | microsoft/**UFO²** (9.0k⭐) | HostAgent/AppAgent orchestration + hybrid GUI–API + OmniParser vision + PiP isolated desktop. Microsoft-backed. |
| **Automation engine** (eyes+hands for any LLM) — *naturo's tier* | **Windows-MCP** (CursorTouch, 6.0k⭐) · **Terminator** (mediar-ai, 1.5k⭐) · **naturo (5⭐)** | UIA/accessibility tree + MCP. naturo is clearly last. |
| **Classic libraries** (pre-AI) | pywinauto (6.1k⭐) · pyautogui (12.5k⭐, stale) | Mature but not AI-native (no MCP/vision/agent layer). |
| **Cross-platform sibling** | Peekaboo 3 (4.7k⭐, macOS) | Design north-star ("eyes+hands for AI"), different platform. |

## naturo's differentiation (real but niche)
- **Cascade Recognition = UIA + CDP (Chrome DevTools) + vision** for Electron/CEF apps (Feishu etc.) — **the moat**; rivals don't emphasize CDP-for-Electron. → #920
- Hardware scan-code input (games / anti-cheat). Recording/playback + selector management. Visual regression.
- **Chinese-market / CJK app** coverage where Western tools are weak. → #921

## naturo's gaps (why we're last)
- **Adoption ≈ 0** (5⭐). No user → no feedback → no trust flywheel.
- **Reliability debt** (~90 open issues, silent-failure clusters) vs Terminator (5 open issues) / Windows-MCP (2M users).
- **No distribution** (no Claude Desktop Extension, low PyPI) vs Windows-MCP's 2M Claude-Desktop users. → #922
- **Thin SDK** (Python+CLI) vs Terminator (TS/Rust/Py). → #924
- **~2-month source freeze** (Apr→Jun 2026) while every rival shipped.

## Strategy (epic #919, 5 pillars)
1. **Reliability first** — existing v0.3.2/3/4 backlog + #912 (already in flight).
2. **Flagship wedge** — Electron/CDP + CJK. → #920, #921
3. **Distribution** — MCP registries + Claude Desktop Extension (ship-gate-independent, pull forward). → #922
4. **Release cadence** — no multi-month gaps. → #925
5. **Onboarding + SDK** — 5-min quickstart + Python SDK parity. → #923, #924

---

## Weekly Competitiveness Tracker
Primary metric: **gap → nearest peer (Terminator)** and absolute stars. "Trend" = did the gap shrink (closer)
or grow (further) since last week. Orc appends one row every 7 days.

| Date | naturo ⭐ | Terminator ⭐ | Windows-MCP ⭐ | UFO² ⭐ | naturo Δ/wk | gap → Terminator | Trend |
|------|----------|---------------|----------------|---------|-------------|------------------|-------|
| 2026-06-16 | 5 | 1,530 | 6,058 | 9,014 | — (baseline) | −1,525 | — baseline |

### How Orc updates this (weekly, headless)
On an Orch cycle where ≥7 days have passed since the last tracker row:
1. `gh api repos/<r>` stars for `AcePeak/naturo`, `mediar-ai/terminator`, `CursorTouch/Windows-MCP`, `microsoft/UFO`.
2. Light web check for any major rival release/news that week.
3. Append a dated row; compute naturo's weekly Δ and the gap → Terminator; mark **Trend: closer / further**.
4. If a rival shifted the landscape (new entrant, big release), update the sections above.
5. Regenerate the HTML report; surface a one-line week-over-week verdict to Ace in `NEEDS-ACE.md`
   (and file/refresh a `needs:ace` note if a strategic pivot is warranted).
6. Commit `docs/COMPETITIVE.md` (+ report) to `develop`.
