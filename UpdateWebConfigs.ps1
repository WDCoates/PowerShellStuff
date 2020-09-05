Function UpdateDataSource([string]$webConfig){

$webConfig

$doc = (Get-Content $webConfig) -as [Xml]
$root=$doc.get_DocumentElement()

foreach ($connection in $root.connectionStrings.ChildNodes){
    
   $connection.connectionString = $connection.connectionString -replace "SegenDev;", "SegenDevD;"

}

$doc.Save($webConfig)

""
$root.connectionStrings.ChildNodes

"--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
""
}


clear-Host

UpdateDataSource("D:\Development\Segen\Trunk\SegenPortal.Mvc\SegenPortal.Mvc\Web.config");
UpdateDataSource("D:\Development\Segen\Trunk\SegenPortal.Mvc\BackOfficePortal\BackOfficePortal\BackOfficePortal\Web.config");
UpdateDataSource("D:\Development\Segen\Trunk\SegenPortal.Mvc\MvcCommonServices\Web.config");
UpdateDataSource("D:\Development\Segen\Trunk\SegenPortal.Mvc\SegenPortals.CustomerAPI\Web.config");
