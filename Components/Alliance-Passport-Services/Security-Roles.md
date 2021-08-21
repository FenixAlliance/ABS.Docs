# Security Roles
---

When an identity is created it may belong to one or more roles. For example, Daniel may belong to the Administrator and User roles, while Ana may only belong to the User role. 

How these roles are created and managed depends on the backing store of the authorization process. Roles are exposed to the developer through the IsInRole method on the `IAuthService` class.

You can use roles to delegate access to APS Identities like Account Holders, applications, or services that don't normally have access to your ABS resources. For example, you might want to grant users in your Alliance Business Suite instance access to resources they don't usually have, or grant users in one server instance access to resources in another instance. Or you might want to allow a mobile app to use Alliance Business Suite resources, but not want to embed access keys within the app (where they can be difficult to rotate and where users can potentially extract them). Sometimes you want to give access to users who already have identities defined outside of your server instance, such as in your corporate directory. Or, you might want to grant access to your account to third parties so that they can perform an audit on your resources.

For these scenarios, you assign them a Security Role that provides the permissions they need. For example, you can assign roles to allow adding or changing users, resetting user passwords, managing user licenses or managing domain names.

## Default Account Holder permissions

In [Alliance Passport Services ](/Components/Alliance-Passport-Services.md), every Account Holder is granted a set of default permissions. An Account Holder’s access consists of the type of user, their role assignments, and their ownership of individual records. This article describes those default permissions and contains a comparison of the member and guest user defaults. The default user permissions can be changed only in user settings in [Alliance Business Studio](/Components/Alliance-Business-Studio.md).

## Member and Guest Account Holders

The set of default permissions received depends on whether the user is a native member of the tenant (member user) or if the user is unrelated to the acting tenant or brought over from another tenant as a guest (guest user). 


