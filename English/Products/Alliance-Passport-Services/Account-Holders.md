# Introduction to Account Holder Entities

An Account Holder is a CredentialsPrincipal for the APS Engine. It represents a human user identified by a username/password. (Unless using some kind of federated identity service like Azure Active Directory, Google, Facebook, Microsoft Identity, etc...)

The "Credentials" aspect of APS Identity and Access Management (IAM) helps you with the question "Who is that user?", often referred to as authentication. Instead of sharing your root user credentials with others, you can create individual Account Holders within your instance that correspond to users in your organization. Account Holders are not unrelated accounts; they are users within your root Business Tenant. Each user can have their own password for access to the AWS Management Console. You can also create an individual access key for each user so that the user can make programmatic requests to work with resources in your account. 

In the following figure, the user's Sebastien, Fernando, Camila, Alejandro, Ana, and Julianna have been added to a single ABS Instance. Each Account Holder will have their own credentials.

## First-time access only: Your root user credentials
When you create an ABS Instance, you create an APS Account Holder root identity, which you use to sign in to the instance. You can sign in to the ABS Studio and the ABS Portal Admin using this root user identity; that is, the email address and password that you provided when creating the instance. This combination of your email address and password is also called your root user credentials.

When you use your root user credentials, you have complete, unrestricted access to all resources in your ABS instance, including access to your billing and licensing information and the ability to change your password and set multi-factor authentication. This level of access is necessary when you first set up your account. However, **we recommend that you don't use root user credentials for everyday access**. We especially recommend that you do not share your root user credentials with anyone because doing so gives them unrestricted access to your instance. Only service control policies (SCPs) in tenants can restrict the permissions that are granted to the root user.

The following sections explain how you can use APS to create and manage user identity and permissions to provide secure, limited access to your ABS instance, both for yourself and for others who need to work with your ABS instance.

# Create an Account Holder


## Creating your Account through a local account.
------------------------------ ----------------------
We want to give you options. If you don't want to use or you don't have any social media account, you can go old style and create your Alliance ID Account through your Email address. This will mean that you will need to verify that email address through a code. This will also enable a password for your account, so you will need to provide a strong password to continue with your sign-up process.

![When creating a local account, you will be asked to verify your email address through a code.](/.attachments/image-79a1abf3-4957-4c4f-aae8-5df764ebcc72.png)

 The IAM module contains all the access logic to the Alliance ID account, It is composed of roles capable of assuming a certain set of permissions to act on behalf of a Business Tenant.

![image.png](/.attachments/image-e958c1ab-1f3e-4219-9b64-36df68784c32.png)

## Federating existing users

### Creating your Alliance ID through an identity provider: \(e.g. Amazon, Facebook, LinkedIn, Google...\)
------------------------------------------------------------ -------------------------------------------
If you don’t already have an Alliance ID account, you can get it for free by using those accounts that you already own and use \(like your social media accounts\). For this matter, you will need to select the identity provider of your choice when you [create your Alliance ID](https://fenixalliance.com.co/Account/SignIn). 


You will need to log in to your Alliance ID account through your chosen identity provider to get access to your account and resources.

![Enabled Identity Providers](/.attachments/image-a85a71aa-0553-47b3-bde4-0f2a7cb8b220.png)