#Comments   

<# 
    This block gives users help with the Get-Help command... 
    The block must be followed by a blank line.
#>

<#
    .SYNOPSIS   
        Short description of whats it all about!

    .DESCRIPTION
        Chapter 01 Examples and little extra bits
    
    .EXAMPLE
    
    .INPUTS
    
    .OUTPUTS
    
    .NOTES
    
    .LINK https://docs.microsoft.com/en-us/powershell/scripting/developer/help/examples-of-comment-based-help?view=powershell-7

    ETC
    
#>

# This is a regular comment...

Get-Help about_Comment_Based_Help


<# Commands and Expressions #>
#Region Commands and Expressions

# Precedence Control: ()
5 * 1 + 2
5 * (1 + 2)

Set-Location C:\Windows
(Get-ChildItem).Count

# Expression subparse: $()
"What is (2+2)"
"The Answer is $(2+2)"

$test = 10
$res = $(if ($test -gt 0) { $true } else { $false } )
$res


# List evaluation: @()
"ThighHighBoots".Length
@("KneeHighBoots", "OTK Boots").Length

$Boots = @("KneeHighBoots", "OTK Boots")
$Boots.Length

(Get-ChildItem).Count
(Get-ChildItem *.exe).Count  # This will restrict the search to only *.exe files
@(Get-ChildItem *.exe).Count

$L = @(Get-ChildItem *.exe)
$L

# DATA evaluation: DATA {}
$D1 = DATA { 1 + 1 }
$D2 = DATA { 1 , 1 }
$D1
$D2

#EndRegion

#Region Variables

#Simple Variable
$ABC = "Variable names are not case-sensitive! But adding case does helps the spell checker"
$abc

#Multiple Variable Assignments
$var1, $var2 = "Number 1", "Number 2"
$var1 + " " + $var2

