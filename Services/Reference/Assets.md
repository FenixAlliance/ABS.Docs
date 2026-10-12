# Assets service

The Assets service lets you keep a register of the assets your workspace owns, with their history of transfers, repairs, value changes and depreciation.

**Who uses it:** developers who connect asset tracking, maintenance or fixed asset tools to a workspace.

**Base route:** `/api/v2/AssetsService/...`

## What you can do

- **Keep an asset register:** create, update and delete assets, and organize them by category and type.
- **Record transfers:** record when an asset moves, and list the transfers of one asset or of the whole workspace.
- **Record repairs:** keep the repair history of each asset.
- **Record value changes:** keep the value amendments of each asset, and record its depreciation. Depreciation records are entered by you; the platform does not calculate depreciation and does not post it to your accounts.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every call.
- **Permissions:** `assets_read`, `assets_create`, `assets_update` and `assets_delete` for assets, categories, types, repairs, value amendments and depreciation records; `asset_transfers_read`, `asset_transfers_create`, `asset_transfers_update` and `asset_transfers_delete` for transfers.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `AssetsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## AssetCategories

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AssetsService/AssetCategories` | `assets_read` | Workspace member | Gets all asset categories for the current tenant |
| POST | `/api/v2/AssetsService/AssetCategories` | `assets_create` | Workspace member | Creates a new asset category |
| GET | `/api/v2/AssetsService/AssetCategories/count` | `assets_read` | Workspace member | Gets the count of asset categories |
| GET | `/api/v2/AssetsService/AssetCategories/{categoryId}` | `assets_read` | Workspace member | Gets a specific asset category |
| PUT | `/api/v2/AssetsService/AssetCategories/{categoryId}` | `assets_update` | Workspace member | Updates an existing asset category |
| PATCH | `/api/v2/AssetsService/AssetCategories/{categoryId}` | `assets_update` | Workspace member | Partially updates an existing asset category |
| DELETE | `/api/v2/AssetsService/AssetCategories/{categoryId}` | `assets_delete` | Workspace member | Deletes an asset category |
| GET | `/api/v2/AssetsService/Assets/Categories` | `assets_read` | Workspace member | Gets all asset categories |
| POST | `/api/v2/AssetsService/Assets/Categories` | `assets_create` | Workspace member | Creates a new asset category |
| GET | `/api/v2/AssetsService/Assets/Categories/count` | `assets_read` | Workspace member | Gets the count of asset categories |
| GET | `/api/v2/AssetsService/Assets/Categories/{categoryId}` | `assets_read` | Workspace member | Gets a specific asset category |
| PUT | `/api/v2/AssetsService/Assets/Categories/{categoryId}` | `assets_update` | Workspace member | Updates an existing asset category |
| PATCH | `/api/v2/AssetsService/Assets/Categories/{categoryId}` | `assets_update` | Workspace member | Partially updates an existing asset category |
| DELETE | `/api/v2/AssetsService/Assets/Categories/{categoryId}` | `assets_delete` | Workspace member | Deletes an existing asset category |

## AssetTransfers

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AssetsService/AssetTransfers` | `asset_transfers_read` | Workspace member | Gets a list of asset transfers |
| POST | `/api/v2/AssetsService/AssetTransfers` | `asset_transfers_create` | Workspace member | Creates a new asset transfer |
| GET | `/api/v2/AssetsService/AssetTransfers/Count` | `asset_transfers_read` | Workspace member | Gets the count of asset transfers |
| GET | `/api/v2/AssetsService/AssetTransfers/{transferId}` | `asset_transfers_read` | Workspace member | Gets a single asset transfer by ID |
| PUT | `/api/v2/AssetsService/AssetTransfers/{transferId}` | `asset_transfers_update` | Workspace member | Updates an existing asset transfer |
| PATCH | `/api/v2/AssetsService/AssetTransfers/{transferId}` | `asset_transfers_update` | Workspace member | Partially updates an existing asset transfer |
| DELETE | `/api/v2/AssetsService/AssetTransfers/{transferId}` | `asset_transfers_delete` | Workspace member | Deletes an asset transfer |

## AssetTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AssetsService/AssetTypes` | `assets_read` | Workspace member | Gets all asset types for the current tenant |
| POST | `/api/v2/AssetsService/AssetTypes` | `assets_create` | Workspace member | Creates a new asset type |
| GET | `/api/v2/AssetsService/AssetTypes/count` | `assets_read` | Workspace member | Gets the count of asset types |
| GET | `/api/v2/AssetsService/AssetTypes/{typeId}` | `assets_read` | Workspace member | Gets a specific asset type |
| PUT | `/api/v2/AssetsService/AssetTypes/{typeId}` | `assets_update` | Workspace member | Updates an existing asset type |
| PATCH | `/api/v2/AssetsService/AssetTypes/{typeId}` | `assets_update` | Workspace member | Partially updates an existing asset type |
| DELETE | `/api/v2/AssetsService/AssetTypes/{typeId}` | `assets_delete` | Workspace member | Deletes an asset type |

