$sourcePath = "C:\Users\wd_co\Pictures\Phone\Dave\DCIM\100ANDRO"
$destinationPath = "C:\Users\wd_co\Pictures\Phone\Dave\DCIM\100ANDRO_Dups"
$filePattern = "*(1).jpg" # Searching for files with "(3)" in their name


# Get files matching the pattern and print their names
Get-ChildItem -Path $sourcePath -Filter $filePattern | ForEach-Object {
    Write-Output $_.FullName
}

# Ensure the destination folder exists
Write-Output $destinationPath
if (!(Test-Path $destinationPath)) {
    New-Item -ItemType Directory -Path $destinationPath -Force
}

Get-Acl $destinationPath | Format-List

# Get files matching the pattern and move them
Get-ChildItem -Path $sourcePath -Filter $filePattern | ForEach-Object {
    Move-Item -Path $_.FullName -Destination $destinationPath -Force
}

Write-Output "Matching files moved successfully."