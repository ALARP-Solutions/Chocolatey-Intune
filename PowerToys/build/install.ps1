$localprograms = choco list --localonly
if ($localprograms -like "*powertoys*")
{
    choco upgrade powertoys -y
}
Else
{
    choco install powertoys -y
}