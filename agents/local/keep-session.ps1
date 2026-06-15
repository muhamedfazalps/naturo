<#
.SYNOPSIS
  Keep the interactive desktop session ACTIVE after you disconnect mstsc/RDP, so the QA loop
  keeps working. RUN THIS YOURSELF (Ace), elevated.

.DESCRIPTION
  On Windows client, disconnecting an RDP session leaves it *disconnected + locked* — no rendered
  desktop — which breaks UI automation (capture goes black, click/type don't reach windows). This
  is the same NO_DESKTOP_SESSION class the project tests (#863/#868/#885).

  The fix is to redirect your RDP session to the physical **console** session, where it stays
  ACTIVE (unlocked) even after RDP disconnects and with no monitor attached.

  Default (manual): run this right before you leave. Your mstsc window drops immediately, but the
  session lives on the console and the loop keeps running. Reconnect with mstsc anytime to take it
  back. Requires administrator (auto-elevates).

  Optional (-InstallAuto): register a SYSTEM scheduled task that fires on every RDP *disconnect*
  event and runs the same redirect automatically, so you can just close mstsc. Remove with -Uninstall.

.EXAMPLE
  powershell -ExecutionPolicy Bypass -File agents\local\keep-session.ps1
  powershell -ExecutionPolicy Bypass -File agents\local\keep-session.ps1 -InstallAuto
  powershell -ExecutionPolicy Bypass -File agents\local\keep-session.ps1 -Uninstall
#>
param([switch]$InstallAuto, [switch]$Uninstall)

$ErrorActionPreference = 'Stop'

# --- self-elevate ---
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
        ).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
  $argline = "-ExecutionPolicy Bypass -NoProfile -File `"$PSCommandPath`""
  if ($InstallAuto) { $argline += " -InstallAuto" }
  if ($Uninstall)   { $argline += " -Uninstall" }
  Start-Process powershell.exe -Verb RunAs -ArgumentList $argline
  return
}

$TaskName = 'Naturo-KeepSession'

if ($Uninstall) {
  Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false -ErrorAction SilentlyContinue
  Write-Output "removed $TaskName"
  return
}

if ($InstallAuto) {
  # Redirect THIS session's user back to console whenever an RDP session disconnects.
  # Trigger: Microsoft-Windows-TerminalServices-LocalSessionManager/Operational, Event ID 24 (disconnect).
  $cmd = 'for /f "tokens=2" %s in (''query session ^| findstr /i "Disc"'') do tscon %s /dest:console'
  $action  = New-ScheduledTaskAction -Execute 'cmd.exe' -Argument "/c $cmd"
  $trigClass = Get-CimClass MSFT_TaskEventTrigger root/Microsoft/Windows/TaskScheduler
  $trig = New-CimInstance -CimClass $trigClass -ClientOnly
  $trig.Enabled = $true
  $trig.Subscription = '<QueryList><Query Id="0" Path="Microsoft-Windows-TerminalServices-LocalSessionManager/Operational"><Select Path="Microsoft-Windows-TerminalServices-LocalSessionManager/Operational">*[System[(EventID=24)]]</Select></Query></QueryList>'
  $principal = New-ScheduledTaskPrincipal -UserId 'SYSTEM' -LogonType ServiceAccount -RunLevel Highest
  $settings  = New-ScheduledTaskSettingsSet -MultipleInstances IgnoreNew -StartWhenAvailable
  Register-ScheduledTask -TaskName $TaskName -Action $action -Trigger $trig -Principal $principal -Settings $settings -Force | Out-Null
  Write-Output "registered $TaskName — will auto-redirect to console on RDP disconnect."
  Write-Output "Test: connect via mstsc, then just close the window; the loop should keep running."
  return
}

# --- manual one-shot: move the current session to console now ---
$sid = (Get-Process -Id $PID).SessionId
Write-Output "Redirecting session $sid to console. Your RDP window will drop; the session stays ACTIVE."
Start-Sleep -Seconds 1
& tscon $sid /dest:console
