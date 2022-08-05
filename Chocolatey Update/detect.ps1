$ProgramName = "Update Chocolatey Apps"
if(Test-Path "C:\Windows\System32\Tasks\ALARP Solutions\$ProgramName") {
    Write-Output "Exists"
    exit 0
} else {
    Write-Output "Doesn't Exist"
    exit 1
}