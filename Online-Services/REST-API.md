# Welcome to the Alliance Online Services REST API reference documentation.

Apart from the traditional Web Portals, the AOS APIs expose a set of Representational State Transfer (REST) service endpoints that support sets of HTTP operations (methods), which provide create, retrieve, update, or delete access to the service's resources. This section will walk you through:

- How to call Alliance Online Services REST APIs with Postman
- How to register your client application with Alliance Passport Services ("APS") to secure your REST requests.
- Overviews of creating and sending a REST request, and handling the response.

## How to call AOS REST APIs with Postman
The following video will show you how to quickly authenticate with the AOS REST APIs via the client id/secret method. We encourage you to continue reading below to learn about what constitutes a REST operation, but if you need to quickly call the APIs, this video is for you.

{video placeholder}

## How to Authenticate and Authorize requests to the AOS Rest API.

### Register your client application with APS

Most AOS REST API endpoint sets require your client code to authenticate with valid credentials before you can call the service's API. Authentication is coordinated between the various actors by APS and provides your client with an access token as proof of the authentication. The token is then sent to the AOS service in the HTTP Authorization header of subsequent REST API requests. The token's claims also provide information to the service, allowing it to validate the client and perform any required authorization.

If you are using a REST API that does not use integrated APS authentication, or you've already registered your client, skip to the Create the request section.

#### Prerequisites
Your client application must make its identity configuration known to APS before run-time by registering it in an Online Business Tenant. Before you register your client with APS, consider the following prerequisites:

- If you do not have an Online Business Tenant yet, see Set up an Online Business Tenant.

- In accordance with the OAuth2 Authorization Framework, APS supports two types of clients. Understanding each helps you decide which is most appropriate for your scenario:

  - web/confidential clients run on a web server and can access resources under their own identity (for example, a service or daemon), or obtain delegated authorization to access resources under the identity of a signed-in user (for example, a web app). Only a web client can securely maintain and present its own credentials during APS authentication to acquire an access token.

  - native/public clients are installed and run on a device. They can access resources only under delegated authorization, using the identity of the signed-in user to acquire an access token on behalf of the user.

You are now ready to register your client application with APS.

#### Client registration

To register a client that accesses an AOS REST API, see Use the Alliance Developer Center portal to create an application that can access resources. The article (also available in PowerShell and CLI versions for automating registration) shows you how to:

- Register the client application with APS.
- Set permission requests to allow the client to access the AOS REST APIs.
- Configure APS IAM Role-Based Access Control (RBAC) settings for authorizing the client.

If your client accesses an API other than the APS IAM API, refer to:

- Register an application with the Alliance Passport Service
  - Register the client application with APS, in the "Register an application" section.
  - Create a secret key (if you are registering a web client), in the "Add credentials" section.
- Configure an application to expose a web API
  - Add permissions to your web API, exposing them as scopes
- Configure a client application to access a web API
  - Add permission requests as required by the scopes defined for the API, in the "Add permissions to access your web API" section.

Now that you've completed the registration of your client application, move on to your client code where you create the REST request and handle the response.

### Create the request

This section covers the first three of the five components that we discussed earlier. You first need to acquire the access token from APS, which you use to assemble your request message header.

#### Acquire an access token
After you have a valid client registration, you have two ways to integrate with APS to acquire an access token:

Platform and language-neutral OAuth2 service endpoints, which we use in this article. The instructions provided in this section assume nothing about your client's platform or language/script when you use the APS OAuth endpoints. The only requirement is that you can send/receive HTTPS requests to/from APS and parse the response message.

The platform- and language-specific Authentication Libraries, which are beyond the scope of this article. The libraries provide asynchronous wrappers for the OAuth2 endpoint requests, and robust token-handling features such as caching and refresh token management. For more information, see the Overview of the ABS SDKs.

The two APS endpoints that you use to authenticate your client and acquire an access token are referred to as the OAuth2 /authorize and /token endpoints. How you use them depends on your application's registration and the type of OAuth2 authorization grant flow you need to support your application at run-time. For the purposes of this article, we assume that your client uses one of the following authorization grant flows: authorization code or client_credentials. To acquire an access token used in the remaining sections, follow the instructions for the flow that best matches your scenario.

##### Authorization code grant (interactive clients)

This grant is used by both web and native clients, requiring credentials from a signed-in user in order to delegate resource access to the client application. It uses the /authorize endpoint to obtain an authorization code (in response to user sign-in/consent), followed by the /token endpoint to exchange the authorization code for an access token.

1. First, your client needs to request an authorization code from APS. For details on the format of the HTTPS GET request to the /authorize endpoint, and example request/response messages, see Request an authorization code. The URI contains the following query-string parameters, which are specific to your client application:

   -    `client_id`: A GUID that was assigned to your client application during registration, also known as an application ID.

   -   `redirect_uri`: A URL-encoded version of one of the reply/redirect URIs, specified during registration of your client application. The value you pass must match your registration value exactly.

   -   `resource`: A URL-encoded identifier URI that's specified by the REST API you are calling. Web/REST APIs (also known as resource applications) can expose one or more application ID URIs in their configuration. For example:

The request to the /authorize endpoint first triggers a sign-in prompt to authenticate the user. The response you get back is delivered as a redirect (302) to the URI that you specified in redirect_uri. The response header message contains a location field, containing the redirect URI followed by a code query parameter. The code parameter contains the authorization code that you need for step 2.

