# Introduction to Account Holder Entities

An Account Holder is a CredentialsPrincipal for the APS Engine. It represents a human user identified by a username/password. (Unless using some kind of federated identity service like Azure Active Directory, Google, Facebook, Microsoft Identity, etc...)

The "Credentials" aspect of APS Identity and Access Management (IAM) helps you with the question "Who is that user?", often referred to as authentication. Instead of sharing your root user credentials with others, you can create individual Account Holders within your instance that correspond to users in your organization. 

In the following figure, the users Sebastien, Fernando, Camila, Alejandro, Ana, and Julianna have been added to a single ABS Instance. Each Account Holder will have their own credentials.

## First-time access only: Your root user credentials
When you create an ABS Instance, you create an APS Account Holder root identity, which you will use to sign in to the instance. You can sign in to the ABS Studio and the ABS Portal Admin using this root user identity; that is, the email address and password that you provided when installing the instance. This combination of your email address and password is also called your root user credentials.

When you use your root user credentials, you have complete, unrestricted access to all resources in your ABS instance, including access to your billing and licensing information and the ability to change your password and set multi-factor authentication. This level of access is necessary when you first set up your account. However, **we recommend that you don't use root user credentials for everyday access**. We especially recommend that you do not share your root user credentials with anyone because doing so gives them unrestricted access to your instance. Only service control policies (SCPs) in tenants can restrict the permissions that are granted to the root user.

We recommend that you create an Account Holder for yourself and then assign yourself administrative permissions for your account. You can then sign in as the new user to add more users and transact over resources as needed.

The following sections explain how you can use APS to create and manage user identity and permissions to provide secure, limited access to your ABS instance, both for yourself and for others who need to work with your ABS instance.

# Create an Account Holder

## Creating an Account through a local account.
------------------------------ ----------------------
Account Holders are not unrelated records; they are users within your ABS Portals, Contacts within your CRM, Students within your LMS, Account Owners within your Accounting Management Engine, Business Employees within a given Business Tenant, and much more.

Each Account Holder can have their own password for access to the ABS. You can also create an individual access key for each user so that the user can make programmatic requests to work with resources in your account. 

By default, ABS Portals are configured to allow Guest Users and Customer Users. These Guest Users are unauthenticated portal visitors granted with a limited set of permissions, like `store_read`, `cart_view`, `cart_update`, while Customer Accounts are allowed for more extensive permissions such as `account_read`, `account_delete`, `account_update`, `wallet_read`, and others.

If the Enable New User Option is marked to true, Guest Users can quickly create and manage their Account Holder credentials by themselves. The APS Engine is configured to allow local or federated accounts by enabling and configuring additional identity providers such as Google, Facebook, Microsoft, LinkedIn, Twitter, and more.


![When creating a local account, you will be asked to verify your email address through a code.](/.attachments/image-79a1abf3-4957-4c4f-aae8-5df764ebcc72.png)

The IAM module contains all the access logic to the Alliance ID account, It is composed of roles capable of assuming a certain set of permissions to act on behalf of a Business Tenant.

![image.png](/.attachments/image-e958c1ab-1f3e-4219-9b64-36df68784c32.png)

## Federating existing users
If the users in your organization already have a way to be authenticated, such as by signing in to your corporate network, you don't have to create separate IAM users for them. Instead, you can federate those user identities into the APS Engine.

**Federation is particularly useful in these cases:**

**Your users already have identities in a corporate directory**: If your corporate directory is compatible with Security Assertion Markup Language 2.0 (SAML 2.0), you can configure your corporate directory to provide single-sign-on (SSO) access to the APS Engine for your users. For more information, refer to Common scenarios for temporary credentials.

If your corporate directory is not compatible with SAML 2.0, you can create an identity broker extension to provide single-sign-on (SSO) access to the APS Engine for your users. For more information, see Enabling custom identity broker access into an ABS Instance.

If your corporate directory is Microsoft Active Directory, you can use Azure Active Directory to establish trust between your corporate directory and your ABS instance.

**Your users already have Internet identities**: If you are creating a mobile app or web-based app that can let users identify themselves through an Internet identity provider like Login with Amazon, Facebook, Google, or any OpenID Connect (OIDC) compatible identity provider, the app can use federation to access ABS resources. For more information, see About web identity federation.

## Enabling supported identity providers

To enable an external identity provider into your Alliance Business Suite instance you'll need to use the following topics to configure your instance to use the respective providers:

![image.png](/.attachments/image-34197a3a-8c2d-4234-88c4-f882cb4ed7ba.png)

### Optionally set password
When you register with an external login provider, you don't have a password registered with the app. This alleviates you from creating and remembering a password for the site, but it also makes you dependent on the external login provider. If the external login provider is unavailable, you won't be able to sign in to the website.

To create a password and sign in using your email that you set during the sign-in process with external providers:
Select the Hello <email alias> link at the top-right corner to navigate to the Manage view.


### Creating your Alliance ID through an identity provider: \(e.g. Amazon, Facebook, LinkedIn, Google...\)
------------------------------------------------------------ -------------------------------------------
If you don’t already have an Alliance ID account, you can get it for free by using those accounts that you already own and use \(like your social media accounts\). For this matter, you will need to select the identity provider of your choice when you [create your Account Holder](https://fenixalliance.com.co/Account/SignIn). 


You will need to log in to your Alliance ID account through your chosen identity provider to get access to your account and resources.

![Enabled Identity Providers](/.attachments/image-a85a71aa-0553-47b3-bde4-0f2a7cb8b220.png)