<#
    Re-set my sites when they get...
    Must run under x64 not x86 mode

    if([IntPtr]::size -eq 8) { Write-Host 'x64' } else { Write-Host 'x86' }
#>

function setPhysicalPath($site, $pP){
    $site
    $pP

    <# Can't quite get this to work passing in the params...

    $s = Get-Item "IIS:\Sites\devAdmin.segen.local\"
    $s | Set-ItemProperty -name physicalPath -value "D:\Development\DC"
    
    #>

}

clear-Host
Import-Module WebAdministration


Set-ItemProperty IIS:\Sites\devAdmin.segen.local\             -name physicalPath -value "C:\Development\Segen\Trunk\SegenPortal.Mvc\BackOfficePortal\BackOfficePortal\BackOfficePortal"
Set-ItemProperty IIS:\Sites\devApi.segen.local\               -name physicalPath -value "C:\Development\Segen\Trunk\SegenPortal.Mvc\SegenPortals.PublicAPI"
Set-ItemProperty IIS:\Sites\devCommonServices.segen.local\    -name physicalPath -value "C:\Development\Segen\Trunk\SegenPortal.Mvc\MvcCommonServices"
Set-ItemProperty IIS:\Sites\devCustomerAPI.segen.local\       -name physicalPath -value "C:\Development\Segen\Trunk\SegenPortal.Mvc\SegenPortals.CustomerAPI"
Set-ItemProperty IIS:\Sites\devPortal.segen.local\            -name physicalPath -value "C:\Development\Segen\Trunk\SegenPortal.Mvc\SegenPortal.Mvc"

Set-ItemProperty IIS:\Sites\masterAdmin.segen.local\          -name physicalPath -value "D:\Development\Segen\Trunk\SegenPortal.Mvc\BackOfficePortal\BackOfficePortal\BackOfficePortal"
Set-ItemProperty IIS:\Sites\masterCommonServices.segen.local\ -name physicalPath -value "D:\Development\Segen\Trunk\SegenPortal.Mvc\MvcCommonServices"
Set-ItemProperty IIS:\Sites\masterCustomerAPI.segen.local\    -name physicalPath -value "D:\Development\Segen\Trunk\SegenPortal.Mvc\SegenPortals.CustomerAPI"
Set-ItemProperty IIS:\Sites\masterPortal.segen.local\         -name physicalPath -value "D:\Development\Segen\Trunk\SegenPortal.Mvc\SegenPortal.Mvc"

<#
$site = "IIS:\Sites\devApi.segen.local"
$pP = "D:\Development\Segen\Repos\SegenPortal.Mvc\SegenPortals.PublicAPI"
setPhysicalPath($site, $pP)

$site = "IIS:\Sites\devCommonServices.segen.local"
$pP = "D:\Development\Segen\Repos\SegenPortal.Mvc\MvcCommonServices"
setPhysicalPath($site, $pP)
#>