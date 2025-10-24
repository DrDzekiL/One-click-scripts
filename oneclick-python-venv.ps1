<#
  oneclick-python-venv.ps1
  Create a local Python venv in the current folder and install 'requests'.
  Requirements: python.exe in PATH.
#>

$python = (Get-Command python -ErrorAction SilentlyContinue)?.Source
if (-not $python) {
  Write-Host "⚠️ Python not found in PATH. Install Python 3.10+ and retry." -ForegroundColor Yellow
  exit 1
}

$venvDir = ".venv"
& $python -m venv $venvDir
$pip = Join-Path $venvDir "Scripts\pip.exe"
& $pip install --disable-pip-version-check -q requests
Write-Host "✅ Venv created: $venvDir (requests installed)" -ForegroundColor Green
