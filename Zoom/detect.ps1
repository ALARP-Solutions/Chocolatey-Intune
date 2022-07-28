choco feature enable --name="'useEnhancedExitCodes'" -y
$PackageName = "zoom"
choco list -e $PackageName --local-only
exit $LastExitCode