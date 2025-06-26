$sourcePath = "C:\Users\wd_co\Pictures\Phone\Dave\DCIM\100ANDRO_Dups"
$filter = "*(2).jpg" # Searching for files with "(*)" in their name


# Get files matching the pattern and print their names
Get-ChildItem -Path $sourcePath -Filter $filter | ForEach-Object {
    Write-Output $_.FullName
}

Get-ChildItem -Path $sourcePath -Filter $filter | ForEach-Object {
    $newName = $_.Name -replace " \(\d+\)", ""  # Removes (number)
    $newPath = Join-Path $_.DirectoryName $newName
    Rename-Item -Path $_.FullName -NewName $newName
    Write-Output "Renamed: $_.Name -> $newName -> $newPath"
}

