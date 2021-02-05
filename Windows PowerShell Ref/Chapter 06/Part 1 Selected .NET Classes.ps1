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