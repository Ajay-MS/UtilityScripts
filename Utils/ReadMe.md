## Basic PowerShell cmdlets

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
