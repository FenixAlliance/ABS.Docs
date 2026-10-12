---
description: >-
  Alliance Passport Service signs people in to Alliance Business Suite and decides what each person and each application can do in a workspace.
---

# Alliance Passport Service

Alliance Passport Service signs people in to Alliance Business Suite and decides what each of them can do in each workspace.

**Who it is for:** everyone who signs in, workspace owners and administrators who manage access, and developers who connect apps to the platform.

**Availability:** every account uses it. Managing members, roles and permissions in a workspace requires the matching permissions in that workspace, described on each page below. In Studio, a workspace is shown as a tenant.

## How access works

Access in Alliance Business Suite rests on three ideas.

1. **An account identifies a person.** You have one account, identified by your email address. The same account signs you in to Studio and to the portals and stores that run on your instance.
2. **A membership connects an account to a workspace.** A workspace is the organization whose data you work with. Your account can belong to several workspaces, and each membership carries its own access.
3. **Roles and permissions grant actions.** A permission allows one kind of action on one kind of record, such as reading invoices. A role is a named set of permissions. You grant roles and permissions to a membership, never to the account itself.

Access is allow-only. A person can do something in a workspace only when one of their roles or direct permissions grants it. Nothing is allowed by default, and there are no deny rules to manage.

## Signing in

- You sign in with your email address and password. Every email address belongs to exactly one account.
- You can protect your account with [two-factor authentication](Alliance-Passport-Service/Account-Holders/Multi%252Dfactor-Authentication.md) using an authenticator app. When two-factor authentication is on, your password alone never signs you in.
- Repeated failed sign-in attempts lock the account for a few minutes.
- Your instance administrator can also turn on sign-in with external providers, such as Google or Microsoft.
- If you forget your password, you [reset it by email](Alliance-Passport-Service/Account-Holders/Password-Recovery.md).

See [Account holders](Alliance-Passport-Service/Account-Holders.md) for the full sign-in experience.

## Working in a workspace

- **Create a workspace.** Any signed-in account can [create a workspace](Alliance-Passport-Service/Business-Tenants.md) and becomes its owner.
- **Bring people in.** Administrators [invite people](Alliance-Passport-Service/Business-Users.md) by email. A person who accepts joins with a baseline role that lets them open Studio and nothing more.
- **Grant access.** Administrators grant [security roles](Alliance-Passport-Service/Security-Roles.md) and individual [permissions](Alliance-Passport-Service/Business-Permissions.md) to each member.
- **Review changes.** Every role or permission granted to or revoked from a member is recorded in the workspace's security logs.

## Application identities

Automated work that runs inside your workspace, such as connectors and unattended workflow steps, acts under an application identity. An application identity has its own membership, roles and permissions, so it can do only what you grant it. It can never sign in to Studio or to a sign-in page.

Administrators manage application identities in Studio, in the workspace's IAM module, under **Application Principals**. Which modules your workspace can use depends on your plan. There you provision an identity and grant it access. You can suspend an identity to pause the work that depends on it, reinstate it, or disable it to retire it.

## Connecting apps

Apps that act for a signed-in person use OAuth 2.0 and OpenID Connect. The [Connect protocols](Alliance-Passport-Service/Connect-protocols.md) page lists the flows and endpoints.

From 2.4, machine-to-machine sign-in is turned off. The client-credentials endpoint `POST /api/v2/OAuth/Token` is off by default, and the platform has no other way yet for a service to sign in without a user. If your integration signs in as a service, contact us before you upgrade.

## Related

- [Identity and access](Identity-and-Access.md)
- [Changelog](../reference/Changelog.md)
