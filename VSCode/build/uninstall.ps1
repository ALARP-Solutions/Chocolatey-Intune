choco uninstall vscode -y

# Remove Desktop Item 
$SCPath = "C:\Users\Public\Desktop\Visual Studio Code.lnk"
if (Test-Path $SCPath) {
    Remove-Item -LiteralPath $SCPath -Force
}