<!-- generated:start -->
# Locations service reference

> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `LocationsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## Locations

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LocationsService/Locations` | `locations_read` | Workspace member | Get Locations |
| POST | `/api/v2/LocationsService/Locations` | `locations_create` | Workspace member | Create Location |
| GET | `/api/v2/LocationsService/Locations/count` | `locations_read` | Workspace member | Get Locations Count |
| GET | `/api/v2/LocationsService/Locations/wallet/{walletId}` | `locations_read` | Workspace member | Get Wallet Locations |
| POST | `/api/v2/LocationsService/Locations/wallet/{walletId}` | `locations_create` | Workspace member | Create Wallet Location |
| GET | `/api/v2/LocationsService/Locations/wallet/{walletId}/count` | `locations_read` | Workspace member | Get Wallet Locations Count |
| GET | `/api/v2/LocationsService/Locations/wallet/{walletId}/{locationId}` | `locations_read` | Workspace member | Get Wallet Location |
| PUT | `/api/v2/LocationsService/Locations/wallet/{walletId}/{locationId}` | `locations_update` | Workspace member | Update Wallet Location |
| PATCH | `/api/v2/LocationsService/Locations/wallet/{walletId}/{locationId}` | `locations_update` | Workspace member | Patch a wallet location |
| DELETE | `/api/v2/LocationsService/Locations/wallet/{walletId}/{locationId}` | `locations_delete` | Workspace member | Delete Wallet Location |
| GET | `/api/v2/LocationsService/Locations/{locationId}` | `locations_read` | Workspace member | Get Location |
| PUT | `/api/v2/LocationsService/Locations/{locationId}` | `locations_update` | Workspace member | Update Location |
| PATCH | `/api/v2/LocationsService/Locations/{locationId}` | `locations_update` | Workspace member | Patch a location |
| DELETE | `/api/v2/LocationsService/Locations/{locationId}` | `locations_delete` | Workspace member | Delete Location |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
