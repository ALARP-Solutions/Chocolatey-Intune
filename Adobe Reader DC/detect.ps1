choco feature enable --name="'useEnhancedExitCodes'" -y
$PackageName = "adobereader"
choco list -e $PackageName --local-only
exit $LastExitCode