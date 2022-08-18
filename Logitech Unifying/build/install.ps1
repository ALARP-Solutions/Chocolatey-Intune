$localprograms = choco list --localonly
if ($localprograms -like "*unifying*")
{
    choco upgrade unifying -y
}
Else
{
    choco install unifying -y
}

# $dest = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"
# if (Test-Path "$dest\PDFsam Basic\PDFsam Basic.lnk") {
#     Copy-Item -Path "$dest\PDFsam Basic\PDFsam Basic.lnk" -Destination "$dest\PDFsam Basic.lnk"
#     Remove-Item -LiteralPath "$dest\PDFsam Basic\" -Force -Recurse
# }

# # Remove Desktop Item 
# $SCPath = "C:\Users\Public\Desktop\PDFsam Basic.lnk"
# if (Test-Path $SCPath) {
#     Remove-Item -LiteralPath $SCPath -Force
# }