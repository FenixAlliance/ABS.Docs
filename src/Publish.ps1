function FA_Build_Docs {
    Param
    (
        [Parameter(Mandatory = $false, Position = 2)]
        [switch] $Build
    )

    Write-Output "Cleaning Docs"
    set-location "C:\Code\FAGroup\FenixAlliance.Docs\FenixAlliance.ABS.Docs"
  
    rm -recurse -force _book
    rm -recurse -force "C:\Builds\Releases\ABS.Docs\_book"
    
    if ($Build -eq $true) {

        Write-Output "Building Docs"

        gitbook build
        .\Rebrand.ps1

        Write-Output "Pushing Docs"

        cp -r "C:\Code\FAGroup\FenixAlliance.Docs\FenixAlliance.ABS.Docs\_book" "C:\Builds\Releases\ABS.Docs\" 
    }
}
FA_Build_Docs -Build