Next, your client needs to redeem the authorization code for an access token. For details on the format of the HTTPS POST request to the /token endpoint and request/response examples, see Request an access token. Because this is a POST request, you package your application-specific parameters in the request body. In addition to some of the previously mentioned parameters (along with other new ones), you will pass:

code: This query parameter contains the authorization code that you obtained in step 1.

client_secret: You need this parameter only if your client is configured as a web application. This is the same secret/key value that you generated earlier, in client registration.

##### Client credentials grant (non-interactive clients)
This grant is used only by web clients, allowing the application to access resources directly (no user delegation) using the client's credentials, which are provided at registration time. The grant is typically used by non-interactive clients (no UI) that run as a service or daemon. It requires only the /token endpoint to acquire an access token.

The client/resource interactions for this grant are similar to step 2 of the authorization code grant. For details on the format of the HTTPS POST request to the /token endpoint and request/response examples, see the "Get a token" section in the [Authentication and Authorization and the OAuth 2.0 client credentials flow](/Online-Services/REST-API/Authentication-and-Authorization.md) section.

#### Assemble the request message

Most programming languages or frameworks and scripting environments make it easy to assemble and send the request message. They typically provide a web/HTTP class or API that abstracts the creation or formatting of the request, making it easier to write the client code. For brevity, and because most of the task is handled for you, this section covers only the important elements of the request.

##### Request URI
Because sensitive information is being transmitted and received, **all REST requests to any AOS Service Endpoint requires the HTTPS** protocol for the URI scheme, giving the request and response a secure channel. The information (that is, the APS authorization code, access/bearer token, and sensitive request/response data) is encrypted by a lower transport layer, ensuring the privacy of the messages.

The remainder of your service's request URI (the host, resource path, and any required query-string parameters) are determined by its related REST API specification. For a more detailed reference on each AOS REST Endpoint, please refer to the [AOS REST API Interactive Documentation](https://fenix-alliance.com/api/v2/documentation).

##### Request header
The request URI is bundled in the request message header, along with any additional fields required by your service's REST API specification and the HTTP specification. Your request might require the following common header fields:

- `Authorization`: Contains the OAuth2 bearer token to secure the request, as acquired earlier from APS.
- `Content-Type`: Typically set to "application/json" (name/value pairs in JSON format), and specifies the MIME type of the request body.
- `Host`: The domain name or IP address of the server where the REST service endpoint is hosted.

##### Request body
As mentioned earlier, the request message body is optional, depending on the specific operation you're requesting and its parameter requirements. If it's required, the API specification for the service you are requesting also specifies the encoding and format.

The request body is separated from the header by an empty line, formatted in accordance with the Content-Type header field. An example of an "application/json" formatted body would appear as follows:

```
{
  "<name>": "<value>"
}
```

### Send the request
Now that you have the service's request URI and have created the related request message header and body, you are ready to send the request to the AOS REST service endpoint.

For example, you might send an HTTPS GET request method for an AOS REST API endpoint by using request header fields that are similar to the following (note that the request body is empty):

 

```
GET /api/v2/subscriptions HTTP/1.1
Authorization: Bearer <bearer-token>
Host: fenix-alliance.com



<no body>
```

And you might send an HTTPS PUT request method for an AOS REST API endpoint by using request header and body fields similar to the following example:


```
PUT /api/v2/subscriptions/d0928ef4-84b0-4710-9a8e-e34c82ccc917  HTTP/1.1
Authorization: Bearer <bearer-token>
Content-Length: 29
Content-Type: application/json
Host: fenix-alliance.com

{
  "displayName": "My Subscription"
}
```

After you make the request, the response message header and optional body are returned.

### Process the response message
The process concludes with the final two of the five components.

To process the response, parse the response header and, optionally, the response body (depending on the request). In the HTTPS GET example provided in the preceding section, you used the `/API/v2/subscriptions` endpoint to retrieve the list of subscriptions for a user. Assuming that the response was successful, you should receive response header fields that are similar to the following example:



```
HTTP/1.1 200 OK
Content-Length: 303
Content-Type: application/json;
```

And you should receive a response body that contains a list of subscriptions and their individual properties encoded in JSON format, similar to:



```json
[
    {
        "id":"d0928ef4-84b0-4710-9a8e-e34c82ccc917",
        "subscriptionId":"123cc9dd-09c9-47de-9f2b-2517adfcfd44",
        "displayName":"My Subscription",
        "state":"Enabled",
    }
]

```

Similarly, for the HTTPS PUT example, you should receive a response header similar to the following, confirming that your PUT operation to add the "ExampleResourceGroup" was successful:
 

```
HTTP/1.1 200 OK
Content-Length: 193
Content-Type: application/json;
```

And you should receive a response body that confirms the content of your newly added resource group encoded in JSON format, similar to:

 
```json
{
    "id":"123cc9dd-09c9-47de-9f2b-2517adfcfd44",
    "name":"ExampleResourceGroup",
    "location":"westus",
    "properties":
        {
        "provisioningState":"Succeeded"
        }
}
```

As with the request, most programming languages and frameworks make it easy to process the response message. They typically return this information to your application following the request, allowing you to process it in a typed/structured format. Mainly, you are interested in confirming the HTTP status code in the response header, and parsing the response body according to the API specification (or the Content-Type and Content-Length response header fields).