# Security Roles
---

When an identity is created it may belong to one or more roles. For example, Daniel may belong to the Administrator and User roles, while Ana may only belong to the User role. 

How these roles are created and managed depends on the backing store of the authorization process. Roles are exposed to the developer through the IsInRole method on the `IAuthService` class.

If another administrator or non-administrator needs to manage ABS resources, you assign them a Security role that provides the permissions they need. For example, you can assign roles to allow adding or changing users, resetting user passwords, managing user licenses or managing domain names.

## Default user permissions

In Alliance Passport Services (APS), all users are granted a set of default permissions. A user’s access consists of the type of user, their role assignments, and their ownership of individual records. This article describes those default permissions and contains a comparison of the member and guest user defaults. The default user permissions can be changed only in user settings in [Alliance Business Studio](/Components/Alliance-Business-Studio.md).

