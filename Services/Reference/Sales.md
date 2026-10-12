# Sales service

The Sales service lets you manage the stores, sales literature and loyalty program records of your workspace from your own applications.

**Who uses it:** developers who connect sales tools, storefront back offices or content systems to a workspace's Sales Hub.

**Base route:** `/api/v2/SalesService/...`

## What you can do

- **Stores:** list, create, update and delete the store records of your workspace.
- **Points of sale:** list, create, update and delete the point of sale records of your workspace.
- **Sales literature:** keep brochures and other sales material in one place, and list it with its extended details.
- **Loyalty programs:** keep loyalty program records. A record names the program and the price list that goes with it. It does not track points or rewards.
- Deal units, quotes and orders have their own services. See [Sales Hub](~/Modules/Sales-Hub.md) for how they fit together.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** each resource has its own read, create, update and delete permission: `stores_*`, `point_of_sales_*`, `sales_literatures_*` and `loyalty_programs_*` (for example `stores_read`).

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `SalesService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## LoyaltyPrograms

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SalesService/LoyaltyPrograms` | `loyalty_programs_read` | Workspace member | Get loyalty programs |
| POST | `/api/v2/SalesService/LoyaltyPrograms` | `loyalty_programs_create` | Workspace member | Create a loyalty program |
| GET | `/api/v2/SalesService/LoyaltyPrograms/Count` | `loyalty_programs_read` | Workspace member | Get loyalty programs count |
| GET | `/api/v2/SalesService/LoyaltyPrograms/{loyaltyProgramId}` | `loyalty_programs_read` | Workspace member | Get loyalty program by ID |
| PUT | `/api/v2/SalesService/LoyaltyPrograms/{loyaltyProgramId}` | `loyalty_programs_update` | Workspace member | Update a loyalty program |
| PATCH | `/api/v2/SalesService/LoyaltyPrograms/{loyaltyProgramId}` | `loyalty_programs_update` | Workspace member | Patch a loyalty program |
| DELETE | `/api/v2/SalesService/LoyaltyPrograms/{loyaltyProgramId}` | `loyalty_programs_delete` | Workspace member | Delete a loyalty program |

## PointOfSales

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SalesService/PointOfSales` | `point_of_sales_read` | Workspace member | Get point of sales |
| POST | `/api/v2/SalesService/PointOfSales` | `point_of_sales_create` | Workspace member | Create a point of sale |
| GET | `/api/v2/SalesService/PointOfSales/Count` | `point_of_sales_read` | Workspace member | Get point of sales count |
| GET | `/api/v2/SalesService/PointOfSales/{pointOfSaleId}` | `point_of_sales_read` | Workspace member | Get point of sale by ID |
| PUT | `/api/v2/SalesService/PointOfSales/{pointOfSaleId}` | `point_of_sales_update` | Workspace member | Update a point of sale |
| PATCH | `/api/v2/SalesService/PointOfSales/{pointOfSaleId}` | `point_of_sales_update` | Workspace member | Patch a point of sale |
| DELETE | `/api/v2/SalesService/PointOfSales/{pointOfSaleId}` | `point_of_sales_delete` | Workspace member | Delete a point of sale |

## SalesLiteratures

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SalesService/SalesLiteratures` | `sales_literatures_read` | Workspace member | Get sales literatures |
| POST | `/api/v2/SalesService/SalesLiteratures` | `sales_literatures_create` | Workspace member | Create a sales literature |
| GET | `/api/v2/SalesService/SalesLiteratures/Count` | `sales_literatures_read` | Workspace member | Get sales literatures count |
| GET | `/api/v2/SalesService/SalesLiteratures/Extended` | `sales_literatures_read` | Workspace member | Get extended sales literatures |
| GET | `/api/v2/SalesService/SalesLiteratures/{salesLiteratureId}` | `sales_literatures_read` | Workspace member | Get sales literature by ID |
| PUT | `/api/v2/SalesService/SalesLiteratures/{salesLiteratureId}` | `sales_literatures_update` | Workspace member | Update a sales literature |
| PATCH | `/api/v2/SalesService/SalesLiteratures/{salesLiteratureId}` | `sales_literatures_update` | Workspace member | Patch a sales literature |
| DELETE | `/api/v2/SalesService/SalesLiteratures/{salesLiteratureId}` | `sales_literatures_delete` | Workspace member | Delete a sales literature |

## Stores

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SalesService/Stores` | `stores_read` | Workspace member | Get stores |
| POST | `/api/v2/SalesService/Stores` | `stores_create` | Workspace member | Create a store |
| GET | `/api/v2/SalesService/Stores/Count` | `stores_read` | Workspace member | Get stores count |
| GET | `/api/v2/SalesService/Stores/{storeId}` | `stores_read` | Workspace member | Get store by ID |
| PUT | `/api/v2/SalesService/Stores/{storeId}` | `stores_update` | Workspace member | Update a store |
| PATCH | `/api/v2/SalesService/Stores/{storeId}` | `stores_update` | Workspace member | Patch a store |
| DELETE | `/api/v2/SalesService/Stores/{storeId}` | `stores_delete` | Workspace member | Delete a store |

Generated from the source at commit 05da3e4078.
<!-- generated:end -->
