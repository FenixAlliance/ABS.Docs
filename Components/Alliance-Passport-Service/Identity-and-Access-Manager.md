# Identity and Access Manager

The ABP **Identity and Access Manager** (IAM) enables you to manage access to Business Tenant services and resources securely. Using IAM, you can create and manage ABP users and groups, and use permissions to allow and deny their access to Tenant owned resources.

IAM is a feature of the **Alliance Passport Service** offered at no additional charge. You will be charged only for use of other ABS services consumed by your users or ABP Services consumed by your applications.

To get started using IAM you will need to have a Business Tenant. If you have already registered a Business Tenant, go to the ABS Management Console and get started with these **IAM Best Practices**. 

ABP IAM has a list of best practices to help Alliance ID Holders to manage access to Business Tenant resources.

- Users – Create individual users.
- Groups – Manage permissions with groups.
- Permissions – Grant least privilege.
- Auditing – Turn on ABS SecTrail.
- Password – Configure a strong password policy.
- MFA – Enable MFA for privileged users.
- Roles – Use IAM roles for custom integrations.
- Sharing – Use IAM roles to share access.
- Rotate – Rotate security credentials regularly.
- Conditions – Restrict privileged access further with conditions.
- Rooting – Reduce or remove the use of overprivileged users.

## Use cases

### Fine-grained access control to [ABP](/Components/Alliance-Business-Platform.md) resources

IAM enables your users to control access to ABP service APIs and to specific resources. IAM also enables you to add specific conditions such as time of day to control how a user can use ABP, their originating IP address, whether they are using SSL, or whether they have authenticated with a multi-factor authentication device.

### Multi-factor authentication for highly privileged users
Protect your ABP environment by using ABP MFA, a security feature available at no extra cost that augments user name and password credentials. MFA requires users to prove physical possession of a hardware MFA token or MFA-enabled mobile device by providing a valid MFA code.

### Analyze access
IAM helps you analyze access across your ABP environment. Your security teams and administrators can quickly validate that your policies only provide the intended public and cross-account access to your resources. You can also easily identify and refine your policies to allow access to only the services being used. This helps you to better adhere to the principle of least privilege.

### Integrate with your corporate directory
IAM can be used to grant your employees and applications federated access to the ABP Management Console and ABP service APIs, using your existing identity systems such as Microsoft Active Directory. You can use any identity management solution that supports SAML 2.0, or feel free to use one of our federation samples (ABP Console SSO or API federation).

## How it works
IAM assists in creating roles and permissions
ABP IAM allows you to:

- Manage IAM users and their access – You can create users in IAM, assign them individual security credentials (in other words, access keys, passwords, and multi-factor authentication devices), or request temporary security credentials to provide users access to ABP services and resources. You can manage permissions in order to control which operations a user can perform.

- Manage IAM roles and their permissions – You can create roles in IAM and manage permissions to control which operations can be performed by the entity, or ABP service, that assumes the role. You can also define which entity is allowed to assume the role. In addition, you can use service-linked roles to delegate permissions to ABP services that create and manage ABP resources on your behalf.

- Manage federated users and their permissions – You can enable identity federation to allow existing identities (users, groups, and roles) in your enterprise to access the ABP Management Console, call ABP APIs, and access resources, without the need to create an IAM user for each identity. Use any identity management solution that supports SAML 2.0, or use one of our federation samples (ABP Console SSO or API federation).



## Get started with ABP IAM

Step 1 - Sign up for an Alliance ID account

Step 2 - Explore and learn with simple tutorials by instantly get access to the ABS Free Tier.

Step 3 - Accelerate, build and expand your business while taking advantage of being a part of our global Alliance Network.

