# Identity service

The Identity service lets an app sign a person in with their email address and password, and find out who is signed in and what they can do.

**Who uses it:** developers who build apps that sign people in to Alliance Business Suite.

**Base route:** `/api/v2/OAuth/...`. A sign-in check lives under `/api/v2/Auth/...`, and the OpenID Connect user information endpoint is `/connect/userinfo`.

## What you can do

- **Sign a person in.** Sign in with an email address and password and receive a token, or check a sign-in without starting a session. An account with two-factor authentication turned on cannot sign in with its password alone; use a browser flow instead. See [Account holders](~/Capabilities/Alliance-Passport-Service/Account-Holders.md).
- **Find out who is signed in.** Read the signed-in person's identity, check whether a request is authenticated, and read the OpenID Connect user information. See [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md).
- **Read a person's permissions.** List the permissions the signed-in person holds in a workspace. See [Business permissions](~/Capabilities/Alliance-Passport-Service/Business-Permissions.md).
- **Discover an app's settings.** Read the OpenID Connect discovery document and the signing keys for a registered app, so your app can check the tokens it receives.

## Machine-to-machine sign-in

From 2.4, the client-credentials endpoint `POST /api/v2/OAuth/Token` is off by default, and there is no replacement for machine-to-machine sign-in in this release. If your integration signs in as a service, contact us before you upgrade. See the [changelog](~/reference/Changelog.md).

## Before you call it

- **Sign in.** Sign in with your email address to get a token, or use the OpenID Connect flows. See [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md) and [REST API development](~/Web-API-Development/REST-API-Development.md).
- **Name the workspace.** Reading your identity or your permissions in a workspace takes the workspace from the `X-TenantId` header or the `tenantId` request value. Sign-in, discovery and signing-key calls need no token.
- **Permissions.** These calls declare no permission. What a token can do afterwards depends on the person's roles and permissions in each workspace.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `OAuth`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## Checker

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/Auth/Checker/IsAuthenticated` |  |  | Check if a particular user is authenticated. |

## OAuth

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/OAuth/Permissions` |  | Workspace member | Get user permissions |
| GET | `/api/v2/OAuth/SignIn` |  | Public | Check password sign-in |
| POST | `/api/v2/OAuth/SignIn` |  | Public | Sign in with password |
| POST | `/api/v2/OAuth/Token` |  | Public | Get OAuth token |
| GET | `/api/v2/OAuth/WhoAmI` |  | Workspace member | Get current user identity |
| GET | `/api/v2/OAuth/{applicationId}/Keys` |  | Public | Gets the signing the keys for a particular application. |
| GET | `/api/v2/OAuth/{tenantId}/{applicationId}/.Well-Known/OpenId-Configuration` |  | Public | Gets OpenID Configuration for a particular application in within the context of a business tenant. |

## Resource

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IdentityService/Resource/message` |  |  | Get authenticated resource message |

## UserInfo

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/connect/userinfo` |  |  |  |
| POST | `/connect/userinfo` |  |  |  |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
