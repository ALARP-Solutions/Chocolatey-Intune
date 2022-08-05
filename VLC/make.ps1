$package = "VLC"

$IntuneWinAppUtil_Path = (get-item $PSScriptRoot ).parent.FullName +  "\Microsoft-Win32-Content-Prep-Tool\IntuneWinAppUtil.exe"

Remove-Item ".\install.intunewin" -Force -ErrorAction Ignore

& $IntuneWinAppUtil_Path -c ".\build" -s ".\build\install.ps1" -o ".\"
Rename-Item -Path ".\install.intunewin" -NewName ".\$package.intunewin"