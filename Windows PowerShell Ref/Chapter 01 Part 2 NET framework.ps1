# Static Methods
# [ClassName]::MethodName(parameter list)

[System.Diagnostics.Process]::GetCurrentProcess()
[System.Diagnostics.Process]::GetProcessById(0)

# Instance Methods
# $objectReference.MethodName(parameter list)

$curPro =           #[System.Diagnostics.Process]::GetCurrentProcess()
$curPro.Refresh()


$pro =          #[System.Diagnostics.Process]::GetProcessesByName("Teams")
$pro

# Explicitly Implemented Interface Methods
# ([Interface] $objectReference).MethodName(parameter list)

$t = ([IConvertible] 123).ToUint16($null)
$t

# Static Properties
# [ClassName]::PropertyName

[System.DateTime]::Now

# Instance Properties
# $objectReference.PropertyName

$now =          #[System.DateTime]::Now
$now.DayOfWeek


# Learning About Types
# Get-Member cmdlet

[System.DateTime] | Get-Member -Static
$now =          #[System.DateTime]::Now
$now | Get-Member -Static
$now | Get-Member

# Type Shortcuts

[Adsi]              #[System.DirectoryServices.DirectoryEntry]
[AdsiSearcher]      #[System.DirectoryServices.DirectorySearcher]
[Float]             #[System.Single]
[Hashtable]         #[System.Collections.Hashtable]
[Int]               #[System.Int32]
[IPAddress]         #[System.Net.IPAddress]
[Long]              #[System.Collections.Int64]
[PowerShell]        #[System.Management.Automation.PowerShell]
[PSCustomObject]    #[System.Management.Automation.PSObject]
[PSModuleInfo]      #[System.Management.Automation.PSModuleInfo]
[PSObject]          #[System.Management.Automation.PSObject]
[Ref]               #[System.Management.Automation.PSReference]
[Regex]             #[System.Text.RegularExpressions.Regex]
[Runspace]          #[System.Management.Automation.Runspaces.Runspace]
[RunspaceFactory]   #[System.Management.Automation.Runspaces.RunspaceFactory]
[ScriptBlock]       #[System.Management.Automation.ScriptBlock]
[Switch]            #[System.Management.Automation.SwitchParameter]
[Wmi]               #[System.Management.ManagementObject]
[WmiClass]          #[System.Management.ManagementClass]
[WmiSearcher]       #[System.Management.ManagementObjectSearcher]
[Xml]               #[System.Xml.XmlDocument]
[TypeName]          #[System.TypeName]

# Creating instances of Types
# $objectReference = New-Object TypeName parameters

$webClient = New-Object Net.WebClient
$webClient | Get-Member
$bbcHome = $webClient.DownloadString("http://www.bbc.co.uk").ToString()
$bbcHome.Length

# Generic Type enclose its type parameters in square brackets
[System.Collections.Generic.Dictionary[String, Bool]] | Get-Member 
$hashTable = New-Object "System.Collections.Generic.Dictionary[String, Bool]"
$hashTable["Test"] = $true
$hashTable

Get-TypeData | Where-Object {$_.TypeName -like "System.W*"}
Add-Type -AssemblyName System.Web                               

[Web.HttpUtility] | Get-Member 
[Web.HttpUtility] | Get-Member -Static

$EnCoded = [Web.HttpUtility]::UrlEncode("http://www.bing.com")
$Encoded | Out-GridView
[Web.HttpUtility]::UrlDecode($EnCoded) | Out-GridView

# COM Objects More in Chapter08.ps1
$shell = New-Object -ComObject Shell.Application
$shell.Windows() | Select-Object LocationName, LocationUrl

# Extending Types
# 1/2 Add-Member cmdlet

#AliasProperty

$ps1Object = [PsObject] "Test"
$ps1Object.Characters
$ps1Object | Add-Member "AliasProperty" Characters Length   # Length is already a Property
$ps1Object.Characters


#NoteProperty - A property defined by the initial value you provide.

    $testObj = [PsObject] "Test"
    $testObj | Add-Member NoteProperty Reversed tseT
    $testObj.Reversed

#ScriptProperty

    $testObj = [PsObject] ("Hi" * 20 )
    $testObj
    $testObj | Add-Member ScriptProperty IsLong  {
        $this.Length -gt 10
    }
    $testObj.IsLong

#PropertySet - Or Shortcut

    $testObj = [psobject] [datetime]::Now
    $collection = New-Object `Collections.ObjectModel.Collection``1[System.String]
    $collection.Add("Month")
    $collection.Add("Year")

    $testObj | Add-Member PropertySet MonthYear $collection
    $testObj | Select-Object MonthYear

#ScriptMethod

    $testObj = [psobject] "Boots"
    $testObj | Add-Member ScriptMethod IsLong {
        $this.Length -gt $args[0]
    }
    $testObj.IsLong(3)
    $testObj.IsLong(13)
    

#CodeProperty - A property defined by a System.Reflection.MethodInfo.
#CodeMethod - A property defined by a System.Reflection.MethodInfo.

#Custom type extension files - 
#   Copy types.ps1.xml from the install folder System32\WindowsPowerShell\v1.0
#   The following command loads Types.custom.ps1xml from the same directory as your profile:

    $typesFile = Join-Path (Split-Path $profile) "Types.Custom.Ps1Xml"
    Update-TypeData -PrependPath $typesFile