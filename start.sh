#!/bin/sh
# macOS/Linux: ./start.sh  (first run creates venv and installs deps)
cd "$(dirname "$0")"
[ -d backend/.venv ] || { python3 -m venv backend/.venv && backend/.venv/bin/pip install -r backend/requirements.txt; }
[ -d frontend/node_modules ] || (cd frontend && npm install)
(cd backend && .venv/bin/uvicorn app.main:app --port 8000) &
(cd frontend && npm run dev)
