@echo off
cd /d "%~dp0"
echo === NetPlan setup ===
where python >nul 2>nul || (echo Python 3.10+ not found. Install from python.org & pause & exit /b 1)
where npm >nul 2>nul || (echo Node.js 18+ not found. Install from nodejs.org & pause & exit /b 1)
cd backend
python -m venv .venv || goto :err
call .venv\Scripts\activate.bat
python -m pip install --upgrade pip
pip install -r requirements.txt || goto :err
cd ..\frontend
call npm install || goto :err
echo.
echo Setup complete. Run start.bat to launch NetPlan.
pause
exit /b 0
:err
echo Setup failed - see messages above.
pause
exit /b 1
