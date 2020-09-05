$message = "Test Message"
$label = "Label"

$queue = new-object System.Messaging.MessageQueue ".\Private$\testmq"
$utf8 = new-object System.Text.UTF8Encoding

$msgBytes = $utf8.GetBytes($message)
$msgBytes

$msgStream = new-object System.IO.MemoryStream
$msgStream.Write($msgBytes, 0, $msgBytes.Length)

$msg = new-object System.Messaging.Message
$msg.BodyStream = $msgStream
$msg.Label = $label

$queue.Send($msg)


Clear-Host
$queue.Send("Test")