<# Examples:
    powershell.exe -File "Args.ps1" 123
    powershell.exe -File Args.ps1 123 Abc
#>

"Playing with args!"

Write-Host "Num Args:" $args.Length;
foreach ($arg in $args) {
    Write-Host "Arg: $arg";
}