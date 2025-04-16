@echo off
cd /d e:\work\Webuild\Kamil\Backup-WiFi

for %%f in (*.xml) do (
    netsh wlan add profile filename="%%f" user=all
    if errorlevel 1 (
        echo Błąd podczas dodawania profilu: %%f
    ) else (
        echo Profil dodany pomyślnie: %%f
    )
)

pause
