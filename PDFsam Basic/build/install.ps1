$localprograms = choco list --localonly
if ($localprograms -like "*pdfsam*")
{
    choco upgrade pdfsam -y
}
Else
{
    choco install pdfsam -y
}

$dest = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"
if (Test-Path "$dest\PDFsam Basic\PDFsam Basic.lnk") {
    Copy-Item -Path "$dest\PDFsam Basic\PDFsam Basic.lnk" -Destination "$dest\PDFsam Basic.lnk"
    Remove-Item -LiteralPath "$dest\PDFsam Basic\" -Force -Recurse
}

# Remove Desktop Item 
$SCPath = "C:\Users\Public\Desktop\PDFsam Basic.lnk"
if (Test-Path $SCPath) {
    Remove-Item -LiteralPath $SCPath -Force
}