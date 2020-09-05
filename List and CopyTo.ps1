Clear-Host
E:

$Globals = Get-ChildItem -Include Global.asa -Recurse

foreach($f in $Globals) 
{    
    $p = $f.DirectoryName + "\" + $f.Name

    $t = $f.DirectoryName.Replace("E:\", "E:\Rubicon\")
    
    New-Item -Path $t -ItemType Directory -Force
    
    Copy-Item -Path $p -Destination $t -Force
}