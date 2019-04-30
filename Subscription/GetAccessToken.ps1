################ User Input ############################
$servicePrincipalId = ""
$servicePrincipalKey = ""
$tenantId = ""
$azureSubscriptionId = "" 
$environment = "AzureCloud"

############## Logic to fetch auth token 
$auzreRmEnvironment = Get-AzureRmEnvironment -Name $environment

$method = "POST"
$authUri = $auzreRmEnvironment.ActiveDirectoryAuthority + "$tenantId/oauth2/token"

$body = @{
    resource=$auzreRmEnvironment.ResourceManagerUrl
    client_id=$servicePrincipalId
    grant_type='client_credentials'
    client_secret=$servicePrincipalKey
}
    
# Call Rest API to fetch AccessToken
Write-Verbose "Fetching Access Token"
    
try
{
    $accessToken = Invoke-RestMethod -Uri $authUri -Method $method -Body $body -ContentType $script:formContentType
    Write-Output $accessToken
}
catch
{
    $exceptionMessage = $_.Exception.Message.ToString()
    throw $exceptionMessage
}