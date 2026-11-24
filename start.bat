@echo off
cd /d "%~dp0"
if not exist backend\.venv\Scripts\activate.bat call setup.bat
if not exist frontend\node_modules call setup.bat
start "NetPlan API (port 8000)" cmd /k "cd /d %~dp0backend && call .venv\Scripts\activate.bat && uvicorn app.main:app --port 8000"
start "NetPlan UI (port 5173)" cmd /k "cd /d %~dp0frontend && npm run dev"
timeout /t 6 >nul
start http://localhost:5173
