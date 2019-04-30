## Subscription 

#### Generate access token via REST API 

**REST Client**
Request Syntax : <ActiveDirectoryAuthority>/<tenantId>/oauth2/token
 
Ex. Azure Cloud
Request : https://login.microsoftonline.com/<tenantId>/oauth2/token/
 
Body content :
 
Type : x-www-form-urlencoded
 
resource: <ResourceManagerUrl>
Client_id: <Service Principal Id>
grant_type: client_credentials
Client_secret: <Service principal key>
