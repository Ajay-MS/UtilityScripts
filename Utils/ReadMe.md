## Basic PowerShell cmdlets

#### Powershell module installation path
`PSModulePath` environment variable list our all installation path for PS modules.

Possible installation paths :
* $PSHome\Modules (%Windir%\System32\WindowsPowerShell\v1.0\Modules)
* $Home\Documents\WindowsPowerShell\Modules (%UserProfile%\Documents\WindowsPowerShell\Modules)
* $Env:ProgramFiles\WindowsPowerShell\Modules (%ProgramFiles%\WindowsPowerShell\Modules)

#### Get-Command
Commands available in current session. 
```
get-command
```

#### Set-ExecutionPolicy
Set-ExecutionPolicy command enables you to control the level of security surrounding PowerShell scripts.

* Restricted: This is the default security level which blocks PowerShell scripts from running. In this security level, you can only enter commands interactively.
* All Signed: This security level allows scripts to run only if they are signed by a trustworthy publisher.
* Remote Signed: In this security level, any PowerShell scripts that were created locally are permitted to run. Scripts created remotely are permitted to run only if they’ve been signed by a reputable publisher.
* Unrestricted: As its name suggests, the unrestricted security level permits all scripts to run by removing all restrictions from the execution policy.

```
Set-ExecutionPolicy
Get-ExecutionPolicy
```

#### Get-Service
To know what services are installed on the system.
```
Get-Service | Where-Object {$_.status -eq "stopped"}
```

#### Get-Process
Quick list of currently running processes
```
Get-Process
Stop-Process -processname notepad
Stop-Process -processname note*
```

#### Where-Object
To filter out from list of object.
```
Get-Service | Where-Object {$_.Status -eq 'Running'}
```

#### Foreach-object
Iterate over each object
```
Get-Process | ForEach-Object {Write-Host $_.name -foregroundcolor cyan}
```

#### New-Object
```
$ourObject = New-Object -TypeName psobject

$ourObject | Add-Member -MemberType NoteProperty -Name ComputerName -Value $computerInfo.Name
```
