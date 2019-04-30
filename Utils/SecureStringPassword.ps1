$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$psCredential = New-Object System.Management.Automation.PSCredential ($username, $securePassword)