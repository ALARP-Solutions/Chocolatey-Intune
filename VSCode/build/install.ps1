$localprograms = choco list --localonly
if ($localprograms -like "*vscode*")
{
    choco upgrade vscode -y
}
Else
{
    choco install vscode -y --params "/NoDesktopIcon /DontAddToPath"
}