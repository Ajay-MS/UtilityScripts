$allServices = Get-Service

foreach ($service in $allServices)
{
        # Remove service contains string XYZ
        if($service.DisplayName -match "XYZ")
        {
            $validInput = Read-Host -Prompt "Enter Y to delete : $($service.DisplayName)"

            if ( $validInput -eq "Y")
            {
                Write-Output "Removing service $($service.Name)"
                $serviceObj = Get-WmiObject -Class Win32_Service -Filter "Name='$($service.Name)'"
                Write-Output "Got service $serviceObj"
                sc.exe delete $service.Name
            }
        }
    
}