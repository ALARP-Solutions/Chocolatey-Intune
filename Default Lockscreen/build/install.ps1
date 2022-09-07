$directory = "$Env:ProgramData\ALARP Solutions"

## Shared Device Test
$devicename = $env:computername
$isSharedDesktop = $devicename -match "SD"

## Get Screen Size
$vc = Get-WmiObject -class "Win32_VideoController"
$screenwidth = $vc.CurrentHorizontalResolution
$screenheight = $vc.CurrentVerticalResolution

if ($screenwidth -eq 2496 -and $screenheight -eq 1664){
    $ar = "3x2"
} else {
    $ar = "16x9"
}

if ($isSharedDesktop) {
    $filename = "AS_Lockscreen_$($ar)_shared.jpg"
} else {
    $filename = "AS_Lockscreen_$ar.jpg"
}

If ((Test-Path -Path $directory) -eq $false)
{
	New-Item -Path $directory -ItemType directory | Out-Null
}

Copy-Item -Path "$PSScriptRoot\$filename" -Destination "$directory\$filename" -ErrorAction SilentlyContinue

$regkey = @(
    "HKLM:\\SOFTWARE\Policies\Microsoft\Windows\Personalization","LockScreenImage","$directory\$filename","String",
    "HKLM:\\SOFTWARE\Policies\Microsoft\Windows\Personalization","NoChangingLockScreen","1","DWord"
)

try {
    for ($i = 0; $i -lt $regkey.Length; $i = $i + 4) {
        
        
        IF(!(Test-Path $regkey[$i]))
        {
            New-Item -path $regkey[$i] -force | Out-Null
        }

        Set-ItemProperty -path $regkey[$i] -name $regkey[$i+1] -value $regkey[$i+2] -type $regkey[$i+3] -force | Out-Null
    }
    exit 0
}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}