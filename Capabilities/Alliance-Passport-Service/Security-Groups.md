# Security Groups

There are two forms of common security identities in Alliance Passport Services: Account Holders and Business Tenants. These accounts represent an entity (a person or an organization). 

Account Holders can also be used as dedicated service accounts for some applications. Security groups are used to collect user accounts, service accounts, and other groups into manageable units.

Security groups can provide an efficient way to assign access to resources on your Alliance Business Suite. By using security groups, you can:

## Assign Business Permissions to security groups.

Business Permissions can be assigned to a security group to determine what members of that group can do within the scope of a Business Tenant. Business Permissions are automatically assigned to some security groups when the Alliance Business Suite is installed to help administrators define a person’s administrative role.

For example, a user who is added to the `Global Administrators` group in Alliance Passport Services has the ability to access the Alliance Business Studio Manager. This is possible because, by default, the Business Permission `studio_access` is automatically assigned to the `Global Administrators` group through the "Admin" Security Role being assigned to that group. Therefore, members of this group inherit the Business Permissions that are assigned to that Security Group.

You can use Group Policy to assign user rights to security groups to delegate specific tasks. For more information about using Group Policy, see User Rights Assignment.

## Assign Roles to security groups.

Like Business Permissions, Security Roles are assigned to Identities to grant access to certain resources. Business Permissions determine who can access the resource and the level of access, such as Full Control. 

A Security Role is a group of permissions that grant access to various levels of access, such as the Account Operators Role or the Domain Admins group. When assigning permissions for resources to a Security Role, administrators assign those permissions to a Security Role rather than to individual users. 

The permissions are assigned once to the Security Role, instead of several times to each individual user. Each account that is added to a Security Role receives the Business Permissions that are assigned to that Security Role in Alliance passport Services, and the user receives the permissions that are defined for that group.

Security groups can be assigned with an Email Address so that sending an email message to the group forwards the message to all the members of the group.