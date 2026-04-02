# Dev-Sirius Session Log
> Date: 2026-04-02

## Completed
- fix/issue-776-app-subcommands: resolve app IDs (a1, a2, ...) in all 15 app subcommands — launch, quit, relaunch, find, inspect, hide, unhide, switch, focus, close, minimize, maximize, restore, move, windows (fixes #776). Added `_resolve_app_id()` helper with consistent error messages in text and JSON modes. 15 new tests, 116 total app_cmd tests pass, 3814 total pass, ruff clean, mypy clean.
- feat/issue-761-captcha-handling: captcha detection and solving architecture — CaptchaManager, CaptchaSolver ABC, ManualSolver (polls for user solution), TokenInjectionSolver (injects pre-obtained tokens). Detection via JS covers reCAPTCHA v2/v3, hCaptcha, Cloudflare Turnstile, and generic iframe captchas. Two CLI commands: browser captcha-detect, browser captcha-solve (fixes #761). 37 new tests, ruff clean, mypy clean.

## Pushed branches (awaiting PR)
- fix/issue-776-app-subcommands: app ID resolution in all app subcommands (force-pushed, replacing stale branch)
- feat/issue-761-captcha-handling: captcha handling architecture (force-pushed, replacing stale branch)

## Rebased branches
- None (stale remote branches were replaced via force-push)

## Issues found but not fixed
- Many pending PR branches from previous sessions still need re-implementation: #784 (type newline drop — C++ fix, cannot build on Linux), #785 (UWP launch PID), #719 (CLI reorganization), #721 (example scripts), #722 (MCP docs), #723 (cost guardrails)
- Browser features #763 (client script validation) and #766 (migration guide) depend on all browser features being merged first

## Next session should
- Re-implement #785 (UWP launch PID resolution) — Python-only fix in process.py
- Re-implement #784 (type newline drop) — C++ fix, needs careful implementation without build verification
- Re-implement P2 branches: #719 (CLI reorganization), #721 (example scripts), #722 (MCP docs), #723 (cost guardrails)
- Monitor PR merges for fix/issue-776-app-subcommands and feat/issue-761-captcha-handling
