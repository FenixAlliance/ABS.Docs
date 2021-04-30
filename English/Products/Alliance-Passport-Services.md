---
description: >-
  Welcome to the open-source documentation on the Alliance Passport Services Layer.
  Please review this README file to understand how you can get the most out of your Account Holder Credentials.
---

## How to get started?

The Alliance Business Suite enables developers and non-developers alike to easily configure and manage security. The Alliance Passport Services Engine contains features for managing authentication, authorization, data protection, HTTPS enforcement, app secrets, XSRF/CSRF prevention, and CORS management. These security features allow you to build robust yet secure Alliance Business Suite apps.

## Alliance Business Suite security features

The Alliance Business Suite provides many tools and libraries to secure your apps including built-in identity providers, MFA TOTP (Time-based One-time Password Algorithm) support, but you can use third-party identity services such as Facebook, Twitter, and LinkedIn, or even enterprise services such as Azure AD, Azure AD B2C, and AWS Cognito (preview). With the Alliance Business Suite, you can easily manage app secrets, which are a way to store and use confidential information without having to expose it in the code.

## Authentication vs. Authorization
Authentication is a process in which a user provides credentials that are then compared to those stored by an operating system, database, app, or resource. If they match, users are authenticated successfully, and can then perform actions that they're authorized for, during an authorization process. The authorization refers to the process that determines what a user is allowed to do.

Another way to think of authentication is to consider it as a way to enter a space, such as a server, database, app, or resource, while authorization is which actions the user can perform to which objects inside that space (server, database, or app).

## Understanding how APS works
Before you create Account Holders or businessesTenants, you should understand how APS enables IAM workflows. 

**Alliance Passport Services** (commonly known as "**APS**") is an Identity Engine that provides the infrastructure necessary to control authentication and authorization for the Alliance Business Suite. 

The **Identity and Access Management** Module ("**IAM**") is an extension built on top of the Alliance Passport Services Framework to allow users and applications to connect to certain Alliance Business Suite instances.

The IAM infrastructure includes the following elements:


## Common Terms
Learn more about APS + IAM terms.

**Resources**
The SecurityGroup, SecurityRole, BusinessPermission, and IdentityProvider objects are stored in ABM. As with other ABM entities, you can add, edit, and remove resources from IAM.

**Identities**
They refer to the IAM resource objects that are used to identify and group. You can attach a SecurityRole or a BusinessPermission to an IAM identity. These include BusinessProfileRecords, SecurityGroups, and SecurityRoles.

**Identity Entities**
The IAM resource objects that APS uses for authentication. These include AccountHolders, federated users, and assumed IAM roles (like when an application created by an AccountHolder tries to access resources through one of the API endpoints).

**Identity Holders**
A person or application that uses the ABS Account Holder entity, like the root Holder, an IAM user, or an IAM Application to sign in and make requests to the Alliance Business Platform's APIs.


## Account Holder

An Account Holder is a person or application that can make a request for an action or operation on an ABM resource. The principal is authenticated as the ABS account root user or an IAM entity to make requests to any Alliance Business Platform API. As a best practice, do not use your root user credentials for your daily work. Instead, create IAM entities (holders and roles). You can also support federated users or programmatic access to allow an application to access your ABS instance.


Authentication
A principal must be authenticated (signed in to the Alliance Business Suite) using their credentials to send a request to any Alliance Business Platform API. Some services, such as ABS Portals, ICX Stores, and ABS Workplace, allow a few requests from anonymous users. However, they are the exception to the rule.

To authenticate from the console as a root user, you must sign in with your email address and password. As an IAM user, you can set up multi-factor authentication through an authenticator app such as Google Authenticator, Microsoft Authenticator, or really any MFA TOTP (Time-based One-time Password Algorithm) application. To authenticate from the API or ABS Commander CLI (Bash or Powershell), you must create and provide an access key and secret key. You might also be required to provide additional security information. For example, Fenix Alliance recommends that you use multi-factor authentication (MFA) to increase the security of your account. To learn more about the IAM entities that the Alliance Passport Service can authenticate, see IAM Identity Holders and IAM Security Roles.

Authorization
You must also be authorized (allowed) to complete your request. During authorization, the APS Engine uses values from the request context to check for policies that apply to the request. It then uses the policies to determine whether to allow or deny the request. Most policies are stored in the ABS as ABM Records and specify the permissions for principal entities. There are several types of policies that can affect whether a request is authorized. To provide your users with permissions to access any layer of the Alliance Business Suite, you need only identity-based ABM records. Resource-based policies are popular for granting cross-account access. The other policy types are advanced features and should be used carefully.

The APS Engine checks each policy that applies to the context of any given request. If a single permissions policy is missing, a denied action will be returned, APS denies the entire request and stops evaluating. This is called an explicit deny. Because requests are denied by default, APS authorizes your request only if every part of your request is allowed by the applicable permissions policies. The evaluation logic for a request within a single account follows these general rules:

- By default, all requests are denied. (In general, requests made using the ABS root user credentials for resources in the account are always allowed.)

- An explicit allow in any permissions policy (identity-based or resource-based) overrides this default.

- The existence of a Parent Organizations' IAM permissions boundary or a session policy overrides the allow. If one or more of these policy types exists, they must all allow the request. Otherwise, it is implicitly denied.

- An explicit deny in any policy overrides any allows.

To learn more about how all types of policies are evaluated, please refer to Authorization evaluation logic. If you need to make a request in a different account, a policy in the other account must allow you to access the resource, and the IAM entity that you use to make the request must have an identity-based policy that allows the request.


## Security Permissions
After your request has been authenticated and authorized, AWS approves the actions or operations in your request. Operations are defined by service and include things that you can do to a resource, such as viewing, creating, editing, and deleting that resource. For example, APS supports approximately 40 actions for a user resource, including the following actions:

- CreateUser

- DeleteUser

- GetUser

- UpdateUser

To allow an **Identity Holder** to perform an operation, you must include the necessary actions in a policy that applies to the principal or the affected resource. To see a list of actions, resource types, and condition keys supported by each service, refer to Actions, Resources, and Permissions for ABS Services.

# Resources
After the Alliance Business Platform approves the operations in your request, it can be performed on the related resources within your account. A resource is an object that exists within an Alliance Business Suite instance. Examples include a Financial Account Record in the ABM, an IAM user, and a Storage File. The service defines a set of actions that can be performed on each resource through its exposed API Methods through either the REST Application Programming Interface or a GUI, like the Alliance Business Studio or a Portal. If you create a request to perform an unrelated action on a resource, that request is denied. For example, if you request to delete an IAM role but provide an IAM group resource, the request fails. Please refer to the BusinessPermission tables that identify which resources are affected by an action, see Actions, Resources, and Business Permissions for the ABS Resources.




















