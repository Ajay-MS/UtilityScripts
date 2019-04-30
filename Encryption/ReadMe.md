## Understand about certificates

####SSL certificate formats
 
PFX file 
•	The PKCS#12 or PFX format is a binary format for storing the server certificate, any intermediate certificates, and the private key in one encryptable file. 
•	PFX files usually have extensions such as .pfx and .p12. 
•	Use - PFX files are typically used on Windows machines to import and export certificates and private keys
 
DER certificate
•	It usually have extension such as .der, .cer
•	It is binary format of the certificate. 
•	To differentiate between DER or PEM format if extension is .cer then open file in any text editor if content is binary then it's DER format. 
•	Use - Typically used with Java plaform
 
PEM certificate
•	It usually have extension such as .pem, .crt, .cer and .key 
•	They are Base64 encoded ASCII files and contain "-----BEGIN CERTIFICATE-----" and "-----END CERTIFICATE-----" statements. 
•	Use - Apache and similar server generally use certificate in PEM format

####Convert PFX file to CER file
 
Using windows cert manager
 
1.	Import PFX certificate to windows certificate manager. Refer -  https://docs.microsoft.com/en-us/dotnet/framework/wcf/feature-details/how-to-view-certificates-with-the-mmc-snap-in
2.	Export certificate in cert format. 
 
Using open SSL
 
openssl pkcs12 -in AjyaSelfSigned.pfx -clcerts -nokeys -out ajyaCertFile.cer

####Convert a password protected PFX file into password less PFX file
https://serverfault.com/questions/515833/how-to-remove-private-key-password-from-pkcs12-container/633820

Add Certificate to Azure Cloud Service

Add PEM format certificate to cloud service 
Add-AzureCertificate -ServiceName "others-dtlL2test1" -CertToDeploy "E:\TaskResources\Certificates\ajyaCertFile.cer"
 
Add PFX certificate to cloud service 
Add-AzureCertificate -ServiceName "others-dtlL2test1" -CertToDeploy "E:\TaskResources\Certificates\ajyaCertFile.pfx" -Password <password>
