$sourcePath = "C:\Users\wd_co\Pictures\Phone\Dave\DCIM\100ANDRO_Dups"
$doNotMatch = "\(\d+\)"

# Get files matching the pattern and print their names
Get-ChildItem -Path $sourcePath | Where-Object { $_.Name -notmatch $doNotMatch } | ForEach-Object {
    Write-Output $_.FullName
}


Get-ChildItem -Path $sourcePath | Where-Object { $_.Name -notmatch $doNotMatch } | ForEach-Object {
    $newName = $_.Name -replace ".jpg", "_1.jpg"  # Removes (number)
    Rename-Item -Path $_.FullName -NewName $newName #-WhatIf
    Write-Output "Renamed: $_.Name -> $newName"
}

