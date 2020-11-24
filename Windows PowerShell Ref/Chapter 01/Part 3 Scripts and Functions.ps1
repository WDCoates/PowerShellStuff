# Writing Scripts and Reusing Functionality

# Scripts are held in files with extension .ps1

<# Functions and Filters

    function SCOPE:name(parameters){
        statement block
    }

    filter SCOPE:name(parameters){
        statement block
    }

#>

<# Script Blocks

    $objRef = {
        statement block
    }

#>


# SCOPE: global, script, local, private

# $args $input

# call functions an scripts the same way i.e. $res = GetMyRes $p1 $p2

<# Standard layout as functions must be declaired and available first

function Main {     
    (...)
    HelperFunction
    (...)
}

function HelperFunction { 
    (...)
}

. Main

#>