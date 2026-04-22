@echo off
cd /d %~dp0

:: Datum & Uhrzeit sauber holen (DE-Format erzwingen)
for /f "tokens=2 delims==" %%I in ('wmic os get LocalDateTime /value') do set dt=%%I

set DATE=%dt:~6,2%.%dt:~4,2%.%dt:~0,4%
set TIME=%dt:~8,2%.%dt:~10,2%.%dt:~12,2%

set MSG=update_%DATE%_%TIME%

git add .
git commit -m "%MSG%"
git push

echo.
echo Push fertig!
echo Commit: %MSG%
pause