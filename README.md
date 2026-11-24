# NetPlan - Network Infrastructure Planning on CAD Floorplans

## Run (Windows)
1. Install Python 3.10+ and Node.js 18+.
2. Double-click `setup.bat` (once), then `start.bat`. The browser opens http://localhost:5173.
macOS/Linux: `./start.sh`.

## Try it
Upload `samples/sample_floorplan.dxf` -> keep `A-WALL` checked (leave `A-FURN` off) -> Detect rooms.
Regenerate the sample: `cd backend && python make_sample_dxf.py`.

## Features so far (Phases 1-4)
- DXF import (DWG needs ODA File Converter installed), layer picker, automatic room detection with gap closing
- Rooms: rename (double-click), type/colour, merge, split, delete, undo/redo, autosave, restore on reload
- Devices: 10 types, click-to-place or drag from palette, draggable zoom-stable icons, properties form,
  room derived from position, inventory table (search/filter), CSV/Excel import, CSV export
- Connectivity: Ports tab (24/48-port visual map, utilisation, connect/disconnect with cable type, auto length estimate, patch-panel mapping),
  Racks tab (rack elevations, U placement with overlap checks), Topology tab (Firewall > Core > Access > endpoints),
  cable lines on the floorplan (toggle), validation warnings in the top bar
- Shortcuts: Ctrl+Z / Ctrl+Shift+Z, Delete, Shift+click multi-select, Esc cancels tool

## Notes
- Data is stored in `backend/netplan.db` (SQLite). Set `DATABASE_URL` for PostgreSQL.
- Tables are created at startup (no Alembic migrations yet).
- Docs: `docs/ARCHITECTURE.md`. Links/racks are stored as one JSON document per floor (`NetworkState`). Next: Phase 5 (reports, export, roles, snapshots).
