# Authorizing request against the Alliance Online Services

Some apps call the Alliance Online Services ("AOS") APIs with their own identity and not on behalf of an Account Holder. In many cases, these are background services or daemons that run on a server without the presence of a signed-in user. An example of such an app might be a contact information updater service that wakes up and runs overnight. In some cases, apps that have a signed-in user present may also need to call the AOS APIs under their own identity. For example, an app may need to use functionality that requires more elevated privileges in an Online Business Tenant than those granted by the signed-in Account Holder.

## Authentication and authorization steps
The basic steps required to configure a service and get a token from the Alliance Passport Services ("APS") API for the endpoint that your service can use to call the AOS under its own identity are:

1. Register your app.
1. Configure permissions for AOS on your app.
1. Get administrator consent (if required).
1. Get an access token.
1. Use the access token to call Alliance Online Services.

### 1. Register your app
To authenticate with the Alliance Passport Service IAM endpoint, you must first register your app at the Alliance Developer Center portal. You need to use a business enrollment with enough privileges to register your app.

For a service that will call AOS under its own identity, you need to register your app for the Web platform and copy the following values:

The Application ID is assigned by the Alliance Developer Center portal.
- A Client (application) Secret, either a password or a public/private key pair (certificate).
- A Redirect URL for your service to receive token responses.
- A Redirect URL for your service to receive admin consent responses if your app implements functionality that requires administrator consent.

For steps on how to configure an app using the Alliance Developer Center portal, see Register your app.

With the OAuth 2.0 client credentials grant flow, your app authenticates directly at the APS IAM endpoint through the `API/v2/OAuth/token` endpoint using the Application Public Key and Application Secret assigned by the Alliance Developer Center Portal.

### 2. Configure permissions for Alliance Online Services
For apps that call AOS under their own identity, APS exposes application permissions (APS can also expose delegated permissions for apps that call AOS on behalf of an Account Holder). You pre-configure the application permissions your app needs when you register your app. 

By default, application permissions always require administrator consent. An administrator can either consent to these permissions using the Alliance Developer Center portal when your app is installed in their Business Tenant, or you can provide a sign-up experience in your app through which administrators can consent to the permissions you configured. Once administrator consent is recorded by APS, your app can request tokens without having to request consent again. For more detailed information about the permissions available with the Alliance Business Suite, see the Permissions reference.

To configure application permissions for your app in the Alliance Developer Center portal: under an application's API permissions page, choose "Add permission", then choose the permissions your app requires under Application permissions.

The following screenshot shows the Select Permissions page for application permissions.
![image.png](/.attachments/image-c521f27a-288a-4920-8edd-767deddbd62f.png)
**Note**: We recommend that you configure the least privileged set of permissions required by your app. This provides a much more comfortable experience for administrators than having to consent to a long list of permissions.

### 4. Get an access token
In the OAuth 2.0 client credentials grant flow, you use the Application Public Key and Application Secret values that you saved when you registered your app to request an access token directly from the APS /token endpoint.

You specify the pre-configured permissions bypassing the permission ids as a comma-separated list as the value for the `requested_scopes` parameter in the token request. See the scope parameter description in the token request below for details.

Token request
You send a POST request to the APS /token endpoint to acquire an access token:


```
// Line breaks are for legibility only.

POST https://fenix-allliance.com/api/v2/oauth2/v2.0/token
HTTP/1.1
Host: fenix-allliance.com
Content-Type: application/x-www-form-urlencoded

client_id=535fb089-9ff3-47b6-9bfb-4f1264799865
&client_secret=535fb089-9ff3-47b6-9bfb-4f1264799865
&scope=assets_read,assets_create,assets_delete
&grant_type=client_credentials
```


#### TOKEN REQUEST


	

| Parameter	 |  Condition	| Description |
|--|--|--|
| tenant |  Required	| The directory tenant that you want to request permission from. This can be in GUID or friendly name format. |
| client_id | Required | The Application ID that the Azure app registration portal assigned when you registered your app. |
|client_secret	 | Required	|The Application Secret that you generated for your app in the app registration portal. Ensure that it is URL encoded. ​|
| grant_type	|  required| Must be client_credentials.|
| scope	|  Required | The value passed for the scope parameter in this request should be the resource identifier (Permission ID) of the resource you want to work with. For APS IAM, the value default informs the APS endpoint that of all the application permissions you have configured for your app in the app registration portal, although it is highly recommended that you should issue a token for the ones associated with the resource you want to use.|


Token response
A successful response looks like this:

```JSON
{
 ​"token_type": "Bearer",
 ​"expires_in": 3599,
 ​"access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ik1uQ19WWmNBVGZNNXBP..."
}
```

### TOKEN RESPONSE

| Parameter	 | Description |
|--|--|
| access_token	 | The requested access token. Your app can use this token in calls to AOS.|
| token_type	 | Indicates the token type value. The only type that APS supports is bearer.  |
| expires_in	 | How long the access token is valid (in seconds).​|


### 5. Use the access token to call Alliance Online Services
After you have an access token, you can use it to call any AOS Web API by including it in the Authorization header of a request. The following request gets the profile of a specific user. Your app must have the User.Read.All permission to call this API.


```
GET https://fenix-alliance.com/api/v2/me
Authorization: Bearer eyJ0eXAiO ... 0X2tnSQLEANnSPHY0gKcgw
Host: fenix-alliance.com
```

A successful response will look similar to this (some response headers have been removed):

HTTP

```curl
HTTP/1.1 200 OK
Content-Type: application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=false;charset=utf-8
request-id: f45d08c0-6901-473a-90f5-7867287de97f
Duration: 309.0273
Date: Wed, 26 Apr 2017 19:53:49 GMT
Content-Length: 407
```

```JSON
{
{
  "id": "aa4sg587b-c7f5-44e0-947e-50a5b73f33ed",
  "publicName": "GreatWarrior23",
  "idProvider": "Alliance Passport Services SSO",
  "email": "jhon.doe@contoso.com",
  "coverURL": "data:image/jpeg;base64,/9j/4AAQSkZJsadS..LKSCtz/9k=",
  "avatarURL": "data:image/jpeg;base64,/9j/4AAQSkZJRgA..jACCtz/9k=",
  "followsCount": 2,
  "followersCount": 2,
  "enrollmentsCount": 8,
  "socialProfileID": "s687a1d-dad6-4433-a1d1-83316e9edwed",
  "cartID": "0878e6b6-d25a-481a-ab06-8b76e93e1175",
  "walletID": "1be9de4e-cab1-4044-89f3-a8cc8bf30a8b",
  "currencyID": "COP.COL",
  "currencyISO": "COP",
  "currencyExchange": 3786
}
}
```



