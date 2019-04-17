$fileContentBytes = get-content "SomeCert.pfx" -Encoding Byte
[System.Convert]::ToBase64String($fileContentBytes) | Out-File ‘pfx-encoded-bytes.txt’