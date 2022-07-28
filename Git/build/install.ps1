$localprograms = choco list --localonly
if ($localprograms -like "*git*")
{
    choco upgrade git -y
}
Else
{
    choco install git.install -y --params "/GitAndUnixToolsOnPath /WindowsTerminal /NoAutoCrlf"
}

exit 3010