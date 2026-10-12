---
description: >-
  Invite people to a workspace, then grant each member the roles and permissions they need.
---

# Business users

A business user is a person who belongs to a workspace. You invite people by email, and each person who accepts gets a membership that carries their roles and permissions in that workspace.

**Who it is for:** workspace owners and administrators who manage who can do what.

**Availability:** in Studio, in the workspace's **Enrollments** pages. Inviting people requires the Manage tenants permission. Granting roles requires Manage security roles, and granting individual permissions requires Manage security permissions. The Business Owner and Global Admin roles include all three.

## Accounts and memberships

An account identifies a person across the whole instance. A membership, shown in Studio as an enrollment, connects that account to one workspace.

- An account with no membership in your workspace can do nothing in it.
- One account can hold memberships in several workspaces, each with different access.
- Roles and permissions are granted to the membership, so access in one workspace never carries over to another.

## Invite a person

1. In Studio, open your workspace and go to its **Create User Enrollment** page. From any member's details page, select **Add new user** to reach it.
2. Under **Invite a User to** your workspace, type or paste the person's email address.
3. Select **Create Invitation**. The person receives an email with the invitation.

The page lists **Your Invitations**. To withdraw an invitation that has not been accepted, select **Delete** next to it.

## Accept an invitation

1. Sign in, or create an account with the email address the invitation was sent to.
2. In Studio, open **Me** > **Invitations**.
3. Under **My Enrollment Invitations**, select **Accept**, or **Decline** if you do not want to join.

Only the person the invitation was sent to can accept it. When they accept, they join the workspace with the Tenant Member role, which lets them open Studio and use workspace conversations. Everything else needs a role or permission an administrator grants. The person who sent the invitation receives an email when it is accepted.

## Invitations from a verified domain

When your workspace has a verified email domain, under its **Security** > **Domains**, a person who signs in with an address on that domain receives an invitation to your workspace automatically. They still choose whether to accept it. An unverified domain never produces invitations.

## Grant roles and permissions to a member

1. In Studio, open your workspace's **Enrollments** page.
2. Find the member under **User Enrollments** and select **View**.
3. On **Edit Enrollment**, the **Roles** grid lists the workspace's roles. Check a role to grant it, or clear it to revoke it.
4. The **Permissions** grid works the same way for individual permissions.

A role is usually the better choice: you maintain the set of permissions once, in the role, and every member who holds it follows. See [Security roles](Security-Roles.md) and [Business permissions](Business-Permissions.md).

## Rules that protect access

- **You cannot grant built-in access to yourself.** No one can grant a built-in role or permission to their own membership. Another administrator must do it. Managing security roles and permissions is full administrative control of the workspace. Give it only to the people you trust as administrators.
- **Built-in roles stay as they are.** You grant built-in roles, but you cannot change which permissions they contain.
- **Every change is recorded.** Each role or permission granted to or revoked from a member is written to the workspace's **Security Logs**, with who made the change and when.
- **A disabled membership cannot act.** The **User Enrollments** list shows which memberships are the owner, an administrator or disabled. A disabled membership keeps its history but cannot act in the workspace.

## Positions

Positions describe your organization chart. In Studio, your workspace's **Organization** > **Positions** lists them. You manage who holds a position through the HR API.

- A position can belong to a department, which is optional and can be changed later.
- A position has a capacity, the number of people who can hold it at the same time. The capacity is at least 1, and it cannot be lowered below the number of seats currently held.
- A person holds at most one seat on the same position, and a new assignment is refused when every seat is filled.
- Each assignment records when it starts and ends, and ended assignments are kept as history.
- A position cannot be deleted while someone holds it.

Holding a position grants no permissions. Access always comes from roles and permissions on the membership.

## Related

- [Alliance Passport Service](../Alliance-Passport-Service.md)
- [Business tenants](Business-Tenants.md)
- [Workforce](../Workforce.md)
