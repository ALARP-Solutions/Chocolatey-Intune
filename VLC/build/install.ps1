$localprograms = choco list --localonly
if ($localprograms -like "*vlc*") {
    choco upgrade vlc -y
}
Else {
    choco install vlc -y
}

$dest = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"
if (Test-Path "$dest\VideoLAN\VLC media player.lnk") {
    Copy-Item -Path "$dest\VideoLAN\VLC media player.lnk" -Destination "$dest\VLC media player.lnk"
    Remove-Item -LiteralPath "$dest\VideoLAN" -Force -Recurse
}


# Remove Desktop Item 
$SCPath = "C:\Users\Public\Desktop\VLC media player.lnk"
if (Test-Path $SCPath) {
    Remove-Item -LiteralPath $SCPath -Force
}