choco feature enable --name="'useEnhancedExitCodes'" -y
$PackageName = "vscode"
choco list -e $PackageName --local-only
exit $LastExitCode