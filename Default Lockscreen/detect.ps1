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

$directory = "$Env:ProgramData\ALARP Solutions\DefaultLockscreen"
$filename = "AS_Lockscreen"
$DLVersion = "1.3"

$path = "HKLM:\\SOFTWARE\Policies\Microsoft\Windows\Personalization"

$key1 = "LockScreenImage"
$key2 = "NoChangingLockScreen"

$value1 = "*$filename*"
$value2 = "1"

$detected = @()

# Check Registry Settings 1
if ((Test-RegistryValue $path $key1 -PassThru).($key1) -like $value1) {
    Write-Output "Key '$($key1)' exists, and is set to $((Test-RegistryValue $path $key1 -PassThru).($key1))."
    $detected += $true
} else {
    $detected += $false
}

# Check Registry Settings 2
if ((Test-RegistryValue $path $key2 -PassThru).($key2) -eq $value2) {
    Write-Output "Key '$($key2)' exists, and is set to $($value2)."
    $detected += $true
} else {
    $detected += $false
}

#Check Image Exists
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

# Check Version
$cfg = "DefaultLockscreen.cfg"
if (test-path "$directory\$cfg") {
    $vers = Select-String -Path "$directory\$cfg" -Pattern 'Version: ' 
    if ($vers -like "*$DLVersion") {
        Write-Output "Version is $DLVersion"
        $detected += $true
    } else {
        Write-Output "Version does not match $DLVersion"
        $detected += $false
    }
} else {
    $detected += $false
}



if(!($detected -contains $false)) {
    Write-Output "Installed Correctly"
    exit 0
} else {
    Write-Output "Not Installed"
    exit 1
}