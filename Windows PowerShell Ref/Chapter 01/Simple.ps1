param([string] $p1Test = 'Param01')

Write-Host "Hello, I'm Simple!"

Write-Host $pTest

if ($args.Count -gt 0){
    $localTest = $args[0].ToString()
    
    foreach ($p in $args) {
        Write-Host $p
    }
} else {
    $localTest = "Local Test"
    $GLOBAL:globalTest = "Global Test";    
}

