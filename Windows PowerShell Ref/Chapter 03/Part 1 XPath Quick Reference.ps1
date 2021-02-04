#  XPath is the standard way to interact with XML

# Select-Xml and Get-WinEvent Support XPath queries

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

$xml = [xml](Get-Content -Path '.\Windows PowerShell Ref\Chapter 04\AddressBook.xml')

Write-Host $xml
# / Represents the root

$xml | Select-Xml "/" 
$node 