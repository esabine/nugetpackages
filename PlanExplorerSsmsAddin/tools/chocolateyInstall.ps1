$packageName    = 'PlanExplorerSsmsAddin'
$installerType  = 'MSI'
$url            = 'http://downloads.sqlsentry.net/downloads/sqlsentryplanexplorer/SQLSentryPlanExplorerSSMSAddinSetup.msi'
$url64          = $url
$silentArgs     = '/quiet'
$validExitCodes = @(0)
if(((test-path "hkcu:\SOFTWARE\Microsoft\Microsoft SQL Server\90\Tools\Shell\FontAndColors\" <#ssms 2005#>) -or 
   (test-path "hkcu:\SOFTWARE\Microsoft\Microsoft SQL Server\100\Tools\Shell\FontAndColors\" <#ssms 2008#>)) -or
   (test-path "hkcu:\Software\Microsoft\SQL Server Management Studio\11.0\FontAndColors\" <#ssms 2012#>)) { 
        Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes 
}
else {
   Write-Host "You need to install SQL Server Management Studio first. If you have it, please report this bug." 
}