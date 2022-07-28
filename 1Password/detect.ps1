choco feature enable --name="'useEnhancedExitCodes'" -y
$PackageName = "1Password"
choco list -e $PackageName --local-only
exit $LastExitCode