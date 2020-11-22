# gmo => Get-Module
Get-Module PackageManagement -ListAvailable

Get-Module

#Version Stuff
Get-Host | Select-Object
$PSVersionTable


[System.Reflection.Assembly]::GetExecutingAssembly().ImageRuntimeVersion

([AppDomain]::CurrentDomain.GetAssemblies() | ? { $_.GetName().Name -eq "mscorlib" }).GetName().Version

[Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory()

#Fixed Constant Objects and verbs
$Host

$Null

# Profile Path
$profile

$env:USERPROFILE

$Env:PUBLIC

$Env:HOMEDRIVE

$Env:HOMEPATH



New-PSDrive -Name HKCR -PSProvider 'Microsoft.PowerShell.Core\Registry' -Root HKEY_CLASSES_ROOT
Get-ItemProperty -Path 'HKCR:\Installer\Assemblies\Global' | Get-Member -MemberType NotePropertySort 

#Region => Loaded Assemblies
$obj = @()

[System.AppDomain]::CurrentDomain.GetAssemblies() | Where-Object location | ForEach-Object FullN*  | ForEach-Object {

$temp = $_ -split ','

$props = [ordered]@{

name =$temp[0]

version =($temp[1] -split "=")[1]

Culture =($temp[2] -split "=")[1]

PublicKeyToken=($temp[3] -split "=")[1]

}

$obj += New-Object PsObject -Property  $props

}

$obj | Sort-Object Name | Out-GridView

# Or 
[System.AppDomain]::CurrentDomain.GetAssemblies() |  Where-Object Location |  Sort-Object -Property FullName |
  Select-Object -Property Name, Location, Version |  Out-GridView

#EndRegian 
# Url Encoding
[Web.HttpUtility]::UrlEncode("http://www.bing.com")

# You will need to install RSAT (Remote Server Admin Tools)
Get-ADGroupMember 