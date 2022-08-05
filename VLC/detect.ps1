choco feature enable --name="'useEnhancedExitCodes'" -y
$PackageName = "VLC"
choco list -e $PackageName --local-only
exit $LastExitCode