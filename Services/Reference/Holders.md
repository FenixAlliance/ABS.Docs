# Holders service

The Holders service lets a signed-in person read and manage their own account: profile, settings, memberships, invitations and personal options.

**Who uses it:** apps that act for a signed-in person, such as a personal dashboard or a mobile client.

**Base route:** `/api/v2/Me/...`. One call, a user's public profile, lives under `/api/v2/UsersService/...`.

## What you can do

- **Read and update your profile.** Read your profile and extended profile, update or patch it, and read your avatar. See [Account holders](~/Capabilities/Alliance-Passport-Service/Account-Holders.md).
- **List your workspaces and memberships.** List and count the workspaces you belong to, and read each of your memberships (enrollments). See [Business tenants](~/Capabilities/Alliance-Passport-Service/Business-Tenants.md).
- **Review your invitations.** List the invitations addressed to you and read one before you accept it. An invitation is visible only to the account it is addressed to, or to whoever opens it from the invitation email link. See [Business users](~/Capabilities/Alliance-Passport-Service/Business-Users.md).
- **Keep personal settings and options.** Read and update your settings, and create, read, update and delete personal options by ID or by key.
- **Read what belongs to you.** Read your notifications and their count, your addresses, your cart, your wallet account and your social profile, followers and follows.
- **Check Studio access.** Find out whether your account can open Studio.
- **Show another user's public profile.** Read a user's public name and avatar, and nothing private.

## Before you call it

- **Sign in.** Sign in with `POST /login` (your email address and password) to get an access token, and renew it with `POST /refresh`, or use the OpenID Connect flows. See [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md) and [REST API development](~/Web-API-Development/REST-API-Development.md).
- **No workspace header.** These calls are about your own account, so they do not take an `X-TenantId` header.
- **Permissions.** Any signed-in account can call them. Reading your profile and your memberships also needs `users_read`.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `Me`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## Options

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/Me/Options` |  | Signed-in user | Retrieve a list of user options |
| POST | `/api/v2/Me/Options` |  | Signed-in user | Create a new user option |
| GET | `/api/v2/Me/Options/Count` |  | Signed-in user | Get the count of user options |
| GET | `/api/v2/Me/Options/Key/{key}` |  | Signed-in user | Retrieve a single user option by its key |
| PUT | `/api/v2/Me/Options/Upsert/{key}` |  | Signed-in user | Create or update a user option by key |
| GET | `/api/v2/Me/Options/{optionId}` |  | Signed-in user | Retrieve a single user option by its ID |
| PUT | `/api/v2/Me/Options/{optionId}` |  | Signed-in user | Update a user option |
| PATCH | `/api/v2/Me/Options/{optionId}` |  | Signed-in user | Patch a user option |
| DELETE | `/api/v2/Me/Options/{optionId}` |  | Signed-in user | Delete a user option |

## StudioAccess

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/Me/StudioAccess` |  | Signed-in user | Get the current user's Studio access |

## UserPublicProfiles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/UsersService/Users/{userId}/PublicProfile` |  | Signed-in user | Get a user's public profile |

## Users

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/Me` | `users_read` | Signed-in user | Gets the current user |
| PUT | `/api/v2/Me` |  | Signed-in user | Update the current user's profile |
| PATCH | `/api/v2/Me` |  | Signed-in user | Partially update the current user's profile |
| GET | `/api/v2/Me/Addresses` |  | Checked by the service | Get the list of addresses for the current user |
| GET | `/api/v2/Me/Avatar` |  | Signed-in user, Public | Get the current user's avatar |
| GET | `/api/v2/Me/Cart` |  | Signed-in user | Get the current user's cart |
| GET | `/api/v2/Me/Enrollments` | `users_read` | Signed-in user | Get the list of enrollments for the current user |
| GET | `/api/v2/Me/Enrollments/Extended` |  | Signed-in user | Get the list of enrollments for the current user |
| GET | `/api/v2/Me/Enrollments/{enrollmentId}` |  | Signed-in user | Get a single TenantEnrollment by its ID |
| GET | `/api/v2/Me/Extended` |  | Signed-in user | Get the current user's extended profile |
| GET | `/api/v2/Me/Followers` |  | Signed-in user | Get the social profiles that follow the current user |
| GET | `/api/v2/Me/Followers/Count` |  | Signed-in user | Count the social profiles that follow the current user |
| GET | `/api/v2/Me/Follows` |  | Signed-in user | Get the social profiles that the current user follows |
| GET | `/api/v2/Me/Follows/Count` |  | Signed-in user | Count the social profiles that the current user follows |
| GET | `/api/v2/Me/Invitations` |  | Signed-in user | Get the list of tenant enrollment invitations for the current user |
| GET | `/api/v2/Me/Invitations/{invitationId}` |  | Signed-in user | Get one tenant enrollment invitation for the current user |
| GET | `/api/v2/Me/Notifications` |  | Signed-in user | Get the list of notifications for the current user |
| GET | `/api/v2/Me/Notifications/Count` |  | Signed-in user | Count the notifications for the current user |
| GET | `/api/v2/Me/Settings` |  | Signed-in user | Get the settings for the current user |
| PUT | `/api/v2/Me/Settings` |  | Signed-in user | Update the settings for the current user |
| GET | `/api/v2/Me/SocialProfile` |  | Signed-in user | Get the current user's social profile |
| GET | `/api/v2/Me/Tenants` |  | Signed-in user | Get the tenants that the current user is enrolled in |
| GET | `/api/v2/Me/Tenants/Count` |  | Signed-in user | Count the tenants that the current user is enrolled in |
| GET | `/api/v2/Me/Tenants/Extended` |  | Signed-in user | Get the tenants that the current user is enrolled in |
| GET | `/api/v2/Me/Wallet` |  | Signed-in user | Get the current user's billing profile |

Generated from the source at commit 05da3e4078.
<!-- generated:end -->
