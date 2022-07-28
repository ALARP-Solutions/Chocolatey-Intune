choco feature enable --name="'useEnhancedExitCodes'" -y
$PackageName = "git.install"
choco list -e $PackageName --local-only
exit $LastExitCode