function Check-DacExists
{
    param
    (
        $BaseDir
    )

    Write-Host "############# Searching : $BaseDir ##############"

    # Look for DAC folder
    $Path = Get-ChildItem $BaseDir -Recurse | Where-Object { $_.PSIsContainer -and $_.Name.Contains("DAC")}
    Write-Host "Found DAC folder at location : $($Path.FullName)"

    $FileToFind = "SQLPackage.exe"
    $Path = Get-ChildItem -Path $BaseDir -Filter SQLPackage.exe -Recurse -ErrorAction SilentlyContinue -Force
    Write-Host "Found SQLpackage.exe at location : $($Path.FullName)"

    Write-Host "`r`n`r`n"
}

Check-DacExists -BaseDir "c:\Program Files\Microsoft SQL Server"
Check-DacExists -BaseDir "C:\Program Files (x86)\Microsoft SQL Server"
Check-DacExists -BaseDir "C:\Program Files (x86)\Microsoft Visual Studio"
Check-DacExists -BaseDir "C:\Program Files\Microsoft Visual Studio"
