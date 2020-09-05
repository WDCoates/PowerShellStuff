[Reflection.Assembly]::LoadWithPartialName("System.Messaging")

function WriteMessageToMSMQTrans($queueName, $message, $label)
  {
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

     $tran.Commit()
     Write-Host "Message written - tran closed"
  }

function WriteMessageToMSMQNonTrans($queueName, $message, $label)
  {
     $queue = new-object System.Messaging.MessageQueue $queueName
     $utf8 = new-object System.Text.UTF8Encoding

     $msgBytes = $utf8.GetBytes($message)

     $msgStream = new-object System.IO.MemoryStream
     $msgStream.Write($msgBytes, 0, $msgBytes.Length)

     $msg = new-object System.Messaging.Message
     $msg.BodyStream = $msgStream
     if ($label -ne $null)
       {
         $msg.Label = $label
       }
     $queue.Send($msg)

    Write-Host "Message written"
  }

#-------------------------
#Test the above functions 
#-------------------------
cls  #clear screen (junk from prior runs) 
$queueName = ".\Private$\testmq"
$message = "This is my first test message"
WriteMessageToMSMQNonTrans $queueName $message $null


$queueName = ".\Private$\transmq"
$message = "This is my second test message"
WriteMessageToMSMQTrans $queueName $message "MyLabel"

Write-Host "Completed"
