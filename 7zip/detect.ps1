choco feature enable --name="'useEnhancedExitCodes'" -y
$PackageName = "7zip.install"
choco list -e $PackageName --local-only
exit $LastExitCode