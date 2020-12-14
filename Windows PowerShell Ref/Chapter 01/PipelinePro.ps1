foreach($e in $input) {
    "Input was: $e"
}


foreach($e in $input) {
    "Input was: $e"
}

#If you want to access these again you MUST use the Reset()

$input.Reset()

foreach($e in $input) {
    "Input was: $e"
}

$input.Reset()
$inputArray = @($input)
Write-Host $inputArray

#return $inputArray