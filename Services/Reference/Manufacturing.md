# Manufacturing service

The Manufacturing service lets you keep the production plans, work orders and workstations of your shop floor.

**Who uses it:** developers who connect production planning or shop floor systems to a workspace.

**Base route:** `/api/v2/ManufacturingService/...`

## What you can do

- **Plan production:** create, update and delete production plans. See [Operations](~/Capabilities/Operations.md).
- **Manage work orders:** create and update work orders, and classify them with work order types.
- **Keep workstations:** record the workstations where the work is done.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every call.
- **Permissions:** `production_plans_read`, `production_plans_create`, `production_plans_update` and `production_plans_delete`; the same four for `work_orders`, which also cover work order types, and for `workstations`.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `ManufacturingService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## ProductionPlans

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ManufacturingService/ProductionPlans` | `production_plans_read` | Workspace member | Get all production plans |
| POST | `/api/v2/ManufacturingService/ProductionPlans` | `production_plans_create` | Workspace member | Create a new production plan |
| GET | `/api/v2/ManufacturingService/ProductionPlans/Count` | `production_plans_read` | Workspace member | Get production plans count |
| GET | `/api/v2/ManufacturingService/ProductionPlans/{id}` | `production_plans_read` | Workspace member | Get production plan by ID |
| PUT | `/api/v2/ManufacturingService/ProductionPlans/{id}` | `production_plans_update` | Workspace member | Update a production plan |
| PATCH | `/api/v2/ManufacturingService/ProductionPlans/{id}` | `production_plans_update` | Workspace member | Patch a production plan |
| DELETE | `/api/v2/ManufacturingService/ProductionPlans/{id}` | `production_plans_delete` | Workspace member | Delete a production plan |

## WorkOrderTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ManufacturingService/WorkOrderTypes` | `work_orders_read` | Workspace member | Get all work order types |
| POST | `/api/v2/ManufacturingService/WorkOrderTypes` | `work_orders_create` | Workspace member | Create a new work order type |
| GET | `/api/v2/ManufacturingService/WorkOrderTypes/Count` | `work_orders_read` | Workspace member | Get work order types count |
| GET | `/api/v2/ManufacturingService/WorkOrderTypes/{id}` | `work_orders_read` | Workspace member | Get work order type by ID |
| PUT | `/api/v2/ManufacturingService/WorkOrderTypes/{id}` | `work_orders_update` | Workspace member | Update a work order type |
| PATCH | `/api/v2/ManufacturingService/WorkOrderTypes/{id}` | `work_orders_update` | Workspace member | Patch a work order type |
| DELETE | `/api/v2/ManufacturingService/WorkOrderTypes/{id}` | `work_orders_delete` | Workspace member | Delete a work order type |

## WorkOrders

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ManufacturingService/WorkOrders` | `work_orders_read` | Workspace member | Get all work orders |
| POST | `/api/v2/ManufacturingService/WorkOrders` | `work_orders_create` | Workspace member | Create a new work order |
| GET | `/api/v2/ManufacturingService/WorkOrders/Count` | `work_orders_read` | Workspace member | Get work orders count |
| GET | `/api/v2/ManufacturingService/WorkOrders/{id}` | `work_orders_read` | Workspace member | Get work order by ID |
| PUT | `/api/v2/ManufacturingService/WorkOrders/{id}` | `work_orders_update` | Workspace member | Update a work order |
| PATCH | `/api/v2/ManufacturingService/WorkOrders/{id}` | `work_orders_update` | Workspace member | Patch a work order |
| DELETE | `/api/v2/ManufacturingService/WorkOrders/{id}` | `work_orders_delete` | Workspace member | Delete a work order |

## Workstations

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ManufacturingService/Workstations` | `workstations_read` | Workspace member | Get all workstations |
| POST | `/api/v2/ManufacturingService/Workstations` | `workstations_create` | Workspace member | Create a new workstation |
| GET | `/api/v2/ManufacturingService/Workstations/Count` | `workstations_read` | Workspace member | Get workstations count |
| GET | `/api/v2/ManufacturingService/Workstations/{id}` | `workstations_read` | Workspace member | Get workstation by ID |
| PUT | `/api/v2/ManufacturingService/Workstations/{id}` | `workstations_update` | Workspace member | Update a workstation |
| PATCH | `/api/v2/ManufacturingService/Workstations/{id}` | `workstations_update` | Workspace member | Patch a workstation |
| DELETE | `/api/v2/ManufacturingService/Workstations/{id}` | `workstations_delete` | Workspace member | Delete a workstation |

Generated from the source at commit 642fb3c3ad.
<!-- generated:end -->
