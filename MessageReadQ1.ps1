[Reflection.Assembly]::LoadWithPartialName("System.Messaging")

cls

$queueName = '.\Private$\transmq'
$queue = new-object System.Messaging.MessageQueue $queueName
$utf8  = new-object System.Text.UTF8Encoding

$msgs = $queue.GetAllMessages()
 
write-host "Number of messages=$($msgs.Length)" 

foreach ($msg in $msgs)
  {
      write-host $msg
      write-host $msg.BodyStream.ToArray()
      write-host $utf8.GetString($msg.BodyStream.ToArray())
  }