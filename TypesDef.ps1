Clear-Host

##[Reflection.Assembly]::LoadWithPartialName("System.Messaging")
##
## Get-MsmqQueue -Name ".\private$\transmq" | Send-MsmqQueue -AdminQueuePath ".\private$\admin" -Recoverable -Transactional
##

$Error1 = ""
$Error1.GetType()

$Error2 = @()
$Error2.GetType()

$Error3 = New-Object -TypeName "System.String"
$Error3.GetType()

$Error4 = New-Object -TypeName "System.Collections.ArrayList"
$Error4.GetType()


