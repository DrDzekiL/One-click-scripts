param(
    [int]$Days = 3,
    [switch]$Force
)

$cutoff = (Get-Date).AddDays(-$Days)

$targets = @(
    "$env:TEMP",
    "$env:LOCALAPPDATA\Temp",
    "$env:WINDIR\Temp"
) | Where-Object { Test-Path -LiteralPath $_ }

if (-not $targets) {
    Write-Host "No temp folders found." -ForegroundColor Yellow
    exit 0
}

Write-Host "Cutoff: $cutoff" -ForegroundColor Cyan
Write-Host ("Targets:`n - " + ($targets -join "`n - ")) -ForegroundColor Cyan

$items = foreach ($t in $targets) {
    Get-ChildItem -LiteralPath $t -Force -Recurse -ErrorAction SilentlyContinue |
        Where-Object { $_.LastWriteTime -lt $cutoff }
}

if (-not $items) {
    Write-Host "Nothing to delete (older than $Days days)." -ForegroundColor Green
    exit 0
}

if (-not $Force) {
    Write-Host "Dry-run. Use -Force to actually delete." -ForegroundColor Yellow
    $items | Select-Object FullName, LastWriteTime
    exit 0
}

$items | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
Write-Host "Done." -ForegroundColor Green
