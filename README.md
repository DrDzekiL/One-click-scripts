# One‑click scripts (Windows • PowerShell)

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE)
[![PowerShell 7+](https://img.shields.io/badge/PowerShell-7%2B-5391FE?logo=powershell&logoColor=white)](/scripts)
[![Docs: EN](https://img.shields.io/badge/Docs-EN-black)](#)

**Purpose:** tiny, safe, and practical **one‑click** helpers for Windows.
All scripts have comments, sane defaults, and NO permanent system changes.

## Quick start
1. Download any script from `/scripts` (press **Raw** → Save As).
2. Run from terminal:
   ```powershell
   pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\oneclick-hello.ps1
   ```
   > `-ExecutionPolicy Bypass` applies to the **current process only**.
3. Read the header of each script for optional parameters.

## Scripts
- `oneclick-hello.ps1` — smoke test: prints environment info.
- `oneclick-make-skeleton.ps1` — create a small project skeleton (folders + README).
- `oneclick-python-venv.ps1` — create `.venv` and install `requests` (if Python is present).

## Contributing
Open a small and focused PR. English only. Keep scripts idempotent and side‑effect free.
