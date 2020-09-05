function mF-DeleteDir($tFolder){

    Set-Location $tFolder

    $exists = Test-Path -Path Bin
    if ($exists) {
        "Removing Bin folder"
        Remove-Item -Path Bin -Force -Recurse
    }

    $exists = Test-Path -Path Obj
    if ($exists) {
        "Removing Obj folder"
        Remove-Item -Path Obj -Force -Recurse
    }

}

Clear-Host
"Portal"

switch ($env:COMPUTERNAME)
{
    'BuildBox' {$devEnv = 'C:\Rubicon\Segen\'; Break}
    'IAPETUS' {$devEnv = 'D:\Development\Segen\Repos\'; Break}
    Default {
        "Computer Name is not known!";
        return -1;
        }
}


"BackOffice Admin"
Set-Location $devEnv
mF-DeleteDir .\SegenPortal.Mvc\BackOfficePortal\BackOfficePortal\BackOfficePortal\

"Common Services"
Set-Location $devEnv
mF-DeleteDir .\SegenPortal.Mvc\MvcCommonServices\

"Customer API"
Set-Location $devEnv
mF-DeleteDir .\SegenPortal.Mvc\SegenPortals.CustomerAPI\

"Portal"
Set-Location $devEnv
mF-DeleteDir .\SegenPortal.Mvc\SegenPortal.Mvc\

"Worker Service"
Set-Location $devEnv
mF-DeleteDir .\SegenPortal.Mvc\SegenWorkerService\SegenWorkerService\
