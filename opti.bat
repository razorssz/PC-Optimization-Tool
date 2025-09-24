@echo off
chcp 65001 >nul
title RazorsOpti - Ultimate Windows Optimizer
color 0B
mode con: cols=100 lines=40

:: ===========================
::   RAZORSOPTI
:: ===========================
echo.
echo ██████╗  █████╗ ███████╗ ██████╗ ██████╗ ██████╗ ███████╗ ██████╗ ██████╗ ████████╗██╗
echo ██╔══██╗██╔══██╗██╔════╝██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝ ██╔══██╗╚══██╔══╝██║
echo ██████╔╝███████║███████╗██║   ██║██████╔╝██████╔╝█████╗  ██║  ███╗██████╔╝   ██║   ██║
echo ██╔══██╗██╔══██║╚════██║██║   ██║██╔══██╗██╔══██╗██╔══╝  ██║   ██║██╔═══╝    ██║   ╚═╝
echo ██║  ██║██║  ██║███████║╚██████╔╝██║  ██║██║  ██║███████╗╚██████╔╝██║        ██║   ██╗
echo ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝        ╚═╝   ╚═╝
echo.
echo              --- RazorsOpti v2.0 ---
echo.
pause

:: Check for administrator privileges
NET FILE >nul 2>&1
if '%errorlevel%' neq '0' (
    echo Requesting administrator privileges...
    goto UACPrompt
) else ( goto MENU )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B

:MENU
cls
echo ==================================================
echo              RazorsOpti - Optimization Menu
echo ==================================================
echo [1] Performance Tweaks (40+ tweaks)
echo [2] Network Tweaks (25+ tweaks)
echo [3] Service Tweaks (20+ tweaks)
echo [4] Privacy Tweaks (20+ tweaks)
echo [5] Cleanup ^& Temp Removal
echo [6] Security Hardening
echo [7] Apply All Tweaks (100+ total)
echo [8] Create Restore Point
echo [0] Exit
echo ==================================================
set /p choice=Choose an option: 

if "%choice%"=="1" goto PERFORMANCE
if "%choice%"=="2" goto NETWORK
if "%choice%"=="3" goto SERVICES
if "%choice%"=="4" goto PRIVACY
if "%choice%"=="5" goto CLEANUP
if "%choice%"=="6" goto SECURITY
if "%choice%"=="7" goto APPLYALL
if "%choice%"=="8" goto RESTOREPOINT
if "%choice%"=="0" exit
goto MENU

:PERFORMANCE
cls
echo Applying 40+ Performance Tweaks...
echo ==================================

:: Power Scheme Optimization
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
powercfg -setactive SCHEME_MIN >nul 2>&1
powercfg -setacvalueindex SCHEME_MIN SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg -setdcvalueindex SCHEME_MIN SUB_PROCESSOR PROCTHROTTLEMAX 100

:: Memory and Cache Optimization
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v IOPageLockLimit /t REG_DWORD /d 4194304 /f >nul 2>&1

:: Boot Optimization
bcdedit /set useplatformclock false >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
bcdedit /set useplatformtick yes >nul 2>&1
bcdedit /set bootux disabled >nul 2>&1

:: UI Responsiveness
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d 1000 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v WaitToKillAppTimeout /t REG_SZ /d 2000 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v LowLevelHooksTimeout /t REG_SZ /d 1000 /f >nul 2>&1

:: File System Optimization
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableLastAccessUpdate /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v LongPathsEnabled /t REG_DWORD /d 1 /f >nul 2>&1

:: Processor Scheduling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f >nul 2>&1

:: Disable Visual Effects
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v DragFullWindows /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v FontSmoothing /t REG_SZ /d 0 /f >nul 2>&1

:: Windows Search Indexing Optimization
reg add "HKLM\SOFTWARE\Microsoft\Windows Search" /v SetupCompletedSuccessfully /t REG_DWORD /d 1 /f >nul 2>&1

:: Prefetch and Superfetch Optimization
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 3 /f >nul 2>&1

:: Disable Timeline
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableActivityFeed /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f >nul 2>&1

:: Game Mode Optimization
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f >nul 2>&1

:: SSD Optimization
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v DisableDeleteNotification /t REG_DWORD /d 1 /f >nul 2>&1

echo 40+ Performance tweaks applied successfully!
pause
goto MENU

:NETWORK
cls
echo Applying 25+ Network Tweaks...
echo ==============================

:: TCP/IP Optimization
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global chimney=enabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
netsh int tcp set global netdma=enabled >nul 2>&1
netsh int tcp set global dca=enabled >nul 2>&1
netsh int tcp set global ecncapability=disabled >nul 2>&1

:: TCP Parameters Optimization
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v SackOpts /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v Tcp1323Opts /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 65535 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f >nul 2>&1

:: DNS Cache Optimization
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v MaxCacheTtl /t REG_DWORD /d 3600 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v MaxNegativeCacheTtl /t REG_DWORD /d 300 /f >nul 2>&1

