$servicePrincipalId = "<ServicePrincipalID>"
$servicePrincipalKey = "<servicePrincipalKey>"
$tenantId = "<tenantId>"
$azureSubscriptionId = "<azureSubscriptionId>" 

$securePassword = ConvertTo-SecureString $servicePrincipalKey -AsPlainText -Force
$psCredential = New-Object System.Management.Automation.PSCredential ($servicePrincipalId, $securePassword)

Write-Verbose "Add-AzureRMAccount Started" -Verbose
$azureAccount = Add-AzureRMAccount -ServicePrincipal -Tenant $tenantId -Credential $psCredential -EnvironmentName AzureCloud
$azureAccount
Write-Verbose "Add-AzureRMAccount Completed" -Verbose

Write-Verbose "Select-AzureRMSubscription Started" -Verbose
$newSubscription = Select-AzureRMSubscription -SubscriptionId $azureSubscriptionId -TenantId $tenantId
$newSubscription
Write-Verbose "Select-AzureRMSubscription Completed" -Verbose
