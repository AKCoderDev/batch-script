@echo off
cd /d C:\path\to\folder\with\wifi\files

for %%f in (*.xml) do (
    netsh wlan add profile filename="%%f" user=all
    if errorlevel 1 (
        echo Błąd podczas dodawania profilu: %%f
    ) else (
        echo Profil dodany pomyślnie: %%f
    )
)

pause
