# Alliance Passport Services Overview
## How to get started?

The Alliance Business Suite enables developers and non-developers alike to easily configure and manage security. The Alliance Passport Services Engine contains features for managing authentication, authorization, data protection, HTTPS enforcement, app secrets, XSRF/CSRF prevention, and CORS management. These security features allow you to build robust, yet secure Alliance Business Suite apps.

## Common Terms
Learn more about APS + IAM terms.

- **Permission Sets**: refer to the  ABM record objects that are used to grant access to resources. You can attach Permission Sets to Identities. These include `BusinessPermission`, `BusinessProfile`, `SecurityGroup`, and `SecurityRole`.

- **Identities**: The ABM record objects that APS uses to authenticate and group. These include `AccountHolder`, `BusinessTenant`, `BusinessApplication` and `BusinessDomain`.

- **Users**
A person or application that uses an Identity. Although  `AccountHolder` is the most common type of Identity, `BusinessApplication` can also be used to sign in and make requests to the Alliance Business Platform's APIs within the scope of a `BusinessTenant`.

## Alliance Business Suite security features

### Identity Providers: 

Although but you can use third-party identity services such as Facebook, Twitter, and LinkedIn, or even enterprise services such as  Azure AD, Azure AD B2C, AWS Cognito (preview), Okta (preview), and many more, the Alliance Business Suite provides many tools and libraries to secure your apps including built-in identity providers, TOTP MFA (Time-based One-time Password Algorithm Multi-Factor Authentication) support.

With the Alliance Business Suite, you can easily manage app secrets, which are a way to store and use confidential information.

## Authentication vs. Authorization
Authentication is a process in which a user provides credentials that are then compared to those stored by an operating system, database, app, or resource. If they match, users are authenticated successfully, and can then perform actions that they're authorized for, during an authorization process. The authorization refers to the process that determines what a user is allowed to do.

Another way to think of authentication is to consider it as a way to enter a space, such as a server, database, app, or resource, while authorization is which actions the user can perform to which objects inside that space (server, database, or app).

## Understanding how APS works
Before you create Account Holders or Business Tenants, you should understand how APS enables IAM workflows. 

**Alliance Passport Services** (commonly known as "**APS**") is an Identity Engine that provides the infrastructure necessary to control authentication and authorization for the Alliance Business Suite. 

The **Identity and Access Management** Module ("**IAM**") is an extension built on top of the Alliance Passport Services Framework to allow users and applications to connect to certain Alliance Business Suite instances.

## Account Holder

An Account Holder is a person or application that can make a request for an action or operation on an ABM resource. The principal is authenticated as the ABS account root user or an IAM entity to make requests to any Alliance Business Platform API. As a best practice, do not use your root user credentials for your daily work. Instead, create IAM entities (holders and roles). You can also support federated users or programmatic access to allow an application to access your ABS instance.

## Authentication fundamentals

The Alliance Business Suite uses two primary middlewares for authentication. A Cookie-based authentication engine and standard Token-based authentication.

An [Account Holder](/Components/Alliance-Passport-Services/Account-Holders.md) must be authenticated (signed in to the Alliance Business Suite) using their credentials to send a request to any [Alliance Business Platform](/Components/Alliance-Business-Platform.md) API. Some modules, such as [Media Portals](/Components/Modules/CMS.md), ICX Stores, and ABS Workplace, allow a few requests from anonymous users. However, they are the exception to the rule.

### Root Users
To authenticate from the root user, you must sign in with the email address and password you provided when installing the instance. As any other regular IAM user, root users can set up multi-factor authentication through an authenticator app such as Google Authenticator, Microsoft Authenticator, or really any MFA TOTP (Time-based One-time Password Algorithm) application.

### API Users

To authenticate from the API or ABS Commander CLI (Bash or Powershell), you must create and provide an access key and secret key. You can get these keys by installing and navigating to the ABS Self-integration. 

Users might also be required to provide additional security information. For example, Fenix Alliance recommends that you use multi-factor authentication (MFA) to increase the security of your account and to enforce it on Privileged Account Holders. To learn more about the IAM entities that the Alliance Passport Service can authenticate, see [APS Identity Holders](/Components/Alliance-Passport-Services/Account-Holders) and [APS Security Roles](/Components/Alliance-Passport-Services/Security-Roles).

