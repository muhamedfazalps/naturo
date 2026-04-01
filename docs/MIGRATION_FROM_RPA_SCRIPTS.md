# Migration Guide: From RPA Scripts to naturo

This guide helps developers migrate existing automation scripts — built with DrissionPage,
Selenium, pywinauto, uiautomation, or raw CDP — to naturo. It covers pattern-by-pattern
translation, explains naturo's architectural advantages, and provides complete recipes
for common scenarios including anti-detection and captcha handling.

> **Target version**: naturo v0.3.2+
>
> **Audience**: RPA developers who have production scripts using DrissionPage / Selenium /
> pywinauto and want to consolidate into a single tool.

---

## Table of Contents

- [Why Migrate](#why-migrate)
- [Architecture Overview](#architecture-overview)
- [Quick Reference: API Mapping](#quick-reference-api-mapping)
- [Browser Automation](#browser-automation)
  - [Chrome Profile Management](#chrome-profile-management)
  - [Page Navigation](#page-navigation)
  - [Element Finding](#element-finding)
  - [Element Interaction](#element-interaction)
  - [Waiting](#waiting)
  - [Screenshots](#screenshots)
  - [Cookie Management](#cookie-management)
  - [JavaScript Execution](#javascript-execution)
  - [Tab Management](#tab-management)
- [Desktop Automation](#desktop-automation)
  - [Window Finding](#window-finding)
  - [Desktop Element Interaction](#desktop-element-interaction)
  - [Keyboard Input](#keyboard-input)
- [Mixed Browser + Desktop Workflows](#mixed-browser--desktop-workflows)
- [Anti-Detection](#anti-detection)
  - [Default Stealth Behavior](#default-stealth-behavior)
  - [Migrating Selenium Anti-Detection Hacks](#migrating-selenium-anti-detection-hacks)
  - [Verifying Stealth](#verifying-stealth)
- [Captcha Handling](#captcha-handling)
  - [Slider Captcha](#slider-captcha)
  - [Image Recognition Captcha](#image-recognition-captcha)
  - [Cookie Cycling Anti-Captcha](#cookie-cycling-anti-captcha)
- [Human-Like Input](#human-like-input)
  - [Mouse Movement Trajectories](#mouse-movement-trajectories)
  - [Typing Profiles](#typing-profiles)
- [Common Script Patterns](#common-script-patterns)
  - [Multi-Account Management](#multi-account-management)
  - [Data Scraping Loop](#data-scraping-loop)
  - [Form Filling](#form-filling)
  - [File Upload](#file-upload)
- [Full Migration Example](#full-migration-example)
- [Troubleshooting](#troubleshooting)

---

## Why Migrate

| Pain Point | Before (multi-library) | After (naturo) |
|------------|----------------------|----------------|
| **Dependency count** | DrissionPage + pywinauto + pyautogui + psutil + ... | `pip install naturo` |
| **Browser + Desktop** | Separate libraries, separate APIs, separate mental models | One CLI, one SDK — `naturo browser` for web, `naturo find`/`naturo click` for desktop |
| **Anti-detection** | 5+ manual hacks per Selenium script | Stealth ON by default, zero config |
| **Captcha handling** | Copy-paste trajectory code across every project | `naturo drag --trajectory bezier --jitter 2 --overshoot 12` |
| **Profile management** | Manual Chrome `--user-data-dir` + port wrangling | `naturo browser profile create myaccount` |
| **Boilerplate** | LoggerClass, Utils, process management copied everywhere | naturo handles Chrome lifecycle, process cleanup, logging |

**The key advantage**: naturo is the only tool that does desktop + browser + AI vision in one CLI.
No competitor — not Playwright, not Selenium, not browseruse — can automate a WeChat desktop
window and a Chrome tab in the same script.

---

## Architecture Overview

```
                          naturo CLI / Python SDK
                                   |
                 +-----------------+-----------------+
                 |                 |                 |
          naturo browser     naturo find/click   naturo see (AI)
          (CDP protocol)     (UIA / MSAA / Win32) (Vision models)
                 |                 |                 |
          Chrome / Edge      Any desktop app    Screenshot + LLM
          Electron apps      Win32, WPF, UWP    Anthropic/OpenAI/
                             Qt, WinForms       Gemini/Ollama
```

All three engines work together. `naturo see --app feishu` returns UIA elements AND
CDP elements AND AI-detected elements in one unified tree. You don't need to know
which engine found which element — just use `naturo click e42`.

---

## Quick Reference: API Mapping

### DrissionPage to naturo

| DrissionPage | naturo CLI | naturo Python SDK |
|-------------|-----------|-------------------|
| `ChromiumOptions()` | `naturo browser launch` | `BrowserPage()` |
| `co.set_user_data_path(path)` | `--profile <name>` | `BrowserPage(profile="name")` |
| `co.set_local_port(9222)` | `--port 9222` | `BrowserPage(port=9222)` |
| `ChromiumPage(addr_or_opts=co)` | `naturo browser launch --profile x` | `BrowserPage(profile="x")` |
| `page.get(url)` | `naturo browser navigate <url>` | `page.navigate(url)` |
| `page.ele("xpath://...")` | `naturo browser find "xpath://..."` | `page.find("xpath://...")` |
| `page.eles("xpath://...")` | `naturo browser find "xpath://..." --all` | `page.find_all("xpath://...")` |
| `ele.click()` | `naturo browser click <selector>` | `element.click()` |
| `ele.click(by_js=True)` | `naturo browser click <selector> --js` | `element.click(js=True)` |
| `ele.input(text)` | `naturo browser type <selector> <text>` | `element.type(text)` |
| `ele.input(text, True)` | `naturo browser type <selector> <text> --clear-first` | `element.type(text, clear_first=True)` |
| `ele.text` | `naturo browser text <selector>` | `element.text` |
| `ele.attr("href")` | `naturo browser attr <selector> href` | `element.attr("href")` |
| `ele.hover().click()` | `naturo move <selector> && naturo browser click <selector>` | `element.hover(); element.click()` |
| `ele.scroll.to_see()` | automatic (naturo scrolls into view before click) | automatic |
| `page.wait.doc_loaded()` | `naturo browser wait --load` | `page.wait_for_load()` |
| `page.get_screenshot(path)` | `naturo browser screenshot --path file.png` | `page.screenshot("file.png")` |
| `page.set.window.max()` | `naturo app maximize --app chrome` | N/A (use CLI) |

### Selenium to naturo

| Selenium | naturo CLI | naturo Python SDK |
|----------|-----------|-------------------|
| `webdriver.Chrome(options=opts)` | `naturo browser launch` | `BrowserPage()` |
| `WebDriverWait(d,t).until(EC.presence(...))` | `naturo browser wait <selector> --timeout <ms>` | `page.wait_for(selector, timeout=ms)` |
| `driver.find_element(By.XPATH, '...')` | `naturo browser find "xpath://..."` | `page.find("xpath://...")` |
| `driver.find_elements(By.XPATH, '...')` | `naturo browser find "xpath://..." --all` | `page.find_all("xpath://...")` |
| `element.send_keys(text)` | `naturo browser type <sel> <text>` | `element.type(text)` |
| `element.send_keys(Keys.CONTROL, 'v')` | `naturo hotkey ctrl+v` | N/A (use CLI) |
| `ActionChains(d).click_and_hold(e).move_by_offset(x,y).release()` | `naturo drag --from-element <sel> --offset-x <x>` | `drag(from_element=sel, offset_x=x)` |
| `driver.execute_script(js)` | `naturo browser eval <js>` | `page.evaluate(js)` |
| `driver.execute_cdp_cmd(...)` | Built-in (stealth is default) | Built-in |
| `driver.get_cookies()` | `naturo browser cookies save` | `page.cookies.save(path)` |
| `driver.add_cookie(c)` | `naturo browser cookies load` | `page.cookies.load(path)` |

### pywinauto / uiautomation to naturo

| pywinauto / uiautomation | naturo CLI | naturo Python SDK |
|--------------------------|-----------|-------------------|
| `auto.WindowControl(Name="微信")` | `naturo find --name "微信" --control-type Window` | N/A (use CLI) |
| `window.ButtonControl(Name="X").Click()` | `naturo find --name "X" --control-type Button \| naturo click` | N/A (use CLI) |
| `window.EditControl()` | `naturo find --control-type Edit --app <app>` | N/A (use CLI) |
| `window.TextControl(Name="X")` | `naturo find --name "X" --control-type Text` | N/A (use CLI) |
| `window.Exists(timeout, 0)` | `naturo wait --element --name "X" --timeout <s>` | N/A (use CLI) |
| `window.SetTopmost(True)` | `naturo app focus --app <app>` | N/A (use CLI) |
| `send_keys('^a')` | `naturo hotkey ctrl+a` | N/A (use CLI) |
| `send_keys('^v')` | `naturo hotkey ctrl+v` | N/A (use CLI) |
| `send_keys('{ENTER}')` | `naturo press enter` | N/A (use CLI) |
| `pyperclip.copy(text)` | `naturo type --paste "text"` | N/A (use CLI) |

---

## Browser Automation

### Chrome Profile Management

**Before** (every project manually wrangles Chrome profiles):
```python
import os
profile_path = os.path.join(os.getcwd(), "profiles", "xhs-account1")
os.makedirs(profile_path, exist_ok=True)
co = ChromiumOptions()
co.set_user_data_path(profile_path)
co.set_local_port(9222)  # hope no collision
co.set_browser_path(r"C:\Users\me\Application\chrome.exe")
```

**After** (naturo manages everything):
```bash
# One-time setup: create a named profile
naturo browser profile create xhs-account1

# Interactive setup: opens Chrome so you can log in manually
naturo browser profile setup xhs-account1

# List all profiles
naturo browser profile list

# Use the profile — port auto-assigned, no collisions
naturo browser launch --profile xhs-account1
```

**Python SDK**:
```python
from naturo.browser import ProfileManager, BrowserPage

# Create and manage profiles
pm = ProfileManager()
pm.create("xhs-account1")
pm.list()  # [{"name": "xhs-account1", "created": "...", "last_used": "..."}]

# Launch with profile
page = BrowserPage(profile="xhs-account1")
```

Profiles are stored in `~/.naturo/browser/profiles/<name>/`. Each profile gets an
auto-assigned debugging port from range 19200-19299 — no more port collisions when
running multiple accounts.

### Page Navigation

**Before**:
```python
# DrissionPage
page.get("https://www.xiaohongshu.com/explore", retry=3, timeout=10)

# Selenium
driver.get("https://www.xiaohongshu.com/explore")
WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, "body")))
```

**After**:
```bash
naturo browser navigate "https://www.xiaohongshu.com/explore"
naturo browser wait --load --timeout 10000
```

```python
page.navigate("https://www.xiaohongshu.com/explore")
page.wait_for_load(timeout=10000)
```

### Element Finding

naturo auto-detects selector type. No need to specify CSS vs XPath vs text:

```bash
# XPath (starts with / or //)
naturo browser find "//div[@class='note-item']"

# CSS (starts with # or . or contains standard CSS syntax)
naturo browser find "#search-input"
naturo browser find ".note-item > .title"

# Explicit prefix when auto-detect isn't enough
naturo browser find "xpath://div[contains(@class,'note')]"
naturo browser find "css:div.note-item"
naturo browser find "text:Login"

# Find all matching elements
naturo browser find "//div[@class='note-item']" --all

# With timeout (waits for element to appear)
naturo browser find "#dynamic-content" --timeout 5000
```

**Python SDK**:
```python
# Single element
el = page.find("//div[@class='note-item']")
el = page.find("#search-input")
el = page.find("text:Login")

# All matching
items = page.find_all("//div[@class='note-item']")

# Chained — find within a parent element
for item in page.find_all(".note-item"):
    title = item.find(".title").text
    link = item.find("a").attr("href")
```

**Migrating DrissionPage's `ele_dict` pattern**:
```python
# Before: DrissionPage element dictionary
class XhsScraper:
    ele_dict = {
        "search_input": "xpath://input[@id='search-input']",
        "search_btn": "xpath://button[@class='search-btn']",
        "note_items": "xpath://div[@class='note-item']",
    }
    def search(self, keyword):
        self.page.ele(self.ele_dict["search_input"]).input(keyword)
        self.page.ele(self.ele_dict["search_btn"]).click()

# After: naturo — same pattern, cleaner syntax
class XhsScraper:
    selectors = {
        "search_input": "#search-input",
        "search_btn": ".search-btn",
        "note_items": ".note-item",
    }
    def search(self, keyword):
        page.find(self.selectors["search_input"]).type(keyword)
        page.find(self.selectors["search_btn"]).click()
```

### Element Interaction

```bash
# Click
naturo browser click "#submit-btn"
naturo browser click "//button[text()='Submit']"
naturo browser click "#submit-btn" --js          # Force JavaScript click

# Type text
naturo browser type "#search-input" "keyword"
naturo browser type "#search-input" "keyword" --clear-first  # Clear existing text first

# Select dropdown
naturo browser select "#province" "Beijing"

# Read text
naturo browser text ".result-title"

# Read attribute
naturo browser attr ".result-link" "href"

# Read HTML
naturo browser html ".result-container"            # innerHTML
naturo browser html ".result-container" --outer     # outerHTML
```

**Python SDK**:
```python
page.find("#submit-btn").click()
page.find("#submit-btn").click(js=True)
page.find("#search-input").type("keyword")
page.find("#search-input").type("keyword", clear_first=True)

title = page.find(".result-title").text
href = page.find(".result-link").attr("href")
html = page.find(".result-container").html
```

### Waiting

**Before** (scattered `time.sleep()` and manual polling):
```python
# DrissionPage
page.wait.doc_loaded()
page.wait.load_start()

# Selenium
WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.CSS_SELECTOR, ".results"))
)
WebDriverWait(driver, 10).until(
    EC.visibility_of_element_located((By.CSS_SELECTOR, ".results"))
)

# Everywhere
import time
time.sleep(3)  # pray it's enough
```

**After** (event-driven, no guessing):
```bash
# Wait for page lifecycle events
naturo browser wait --load                          # Page fully loaded
naturo browser wait --dom-ready                     # DOM content loaded
naturo browser wait --network-idle                  # No network activity for 500ms
naturo browser wait --network-idle --time 1000      # No network activity for 1s

# Wait for element state
naturo browser wait ".results"                      # Element exists in DOM
naturo browser wait ".results" --state visible      # Element is visible
naturo browser wait ".spinner" --state hidden        # Element becomes hidden
naturo browser wait ".old-content" --state detached  # Element removed from DOM

# Wait for navigation
naturo browser wait --navigate --url-contains "success"

# Wait for JS condition
naturo browser wait --eval "window.dataLoaded === true" --timeout 5000

# All waits have configurable timeout (default 30s)
naturo browser wait ".slow-content" --timeout 60000
```

**Python SDK**:
```python
page.wait_for_load()
page.wait_for_dom_ready()
page.wait_for_network_idle(time=500)
page.wait_for(".results", state="visible", timeout=10000)
page.wait_for_navigation(url_contains="success")
page.wait_for_eval("window.dataLoaded === true")
```

### Screenshots

```bash
# Full page
naturo browser screenshot --path page.png

# Specific element (useful for captcha regions)
naturo browser screenshot --selector "#captcha-container" --path captcha.png

# Full scrollable page
naturo browser screenshot --path full.png --full-page
```

### Cookie Management

**Before** (manual JSON files):
```python
# Selenium
import json
cookies = driver.get_cookies()
with open("cookies.json", "w") as f:
    json.dump(cookies, f)

# Restore
with open("cookies.json") as f:
    cookies = json.load(f)
for cookie in cookies:
    driver.add_cookie(cookie)
driver.refresh()
```

**After**:
```bash
naturo browser cookies save --path cookies.json
naturo browser cookies load --path cookies.json
naturo browser cookies clear
naturo browser cookies delete --domain ".douyin.com"
```

```python
page.cookies.save("cookies.json")
page.cookies.load("cookies.json")
page.cookies.clear()
page.cookies.delete(domain=".douyin.com")
```

### JavaScript Execution

```bash
# Evaluate and get result
naturo browser eval "document.title"
naturo browser eval "document.querySelectorAll('.item').length"

# Execute without return value
naturo browser eval "window.scrollTo(0, document.body.scrollHeight)"
```

```python
title = page.evaluate("document.title")
count = page.evaluate("document.querySelectorAll('.item').length")
```

### Tab Management

```bash
# List open tabs
naturo browser tabs

# Switch to a tab by ID
naturo browser tab <tab-id>
```

---

## Desktop Automation

naturo's desktop automation uses UIA/MSAA/Win32 — the same engines that power
Windows Accessibility. No driver installation, no version matching, no webdriver at all.

### Window Finding

**Before** (uiautomation):
```python
import uiautomation as auto

wechat = auto.WindowControl(searchDepth=1, Name="微信")
wechat = auto.WindowControl(searchDepth=1, ClassName="mmui::MainWindow")
if not wechat.Exists(5, 0):
    raise Exception("WeChat not found")
wechat.SetTopmost(True)
wechat.SetActive()
```

**After**:
```bash
# Find and focus WeChat
naturo app focus --app 微信

# Or by window name
naturo find --name "微信" --control-type Window

# Wait for window to appear (up to 10 seconds)
naturo wait --element --name "微信" --timeout 10
```

### Desktop Element Interaction

**Before** (uiautomation):
```python
wechat.ButtonControl(Name="更多功能").Click()
wechat.TextControl(Name="视频号").Click()
edit = wechat.EditControl()
edit.Click()
```

**After**:
```bash
naturo find --name "更多功能" --control-type Button --app 微信 | naturo click
naturo find --name "视频号" --control-type Text --app 微信 | naturo click
naturo find --control-type Edit --app 微信 | naturo click
```

Or use the `naturo see` + element ref workflow:
```bash
# See all elements in WeChat
naturo see --app 微信

# The output shows numbered elements: e1, e2, e3...
# Click by reference
naturo click e15
naturo type e23 "message text"
```

### Keyboard Input

**Before** (pywinauto):
```python
from pywinauto.keyboard import send_keys
import pyperclip

# Ctrl+A to select all
send_keys('^a')

# Paste text (pyperclip for Chinese text support)
pyperclip.copy("中文内容")
send_keys('^v')

# Press Enter
send_keys('{ENTER}')

# Page Down
send_keys('{PGDN}')
```

**After**:
```bash
# Hotkey combinations
naturo hotkey ctrl+a
naturo hotkey ctrl+v
naturo hotkey ctrl+c

# Single key press
naturo press enter
naturo press pagedown
naturo press tab

# Type text (handles Chinese natively via paste mode)
naturo type --paste "中文内容"

# Type with human-like delays
naturo type "search keyword" --profile human --wpm 80
```

---

## Mixed Browser + Desktop Workflows

This is naturo's killer feature. No other tool can do this.

**Before** (3 libraries, context switching):
```python
from DrissionPage import ChromiumPage, ChromiumOptions
import uiautomation as auto
from pywinauto.keyboard import send_keys
import pyperclip

# Part 1: Scrape Dianping (browser)
co = ChromiumOptions()
co.set_local_port(9222)
page = ChromiumPage(addr_or_opts=co)
page.get("https://www.dianping.com/shop/xxx")
shop_data = page.ele("xpath://div[@class='shop-info']").text

# Part 2: Post to WeChat Video Channel (desktop)
wechat = auto.WindowControl(searchDepth=1, Name="微信")
wechat.SetTopmost(True)
wechat.ButtonControl(Name="视频号").Click()
time.sleep(1)
wechat.ButtonControl(Name="发表动态").Click()
time.sleep(1)
edit = wechat.EditControl()
edit.Click()
pyperclip.copy(shop_data)
send_keys('^v')
send_keys('{ENTER}')
```

**After** (one tool, one mental model):
```bash
#!/bin/bash
# Part 1: Scrape Dianping (browser)
naturo browser launch --profile dianping
naturo browser navigate "https://www.dianping.com/shop/xxx"
SHOP_DATA=$(naturo browser text ".shop-info")

# Part 2: Post to WeChat Video Channel (desktop)
naturo app focus --app 微信
naturo find --name "视频号" --control-type Text --app 微信 | naturo click
naturo find --name "发表动态" --control-type Button --app 微信 | naturo click
naturo find --control-type Edit --app 微信 | naturo click
naturo type --paste "$SHOP_DATA"
naturo press enter
```

No library imports, no driver version management, no context switching between APIs.
The browser CDP connection stays alive while you interact with the desktop.

---

## Anti-Detection

### Default Stealth Behavior

**naturo's browser automation has anti-detection ON by default.** You don't need to
configure anything. When you run `naturo browser launch`, naturo automatically:

1. Connects via CDP natively (no WebDriver protocol = no `navigator.webdriver` flag)
2. Injects stealth scripts before any page loads:
   - `navigator.webdriver` → `false` / `undefined`
   - Removes `window.cdc_` and `document.$cdc_` DevTools markers
   - Overrides `navigator.permissions.query` for notifications
3. Launches Chrome with anti-detection flags:
   - `--disable-blink-features=AutomationControlled`
   - Excludes `enable-automation` switch
   - Suppresses "controlled by automated software" infobar
4. Uses standard Chrome User-Agent (no "Headless" marker)

### Migrating Selenium Anti-Detection Hacks

**Before** (Selenium requires 10+ lines of anti-detection boilerplate):
```python
options = ChromeOptions()
options.add_argument("--disable-blink-features=AutomationControlled")
options.add_experimental_option("excludeSwitches", ["enable-automation", "enable-logging"])
options.add_experimental_option("useAutomationExtension", False)
options.add_argument(f"--user-agent={custom_ua}")
options.add_argument("--no-first-run")
options.add_argument("--no-default-browser-check")

driver = webdriver.Chrome(options=options)

# Still need to inject CDP command
driver.execute_cdp_cmd("Page.addScriptToEvaluateOnNewDocument", {
    "source": """
        Object.defineProperty(navigator, 'webdriver', {get: () => undefined});
        delete window.cdc_adoQpoasnfa76pfcZLmcfl_Array;
        delete window.cdc_adoQpoasnfa76pfcZLmcfl_Promise;
    """
})
```

**After** (naturo — zero anti-detection code needed):
```bash
naturo browser launch --profile myaccount
# That's it. Stealth is the default.
```

If you need to **disable** stealth for debugging:
```bash
naturo browser launch --profile myaccount --no-stealth
```

### Verifying Stealth

```bash
# Quick check against popular detection sites
naturo browser stealth-check

# Or manually
naturo browser launch --profile test
naturo browser navigate "https://bot.sannysoft.com"
naturo browser screenshot --path stealth-check.png
```

Expected results on bot.sannysoft.com:
- WebDriver: `false` (green)
- Chrome: `present` (green)
- Permissions: `notification denied` (green)
- User-Agent: standard Chrome UA (green)

---

## Captcha Handling

naturo provides the **primitives** to handle captchas. You bring the solver
(Chaojiying, ddddocr, or your own model). naturo does the rest.

### Slider Captcha

This is the most common captcha type (Douyin, Taobao, Bilibili, etc.). The flow:

```
Screenshot captcha → Solver calculates distance → naturo drags with human-like trajectory
```

**Before** (custom trajectory code in every project):
```python
def get_tracks(distance):
    """4-phase acceleration model — copy-pasted across 10+ projects"""
    tracks = []
    current = 0
    v = 0
    mid = distance * 3 / 4
    while current < distance:
        if current < mid:
            a = random.uniform(2, 4)
        else:
            a = -random.uniform(1, 3)
        v0 = v
        t = random.uniform(0.02, 0.04)
        v = v0 + a * t
        move = v0 * t + 0.5 * a * t * t
        current += move
        tracks.append(round(move))
    # Backward correction
    tracks.append(-sum(tracks) + distance)
    return tracks

tracks = get_tracks(slide_distance)
ActionChains(driver).click_and_hold(slider).perform()
for x in tracks:
    ActionChains(driver).move_by_offset(x, random.randint(-2, 2)).perform()
ActionChains(driver).release().perform()
```

**After** (one command):
```bash
# Step 1: Screenshot the captcha
naturo browser screenshot --selector "#captcha-container" --path captcha.png

# Step 2: Get slide distance from your solver
DISTANCE=$(python my_solver.py captcha.png)
# Or use Chaojiying: DISTANCE=$(python chaojiying_client.py captcha.png 9101)

# Step 3: Drag with human-like trajectory — replaces 40+ lines of custom code
naturo drag \
  --from-element "#slider-handle" \
  --offset-x $DISTANCE --offset-y 0 \
  --trajectory bezier \
  --duration 600 \
  --jitter 2 \
  --overshoot 12 \
  --release-delay 80

# Step 4: Verify
naturo browser wait ".captcha-success" --timeout 3000
```

**What `--trajectory bezier` does internally** (you don't need to write this):
```
Phase 1 (0-20%):   slow start, ease-in cubic
Phase 2 (20-60%):  acceleration, near-linear speed
Phase 3 (60-85%):  deceleration, ease-out cubic
Phase 4 (85-100%): micro-adjustment, very slow approach
Phase 5 (optional): overshoot 12px past target → backward correction
Each step: +random Y jitter within [-2, +2]px, variable timing
```

**Convenience command** (wraps the full flow):
```bash
# Auto: screenshot → invoke solver hook → drag
naturo browser captcha solve --solver slider \
  --handle "#slider-handle" \
  --container "#captcha-container"
```

**Python SDK**:
```python
page = BrowserPage(profile="myaccount")
page.navigate("https://example.com")

# Manual flow
screenshot = page.screenshot(selector="#captcha-container")
distance = my_solver(screenshot)  # your solver
from naturo.input import drag
drag(from_element="#slider-handle", offset_x=distance,
     trajectory="bezier", duration=600, jitter=2, overshoot=12)
page.wait_for(".captcha-success", timeout=3000)
```

### Image Recognition Captcha

For captchas that require recognizing text or clicking specific images:

```bash
# Step 1: Screenshot the captcha image
naturo browser screenshot --selector "#captcha-image" --path captcha.png

# Step 2: Recognize with your solver
# Text captcha:
TEXT=$(python chaojiying_client.py captcha.png 1902)
naturo browser type "#captcha-input" "$TEXT"
naturo browser click "#captcha-submit"

# Click captcha (click specific coordinates):
COORDS=$(python chaojiying_client.py captcha.png 9004)
# Returns: "123,45|234,67" (click coordinates)
# Parse and click each coordinate
naturo browser click "#captcha-image" --offset-x 123 --offset-y 45
naturo browser click "#captcha-image" --offset-x 234 --offset-y 67
```

**Convenience command**:
```bash
# Image → solver → type result
naturo browser captcha solve --solver image \
  --image-selector "#captcha-image" \
  --input-selector "#captcha-input"
```

### Cookie Cycling Anti-Captcha

Some platforms (e.g., Douyin) can be bypassed by cycling cookies to avoid
triggering the slider:

**Before**:
```python
import json
cookies = driver.get_cookies()
with open("cookies.json", "w") as f:
    json.dump(cookies, f)
driver.delete_all_cookies()
time.sleep(1)
for cookie in cookies:
    driver.add_cookie(cookie)
driver.refresh()
```

**After**:
```bash
naturo browser cookies save --path cookies.json
naturo browser cookies clear
naturo browser cookies load --path cookies.json
naturo browser navigate "https://www.douyin.com"  # Reload with restored cookies
```

---

## Human-Like Input

### Mouse Movement Trajectories

All mouse movement commands support trajectory control:

```bash
# Instant teleport (default, backward compatible)
naturo move 500 300

# Smooth bezier curve (human-like)
naturo move 500 300 --trajectory bezier --duration 800

# With Y-axis jitter (makes movement look less robotic)
naturo move 500 300 --trajectory bezier --duration 800 --jitter 3

# Linear interpolation (smooth but not curved)
naturo move 500 300 --trajectory linear --duration 500

# Drag with full human simulation
naturo drag --from 200 400 --to 500 400 \
  --trajectory bezier --duration 600 --jitter 2 \
  --overshoot 15 --release-delay 100
```

| Flag | Description | Default |
|------|-------------|---------|
| `--trajectory` | `instant`, `linear`, `bezier` | `instant` |
| `--duration` | Total movement time in ms | auto |
| `--steps` | Number of intermediate points | auto (based on duration) |
| `--jitter` | Max random perpendicular offset in px | 0 |
| `--overshoot` | Overshoot past target then correct, in px | 0 |
| `--release-delay` | Pause before releasing drag, in ms | 0 |

### Typing Profiles

```bash
# Instant (default)
naturo type "hello world"

# Human-like with variable delays
naturo type "hello world" --profile human --wpm 80

# Paste mode — handles Chinese text, special characters
naturo type --paste "中文内容和emoji 🎉"
```

---

## Common Script Patterns

### Multi-Account Management

**Before** (manual port juggling):
```python
accounts = [
    {"name": "account1", "port": 9222, "profile": "./profiles/acc1"},
    {"name": "account2", "port": 9223, "profile": "./profiles/acc2"},
    {"name": "account3", "port": 9224, "profile": "./profiles/acc3"},
]
for acc in accounts:
    os.system(f'start chrome --remote-debugging-port={acc["port"]} --user-data-dir={acc["profile"]}')
    co = ChromiumOptions()
    co.set_local_port(acc["port"])
    page = ChromiumPage(addr_or_opts=co)
    # ... do work ...
```

**After**:
```bash
# One-time setup
naturo browser profile create xhs-account1
naturo browser profile create xhs-account2
naturo browser profile create xhs-account3

# Log in to each (interactive, one-time)
naturo browser profile setup xhs-account1
naturo browser profile setup xhs-account2
naturo browser profile setup xhs-account3

# Script: iterate over accounts (ports auto-managed)
for account in xhs-account1 xhs-account2 xhs-account3; do
  naturo browser launch --profile $account
  naturo browser navigate "https://www.xiaohongshu.com"
  # ... do work ...
  naturo browser close
done
```

### Data Scraping Loop

**Before** (DrissionPage):
```python
page.get("https://platform.com/data")
page.wait.doc_loaded()

results = []
while True:
    items = page.eles("xpath://tr[@class='data-row']")
    for item in items:
        row = {
            "name": item.ele("xpath:.//td[1]").text,
            "value": item.ele("xpath:.//td[2]").text,
            "link": item.ele("xpath:.//a").attr("href"),
        }
        results.append(row)

    next_btn = page.ele("xpath://button[@class='next-page']")
    if not next_btn or "disabled" in next_btn.attr("class"):
        break
    next_btn.click()
    page.wait.doc_loaded()
```

**After** (naturo Python SDK):
```python
from naturo.browser import BrowserPage

page = BrowserPage(profile="scraper")
page.navigate("https://platform.com/data")
page.wait_for_load()

results = []
while True:
    items = page.find_all("//tr[@class='data-row']")
    for item in items:
        row = {
            "name": item.find("td:nth-child(1)").text,
            "value": item.find("td:nth-child(2)").text,
            "link": item.find("a").attr("href"),
        }
        results.append(row)

    next_btn = page.find(".next-page")
    if not next_btn or "disabled" in next_btn.attr("class"):
        break
    next_btn.click()
    page.wait_for_load()
```

**Or pure CLI** (for simple cases):
```bash
naturo browser launch --profile scraper
naturo browser navigate "https://platform.com/data"
naturo browser wait --load

# Get all rows as JSON
naturo browser eval "
  Array.from(document.querySelectorAll('tr.data-row')).map(row => ({
    name: row.cells[0].textContent,
    value: row.cells[1].textContent,
    link: row.querySelector('a')?.href
  }))
" --json > results.json
```

### Form Filling

**Before**:
```python
page.ele("xpath://input[@name='company']").input("Acme Corp", True)
page.ele("xpath://input[@name='contact']").input("John", True)
page.ele("xpath://select[@name='industry']").select("Technology")
page.ele("xpath://textarea[@name='description']").input("Our company does...", True)
page.ele("xpath://input[@type='file']").click.to_upload("/path/to/doc.pdf")
page.ele("xpath://button[@type='submit']").click()
```

**After**:
```bash
naturo browser type "input[name='company']" "Acme Corp" --clear-first
naturo browser type "input[name='contact']" "John" --clear-first
naturo browser select "select[name='industry']" "Technology"
naturo browser type "textarea[name='description']" "Our company does..." --clear-first
# File upload handled via dialog
naturo browser click "input[type='file']"
naturo dialog type "/path/to/doc.pdf"
naturo dialog accept
naturo browser click "button[type='submit']"
```

### File Upload

**Before** (DrissionPage):
```python
upload_btn = page.ele("xpath://input[@type='file']")
upload_btn.click.to_upload("/path/to/file.pdf")
upload_btn.wait.disabled()  # Wait for upload to complete
```

**After**:
```bash
naturo browser click "input[type='file']"
# OS file dialog appears — naturo handles desktop dialogs
naturo dialog type "/path/to/file.pdf"
naturo dialog accept
# Wait for upload indicator
naturo browser wait ".upload-complete" --state visible --timeout 30000
```

This is another case where naturo's desktop + browser integration shines —
the file dialog is a native OS window, not a browser element.

---

## Full Migration Example

Here is a complete migration of a Xiaohongshu (Little Red Book) scraping script.

### Before: DrissionPage + pywinauto (120 lines)

```python
import os, time, json, random
from DrissionPage import ChromiumPage, ChromiumOptions
from pywinauto.keyboard import send_keys
import pyperclip

class XhsScraper:
    def __init__(self, account_name, port):
        profile = os.path.join(os.getcwd(), "profiles", account_name)
        os.makedirs(profile, exist_ok=True)
        co = ChromiumOptions()
        co.set_user_data_path(profile)
        co.set_local_port(port)
        co.set_browser_path(r"C:\Users\me\Application\chrome.exe")
        co.set_argument("--hide-crash-restore-bubble")
        co.set_pref("credentials_enable_service", False)
        self.page = ChromiumPage(addr_or_opts=co)

    def search(self, keyword):
        self.page.get("https://www.xiaohongshu.com/explore")
        self.page.wait.doc_loaded()
        time.sleep(random.uniform(1, 2))

        search = self.page.ele("xpath://input[@id='search-input']")
        search.input(keyword, True)
        time.sleep(0.5)
        self.page.ele("xpath://div[@class='search-icon']").click()
        self.page.wait.doc_loaded()

    def scrape_notes(self):
        results = []
        items = self.page.eles("xpath://div[contains(@class,'note-item')]")
        for item in items:
            try:
                title = item.ele("xpath:.//span[@class='title']").text
                author = item.ele("xpath:.//span[@class='author']").text
                likes = item.ele("xpath:.//span[@class='like-count']").text
                link = item.ele("xpath:.//a").attr("href")
                results.append({
                    "title": title, "author": author,
                    "likes": likes, "link": link
                })
            except Exception:
                continue
        return results

    def next_page(self):
        self.page.scroll.to_bottom()
        time.sleep(random.uniform(1, 3))

if __name__ == "__main__":
    scraper = XhsScraper("xhs-main", 9222)
    scraper.search("coffee shop recommendations")
    all_data = []
    for page_num in range(5):
        data = scraper.scrape_notes()
        all_data.extend(data)
        scraper.next_page()
    with open("results.json", "w") as f:
        json.dump(all_data, f, ensure_ascii=False, indent=2)
```

### After: naturo (45 lines, same functionality)

```bash
#!/bin/bash
# xhs_scrape.sh — Xiaohongshu scraper using naturo
# One-time setup: naturo browser profile create xhs-main
#                 naturo browser profile setup xhs-main  (log in manually)

KEYWORD="coffee shop recommendations"
OUTPUT="results.json"

# Launch with profile (anti-detection is automatic)
naturo browser launch --profile xhs-main

# Navigate and search
naturo browser navigate "https://www.xiaohongshu.com/explore"
naturo browser wait --load
sleep $(python3 -c "import random; print(random.uniform(1, 2))")

naturo browser type "#search-input" "$KEYWORD" --clear-first
naturo browser click ".search-icon"
naturo browser wait --load

# Scrape 5 pages
echo "[]" > "$OUTPUT"
for i in $(seq 1 5); do
  # Extract all notes on current page as JSON
  NOTES=$(naturo browser eval "
    Array.from(document.querySelectorAll('.note-item')).map(item => ({
      title: item.querySelector('.title')?.textContent || '',
      author: item.querySelector('.author')?.textContent || '',
      likes: item.querySelector('.like-count')?.textContent || '',
      link: item.querySelector('a')?.href || ''
    }))
  " --json)

  # Merge into results
  python3 -c "
import json, sys
existing = json.load(open('$OUTPUT'))
existing.extend(json.loads(sys.argv[1]))
json.dump(existing, open('$OUTPUT', 'w'), ensure_ascii=False, indent=2)
" "$NOTES"

  # Scroll down for next page
  naturo browser eval "window.scrollTo(0, document.body.scrollHeight)"
  sleep $(python3 -c "import random; print(random.uniform(1, 3))")
done

echo "Scraped $(python3 -c "import json; print(len(json.load(open('$OUTPUT'))))" ) notes → $OUTPUT"
naturo browser close
```

### Or Python SDK (50 lines, more readable)

```python
#!/usr/bin/env python3
"""xhs_scrape.py — Xiaohongshu scraper using naturo Python SDK"""
import json, time, random
from naturo.browser import BrowserPage

page = BrowserPage(profile="xhs-main")  # anti-detection automatic
page.navigate("https://www.xiaohongshu.com/explore")
page.wait_for_load()
time.sleep(random.uniform(1, 2))

# Search
page.find("#search-input").type("coffee shop recommendations", clear_first=True)
page.find(".search-icon").click()
page.wait_for_load()

# Scrape 5 pages
all_data = []
for _ in range(5):
    for item in page.find_all(".note-item"):
        try:
            all_data.append({
                "title": item.find(".title").text,
                "author": item.find(".author").text,
                "likes": item.find(".like-count").text,
                "link": item.find("a").attr("href"),
            })
        except Exception:
            continue

    page.evaluate("window.scrollTo(0, document.body.scrollHeight)")
    time.sleep(random.uniform(1, 3))

with open("results.json", "w") as f:
    json.dump(all_data, f, ensure_ascii=False, indent=2)
print(f"Scraped {len(all_data)} notes")
page.close()
```

**Migration result**: 120 lines → 50 lines, 4 dependencies → 1 dependency,
10 lines of anti-detection boilerplate → 0 lines.

---

## Troubleshooting

### Chrome won't launch

```bash
# Check if Chrome is already running on the profile's port
naturo browser profile info <profile-name>

# Kill orphaned Chrome processes
naturo app quit --app chrome --force
```

### CDP connection refused

```bash
# Verify Chrome is running with debugging port
naturo browser connect --port 9222

# If Chrome was started manually, ensure it has --remote-debugging-port
# Or use naturo to launch it properly:
naturo browser launch --profile <name>
```

### Element not found

```bash
# Check if element exists (maybe page hasn't loaded)
naturo browser wait "#my-element" --timeout 10000

# Check if element is in an iframe
naturo browser eval "document.querySelectorAll('iframe').length"

# Use naturo see for visual debugging — shows ALL elements including AI-detected ones
naturo see --app chrome
```

### Slider captcha fails

```bash
# Verify your solver returns the correct distance
naturo browser screenshot --selector "#captcha-container" --path debug.png

# Try adjusting trajectory parameters
# Slower duration + less overshoot for stricter captchas
naturo drag --from-element "#slider" --offset-x $DIST \
  --trajectory bezier --duration 1000 --jitter 1 --overshoot 5

# Check if the site detects the trajectory pattern
# Run multiple times — each trajectory should be unique
```

### Desktop element not found after browser interaction

```bash
# Ensure the desktop app has focus
naturo app focus --app 微信

# Give the app time to render
naturo wait --duration 1

# Use naturo see to verify what's visible
naturo see --app 微信
```
