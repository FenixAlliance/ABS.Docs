# Security Roles
---

When an identity is created it may belong to one or more roles. For example, Daniel may belong to the Administrator and User roles, while Ana may only belong to the User role. 

How these roles are created and managed depends on the backing store of the authorization process. Roles are exposed to the developer through the IsInRole method on the `IAuthService` class.

# Role Check Process