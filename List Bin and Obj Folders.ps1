Clear-Host

Set-Location D:\Development\Segen\Repos\SegenPortal.Mvc

$allBinAndObjFolders = Get-ChildItem -Directory -Recurse -Include "Bin", "Obj"
"All Bin and Obj Folders:----------------------------------------------"
foreach ($folder in $allBinAndObjFolders){
    $folder.FullName
}

$binObjFolders = Get-ChildItem -Directory -Depth 1 -Include "Bin", "Obj"
"Depth 1 Bin and Obj Folders shows the sane as above!------------------"
foreach ($folder in $binObjFolders){
    $folder.FullName
}

"Finished"