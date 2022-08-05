choco uninstall git -y

$dest = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git"
if (Test-Path $dest) {
    Remove-Item -LiteralPath $dest -Force -Recurse
}