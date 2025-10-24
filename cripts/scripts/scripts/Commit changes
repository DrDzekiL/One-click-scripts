<#
  oneclick-hello.ps1
  Purpose: quick smoke test to confirm PowerShell is running and paths are OK.
  Safe: read-only, no system changes.
#>

$PSVersion = $PSVersionTable.PSVersion.ToString()
$User = [Environment]::UserName
$HostName = $env:COMPUTERNAME
Write-Host "✅ One-click: ready" -ForegroundColor Green
Write-Host "User: $User | Host: $HostName | PowerShell: $PSVersion"
Write-Host "PWD : $(Get-Location)"
