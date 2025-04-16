@echo off
setlocal

:: Folder do zapisu backupu
set backupFolder=%USERPROFILE%\Desktop\Backup-WiFi

:: Tworzenie folderu
mkdir "%backupFolder%"

echo Szukam zapisanych profili Wi-Fi...

:: Pobranie listy wszystkich profili
for /f "tokens=*" %%i in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "profileName=!line:All User Profile     =!"
    echo Eksportuje profil: !profileName!
    netsh wlan export profile name="!profileName!" folder="%backupFolder%" key=clear >nul
    endlocal
)

echo ---
echo Gotowe!
echo Backup zapisany w: %backupFolder%
pause
exit
