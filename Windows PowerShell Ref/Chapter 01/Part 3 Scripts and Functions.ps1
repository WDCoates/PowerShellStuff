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
# 1. Argument Array using $args[n]
# 2. Formal parameters
#    param( [TypeName] $VariableName = Default,...)
# or
<#   [CmdletBinding(cmdlet behavior customizations)]
    param(
        [Parameter(Mandatory = $true, Position = 1, ...)]
        [Alias("MyParameterAlias"]
        [...]
        [TypeName] $VariableName = Default,
        ...
    )
#>

# Command name no spaces
$cur = Get-Location 
if ($cur.Path -notlike "*Chapter 01") {
    Set-Location "D:\Development\PowerShellStuff\Windows PowerShell Ref\Chapter 01"
}

.\Simple.ps1 -p Param1 A1
.\Simple.ps1 A1 A2

# Command behaviour customisations [CmdletBinding()]
# 1. SupportsShouldProcess = $true
# 2. DefaultParameterSetName = name
# 3. ConfirmImpact = "Low" "Medium" "High"

# Parameter attribute customizations [Parameter()]
# 1. Mandatory = $true
# 2. Position = n
# 3. ParameterSetName = name
# 4. ValueFromPipeline = $true
# 5. ValueFromPipelineByPropertyName = $true
# 6. ValueFromRemainingArguments = $true

# Parameter validation attributes 
# 1. [Alias(" name ")]
# 2. [AllowNull()] - required only for mandatory parameters
# 3. [AllowEmptyString()]
# 4. [AllowEmptyCollection()]
# 5. [ValidateCount(lower limit, upper limit)]
# 6. [ValidateLength(lower limit, upper limit)]
# 7. [ValidatePattern("regular expression ")]
# .....
# 11 [ValidateNotNull()]
# 12 [ValidateNotNullOrEmpty()]


# Pipeline Access to data through the input enumerator

foreach($e in $input) {
    "Input was: $e"
}

Set-Location "D:\Development\PowerShellStuff\Windows PowerShell Ref\"
$names = "Adam", "Bill", "Cat", "Dick"
$names | .\'Chapter 01'\PipelinePro.ps1
$names | .\'Chapter 01'\PipelineBPE.ps1

# Retrieving Output from Commands can also use the return command
$names | .\'Chapter 01'\PipelinePro.ps1 | .\'Chapter 01'\PipelineBPE.ps1

# Exit Statement
function exitTest([int] $strTest){
    Write-Host 'This first then...'
    if ($strTest -gt 1){
        exit $strTest
    }
    Write-Host 'Then this.'
}
exitTest 0;
$LastExitCode
$?
exitTest 1111;
$LastExitCode
$?


Get-Help about_automatic_variables
$$


# Functions with two parama
function twoParams {
    param($1, $2)
    begin{
        Write-Host $1, $2        
        $ret = @($1, $2)
    } 
    process{
        Write-Host $_ # for pipelining......
    }
    end{

        return $ret
    }
}

twoParams "ParOne" "ParTwo" | twoParams

# Managing Errors
# 1. nonterminating
#       PowerShell writes error to error output stream
Write-Error 
# or 
# WriteError() API # when writing a cmdlet

# $ErrorActionPreference
# Ignore, Silently Continue, Stop, Continuie (default), Inquire
function eTest ([int] $a){

    switch  ($a)  {
        1 {
            $ErrorActionPreference = "Ignore"
            #doSomeThinf -ErrorAction Ignore
            break
        }
        2 {
            $ErrorActionPreference = "Silently Continue"
            break         
        }     
        10 {
            throw "Error: 10010"
            break
        }   
        0 {
            $r0 = 1/0
            break
        }   
    }

    Write-Host $ErrorActionPreference
    Write-Host $r0
}

eTest(1)
eTest(2)

# 2. terminating with the throw message

eTest (10)


try
{
    eTest 0
}
catch [DivideByZeroException]
{
    Write-Host "Catch Top 1"
    $_
    Write-Host "Simple Error Caught so can continue!"
    $PSItem.Exception
    $PSItem.Exception.StackTrace
    Write-Host "Show Script Stack Trace"
    $PSItem.ScriptStackTrace
    Write-Host "Catch Bottom 1"
}
catch [System.IO.IOException]{
    Write-Host "Catch Top 2"
    $_
    Write-Host "Simple Error Caught so can continue!"
    $PSItem.Exception
    $PSItem.Exception.StackTrace
    Write-Host "Show Script Stack Trace"
    $PSItem.ScriptStackTrace
    Write-Host "Catch Bottom 2"
}


try
{
    eTest 0
}
catch [System.DivideByZeroException]
{
    Write-EventLog -LogName "Windows" -Source "Powershell" -EventId 10010 -Message "Divide By Zero Caught by me!"
}

# also with Powershell you can define trap
etest 0

function eTrap {

    eTest 0

    trap [System.DivideByZeroException]
    {
        eTest 0    
        # Keywords allowed 'continue' and 'break' break is default
        # continue # Not sure but this does not do what I think it says it should!
        write-host "Did we get here 0"
    }

    write-host "Did we get here 1"
}


eTrap