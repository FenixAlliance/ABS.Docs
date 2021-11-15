# OAuth 2.0 and OpenID Connect protocols on the Alliance Passport Service

The Alliance Passport Service implements authentication and authorization with industry-standard protocols such as:

- OpenID Connect (OIDC) 
- OAuth 2.0.

APS offers built-in support for all the standard flows defined by the OAuth 2.0 and OpenID Connect core specifications: 

- Authorization code flow
- Implicit flow
- Hybrid flow (which is basically a mix between the first two flows)
- Resource owner password credentials grant
- Client credentials grant

The information here will be useful if you choose to write your code by directly sending and handling HTTP requests or using a third-party open-source library, rather than using one of our open-source SDKs.

**Note**: While the service is standards-compliant, there can be subtle differences between any two implementations of these protocols. 

# The basics
In nearly all OAuth 2.0 and OpenID Connect flows, there are four parties involved in the exchange:

- The Authorization Server is the Alliance Passport Service and is responsible for ensuring the user's identity, granting and revoking access to resources, and issuing tokens. The authorization server is also known as the identity provider - it securely handles anything to do with the user's information, their access, and the trust relationships between parties in a flow.
- The Resource Owner is typically the end-user. It's the party that owns the data and has the power to allow clients to access that data or resource.
- The OAuth Client is your app, identified by its application ID. The OAuth client is usually the party that the end-user interacts with, and it requests tokens from the authorization server. The client must be granted permission to access the resource by the resource owner.
- The Resource Server is where the resource or data resides. It trusts the Authorization Server to securely authenticate and authorize the OAuth Client and uses Bearer access tokens to ensure that access to a resource can be granted.

# App registration

Every app that wants to connect to the Alliance Passport Service must be registered through the App registrations experience in the Alliance Business Studio before it can sign these users in using OAuth 2.0 or OpenID Connect. The app registration process will collect and assign a few values to your app:

- An Application ID that uniquely identifies your app
- A Redirect URI (optional) that can be used to direct responses back to your app
- A few other scenario-specific values.

For more details, learn how to register an app.

# Endpoints
Once registered, the app communicates with the Alliance Passport Service by sending requests to the endpoint:


|Service Provider| Endpoints |
|----------------|-----------|
| ABS Online     | https://fenix-alliance.com/connect/authorize <br> https://fenix-alliance.com/connect/token |
| ABS Server     | https://{server-endpoint}/connect/authorize <br> https://{server-endpoint}/connect/token   |



# Tokens
OAuth 2.0 and OpenID Connect make extensive use of bearer tokens, generally represented as JWTs (JSON Web Tokens). A bearer token is a lightweight security token that grants the "bearer" access to a protected resource. In this sense, the "bearer" is **anyone that gets a copy of the token**. Though a party must first authenticate with the Alliance Passport Service to receive the bearer token, if the required steps are not taken to secure the token in transmission and storage, it can be intercepted and used by an unintended party.

While some security tokens have a built-in mechanism for preventing unauthorized parties from using them, bearer tokens do not have this mechanism and must be transported in a secure channel such as transport layer security (HTTPS). If a bearer token is transmitted over plain HTTP, a malicious party can use a man-in-the-middle attack to acquire the token and use it for unauthorized access to a protected resource. 

The same security principles apply when storing or caching bearer tokens for later use. Always ensure that your app transmits and stores bearer tokens in a secure manner. For more security considerations on bearer tokens, see [RFC 6750 Section 5](https://datatracker.ietf.org/doc/html/rfc6750).

There are primarily 3 types of tokens used in OAuth 2.0 / OIDC:

- Access tokens - tokens that a resource server receives from a client, containing permissions the client has been granted.
- ID tokens - tokens that a client receives from the authorization server, used to sign in a user and get basic information about them.
- Refresh tokens - used by a client to get new access and ID tokens over time. These are opaque strings and are only understandable by the authorization server.

# External resources

- [OAuth 2.0 specification](https://datatracker.ietf.org/doc/html/rfc6749)
- [OpenID Connect specification](https://openid.net/specs/openid-connect-core-1_0.html)








