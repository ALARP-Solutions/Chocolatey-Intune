choco uninstall zoom -y

# Remove Desktop Item 
$SCPath = "C:\Users\Public\Desktop\Zoom.lnk"
if (Test-Path $SCPath) {
    Remove-Item -LiteralPath $SCPath -Force
}