msiexec /i "SsisAzureFeaturePack_2017_x64.msi" /quiet /qn /norestart /log logfile.log
Get-Content "logfile.log"