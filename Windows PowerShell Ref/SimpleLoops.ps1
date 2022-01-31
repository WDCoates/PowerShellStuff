# Under 'About Do' in the microsoft documentation...

Do {
    Write-Host "Testing....."

    $ent = Read-Host -Prompt "Refresh or type Exit to exit."

} Until($ent.ToUpper() -eq "EXIT")