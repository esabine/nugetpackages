try {
  if (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{5A77EC3E-6846-4C8D-A2D6-F09B0D5AED9C}") {
    Write-Host "SQL Sentry Plan Explorer is already installed! Adding to chocolatey database"
  }
  else {
    Install-ChocolateyPackage `
      'SQLSentryPlanExplorer' 'msi' '/quiet' `
      'http://downloads.sqlsentry.net/downloads/sqlsentryplanexplorer/x86/SQLSentryPlanExplorerSetup-x86.msi' `
      'http://downloads.sqlsentry.net/downloads/sqlsentryplanexplorer/x64/SQLSentryPlanExplorerSetup-x64.msi'  `
      -validExitCodes @(0)
  }
  Write-ChocolateySuccess $package
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw
}
