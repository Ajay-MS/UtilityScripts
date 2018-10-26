$soptions = New-PSSessionOption -SkipCACheck
$cred = Get-Credential
$computername = "<ComputerName>"
# If secured connection change port to 5986 and add -UseSSL argument to Enter-PSSession
$computerport = 5985
Enter-PSSession -ComputerName $computername -Port $computerport -Credential $cred -SessionOption $soptions #-UseSSL
