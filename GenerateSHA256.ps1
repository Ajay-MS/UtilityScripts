$inputString = "Ajay"

$hashHandler = [System.Security.Cryptography.HashAlgorithm]::Create('sha256')
$hash = $hashHandler.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($inputString.ToLower()))

$hashString = [System.BitConverter]::ToString($hash)

$hashString = $hashString.Replace('-', '').ToLower()

Write-Output $hashString
