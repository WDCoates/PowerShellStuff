clear-Host
Import-Module -Name  WebAdministration


Do {
    Write-Host "IIS wp and Sites"
    Get-IISAppPool

    Get-IISSite 
    $appcmd = "C:\\Windows\\System32\\inetsrv\\appcmd.exe"
    
    
    # appcmd list wp
    # appcmd list site
    
    $ent = Read-Host -Prompt "Refresh or type Exit to exit."

} Until($ent.ToUpper() -eq "EXIT")
