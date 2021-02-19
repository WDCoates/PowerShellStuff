# Selected WMI Classes
systeminfo.exe

$c1 = [Win32_BaseBoard]::new()
$c1

# PowerShell GetWmiObject Example
$bB = Get-WmiObject Win32_BaseBoard
$bB

Get-WmiObject Win32_ComputerSystem

Get-WmiObject Win32_Directory

Get-WmiObject Win32_Environment

Get-WmiObject Win32_LogonSession

Get-WmiObject Win32_OperatingSystem

Get-WmiObject Win32_StartupCommand

Get-WmiObject Win32_TimeZone

Get-WmiObject Win32_UserAccount 

# Full list very very long....
Get-EventLog -List