# Writing Scripts and Reusing Functionality

# Scripts are held in files with extension .ps1

<# Functions and Filters

    function SCOPE:name(parameters){
        statement block
    }

    filter SCOPE:name(parameters){
        statement block
    }

#>

<# Script Blocks

    $objRef = {
        statement block
    }

#>


# SCOPE: global, script, local, private

# $args $input

# call functions an scripts the same way i.e. $res = GetMyRes $p1 $p2

<# Standard layout as functions must be declared and available first

function Main {     
    (...)
    HelperFunction
    (...)
}

function HelperFunction { 
    (...)
}

. Main

#>

#Running Commands variables etc do not persist unless GLOBAL keyword used.

Get-Help about_signing
Get-ExecutionPolicy
Set-ExecutionPolicy RemoteSigned

# Command name no spaces
$cur = Get-Location 
if ($cur.Path -notlike "*Chapter 01") {
    Set-Location ".\Chapter 01"
}
.\Simple.ps1 "NoWay" YesWay

# With spaces
& "D:\Development\PowerShellStuff\Windows PowerShell Ref\Chapter 01\Simple.ps1" Parm1 Parm2
$localTest      # Not available when run this way.
$globalTest

# Script blocks
$sBlock = { "Hello World" }
& $sBlock

# From a Module
$module = Get-Module PowerShellCookbook
& $module Invoke-MyFunction parameter1 parameter2 ...
& $module $scriptBlock parameter1 parameter2 ...

# Dot-sourcing - runs the commands so results and var persists
# 

. "D:\Development\PowerShellStuff\Windows PowerShell Ref\Chapter 01\Simple.ps1"
$localTest      # Available as ran with Dot-sourcing
$globalTest

. '.\Chapter 01\Simple.ps1' One Two Three
$localTest     
$globalTest

# Parameters
Get-Command Get-Process -Syntax

Get-Process -Name ("Power" + "Shell")   #Note not case sensitive

Stop-Process -Id 1234
Stop-Process -Name "Process With Spaces"

$name = "Process With Spaces"
Stop-Process -N $name                   # -N is enough so no ambiguity

# Using a hashtable, not passible to our Simple.ps1 though!
$parmList = @{
    Path = "D:\Development"
    Recurse = $true
}

Get-ChildItem @parmList

# Default values for parameters
$PSDefaultParameterValues["Get-Process:ID"] = $pid
Get-Process

$PSDefaultParameterValues["Get-Service:Name"] = { Get-Service -Name * | ForEach-Object Name | Get-Random }
Get-Service

# Providing Input to Commands
# 1. Argument Array