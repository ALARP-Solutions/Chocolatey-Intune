$localprograms = choco list --localonly
if ($localprograms -like "*zoom*")
{
    choco upgrade zoom -y
}
Else
{
    choco install zoom -y
}

# Remove Desktop Item 
$SCPath = "C:\Users\Public\Desktop\Zoom.lnk"
if (Test-Path $SCPath) {
    Remove-Item -LiteralPath $SCPath -Force
}