if ($(Get-ScheduledTask -TaskPath "\ALARP Solutions\" -TaskName "Update Chocolatey Apps" -ErrorAction SilentlyContinue).TaskName -eq "Update Chocolatey Apps") {
    Unregister-ScheduledTask  -TaskPath "\ALARP Solutions\"  -TaskName "Update Chocolatey Apps" -Confirm:$False
}