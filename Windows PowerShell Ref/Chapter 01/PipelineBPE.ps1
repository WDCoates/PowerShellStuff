begin{
    Write-Host "Lets Begin"
    Write-Host $MyInvocation.PipelineLength
}

process{

    Write-Host "Process this:" $_

}

end{
    Write-Host "The End!"
    return $input
}