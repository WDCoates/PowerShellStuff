# System.DateTime
$Obj1 = New-Object -TypeName System.Version -ArgumentList "1.2.3.4"
$Obj1

$DT1 = New-Object DateTime 2005, 5, 10, 0,0,0
$DT1

$DT2 = [DateTime]::Now
$DT2

$DT3 = Get-Date -Year 2021 -Month 02 -Day 29    # Sets it to the 1st or March!
$DT3                                            # 01 March 2021 09:43:37
$DT3.DayOfYear                                  # 60

# System.Guid
$G1 = [Guid]::NewGuid();
$G1

# System.Math
$M1 = [Math]::Sin(100)
$M1
[System.Math]::E
[System.Math]::PI

# System.Random
$r1 = [Random]::new()
for($x = 1; $x -le 10; $x++){
    Write-Host $r1.Next(100)
}

# System.Diagnostics.EventLog
Get-EventLog -List
$eLog = [System.Diagnostics.EventLog]::new()
$eLog.MachineName

# System.Diagnostics.Stopwatch
$sw = [System.Diagnostics.Stopwatch]::new()
$sw.Start()

$sw.Stop()

$sw.Elapsed

# EMail
$emc = [System.Net.Mail.SmtpClient]::new("Test")
$emc.Host

# SQL 
#System.Data.SqlClient.SqlDataAdapter
#System.Data.SqlClient.SqlConnection
#System.Data.SqlClient.SqlCommand

# Access to Message Queue
System.Messaging.MessageQueue