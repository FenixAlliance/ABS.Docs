cd "C:\Code\FAGroup\FenixAlliance.Docs\FenixAlliance.ABS.Docs\_book"


$fileNames = Get-ChildItem "*.html" -Recurse | Select-Object -expand fullname

foreach ($filename in $filenames) {
    (Get-Content $fileName) -replace 'Published with Gitbook', 'Published with ABS Docs' | Set-Content $fileName
    (Get-Content $fileName) -replace 'https://www.gitbook.com', 'https://fenixalliance.com.co' | Set-Content $fileName
    (Get-Content $fileName) -replace '<meta name="generator" content="GitBook 3.2.3">', '<meta name="generator" content="ABS Docs 3.2.3">' | Set-Content $fileName
    (Get-Content $fileName) -replace '· GitBook', '· ABS Docs' | Set-Content $fileName
}

$fileNames = Get-ChildItem "*.html" -Recurse | Select-Object -expand fullname

foreach ($filename in $filenames) { 
}


cd ..