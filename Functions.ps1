
function My-PowerShellFun1 {
    Clear-Host
 "Playing with functions"
}

function My-PowerShellFun2($pOne, $pTwo, $Desc) {
    $pOne + $pTwo
    $Desc
}

function My-PowerShellFun3($pOne, $pTwo) {
    return $pOne + $pTwo
}

My-PowerShellFun1

My-PowerShellFun2 12 55 "Test"

$ret = My-PowerShellFun3 66 101

"This is returned = " + $ret