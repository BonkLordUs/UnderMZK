schtasks /create /tn "CacheCleaner" /tr "C:\Windows\System32\cmd.exe /c start /b C:\Scripts\CacheCleaner.bat" /sc onlogon /delay 0000:30 /ru "%USERNAME%" /f
