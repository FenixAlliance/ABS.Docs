# Locations service

The Locations service lets you keep the addresses your workspace uses, such as sender, return and shipping addresses, and the addresses attached to a wallet.

**Who uses it:** developers who sync addresses with a workspace, or who let customers manage the addresses in their wallet.

**Base route:** `/api/v2/LocationsService/...`

## What you can do

- **Manage workspace locations:** list, count, create, update and delete the locations of your workspace.
- **Manage wallet locations:** list, count, create, update and delete the locations attached to a wallet.
- Orders use locations as their billing and shipping addresses. See [Orders](~/Modules/Sales-Hub/Sales-Records/Orders.md).

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace location call. Wallet location calls take it too when you manage a workspace's wallet; a signed-in user managing their own wallet sends none.
- **Permissions:** `locations_read`, `locations_create`, `locations_update` and `locations_delete` for workspace calls. A signed-in user managing their own wallet's locations needs only sign-in.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `LocationsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## Locations

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LocationsService/Locations` | `locations_read` | Workspace member | Get Locations |
| POST | `/api/v2/LocationsService/Locations` | `locations_create` | Workspace member | Create Location |
| GET | `/api/v2/LocationsService/Locations/count` | `locations_read` | Workspace member | Get Locations Count |
| GET | `/api/v2/LocationsService/Locations/wallet/{walletId}` | `locations_read` | Signed-in user, or workspace member with a workspace | Get Wallet Locations |
| POST | `/api/v2/LocationsService/Locations/wallet/{walletId}` | `locations_create` | Signed-in user, or workspace member with a workspace | Create Wallet Location |
| GET | `/api/v2/LocationsService/Locations/wallet/{walletId}/count` | `locations_read` | Signed-in user, or workspace member with a workspace | Get Wallet Locations Count |
| GET | `/api/v2/LocationsService/Locations/wallet/{walletId}/{locationId}` | `locations_read` | Signed-in user, or workspace member with a workspace | Get Wallet Location |
| PUT | `/api/v2/LocationsService/Locations/wallet/{walletId}/{locationId}` | `locations_update` | Signed-in user, or workspace member with a workspace | Update Wallet Location |
| PATCH | `/api/v2/LocationsService/Locations/wallet/{walletId}/{locationId}` | `locations_update` | Signed-in user, or workspace member with a workspace | Patch a wallet location |
| DELETE | `/api/v2/LocationsService/Locations/wallet/{walletId}/{locationId}` | `locations_delete` | Signed-in user, or workspace member with a workspace | Delete Wallet Location |
| GET | `/api/v2/LocationsService/Locations/{locationId}` | `locations_read` | Workspace member | Get Location |
| PUT | `/api/v2/LocationsService/Locations/{locationId}` | `locations_update` | Workspace member | Update Location |
| PATCH | `/api/v2/LocationsService/Locations/{locationId}` | `locations_update` | Workspace member | Patch a location |
| DELETE | `/api/v2/LocationsService/Locations/{locationId}` | `locations_delete` | Workspace member | Delete Location |

Generated from the source at commit 642fb3c3ad.
<!-- generated:end -->
