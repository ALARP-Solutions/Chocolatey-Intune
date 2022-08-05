$localprograms = choco list --localonly
if ($localprograms -like "*obsidian*")
{
    choco upgrade obsidian -y
}
Else
{
    choco install obsidian -y
}