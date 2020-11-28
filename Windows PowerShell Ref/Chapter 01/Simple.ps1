Write-Host "Hello, I'm Simple!"

if ($args.Count -gt 0){
    $localTest = $args[0].ToString()
    
    foreach ($p in $args) {
        Write-Host $p
    }
} else {
    $localTest = "Local Test"
    $GLOBAL:globalTest = "Global Test";    
}

