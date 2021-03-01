# Selected Events and Their Uses, from the .NET framework.

# Create a new event and add to Event Queue
New-Event -SourceIdentifier 'DCEvent01' -Sender 'Me' -MessageData 'Something went wrong!'
New-Event -SourceIdentifier 'DCEvent02' -Sender 'Me' -MessageData 'Something else happened!'

# View the event queue
Get-Event 
Get-Event -SourceIdentifier 'DCEvent01'

Remove-Event -SourceIdentifier 'DCEvent01' -WhatIf
Remove-Event -SourceIdentifier 'DCEvent01'

Remove-Event -SourceIdentifier *                        # Remove all

# Subscribing to events
Register-EngineEvent -SourceIdentifier 'DCEvent01' -Action {Write-Host "Event Raised"}

# Check which event subscriptions you have.
Get-EventSubscriber

New-Event -SourceIdentifier 'DCEvent01' -Sender 'Me' -MessageData 'See Me!'

Unregister-Event -SourceIdentifier 'DCEvent01'
Unregister-Event *


# .NET Framework Event
# Running processes and members 
Get-CimInstance -ClassName Win32_Process
Get-CimInstance -ClassName Win32_Process | Get-Member

# Start calc.exe
$calc = [System.Diagnostics.Process]::Start("calc.exe")
Register-ObjectEvent -InputObject $calc -EventName Exited -Action {cmd.exe /c ping -n 2 8.8.8.8}

# Example that watches for a new file/dir creation...
$testobj1 = New-Object -TypeName System.IO.FileSystemWatcher
$testobj1.Path = "D:\Temp"
Register-ObjectEvent -InputObject $testobj1 -EventName Created -Action { cmd.exe /c ping -n 2 8.8.8.8 }


# Example that watches for cmd.exe being exited
$conObj1 = [System.Diagnostics.Process]::Start("cmd.exe")
$conObj1 | Get-Member
Register-ObjectEvent -InputObject $conObj1 -EventName Exited -Action { cmd.exe /c ping -n 2 8.8.8.8 }

# Example using the EventLog
$eventLogObj = New-Object -TypeName System.Diagnostics.EventLog 
$eventLogObj.Log = "System"
Register-ObjectEvent -InputObject $eventLogObj -EventName EntryWritten -Action {Write-Host "I See You!"}


# WMI Query Language Example
$query = “Select * from Win32_Bios”
Get-WmiObject -Query $query

# WMI Events again could not work this out...
$query = "Select * From __InstanceCreationEvent WITHIN 5 WHERE targetinstance isa Win32_UserAccount"
Register-CimIndicationEvent -Query $query

