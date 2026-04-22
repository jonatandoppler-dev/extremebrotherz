@echo off
cd /d %~dp0

:: Datum & Uhrzeit holen
for /f "tokens=2-4 delims=.-/ " %%a in ('date /t') do set DATE=%%c-%%b-%%a
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set TIME=%%a-%%b

:: Commit Message bauen
set MSG=update_%DATE%_%TIME%

:: Git Befehle
git add .
git commit -m "%MSG%"
git push

echo.
echo ==========================
echo Push fertig!
echo Commit: %MSG%
echo ==========================
pause