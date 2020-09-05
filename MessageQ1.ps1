CLEAR-HOST

$Test = "This is a Test"
$Test
$Test.Length

$MQs = Get-MsmqQueue
$MQs

$MQ = Get-MsmqQueue -Name "FormatName:DIRECT=OS:desktop-9sr386h\private$\testmq" 
$MQ 


Get-MsmqQueue -Name "FormatName:DIRECT=OS:desktop-9sr386h\private$\testmq_trans" | Send-MsmqQueue -AdminQueuePath ".\private$\testmq_trans" -Recoverable -Transactional
Get-MsmqQueue -Name "FormatName:DIRECT=OS:desktop-9sr386h\private$\transmq" | Send-MsmqQueue -Label "From PowerShell" -Transactional

# Get all message queues
Get-MsmqQueue;

# Get all the private message queues.
# Display only the QueueName and MessageCount for each queue.
Get-MsmqQueue -QueueType Private | Format-Table -Property QueueName,MessageCount;


Test-Path -Path "C:/boot"



## $queue = new-object System.Messaging.MessageQueue $queueName
$MQ = Get-MsmqQueue -Name ".\private$\testmq" 

$utf8 = new-object System.Text.UTF8Encoding
$msgBytes = $utf8.GetBytes("Test Message")
$msgBytes

$msgStream = new-object System.IO.MemoryStream
$msgStream.Write($msgBytes, 0, $msgBytes.Length)

$msg = new-object System.Messaging.Message
$msg.BodyStream = $msgStream
$msg.Label = "Test Label"

$MQ.Send($msg)