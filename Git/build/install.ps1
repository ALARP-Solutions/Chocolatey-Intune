$localprograms = choco list --localonly
if ($localprograms -like "*git*")
{
    choco upgrade git -y
}
Else
{
    choco install git.install -y --params "/GitAndUnixToolsOnPath /WindowsTerminal /NoAutoCrlf"
}

$dest = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git"
if (Test-Path $dest) {
    Remove-Item -LiteralPath $dest -Force -Recurse
}

exit 3010