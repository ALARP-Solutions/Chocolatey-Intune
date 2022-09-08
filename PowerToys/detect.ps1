choco feature enable --name="'useEnhancedExitCodes'" -y
$PackageName = "powertoys"
choco list -e $PackageName --local-only
exit $LastExitCode