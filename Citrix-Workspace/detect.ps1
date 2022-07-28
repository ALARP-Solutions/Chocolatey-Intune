choco feature enable --name="'useEnhancedExitCodes'" -y
$PackageName = "citrix-workspace"
choco list -e $PackageName -l

if (-not $LastExitCode -eq 0) {
    if (Test-Path "C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe") {   
        exit 0
    }
}

exit $LastExitCode