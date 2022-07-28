$localprograms = choco list --localonly
if ($localprograms -like "*citrix-workspace*") {
    choco upgrade citrix-workspace -y
}
Else {
    choco install citrix-workspace -y
}