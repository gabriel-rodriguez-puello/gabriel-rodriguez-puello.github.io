@echo off
echo Starting website preview...
echo Once you see "Web Server is available", open your browser and go to:
echo http://localhost:1313
echo.
echo Press Ctrl+C to stop the server.
echo.
"C:\Users\RodGab\AppData\Local\Microsoft\WinGet\Packages\Hugo.Hugo.Extended_Microsoft.Winget.Source_8wekyb3d8bbwe\hugo.exe" server -s "C:\Users\RodGab\OneDrive - Jonkoping University\website"
pause
