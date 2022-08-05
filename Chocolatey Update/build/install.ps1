# $PackageName = "choco-upgrade"

$Path_ALARPIntune = "$Env:Programfiles\ALARPSolutions\EndpointManager"

Start-Transcript -Path "$Path_ALARPIntune\Log\UpdateChocolateyApps.log" -Force

Register-ScheduledTask -xml (Get-Content "$PSScriptRoot\Update Chocolatey Apps.xml" | Out-String) -TaskName "Update Chocolatey Apps" -TaskPath "\ALARP Solutions\" -Force

Stop-Transcript