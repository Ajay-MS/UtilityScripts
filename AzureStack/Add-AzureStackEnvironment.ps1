﻿<#[CmdletBinding()]
param([Parameter(Mandatory=$true)]$endpointURL) #>

$endpointBaseURL = "<>"

<#
    Adds Azure Stack environment to use with AzureRM command-lets when targeting Azure Stack
#>
function Add-AzureStackAzureRmEnvironment {
    param (
        [Parameter(mandatory=$true, HelpMessage="The Admin ARM endpoint URI of the Azure Stack Environment")]
        $EndpointURI,
        [parameter(mandatory=$true, HelpMessage="Azure Stack environment name for use with AzureRM commandlets")]
        [string] $Name
    )

    $EndpointURI = $EndpointURI.TrimEnd("/")

    $Domain = ""
    try {
        $uriendpoint = [System.Uri] $EndpointURI
        $i = $EndpointURI.IndexOf('.')
        $Domain = ($EndpointURI.Remove(0,$i+1)).TrimEnd('/')
    }
    catch {
        Write-Error (Get-VstsLocString -Key AZ_InvalidARMEndpoint)
    }

    $ResourceManagerEndpoint = $EndpointURI
    $stackdomain = $Domain

    $AzureKeyVaultDnsSuffix="vault.$($stackdomain)".ToLowerInvariant()
    $AzureKeyVaultServiceEndpointResourceId= $("https://vault.$stackdomain".ToLowerInvariant())
    $StorageEndpointSuffix = ($stackdomain).ToLowerInvariant()


    $azureStackEndpointUri = $EndpointURI.ToString() + "/metadata/endpoints?api-version=2015-01-01"

    Write-Verbose "Retrieving endpoints from the $ResourceManagerEndpoint" -Verbose

    $endpointData = Invoke-RestMethod -Uri $azureStackEndpointUri -Method Get -ErrorAction Stop

    Write-Output ($endpointData | ConvertTo-Json)

    if ($endpointData)
    {
        $authenticationData = $endpointData.authentication;
        if ($authenticationData)
        {
            $loginEndpoint = $authenticationData.loginEndpoint
            if($loginEndpoint)
            {
                $aadAuthorityEndpoint = $loginEndpoint
                $activeDirectoryEndpoint = $loginEndpoint.TrimEnd('/') + "/"
            }

            $audiences = $authenticationData.audiences
            if($audiences.Count -gt 0)
            {
                $activeDirectoryServiceEndpointResourceId = $audiences[0]
            }
        }

        $graphEndpoint = $endpointData.graphEndpoint
        $graphAudience = $endpointData.graphEndpoint
        $galleryEndpoint = $endpointData.galleryEndpoint
    }

    $azureEnvironmentParams = @{
        Name                                     = $Name
        ActiveDirectoryEndpoint                  = $activeDirectoryEndpoint
        ActiveDirectoryServiceEndpointResourceId = $activeDirectoryServiceEndpointResourceId
        ResourceManagerEndpoint                  = $ResourceManagerEndpoint
        GalleryEndpoint                          = $galleryEndpoint
        GraphEndpoint                            = $graphEndpoint
        GraphAudience                            = $graphAudience
        StorageEndpointSuffix                    = $StorageEndpointSuffix
        AzureKeyVaultDnsSuffix                   = $AzureKeyVaultDnsSuffix
        AzureKeyVaultServiceEndpointResourceId   = $AzureKeyVaultServiceEndpointResourceId
        EnableAdfsAuthentication                 = $aadAuthorityEndpoint.TrimEnd("/").EndsWith("/adfs", [System.StringComparison]::OrdinalIgnoreCase)
    }

    Write-Host $azureEnvironmentParams

    $armEnv = Get-AzureRmEnvironment -Name $name
    if($armEnv -ne $null) {
        Write-Verbose "Updating AzureRm environment $name" -Verbose
        Remove-AzureRmEnvironment -Name $name | Out-Null
    }
    else {
        Write-Verbose "Adding AzureRm environment $name" -Verbose
    }

    return (Add-AzureRmEnvironment -Name $Name @azureEnvironmentParams )
}

Add-AzureStackAzureRmEnvironment -EndpointURI $endpointBaseURL -Name "AzureStack"
