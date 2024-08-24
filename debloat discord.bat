@echo off
taskkill /f /im Discord.exe >nul 2>&1
timeout /t 5 /nobreak >nul

for /d %%D in ("%LOCALAPPDATA%\Discord\app-*") do (
    for /d %%M in ("%%D\modules\*") do (
        if not "%%~nxM"=="discord_desktop_core-1" if not "%%~nxM"=="discord_krisp-1" if not "%%~nxM"=="discord_modules-1" if not "%%~nxM"=="discord_utils-1" if not "%%~nxM"=="discord_voice-1" if not "%%~nxM"=="discord_zstd-1" (
            rd /s /q "%%M"
        )
    )
    for %%F in ("%%D\locales\*") do (
        if /i not "%%~nxF"=="en-US.pak" (
            del "%%F"
        )
    )
    start "" "%%D\Discord.exe"
    goto :end
)
:end
