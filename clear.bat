@echo off
title Очистка кеша (Автоматический режим)
color 0E

:: Закрываем приложения (без вывода сообщений)
taskkill /F /IM discord.exe >nul 2>&1
taskkill /F /IM steam.exe >nul 2>&1
taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
taskkill /F /IM firefox.exe >nul 2>&1
taskkill /F /IM opera.exe >nul 2>&1
taskkill /F /IM browser.exe >nul 2>&1

:: Небольшая задержка, чтобы процессы точно закрылись
timeout /t 2 /nobreak >nul

:: Очистка Discord
if exist "%LocalAppData%\Discord" (
    cd /d "%LocalAppData%\Discord"
    for /d %%i in (Cache CodeCache GPUCache) do (
        if exist "%%i" rmdir /s /q "%%i" >nul 2>&1
    )
)

:: Очистка Steam
if exist "%LocalAppData%\Steam" (
    cd /d "%LocalAppData%\Steam"
    for /d %%i in (htmlcache appcache) do (
        if exist "%%i" rmdir /s /q "%%i" >nul 2>&1
    )
)

:: Очистка Google Chrome
if exist "%LocalAppData%\Google\Chrome\User Data\Default" (
    cd /d "%LocalAppData%\Google\Chrome\User Data\Default"
    for /d %%i in (Cache Code Cache Storage) do (
        if exist "%%i" rmdir /s /q "%%i" >nul 2>&1
    )
)

:: Очистка Microsoft Edge
if exist "%LocalAppData%\Microsoft\Edge\User Data\Default" (
    cd /d "%LocalAppData%\Microsoft\Edge\User Data\Default"
    for /d %%i in (Cache Code Cache Storage) do (
        if exist "%%i" rmdir /s /q "%%i" >nul 2>&1
    )
)

:: Очистка Mozilla Firefox
if exist "%LocalAppData%\Mozilla\Firefox\Profiles" (
    cd /d "%LocalAppData%\Mozilla\Firefox\Profiles"
    for /d %%i in (*.default-release) do (
        if exist "%%i\cache2" rmdir /s /q "%%i\cache2" >nul 2>&1
        if exist "%%i\thumbnails" rmdir /s /q "%%i\thumbnails" >nul 2>&1
    )
)

:: Очистка Opera
if exist "%LocalAppData%\Opera Software\Opera Stable" (
    cd /d "%LocalAppData%\Opera Software\Opera Stable"
    for /d %%i in (Cache Code Cache) do (
        if exist "%%i" rmdir /s /q "%%i" >nul 2>&1
    )
)

:: Очистка Yandex Browser
if exist "%LocalAppData%\Yandex\YandexBrowser\User Data\Default" (
    cd /d "%LocalAppData%\Yandex\YandexBrowser\User Data\Default"
    for /d %%i in (Cache Code Cache) do (
        if exist "%%i" rmdir /s /q "%%i" >nul 2>&1
    )
)

:: Завершение (без паузы)
exit