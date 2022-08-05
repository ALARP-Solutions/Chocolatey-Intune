$localprograms = choco list --localonly
if ($localprograms -like "*vscode*")
{
    choco upgrade vscode -y
}
Else
{
    choco install vscode -y --params "/NoDesktopIcon /DontAddToPath"
}

# Remove Desktop Item 
$SCPath = "C:\Users\Public\Desktop\Visual Studio Code.lnk"
if (Test-Path $SCPath) {
    Remove-Item -LiteralPath $SCPath -Force
}