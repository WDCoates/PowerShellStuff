Clear-Host

Get-EventLog -List 
""
"--------------------------------------------------------------"
""
$logs = Get-WinEvent -ListLog * | Where-Object { $_.RecordCount -gt 0} | Sort-Object -Property RecordCount -Descending

foreach($log in $logs){
    $log.LogName,  $log.RecordCount
    # Clear-EventLog -LogName $log.LogName
}
""
"--------------------------------------------------------------"
""

Get-LogProperties -Name "System"
Get-EventLog -LogName System -Newest 10

