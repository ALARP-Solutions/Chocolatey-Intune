Function Test-RegistryValue {
    param(
        [Alias("PSPath")]
        [Parameter(Position = 0, Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [String]$Path
        ,
        [Parameter(Position = 1, Mandatory = $true)]
        [String]$Name
        ,
        [Switch]$PassThru
    ) 

    process {
        if (Test-Path $Path) {
            $Key = Get-Item -LiteralPath $Path
            if ($null -ne $Key.GetValue($Name, $null)) {
                if ($PassThru) {
                    Get-ItemProperty $Path $Name
                }
                else {
                    $true
                }
            }
            else {
                $false
            }
        }
        else {
            $false
        }
    }
}

$directory = "$Env:ProgramData\ALARP Solutions"
$filename = "AS_Lockscreen"

$path = "HKLM:\\SOFTWARE\Policies\Microsoft\Windows\Personalization"

$key1 = "LockScreenImage"
$key2 = "NoChangingLockScreen"

$value1 = "*$filename*"
$value2 = "1"

$detected = @()


if ((Test-RegistryValue $path $key1 -PassThru).($key1) -like $value1) {
    Write-Output "Key '$($key1)' exists, and is set to $((Test-RegistryValue $path $key1 -PassThru).($key1))."
    $detected += $true
} else {
    $detected += $false
}

if ((Test-RegistryValue $path $key2 -PassThru).($key2) -eq $value2) {
    Write-Output "Key '$($key2)' exists, and is set to $($value2)."
    $detected += $true
} else {
    $detected += $false
}

if (test-path "$directory\$filename*") {
    if (!(test-path "$directory\$($filename)_ERROR.jpg")) {
        Write-Output "Lockscreen background image exists in the right folder."
        $detected += $true
    } else {
        $detected += $false
    }
} else {
    $detected += $false
}




if(!($detected -contains $false)) {
    Write-Output "Installed"
    exit 0
} else {
    Write-Output "Not Installed"
    exit 1
}