### Cookie-based authentication

When a user authenticates into an Alliance Business Suite instance using their username and password (or any other authentication provider, for that matter), they're issued a cookie, containing an authentication token that can be used for authentication and authorization. The token is stored in the browser as a cookie that accompanies every request the client makes to the application. Generating and validating this cookie is performed by the APS Cookie Authentication Middleware. The middleware serializes a user principal into an encrypted cookie. On subsequent requests, the middleware validates the cookie, recreates the principal, and assigns the principal to the User property present on controllers, views, components, and more.

### Token-based authentication

When a user is authenticated, they're issued a token (not an anti-forgery token). The token contains user information in the form of claims or a reference token that points the app to the user state maintained in the app. When a user attempts to access a resource requiring authentication, the token is sent to the app with an additional authorization header in form of a "Bearer token". 

"Bearer tokens" make the app stateless. In each subsequent request, the token is passed in the request for server-side validation. This token isn't encrypted; it's encoded. On the server, the token is decoded to access its information. To send the token on subsequent requests, the token is saved in the browser's local storage. This design prevents CSRF vulnerability as the token is stored in the browser's local storage. CSRF is a concern when the token is stored in a cookie.

## Authorization Fundamentals
Users must also be authorized (allowed) to complete any request. During authorization, the APS Engine uses values from the request context to check for policies that apply to the request. It then uses the policies to determine whether to allow or deny the request. Most policies are stored in the ABS as ABM Records and specify the permissions for principal entities. There are several types of policies that can affect whether a request is authorized. To provide your users with permissions to access any layer of the Alliance Business Suite, you need only identity-based ABM records. Resource-based policies are popular for granting cross-account access. The other policy types are advanced features and should be used carefully.

The APS Engine checks each policy that applies to the context of any given request. If a single permissions policy is missing, a denied action will be returned, APS denies the entire request and stops evaluating. This is called an explicit deny. Because requests are denied by default, APS authorizes your request only if every part of your request is allowed by the applicable permissions policies. The evaluation logic for a request within a single account follows these general rules:

- By default, all requests are denied. (In general, requests made using the ABS root user credentials for resources in the instance are always allowed.)

- An explicit allow in any permissions policy (identity-based or resource-based) overrides this default.

- The existence of a Parent Tenant' IAM permissions boundary or a session policy overrides the allow. If one or more of these policy types exists, they must all allow the request. Otherwise, it is implicitly denied.

- An explicit deny in any policy overrides any allows.

To learn more about how all types of policies are evaluated, please refer to Authorization evaluation logic. If you need to make a request in a different account, a policy in the other account must allow you to access the resource, and the Identity Entity that you use to make the request must have an identity-based policy that allows the request.


### Security Permissions
After your request has been authenticated and authorized, the Alliance Passport Service approves the actions or operations in your request. Operations are defined by service and include things that you can do to a resource, such as reading, creating, editing, and deleting that resource. For example, APS supports approximately 40 actions for a user resource, including the following actions:

- CreateUser
- DeleteUser
- GetUser
- UpdateUser

To allow an **Identity Holder** to perform an operation, you must include the necessary actions in a policy that applies to the principal or the affected resource. To see a list of actions, resource types, and condition keys supported by each service, refer to Actions, Resources, and Permissions for ABS Services.

# Resources
After the Alliance Passport Service Engine approves the operations in your request, it can be performed on the related resources within your account. A resource is an object that exists within an Alliance Business Suite instance. Examples include a Financial Account Record in the ABM, an IAM user, and a Storage File. The service defines a set of actions that can be performed on each resource through its exposed API Methods through either the REST Application Programming Interface or a GUI, like the Alliance Business Studio or a Portal. If you create a request to perform an unrelated action on a resource, that request is denied. For example, if you request to delete an IAM role but provide an IAM group resource, the request fails. Please refer to the `BusinessPermission` tables that identify which resources are affected by an action, see Actions, Resources, and Business Permissions for Alliance Business Suite Resources.




















