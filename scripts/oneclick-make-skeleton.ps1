<#
  oneclick-make-skeleton.ps1
  Create a tiny, generic project skeleton in the given root folder.
  Usage:
    pwsh -NoProfile -ExecutionPolicy Bypass -File .\oneclick-make-skeleton.ps1 -Root 'C:\Projects\DemoApp' -Name 'DemoApp'
#>

param(
  [string]$Root = (Join-Path (Get-Location) 'Project'),
  [string]$Name = 'MyApp'
)

$dirs = @('src','docs','scripts','tests')
if (-not (Test-Path $Root)) { New-Item -ItemType Directory -Path $Root | Out-Null }
foreach ($d in $dirs) { New-Item -ItemType Directory -Path (Join-Path $Root $d) -Force | Out-Null }

$readme = @"
# $Name
Minimal project skeleton created by oneclick-make-skeleton.ps1

- \`src\\` — your code
- \`scripts\\` — helper scripts
- \`docs\\` — notes
- \`tests\\` — tests
"@

Set-Content -Path (Join-Path $Root 'README.md') -Value $readme -Encoding UTF8
Write-Host "✅ Created skeleton at: $Root" -ForegroundColor Green
