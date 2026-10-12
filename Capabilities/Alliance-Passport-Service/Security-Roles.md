---
description: >-
  Security roles are named sets of permissions that you grant to workspace members. Use the built-in roles or create your own.
---

# Security roles

A security role is a named set of permissions that you grant to members of a workspace.

**Who it is for:** workspace owners and administrators who decide what each member can do.

**Availability:** in Studio, under your workspace's **Security** > **Security Roles**. Creating a role requires the Create security roles permission. Changing a role's permissions, or granting a role to a member, requires Manage security roles, and deleting a role requires Delete security roles.

## How roles work

- A role contains permissions. A member who holds the role can do everything those permissions allow in that workspace.
- A member can hold several roles. Their access is everything their roles and their direct permissions grant together.
- Roles only add access. Holding a role never takes away anything another role grants.
- A role applies only in the workspace where it is granted. The same person can hold different roles in different workspaces.
- Roles can also be granted to [application identities](../Alliance-Passport-Service.md#application-identities), so automated work gets only the access you choose.

## Built-in roles

Every workspace includes a catalog of built-in roles. Their names end in **(System)**, and the role details show **Is System Security Role**. You grant built-in roles, but you cannot change their permissions or delete them.

| Group | Roles | Use them for |
|---|---|---|
| Owner and administrators | Business Owner, Global Admin, Security Admin | Full or security-wide administration of the workspace. The person who creates a workspace holds Business Owner. |
| Baseline | Tenant Member | Every person who joins by invitation. It lets them open Studio and use workspace conversations, and nothing more. |
| Department managers | For example Finance Manager, Sales Manager, HR Manager, Logistics Manager, Marketing Manager, Procurement Manager | Full control of one area of the business. |
| Department viewers | For example Finance Viewer, Sales Viewer, HR Viewer, Logistics Viewer | Read-only access to one area. |
| Specialists | For example Accountant, Sales Representative, Cashier, Billing Clerk, Warehouse Operator, Instructor, Recruiter | The tasks of one job. |
| Portals, stores and support | For example Portal Author, Portal Editor, Store Manager, Store Customer, Support Agent | Access to your portals, stores and support desk. |

The **Security Roles** page lists the full catalog. Open a role to see the permissions it contains.

## Create a custom role

1. In Studio, open your workspace and go to **Security** > **Security Roles**.
2. Select **Add Role**.
3. Enter a **Name** and, optionally, a **Description**.
4. Select **Create**.
5. Open the new role from the list and check the permissions it should contain.

A custom role belongs to the workspace that created it. Other workspaces never see it.

## Role details

Open a role from the list to see:

- the permissions the role contains;
- the application identities that hold it;
- the members that hold it.

You can delete a custom role from its details page with **Delete**. Built-in roles cannot be deleted.

## Grant a role to a member

You grant roles from the member's membership page. See [Grant roles and permissions to a member](Business-Users.md#grant-roles-and-permissions-to-a-member).

No one can grant a built-in role to their own membership. Every grant and revocation is recorded in the workspace's **Security Logs**.

Managing security roles and permissions is full administrative control of the workspace. Give it only to the people you trust as administrators.

## Related

- [Business permissions](Business-Permissions.md)
- [Business users](Business-Users.md)
