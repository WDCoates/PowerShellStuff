[Reflection.Assembly]::LoadWithPartialName("System.Messaging")

Clear-Host
Get-MsmqQueue

$queueName = ".\private$\transmq_1"
[long]$message = 123456789
$label = [DateTime]::Now.ToShortTimeString()

$queue = new-object System.Messaging.MessageQueue $queueName
$utf8 = new-object System.Text.UTF8Encoding

$tran = new-object System.Messaging.MessageQueueTransaction
$tran.Begin()

$msgBytes = $utf8.GetBytes($message)

$msgStream = new-object System.IO.MemoryStream
$msgStream.Write($msgBytes, 0, $msgBytes.Length)

$msg = new-object System.Messaging.Message
$msg.BodyStream = $msgStream   

if ($label -ne $null)
{
    $msg.Label = $label
}

$queue.Send($msg, $tran)

$label = [DateTime]::Now.ToShortTimeString()
$msg.Label = $label
$msg.Body = [long]987654321

$queue.Send($msg, $tran)

$tran.Commit()

Write-Host "Message written - tran closed"
