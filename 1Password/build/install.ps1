$localprograms = choco list --localonly
if ($localprograms -like "*1password*")
{
    choco upgrade 1password -y
}
Else
{
    choco install 1password -y
}