## Assets

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AssetsService/Assets` | `assets_read` | Workspace member | Gets all assets for the current tenant |
| POST | `/api/v2/AssetsService/Assets` | `assets_create` | Workspace member | Creates a new asset |
| GET | `/api/v2/AssetsService/Assets/count` | `assets_read` | Workspace member | Gets the count of assets |
| GET | `/api/v2/AssetsService/Assets/{assetId}` | `assets_read` | Workspace member | Gets a specific asset by ID |
| PUT | `/api/v2/AssetsService/Assets/{assetId}` | `assets_update` | Workspace member | Updates an existing asset |
| PATCH | `/api/v2/AssetsService/Assets/{assetId}` | `assets_update` | Workspace member | Partially updates an existing asset |
| DELETE | `/api/v2/AssetsService/Assets/{assetId}` | `assets_delete` | Workspace member | Deletes an existing asset |
| GET | `/api/v2/AssetsService/Assets/{assetId}/DepreciationRecords` | `assets_read` | Workspace member | Gets depreciation records for a specific asset |
| POST | `/api/v2/AssetsService/Assets/{assetId}/DepreciationRecords` | `assets_create` | Workspace member | Creates a new depreciation record for an asset |
| GET | `/api/v2/AssetsService/Assets/{assetId}/DepreciationRecords/Count` | `assets_read` | Workspace member | Gets count of depreciation records for a specific asset |
| GET | `/api/v2/AssetsService/Assets/{assetId}/DepreciationRecords/{recordId}` | `assets_read` | Workspace member | Gets a specific depreciation record for an asset |
| PUT | `/api/v2/AssetsService/Assets/{assetId}/DepreciationRecords/{recordId}` | `assets_update` | Workspace member | Updates a depreciation record for an asset |
| PATCH | `/api/v2/AssetsService/Assets/{assetId}/DepreciationRecords/{recordId}` | `assets_update` | Workspace member | Partially updates a depreciation record for an asset |
| DELETE | `/api/v2/AssetsService/Assets/{assetId}/DepreciationRecords/{recordId}` | `assets_delete` | Workspace member | Deletes a depreciation record for an asset |
| GET | `/api/v2/AssetsService/Assets/{assetId}/Repairs` | `assets_read` | Workspace member | Gets repairs for a specific asset |
| POST | `/api/v2/AssetsService/Assets/{assetId}/Repairs` | `assets_create` | Workspace member | Creates a new repair for an asset |
| GET | `/api/v2/AssetsService/Assets/{assetId}/Repairs/Count` | `assets_read` | Workspace member | Gets count of repairs for a specific asset |
| GET | `/api/v2/AssetsService/Assets/{assetId}/Repairs/{repairId}` | `assets_read` | Workspace member | Gets a specific repair for an asset |
| PUT | `/api/v2/AssetsService/Assets/{assetId}/Repairs/{repairId}` | `assets_update` | Workspace member | Updates a repair for an asset |
| PATCH | `/api/v2/AssetsService/Assets/{assetId}/Repairs/{repairId}` | `assets_update` | Workspace member | Partially updates a repair for an asset |
| DELETE | `/api/v2/AssetsService/Assets/{assetId}/Repairs/{repairId}` | `assets_delete` | Workspace member | Deletes a repair for an asset |
| GET | `/api/v2/AssetsService/Assets/{assetId}/Transfers` | `asset_transfers_read` | Workspace member | Gets transfers for a specific asset |
| POST | `/api/v2/AssetsService/Assets/{assetId}/Transfers` | `asset_transfers_create` | Workspace member | Creates a new transfer for an asset |
| GET | `/api/v2/AssetsService/Assets/{assetId}/Transfers/Count` | `asset_transfers_read` | Workspace member | Gets count of transfers for a specific asset |
| GET | `/api/v2/AssetsService/Assets/{assetId}/Transfers/{transferId}` | `asset_transfers_read` | Workspace member | Gets a specific transfer for an asset |
| PUT | `/api/v2/AssetsService/Assets/{assetId}/Transfers/{transferId}` | `asset_transfers_update` | Workspace member | Updates a transfer for an asset |
| PATCH | `/api/v2/AssetsService/Assets/{assetId}/Transfers/{transferId}` | `asset_transfers_update` | Workspace member | Partially updates a transfer for an asset |
| DELETE | `/api/v2/AssetsService/Assets/{assetId}/Transfers/{transferId}` | `asset_transfers_delete` | Workspace member | Deletes a transfer for an asset |
| GET | `/api/v2/AssetsService/Assets/{assetId}/ValueAmends` | `assets_read` | Workspace member | Gets value amendments for a specific asset |
| POST | `/api/v2/AssetsService/Assets/{assetId}/ValueAmends` | `assets_create` | Workspace member | Creates a new value amendment for an asset |
| GET | `/api/v2/AssetsService/Assets/{assetId}/ValueAmends/Count` | `assets_read` | Workspace member | Gets count of value amendments for a specific asset |
| GET | `/api/v2/AssetsService/Assets/{assetId}/ValueAmends/{amendId}` | `assets_read` | Workspace member | Gets a specific value amendment for an asset |
| PUT | `/api/v2/AssetsService/Assets/{assetId}/ValueAmends/{amendId}` | `assets_update` | Workspace member | Updates a value amendment for an asset |
| PATCH | `/api/v2/AssetsService/Assets/{assetId}/ValueAmends/{amendId}` | `assets_update` | Workspace member | Partially updates a value amendment for an asset |
| DELETE | `/api/v2/AssetsService/Assets/{assetId}/ValueAmends/{amendId}` | `assets_delete` | Workspace member | Deletes a value amendment for an asset |

Generated from the source at commit 05da3e4078.
<!-- generated:end -->
