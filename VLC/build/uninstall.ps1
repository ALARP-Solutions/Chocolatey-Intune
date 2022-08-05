choco uninstall vlc -y
choco uninstall vlc.install -y

# Clean Up Shortcuts
$dest = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"
if (Test-Path "$dest\VLC media player.lnk") {
    Remove-Item -LiteralPath "$dest\VLC media player.lnk" -Force
}

# Remove Desktop Item 
$SCPath = "C:\Users\Public\Desktop\VLC media player.lnk"
if (Test-Path $SCPath) {
    Remove-Item -LiteralPath $SCPath -Force
}