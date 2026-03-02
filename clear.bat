@echo off
setlocal enabledelayedexpansion

:: Cache Cleaner for Discord, Steam and Browsers
:: Runs completely in background

:: Kill applications silently
taskkill /F /IM discord.exe >nul 2>&1
taskkill /F /IM steam.exe >nul 2>&1
taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
taskkill /F /IM firefox.exe >nul 2>&1
taskkill /F /IM opera.exe >nul 2>&1
taskkill /F /IM yandex.exe >nul 2>&1
taskkill /F /IM brave.exe >nul 2>&1
taskkill /F /IM vivaldi.exe >nul 2>&1

:: Wait for processes to fully close
timeout /t 2 /nobreak >nul

:: ========== DISCORD ==========
if exist "%LocalAppData%\Discord" (
    cd /d "%LocalAppData%\Discord" 2>nul
    for %%i in (Cache CodeCache GPUCache) do (
        if exist "%%i" (
            rmdir /s /q "%%i" 2>nul
        )
    )
)

:: ========== STEAM ==========
if exist "%LocalAppData%\Steam" (
    cd /d "%LocalAppData%\Steam" 2>nul
    for %%i in (htmlcache appcache) do (
        if exist "%%i" (
            rmdir /s /q "%%i" 2>nul
        )
    )
)

:: ========== GOOGLE CHROME ==========
if exist "%LocalAppData%\Google\Chrome\User Data" (
    for /d %%p in ("%LocalAppData%\Google\Chrome\User Data\*") do (
        if exist "%%p\Cache" rmdir /s /q "%%p\Cache" 2>nul
        if exist "%%p\Code Cache" rmdir /s /q "%%p\Code Cache" 2>nul
        if exist "%%p\GPUCache" rmdir /s /q "%%p\GPUCache" 2>nul
    )
)

:: ========== MICROSOFT EDGE ==========
if exist "%LocalAppData%\Microsoft\Edge\User Data" (
    for /d %%p in ("%LocalAppData%\Microsoft\Edge\User Data\*") do (
        if exist "%%p\Cache" rmdir /s /q "%%p\Cache" 2>nul
        if exist "%%p\Code Cache" rmdir /s /q "%%p\Code Cache" 2>nul
    )
)

:: ========== MOZILLA FIREFOX ==========
if exist "%LocalAppData%\Mozilla\Firefox\Profiles" (
    for /d %%p in ("%LocalAppData%\Mozilla\Firefox\Profiles\*") do (
        if exist "%%p\cache2" rmdir /s /q "%%p\cache2" 2>nul
        if exist "%%p\thumbnails" rmdir /s /q "%%p\thumbnails" 2>nul
        if exist "%%p\offlinecache" rmdir /s /q "%%p\offlinecache" 2>nul
    )
)

:: ========== OPERA ==========
if exist "%LocalAppData%\Opera Software\Opera Stable" (
    cd /d "%LocalAppData%\Opera Software\Opera Stable" 2>nul
    for %%i in (Cache Code Cache) do (
        if exist "%%i" rmdir /s /q "%%i" 2>nul
    )
)

:: ========== YANDEX BROWSER ==========
if exist "%LocalAppData%\Yandex\YandexBrowser\User Data" (
    for /d %%p in ("%LocalAppData%\Yandex\YandexBrowser\User Data\*") do (
        if exist "%%p\Cache" rmdir /s /q "%%p\Cache" 2>nul
        if exist "%%p\Code Cache" rmdir /s /q "%%p\Code Cache" 2>nul
    )
)

:: ========== BRAVE ==========
if exist "%LocalAppData%\BraveSoftware\Brave-Browser\User Data" (
    for /d %%p in ("%LocalAppData%\BraveSoftware\Brave-Browser\User Data\*") do (
        if exist "%%p\Cache" rmdir /s /q "%%p\Cache" 2>nul
        if exist "%%p\Code Cache" rmdir /s /q "%%p\Code Cache" 2>nul
    )
)

:: ========== DISCORD PTB/CANARY ==========
if exist "%LocalAppData%\DiscordPTB" (
    cd /d "%LocalAppData%\DiscordPTB" 2>nul
    for %%i in (Cache CodeCache GPUCache) do (
        if exist "%%i" rmdir /s /q "%%i" 2>nul
    )
)

if exist "%LocalAppData%\DiscordCanary" (
    cd /d "%LocalAppData%\DiscordCanary" 2>nul
    for %%i in (Cache CodeCache GPUCache) do (
        if exist "%%i" rmdir /s /q "%%i" 2>nul
    )
)

:: Exit silently
exit