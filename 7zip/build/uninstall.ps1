choco uninstall 7zip.install -y

# Remove Desktop Item
$SCPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\7-Zip File Manager.lnk"
if (Test-Path $SCPath) {
    Remove-Item -LiteralPath $SCPath -Force
}

# $dest = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git"
# if (Test-Path $dest) {
#     Remove-Item -LiteralPath $dest -Force -Recurse
# }