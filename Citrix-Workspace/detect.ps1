choco feature enable --name="'useEnhancedExitCodes'" -y
$PackageName = "citrix-workspace"
choco list -e $PackageName --local-only
exit $LastExitCode