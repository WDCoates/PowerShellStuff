# Formatting Output
# Format-Table

Get-Help Format-Table

Get-Process | Where-Object {$_.ProcessName -eq "svchost"} 

Get-Process | Format-Table -Auto 
Get-Process | Format-Table -Auto ProcessName, Id, @{Label="HexId"; Expression={ "{0:x}" -f $_.Id};  Width=30; Alignment="Left"},pm

Get-Help Format-List
Get-Process | Format-List * 
Get-Process | Format-List * -Force


Get-Help Format-wide
Get-Process | Format-Wide -Auto
Get-Process | Format-Wide -Auto  @{Expression={ "{0:x}" -f $_.Id} }


Get-Process | Where-Object {$_.ProcessName -eq "svchost"} | Format-List *

# Defaults in files '*.Format.Ps1Xml' in the installation directory.
# Copy one modify and use 'Update-FormatData' add to profile script to load every time ps is started.

$formatFile = Join-Path (Split-Path $profile) "Format.Custom.Ps1Xml" Update-FormatData -PrependPath $typesFile
$formatFile

#####################################################################################################################################
# Capturing Output

# 1. In a $variable
$pList = Get-Process | Where-Object {$_.ProcessName -ne "svchost"}
$pList[0]

# 2. After beening converted !
$pList2 = Get-Process | Where-Object {$_.ProcessName -ne "svchost"} | Out-String
$pList2[0]

# 3. NativeCommand 
$pList3 = Dir -s *.ps1
$pList3[0]

# 4. > File, overwriting if exists
Get-Process | Where-Object {$_.ProcessName -ne "svchost"} > plist.txt
# 5. >> File, appending if exists
Get-Process | Where-Object {$_.ProcessName -eq "svchost"} >> plist.txt
# 6. n> File, n => 2 for error, 3 fr warning, 4 for verbose, 5 for debug and * from all

# 7. n>> File, n => 2 for error, 3

# 8. > File 2>&1,  both the error and standard output streams
# 9. >> File 2>&1,  both the error and standard output streams

