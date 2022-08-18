$localprograms = choco list --localonly
if ($localprograms -like "*7zip*")
{
    choco upgrade 7zip.install -y
}
Else
{
    choco install 7zip.install -y
}

$dest = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"
if (Test-Path "$dest\7-Zip\7-Zip File Manager.lnk") {
    Copy-Item -Path "$dest\7-Zip\7-Zip File Manager.lnk" -Destination "$dest\7-Zip File Manager.lnk"
    Remove-Item -LiteralPath "$dest\7-Zip" -Force -Recurse
}