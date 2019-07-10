function Check-FileExists
{
    param
    (
        $BaseDir,
        $FileToFind
    )

    Write-Host "############# Searching : $BaseDir ##############"

    # Looking into folder
    $Path = Get-ChildItem $BaseDir -Recurse
    Write-Host "Found folders at location : $($Path.FullName)"

    $Path = Get-ChildItem -Path $BaseDir -Filter $FileToFind -Recurse -ErrorAction SilentlyContinue -Force
    Write-Host "Found $FileToFind at location : $($Path.FullName)"

    Write-Host "`r`n`r`n"
}

Check-FileExists -BaseDir "c:\Program Files\Microsoft SQL Server" -FileToFind "SQLPackage.exe"
