


#--- Get Screen Resolution ---
# if ("PInvoke" -as [type]) {} else {
# Add-Type @"
# using System;
# using System.Runtime.InteropServices;
# public class PInvoke {
#     [DllImport("user32.dll")] public static extern IntPtr GetDC(IntPtr hwnd);
#     [DllImport("gdi32.dll")] public static extern int GetDeviceCaps(IntPtr hdc, int nIndex);
# }
# "@
# }
# $hdc = [PInvoke]::GetDC([IntPtr]::Zero)
# $screenwidth = [PInvoke]::GetDeviceCaps($hdc, 118) # width
# $screenheight = [PInvoke]::GetDeviceCaps($hdc, 117) # height




# $width = ((Get-WmiObject -Class Win32_VideoController).CurrentHorizontalResolution)
# $height = ((Get-WmiObject -Class Win32_VideoController).CurrentVerticalResolution)
# $result = $width / $height
# echo $width
# echo $height
# echo $result

# Add-Type -AssemblyName System.Windows.Forms
# $size = ([System.Windows.Forms.Screen]::AllScreens | Where-Object Primary).Bounds.Size
# $screenratio = $size.Width / $size.Height
# $screenratio = [math]::Round($screenratio,3)

# if ($screenratio -eq [math]::Round(16/9,3)) {
#     $ar = "16x9"
# } elseif ($screenratio -eq [math]::Round(3/2,3)) {
#     $ar = "3x2"
# } else {
#     $ar = "ERROR"
# }
# $directory = "C:\MDM"
# $filename = "AS_Lockscreen_$ar.jpg"


$vc = Get-WmiObject -class "Win32_VideoController"
$screenwidth = $vc.CurrentHorizontalResolution
$screenheight = $vc.CurrentVerticalResolution

if ($screenwidth -eq 2496 -and $screenheight -eq 1664){
    $ar = "3x2"
} else {
    $ar = "16x9"
}

$directory = "C:\MDM"
$filename = "AS_Lockscreen_$ar.jpg"

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

        # Write-Output ($regkey.Length / 4)
        # Write-Output $regkey[$i + 1]
        # Write-Output $regkey[$i + 2]
        # Write-Output $regkey[$i + 3]

        Set-ItemProperty -path $regkey[$i] -name $regkey[$i+1] -value $regkey[$i+2] -type $regkey[$i+3] -force | Out-Null
    }
    exit 0
}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}