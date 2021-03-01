# As an extensibility and administration interface, many applications expose useful functionality through COM objects.

# ShellOpen.ps1 Opening Explorer using PowerShell
$ShellExp = New-Object -ComObject Shell.Application
$ShellExp.open("C:\")


# Excel but not on my box!
$excel = new-object -ComObject Excel.Application
$excel.visible = $true


# Firewall access
$fireWall = New-Object -ComObject HNetCfg.FwMgr
$fireWall

# Shell User This is not right yet!
$Shell = New-Object -ComObject Shell    #Also tried Shell.User
$Shell::User

$shellUser = New-Object -ComObject [Shell]::User
$shellUser


Write-Host "Press any key to continue..."
$key = [Console]::ReadKey('NoEcho')
$key

Write-Host "Press any key to continue..."
$key = [Console]::ReadKey()
# Windows Shell
$v = New-Object -ComObject WScript.Shell
$v.CurrentDirectory