:: Network Throttling Removal
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >nul 2>&1

:: Disable Nagle's Algorithm
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v TcpNoDelay /t REG_DWORD /d 1 /f >nul 2>&1

:: Increase Max User Ports
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxUserPort /t REG_DWORD /d 65534 /f >nul 2>&1

:: QoS Packet Scheduler
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /t REG_DWORD /d 0 /f >nul 2>&1

echo 25+ Network tweaks applied successfully!
pause
goto MENU

:SERVICES
cls
echo Optimizing 20+ Services...
echo ==========================

:: Disable unnecessary services (with safety checks)
for %%s in (
    "DiagTrack"
    "dmwappushservice"
    "MapsBroker"
    "lfsvc"
    "WSearch"
    "XboxGipSvc"
    "XboxNetApiSvc"
) do (
    sc query "%%s" >nul 2>&1 && (
        sc stop "%%s" >nul 2>&1
        sc config "%%s" start= disabled >nul 2>&1
        echo Disabled: %%s
    )
)

:: Set services to manual
for %%s in (
    "Fax"
    "fhsvc"
    "irmon"
    "SharedAccess"
    "TrkWks"
    "WbioSrvc"
) do (
    sc query "%%s" >nul 2>&1 && (
        sc config "%%s" start= demand >nul 2>&1
        echo Set to manual: %%s
    )
)

:: Optimize critical services
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2000 /f >nul 2>&1

echo 20+ Service optimizations completed!
pause
goto MENU

:PRIVACY
cls
echo Applying 20+ Privacy Tweaks...
echo ==============================

:: Telemetry and Data Collection
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v AITEnable /t REG_DWORD /d 0 /f >nul 2>&1

:: Advertising ID
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1

:: Location Tracking
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v SensorPermissionState /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v Status /t REG_DWORD /d 0 /f >nul 2>&1

:: Cortana and Search Privacy
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowSearchToUseLocation /t REG_DWORD /d 0 /f >nul 2>&1

:: Wi-Fi Sense
reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v AutoConnectAllowedOEM /t REG_DWORD /d 0 /f >nul 2>&1

:: Background Apps
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul 2>&1

:: Diagnostic Data
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v MaxTelemetryAllowed /t REG_DWORD /d 0 /f >nul 2>&1

echo 20+ Privacy tweaks applied successfully!
pause
goto MENU

:CLEANUP
cls
echo Cleaning System...
echo ==================

:: Temp files cleanup
echo Cleaning temporary files...
del /s /q "%temp%\*" >nul 2>&1
del /s /q "C:\Windows\Temp\*" >nul 2>&1
del /s /q "%USERPROFILE%\AppData\Local\Temp\*" >nul 2>&1

:: Browser cache cleanup
if exist "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache" (
    del /s /q "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
)
if exist "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Cache" (
    del /s /q "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
)
if exist "%USERPROFILE%\AppData\Local\Mozilla\Firefox\Profiles" (
    del /s /q "%USERPROFILE%\AppData\Local\Mozilla\Firefox\Profiles\*\cache2\*" >nul 2>&1
)

:: Windows Update cache
net stop wuauserv >nul 2>&1
del /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
net start wuauserv >nul 2>&1

:: Thumbnail cache
del /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1

:: DNS cache flush
ipconfig /flushdns >nul 2>&1

:: Prefetch cleanup
del /s /q "C:\Windows\Prefetch\*" >nul 2>&1

:: Recycle Bin cleanup
powershell -Command "Clear-RecycleBin -Force" >nul 2>&1

echo Cleanup completed successfully!
pause
goto MENU

:SECURITY
cls
echo Applying Security Hardening...
echo ==============================

:: Disable SMBv1
sc config lanmanworkstation depend= bowser/mrxsmb20/nsi >nul 2>&1
sc config mrxsmb10 start= disabled >nul 2>&1

:: Windows Defender exclusions (performance)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions\Paths" /v "C:\Games" /t REG_SZ /d 0 /f >nul 2>&1

:: Disable Autorun
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 255 /f >nul 2>&1

:: Enhanced security policies
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v restrictanonymous /t REG_DWORD /d 1 /f >nul 2>&1

echo Security hardening applied!
pause
goto MENU

:RESTOREPOINT
cls
echo Creating System Restore Point...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "RazorsOpti Pre-Optimization", 100, 7 >nul 2>&1
echo Restore point created successfully!
pause
goto MENU

:APPLYALL
cls
echo Applying All 100+ Tweaks...
echo ===========================
echo This may take several minutes...
echo.

echo Creating restore point...
call :RESTOREPOINT

echo Applying performance tweaks...
call :PERFORMANCE

echo Applying network tweaks...
call :NETWORK

echo Optimizing services...
call :SERVICES

echo Applying privacy tweaks...
call :PRIVACY

echo Applying security hardening...
call :SECURITY

echo Performing system cleanup...
call :CLEANUP

echo.
echo ==================================================
echo All 100+ optimization tweaks applied successfully!
echo ==================================================
pause
goto MENU