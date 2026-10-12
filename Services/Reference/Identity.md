<!-- generated:start -->
# Identity service reference

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
