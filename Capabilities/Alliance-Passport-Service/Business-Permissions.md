---
description: >-
  Business permissions allow one kind of action on one kind of record in a workspace. Learn how they are named, how they combine and how to grant them.
---

# Business permissions

A business permission allows one kind of action on one kind of record in a workspace, such as reading invoices or creating orders.

**Who it is for:** workspace owners and administrators who fine-tune what members and application identities can do.

**Availability:** in Studio, under your workspace's **Security** > **Security Permissions**. Creating a custom permission requires the Create security permissions permission. Granting a permission directly to a member requires Manage security permissions.

## How permissions are named

Most permissions pair an area of the platform with an action. For each area there is one permission per action:

| Action | What it allows |
|---|---|
| Read | View the records. |
| Create | Add new records. |
| Update | Change existing records. |
| Delete | Remove records. |
| Manage | Everything above. |

For example, the invoices area has Read invoices, Create invoices, Update invoices, Delete invoices and Manage invoices. A few areas have permissions for one specific step instead, such as posting or reversing a journal entry. Studio groups permissions into categories such as Accounting, Sales, Logistics, Organization and Security.

## How permissions combine

- **Manage includes the rest.** A member with Manage invoices can also read, create, update and delete invoices.
- **Every change includes reading.** Create, Update and Delete each include Read for the same area.
- **Roles and direct grants add up.** A member's access is every permission in every role they hold, plus every permission granted to them directly.
- **Nothing is allowed by default.** If no role or direct grant gives a permission, the action is refused.
- **Access stays in its workspace.** Permissions granted in one workspace never apply in another.

Step permissions, such as posting a journal entry, are separate on purpose. Manage journals does not include them, so you decide who can take those steps.

## Grant permissions

Prefer roles. Put the permissions a job needs into a [security role](Security-Roles.md) and grant the role, so every member with that job stays consistent.

When one member needs an exception, grant the permission directly:

1. In Studio, open your workspace's **Enrollments** page.
2. Find the member and select **View**.
3. In the **Permissions** grid on **Edit Enrollment**, check the permission to grant it, or clear it to revoke it.

No one can grant a built-in permission to their own membership. Every grant and revocation is recorded in the workspace's **Security Logs**.

## Built-in and custom permissions

Built-in permissions are marked as system permissions. Every feature of the platform checks built-in permissions, and they cannot be changed.

You can also create a custom permission for your workspace:

1. Go to **Security** > **Security Permissions** and select **Add Permission**.
2. Enter a **Permission Name** and, optionally, a **Description**.
3. Select **Create**.

A custom permission does not unlock any built-in feature. Use it with a custom role when an app or page your organization builds needs its own access check.

## Tokens never carry more than the membership

When an app acts for a signed-in member through [OAuth 2.0 or OpenID Connect](Connect-protocols.md), each request is limited to what the member's membership grants in that workspace. A token can narrow a member's access but never widen it.

## Related

- [Security roles](Security-Roles.md)
- [Business users](Business-Users.md)
