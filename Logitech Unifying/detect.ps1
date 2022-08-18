choco feature enable --name="'useEnhancedExitCodes'" -y
$PackageName = "pdfsam"
choco list -e $PackageName --local-only
exit $LastExitCode