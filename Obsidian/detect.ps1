choco feature enable --name="'useEnhancedExitCodes'" -y
$PackageName = "obsidian"
choco list -e $PackageName --local-only
exit $LastExitCode