#An arbitrary variable name. ${}
${veryArb!#@`{} = "{ are escaped with '``'"
${veryArb!#@`{}

# Output to a file...
${D:\Log.txt} = "Did this actually work! Works with absolute path!"
${D:\Log.txt} += "`nCan We add to? Yes we can just not sure how to get new lines in without using the return key yet!`r!Carriage Return!"
$log = ${D:\Log.txt}
$log

#EndRegion

# New Line and carriage returns
$newLine = "1.This is line one.`n2.And this is line two?`r3.LineThree!!!"
$newLine

# Strongly typed 
[string] $strName = 123 / 12
$strName
$strName.GetType()
$strName += 1
$strName

[int] $strName = 123.1 / 3
$strName
$strName.GetType()
$strName += 1
$strName

$Number = Read-Host "Enter a number"
Write-Host "You entered $Number."

#Since V5 of PS
class Contact {
    [string]$First
    [string]$Last
    [string]$Phone
}

$C = [Contact]@{
    First = "Gordon"
    Last  = "Bennett"
    Phone = "+44 7766 666 123"
}

$C

class ContactWithCon {
    # Optionally, add attributes to prevent invalid values
    [ValidateNotNullOrEmpty()][string]$First
    [ValidateNotNullOrEmpty()][string]$Last
    [ValidateNotNullOrEmpty()][string]$Phone

    # optionally, have a constructor to 
    # force properties to be set:
    ContactWithCon($First, $Last, $Phone) {
        $this.First = $First
        $this.Last = $Last
        $this.Phone = $Phone
    }
}

$CWC = New-Object -TypeName ContactWithCon -ArgumentList("Dave", "Test")
Write-Host "Your Name is:$($CWC.Last). Yes or No?"

#Add Constraints
[ValidateLength(4, 10)] $a = "Yes Sir"
$a

#Scope but not sure how it works yet....
$Global:Version = "Test Version"
function test() {
    $local:LV = "L V 1.0"
    Write-Host "Here!"
    Write-Host "Version is $Version and $LV"
}

test
Write-Host "Version is $Version and $LV"

#Notes
<#
    New-Item Variable:\variable -Value value
    Get-Item Variable:\variable
    Get-Variable variable
    New-Variable variable -Option option -Value value
#>

#Booleans
[Boolean]$FTest = $false
$TTest = $true
$FTest.GetTypeCode()

$FTest
$TTest

$TTest -eq $FTest

#Strings
$literal = 'hello `t $ENV:SystemRoot'   #No Variables or escape expansion
$literal

$expanded = "hello `t $($ENV:SystemRoot). `""  #Variables and escape expansion the `b is backspace. `" or ""  and also `' or '' for single quoted strings
$expanded

#Multi-lInes
$multiLines = @"
`0 ``0 is Null 
Sometimes I just want...
Then again I just can't be bothered...
"@

Write-Host $multiLines

#Region Numbers
$myInt = 1001
$myInt.GetTypeCode()
$myDouble = 123.4567
$myDouble.GetTypeCode()
$myShort = [int16] 9999 #with a cast...
$myShort.GetTypeCode()
$myLong = 2147483648L   #using the L long D decimal suffixes
$myLong.GetTypeCode()
$myDec = 0.123456789D
$myDec.GetTypeCode()
$pi = 3141592653e-9     #scientific notation
$pi.GetTypeCode()

$psConstants = (1GB + 250mb) / 120kb / 60
$psConstants
1GB -eq 1gb #=> True

# Hexadecimal and Other Number Bases
$myHexNo = 0xFFe1
$myHexNo
$myBinary = [Convert]::ToInt32("101101010101", 2)
$myBinary
$myHexString = [Convert]::ToString(65098, 16)
$myHexString

# Large Numbers
[BigInt]::Pow(123456, 123)

# Imaginary and Complex Numbers
[System.Numerics.Complex]::ImaginaryOne * [System.Numerics.Complex]::ImaginaryOne | Format-List

#Real : -1
#Imaginary : 0
#Magnitude : 1
#Phase : 3.14159265358979

#EndRegion

#Region Arrays amd Lists
$emptyArray = @()

$mixedArray = 0, "A", 2, "B", 4, "C", 6, "D"

$singleArray = , "Welcome"

$expSyntax = @("Using the more expressive syntax", "Interesting")

# Strongly Typed Arrays
[int[]] $intA2 = 1, "A", 3, "E"    #This will produce an error
[int[]] $intA2 = 1, 2.5, 3, 4.6    #This round the decimal numbers



$emptyArray
$mixedArray
$singleArray.GetType()
$expSyntax
$intA2[2]


$jaggedArray = @(( 1, 2, 3, 4),
    ("A", "B", "C"))
$jaggedArray
$jaggedArray[0][0]
$jaggedArray[1][0]
$jaggedArray[0][3]
$jaggedArray[1][3]

$multiDimArray = New-Object "Int32[,]" 2, 4
$multiDimArray.GetType()

# -1 index access the last element of an array wow
$res = $mixedArray[-1]
$res

$range = $mixedArray[0..3]
$range
$rangeA = $mixedArray[-1..3]
$rangeA
$rangeRev = $mixedArray[-1..-3]
$rangeRev

# Array Slicing
$mixedArray[0, 2, 4, 6]

$mixedArray[0, 2 + 4..6]
$mixedArray[, 0 + 2..3 + 0, 0]

$mixedArray[+2..3 + 0]

#This syntax cam also be used to create arrays
$exArrayX = , 0 + 10..20
$exArrayX[1]    # => 10

#Hashtable or Associative Arrays
# @{}  Different from the @()
# Key Value Pairs pw assumes keys are strings.

$hashtable1 = @{ Key1 = "Value1"; "Key 2" = 1, 2, 3; 3.14 = "Pi" }
$hashtable1     # Order changed

# retain insertion order
$unorderedHashtable = @{Crotch = 0; Thigh = 1; Knee = 2; "Over The Knee" = 3 }
$unorderedHashtable += @{Test = 11 }
$unorderedHashtable

$insertOrder = [Ordered] @{Crotch = 0; Thigh = 1; "Over The Knee" = 2; Knee = 3 }
$insertOrder["Ankle"] = 4
$insertOrder.PVC = 5
$insertOrder."High Heeled" = 6
$insertOrder.Crotch = 10
$insertOrder

# access methods
$insertOrder["Knee"]
$insertOrder.Knee

#EndRegion

#Region XML

$firstXML = [XML] @"
<AddressBook>
    <Person contactType="Personal">
        <Name>Lee</Name>
        <Phone type="home">555-1212</Phone>
        <Phone type="work">555-1213</Phone>
    </Person>
    <Person contactType="Business">
        <Name>Ariel</Name>
        <Phone>555-1234</Phone>
    </Person>
</AddressBook>
"@

$firstXML.AddressBook
$firstXML.AddressBook.Person
$firstXML.AddressBook.Person[0].ContactType
$firstXML.AddressBook.Person[0].Phone
$firstXML.AddressBook.Person[0].Phone[1]

#EndRegion

#Region Simple Operators
# Arithmetic Operators
[Math]::Pi
[Math]::E
[Math]::Max([Math]::E, [Math]::PI)
[Math]::Pow(-1, 1024)

# + works with numbers, strings, arrays and hashtables (op_Addition)
# - works with numbers (op_Subtraction)
# * works with numbers, strings and arrays  ((op_Multiply)
">" * 100
$mArray = (1..3 * 10)
$mArray.Count           # A count of 30
# / works with numbers (op_Division)
# % modulus returns the remainder, works with numbers (op_Modulus)

# all work with short form $r operator= value e.g. $res += 10

# Logical Operators
# -and, -or, -xor, -not !,  

# Binary Operators work Bit by Bit
# -band Binary AND, -bor, -bxor, -bnot, -shl, -shr
$b1 = "100011001"   #This is a string not a number beware
$b2 = "100000001"
$int1 = [Convert]::ToInt32($b1, 2)
$int2 = [Convert]::ToInt32($b2, 2)
[Convert]::ToString($int1 -band $int2, 2)

$int101 = 101
[Convert]::ToString($int101, 2)
$shl04 = $int101 -shl 4
[Convert]::ToString($shl04, 2)

# Other Operators
# -replace, -ireplace case-insensitive -creplace case-sensitive
("Well Hello world" -replace "(e)",'3') -creplace "W", 'UU' 
"Hello World" -ireplace "(.*) (.*)",'$2 $1'

# -f format operator see .NET String.Format
"{0:n0}" -f 1000000.00
"{0:c2}" -f 1000.1234
"{0,6:d} {1,10}" -f [DateTime]::Now, 10
"{0,6:d} {1,10:t}" -f [DateTime]::Now, [DateTime]::Now

# -as type conversion
(3/2) -eq (3/2 -as [int])

$hello = "Hello" -as [int32]
$null -eq $hello
$null.Length -eq $hello.Length

# -split  based on whitespace (\s+) and trims
-split "This is a sentence of x words   "
"1,2:3,4:5,10:,:12,123" -split "[,:]",  6
"1a2B3c4D5EE6" -split "[a-z]+", 0, "IgnoreCase"

# -join Combines items into single string
-join ("1234", 5678, "9ABCD")
("1234", 5678, "9ABCD") -join "-"   # With Delimiter

#EndRegion

#Region Comparison Operators
# -eq -ne -ge -gt -le -lt -in -notin -like -notlike -match -notmatch -contains -notcontains -is -isnot; can also add c or i after - for Case-Sensitive or Ignore Case e.g. -ceq
$list = 1,2,3,4,5,6,7
6 -in $list    #True
9 -in $list    #False
 
"Development" -like "[A-Z]e?[tr]" #False
"Development" -like "[Dev|Te]*" #True
"Test" -like "[Dev|Te]*" #True
"Production" -like "[Dev|Te]*" #False

"Hello World" -match "(.*) (.*)"    #True
$Matches
$Matches[2] -eq "World" #True

$list -contains 6 #True
$list -contains 9 #False

$list.GetType()
$list -is [System.Array]

#EndRegion

#Region Conditional Statements
# if, elseif and else. {} always required
$answer = Read-Host -Prompt "Red or White"
$answer
if ($answer -ceq "Red" -or $answer -ceq "red") {
    Write-Host "You want Red."
} elseif  ($answer -eq "white") {
    Write-Host "You want White"
} else {
    Write-Host "You want Pink!"
}


#switch has options for -c -e -r -w -casesensitive -exact -regex -wildcard; break and continue are also allowed
$answer = Read-Host -Prompt "Red or White"
$answer

switch -c ($answer) {
    "Red" {
        Write-Host "You want Red."
        break
    }
    "White" {
        Write-Host "You want White."
        $sure = Read-Host -Prompt "Yes/No"
        if ($sure -eq "No"){
            continue}
        $_.Length
    }
    {$_.Length -gt 3} {
        Write-Host "You Sure want White."
    }
    default {
        Write-Host "None selected check your case."
    }
}
#EndRegion

#Region Looping Statements
# for
# :label for (init; condition; increment) {}
:simple 
for ($i = 0; $i -lt 10; $i++){
    Write-Host "Loop count is: $i"
}

# foreach
$aName = "Ann", "Bee", "Chrissie", "Dave"
foreach($name in $aName){
    Write-Host "Name: $name"
}

$myHash = @{1=0;2=0;3=0}

foreach($key in $($myHash.keys)){
    $myHash[$key] = Get-Random -Maximum 10
}
$myHash

# while
$com = "";
while($com -notmatch "Y")
{
    $com = Read-Host "Quite Y/N?"
}

# do while / do until
$com = "";
do
{
    $com = Read-Host "Quite Y/N?"
}
while($com -notmatch "Y")

$com = "";
do
{
    $com = Read-Host "Quite Y/N?"
}
until($com -match "Y")

# break or break loop_label

for ($counter = 0; $counter -lt 4; $counter++) {
    for ($counter2 = 0; $counter2 -lt 4; $counter2++) {
        if ($counter2 -eq 2) {
            break
        }
        Write-Host "Processing item $counter,$counter2"
    }
}

:outer_loop 
for ($counter = 0; $counter -lt 4; $counter++) {
    for ($counter2 = 0; $counter2 -lt 4; $counter2++) {
        if ($counter2 -eq 2) {
            break outer_loop
        }
        Write-Host "Processing item $counter,$counter2"
    }
}

# continue skips execution of the rest of the current block
for ($counter = 0; $counter -lt 4; $counter++) {
    for ($counter2 = 0; $counter2 -lt 4; $counter2++) {
        if ($counter2 -eq 2) {
            continue
        }
        Write-Host "Processing item $counter,$counter2"
    }
}

:outer_loop 
for ($counter = 0; $counter -lt 4; $counter++) {
    for ($counter2 = 0; $counter2 -lt 4; $counter2++) {
        if ($counter2 -eq 2) {
            continue outer_loop
        }
        Write-Host "Processing item $counter,$counter2"
    }
}

# :labels can be anywhere in the code so beware!

#EndRegion

#Region Workflow-Specific
# Supported InLineScript, Parallel, Sequence and foreach -parallel

workflow FirstInLine_WF{

    #[Math]::Sqrt(100)

    InlineScript{
        [Math]::Sqrt(100)
    }
    
}

FirstInLine_WF

# Parallel/Sequence

workflow FirstParallel_WF {

    Parallel{
        InlineScript {Start-Sleep -Seconds 2; "One thing run in parallel"}
        InlineScript {Start-Sleep -Seconds 6; "Second thing run in parallel"}
        inlineScript {Start-Sleep -Seconds 4; "Third thing run in parallel"}
    }
}

FirstParallel_WF

workflow FirstSequence_WF {
    Parallel {

        InlineScript {Start-Sleep -Seconds 4; "One thing run in parallel"}

        Sequence {
            Start-Sleep -Seconds 1; "A Sequence Step 1, must be on a new line or preceded by ';'"
            "Step 2 happeneing here!"
        }
    }
}

FirstSequence_WF


# foreach -parallel

workflow FirstForEach_WF{
    $items = @{1="1";2="2";3="3";4="4";5="5";6="6";7="7";8="8";9="9";10="A";11="B";12="C";}
    
    ForEach -parallel ($k in $items){
        $sleep = Get-Random -Max 10
        Start-Sleep -seconds $sleep

        Write-Progress $_.
    }

}

FirstForEach_WF

# TODO:Work out how to update the values in a parallel foreach...

# This does not quite work!
workflow PassParam_WF {
    param ([Parameter(Mandatory=$True)] [Int]$test
    )
    $test
    
    Parallel{
        InlineScript {Write-Host "You entered something but can't quite see it! " $USING:test}

        "This was fun! $test"
    }
}

PassParam_WF 1234

#EndRegion