$directory = "$Env:ProgramData\ALARP Solutions\DefaultLockscreen"

Remove-Item "$directory\AS_Lockscreen*.jpg" -ErrorAction SilentlyContinue
Write-Output "Image File/s Deleted"

Remove-Item "$directory\*.cfg" -ErrorAction SilentlyContinue
Write-Output "Configuration File Deleted"


if (!(Test-Path -Path "$directory\*")) {
    Remove-Item -Path $directory -force -ErrorAction SilentlyContinue
    Write-Output "MDM Folder Deleted"
}

$parentdir = Split-Path -parent $directory
if (!(Test-Path -Path "$parentdir\*")) {
    Remove-Item -Path $parentdir -force -ErrorAction SilentlyContinue
    Write-Output "ALARP Solutions Folder Deleted"
}

$regkey = @(
    "HKLM:\\SOFTWARE\Policies\Microsoft\Windows\Personalization","LockScreenImage",
    "HKLM:\\SOFTWARE\Policies\Microsoft\Windows\Personalization","NoChangingLockScreen"
)

for ($i = 0; $i -lt $regkey.Length; $i = $i + 2) {
    Remove-ItemProperty -path $regkey[$i] -name $regkey[$i+1] -force -ErrorAction SilentlyContinue | Out-Null
    Write-Output "Registry Key Deleted"
}