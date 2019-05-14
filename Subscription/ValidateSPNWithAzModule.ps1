$servicePrincipalId = "<ServicePrincipalID>"
$servicePrincipalKey = "<servicePrincipalKey>"
$tenantId = "<tenantId>"
$azureSubscriptionId = "<azureSubscriptionId>" 

$securePassword = ConvertTo-SecureString $servicePrincipalKey -AsPlainText -Force
$psCredential = New-Object System.Management.Automation.PSCredential ($servicePrincipalId, $securePassword)

Write-Verbose "Connect-AzAccount Started" -Verbose
$azureAccount = Connect-AzAccount -ServicePrincipal -Tenant $tenantId -Credential $psCredential -Environment AzureCloud
$azureAccount
Write-Verbose "Connect-AzAccount Completed" -Verbose
