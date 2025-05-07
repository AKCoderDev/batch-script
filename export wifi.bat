@echo off
setlocal enabledelayedexpansion

:: Folder for backup files
set "backupFolder=%USERPROFILE%\Desktop\Backup-WiFi"

:: Create folder (if you didn't have)
if not exist "%backupFolder%" (
    mkdir "%backupFolder%"
)

echo Searching for profile Wi-Fi...

:: Download All User Profile
for /f "tokens=*" %%i in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    for /f "tokens=1,* delims=:" %%a in ("!line!") do (
        set "profileName=%%b"
        set "profileName=!profileName:~1!"  :: Remove leading space
        echo Eksportuję: !profileName!
        netsh wlan export profile name="!profileName!" folder="%backupFolder%" key=clear >nul
    )
    endlocal
)

echo ---
echo Ready!
echo Backup save in: %backupFolder%
pause
exit
