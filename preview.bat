@echo off
setlocal

rem Find Hugo. Prefer whatever is on PATH, then fall back to the WinGet install
rem location. The old version of this script hard-coded the WinGet path, so it
rem failed with a confusing "not recognized" error whenever Hugo was missing.
set "HUGO="
for %%I in (hugo.exe) do if not defined HUGO set "HUGO=%%~$PATH:I"
if not defined HUGO set "HUGO=%LOCALAPPDATA%\Microsoft\WinGet\Packages\Hugo.Hugo.Extended_Microsoft.Winget.Source_8wekyb3d8bbwe\hugo.exe"
if not exist "%HUGO%" goto nohugo

rem Serve the folder this script lives in, so the script keeps working even if
rem the website folder is moved or renamed.
echo Starting website preview...
echo Using Hugo: %HUGO%
echo.
echo Once you see "Web Server is available", open your browser and go to:
echo http://localhost:1313
echo.
echo Press Ctrl+C to stop the server.
echo.
"%HUGO%" server --source "%~dp0."
if errorlevel 1 echo Hugo exited with an error. Scroll up for the message.
pause
exit /b 0

:nohugo
echo ERROR: Hugo is not installed, so the preview cannot start.
echo.
echo Install the same version the live site is built with:
echo.
echo     winget install --id Hugo.Hugo.Extended --version 0.159.2
echo.
echo The deploy uses Hugo Extended 0.159.2 (see .github/workflows/deploy.yml).
echo Matching that version locally means the preview looks like the live site.
echo.
pause
exit /b 1
