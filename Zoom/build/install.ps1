$localprograms = choco list --localonly
if ($localprograms -like "*zoom*")
{
    choco upgrade zoom -y
}
Else
{
    choco install zoom -y
}