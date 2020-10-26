# Basics
Clear-Host

#What Versions 
Get-Host | Select-Object
$PSVersionTable

function prompt {"PS >"}  #PromptChanged

# Pushd => Push-Location
Push-Location .

# Cd => Set-Location
d:
Set-Location .\Development\PowerShellScripts
# Dir => Get-ChildItem
Get-ChildItem *.* -Recurse

# popd => Pop-Location
Pop-Location

# pwd => Get-Location
Get-Location

ipconfig

# gps => Get-Process
Get-Process -n lsass
Get-Process A*

# .Length
"Hello boots".Length

notepad
$Np = Get-Process -n Notepad
$Np.Kill() #This will stop the process

#PS knows about GB and MB but not Mb
10GB / 100MB
10GB / 100MB

#Date and Time things
[DateTime]::Today
"The year 1900, Leapyear true or false? " + [DateTime]::IsLeapYear(1900)
"The year 2000, Leapyear true or false? " + [DateTime]::IsLeapYear(2000)

$NewDate = [DateTime] "2020/12/31" 
$NewDate
$DateDiff = $NewDate - [DateTime]::Now
$DateDiff

#Composable Commands
#CommandA | CommandB

Get-Process | Where-Object {$_.Handles -ge 500} | Sort-Object Handles | Format-Table Handles, Name, Description -AutoSize

#Standard Methods - Get Set Start Stop Kill

D:
Set-Location D:\Downloads
Get-Item *.* | Copy-Item -Destination D:\Temp\ -Confirm -WhatIf
Get-ChildItem D:\Temp\*.* -Recurse

#Common Discovery Commands
Get-Command -CommandType Alias
Get-Command *File*

Get-Help Debug-FileShare

"Hello Boots" | Get-Member

#Ubiquitous Scripting
#No distinction between command line and scripting files....
$HCount = 0
foreach($p in Get-Process) {$HCount += $p.Handles}
$HCount

$HCount = 0
foreach($p in Get-Process | Where-Object {$_.Handles -ge 500}) {$HCount += $p.Handles}
$HCount

#Working with .NET Framework
$WebC = New-Object System.Net.WebClient
$Content = $WebC.DownloadString("https://www.google.com/search?q=thigh+high+boots&newwindow=1&client=firefox-b-d&sxsrf=ALeKk01zw5bNsqowCY7FFrYpHvXzFShenQ:1597736481588&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjV2reboKTrAhURUxUIHQCkBrIQ_AUoAnoECA0QBA&biw=1920&bih=978")
$Content.Substring(0, 10000)

#Ad-Hoc development
Get-History | ForEach-Object {$_.CommandLine} > D:\Temp\AdHocDev20200818.ps1
#This saves History so can be edited
notepad D:\Temp\AdHocDev20200818.ps1
#Then run with PS >D:\Temp\AdHocDev20200818.ps1


#Bridging Technologies
#XML
$Xcon = [XML] "<note><to>Love</to><from>Jani</from><heading>Reminder</heading><body>Don't forget me this weekend!</body></note>"
$XCon.InnerXml
$XCon.FirstChild
$XCon.FirstChild.Item("body")
$XCon.FirstChild | Select-Object body

#WMI
Get-WmiObject -List
Get-WmiObject Win32_Bios
$OS = Get-WmiObject Win32_OperatingSystem
$OS.PSComputerName
$OS.BootDevice


#Active Dir Service Interfaces (ADSI)
[ADSI] "WinNT://./Administrator" | Format-List *


#Com Objects
$fWall = New-Object -ComObject HNetCfg.FwMgr
$fWall.LocalPolicy.CurrentProfile

#Namespace Navigation Through Providers

Set-Location D:\
Get-ChildItem

#Setting location within the registry 
Set-Location HKCU:\Software\Microsoft\Windows\
Get-Location
Get-ChildItem

Set-Location CurrentVersion\Run
Get-ItemProperty .

# Navigating to the certificate store
Set-Location Cert:\
Get-ChildItem
Set-Location Cert:\CurrentUser\
Get-ChildItem
Set-Location Cert:\LocalMachine
Get-ChildItem

Set-Location Cert:\CurrentUser\Root
Get-ChildItem

Get-ChildItem Env:

Set-Location Env:

Get-ChildItem Env:\COMPUTERNAME

$WinDir = Get-Content Env:windir
$WinDir

Set-Location $WinDir

#Note PowerShell rounds 
(3/2)       #=> 1.5
[int](3/2)  #=> 2