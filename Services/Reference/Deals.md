# Deals service

The Deals service lets you track sales opportunities as deal units and define the stages they move through.

**Who uses it:** developers who connect a CRM, a pipeline dashboard or a sales tool to a workspace.

**Base route:** `/api/v2/DealsService/...`

## What you can do

- **Track opportunities:** create, update and delete deal units, and list them with their count or extended details. See [Deal units](~/Modules/Sales-Hub/Sales-Records/Deal-Units.md).
- **Price a deal unit:** add, update or remove its lines, and calculate the deal unit.
- **Close a deal unit** as won or lost.
- **Define your sales stages:** create deal unit flows and their ordered stages. See [Deal unit flows](~/Modules/Sales-Hub/Sales-Flows.md).

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** `deal_units_read`, `deal_units_create`, `deal_units_update` and `deal_units_delete` cover deal units, their lines, and deal unit flows with their stages.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `DealsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## DealUnitFlows

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/DealsService/DealUnitFlows` | `deal_units_read` | Workspace member | Get deal unit flows |
| POST | `/api/v2/DealsService/DealUnitFlows` | `deal_units_create` | Workspace member | Create a deal unit flow |
| GET | `/api/v2/DealsService/DealUnitFlows/Count` | `deal_units_read` | Workspace member | Get deal unit flows count |
| GET | `/api/v2/DealsService/DealUnitFlows/{dealUnitFlowId}` | `deal_units_read` | Workspace member | Get deal unit flow by ID |
| PUT | `/api/v2/DealsService/DealUnitFlows/{dealUnitFlowId}` | `deal_units_update` | Workspace member | Update a deal unit flow |
| PATCH | `/api/v2/DealsService/DealUnitFlows/{dealUnitFlowId}` | `deal_units_update` | Workspace member | Patch a deal unit flow |
| DELETE | `/api/v2/DealsService/DealUnitFlows/{dealUnitFlowId}` | `deal_units_delete` | Workspace member | Delete a deal unit flow |
| GET | `/api/v2/DealsService/DealUnitFlows/{dealUnitFlowId}/Stages` | `deal_units_read` | Workspace member | Get stages for a deal unit flow |
| POST | `/api/v2/DealsService/DealUnitFlows/{dealUnitFlowId}/Stages` | `deal_units_create` | Workspace member | Create a deal unit flow stage |
| GET | `/api/v2/DealsService/DealUnitFlows/{dealUnitFlowId}/Stages/Count` | `deal_units_read` | Workspace member | Get stages count for a deal unit flow |
| GET | `/api/v2/DealsService/DealUnitFlows/{dealUnitFlowId}/Stages/{dealUnitFlowStageId}` | `deal_units_read` | Workspace member | Get a deal unit flow stage by ID |
| PUT | `/api/v2/DealsService/DealUnitFlows/{dealUnitFlowId}/Stages/{dealUnitFlowStageId}` | `deal_units_update` | Workspace member | Update a deal unit flow stage |
| PATCH | `/api/v2/DealsService/DealUnitFlows/{dealUnitFlowId}/Stages/{dealUnitFlowStageId}` | `deal_units_update` | Workspace member | Patch a deal unit flow stage |
| DELETE | `/api/v2/DealsService/DealUnitFlows/{dealUnitFlowId}/Stages/{dealUnitFlowStageId}` | `deal_units_delete` | Workspace member | Delete a deal unit flow stage |

## DealUnits

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/DealsService/DealUnits` | `deal_units_read` | Workspace member | Get deal units |
| POST | `/api/v2/DealsService/DealUnits` | `deal_units_create` | Workspace member | Create a deal unit |
| GET | `/api/v2/DealsService/DealUnits/Count` | `deal_units_read` | Workspace member | Get deal units count |
| GET | `/api/v2/DealsService/DealUnits/Extended` | `deal_units_read` | Workspace member | Get extended deal units |
| GET | `/api/v2/DealsService/DealUnits/{dealUnitId}` | `deal_units_read` | Workspace member | Get deal unit by ID |
| PUT | `/api/v2/DealsService/DealUnits/{dealUnitId}` | `deal_units_update` | Workspace member | Update a deal unit |
| PATCH | `/api/v2/DealsService/DealUnits/{dealUnitId}` | `deal_units_update` | Workspace member | Patch a deal unit |
| DELETE | `/api/v2/DealsService/DealUnits/{dealUnitId}` | `deal_units_delete` | Workspace member | Delete a deal unit |
| PUT | `/api/v2/DealsService/DealUnits/{dealUnitId}/Calculate` | `deal_units_update` | Workspace member | Calculate a deal unit |
| PUT | `/api/v2/DealsService/DealUnits/{dealUnitId}/Close` | `deal_units_update` | Workspace member | Close a deal unit |
| GET | `/api/v2/DealsService/DealUnits/{dealUnitId}/Extended` | `deal_units_read` | Workspace member | Get extended deal unit by ID |
| GET | `/api/v2/DealsService/DealUnits/{dealUnitId}/Lines` | `deal_units_read` | Workspace member | Get deal unit lines |
| POST | `/api/v2/DealsService/DealUnits/{dealUnitId}/Lines` | `deal_units_create` | Workspace member | Create a deal unit line |
| GET | `/api/v2/DealsService/DealUnits/{dealUnitId}/Lines/Count` | `deal_units_read` | Workspace member | Get deal unit lines count |
| GET | `/api/v2/DealsService/DealUnits/{dealUnitId}/Lines/{dealUnitLineId}` | `deal_units_read` | Workspace member | Get a deal unit line by ID |
| PUT | `/api/v2/DealsService/DealUnits/{dealUnitId}/Lines/{dealUnitLineId}` | `deal_units_update` | Workspace member | Update a deal unit line |
| PATCH | `/api/v2/DealsService/DealUnits/{dealUnitId}/Lines/{dealUnitLineId}` | `deal_units_update` | Workspace member | Patch a deal unit line |
| DELETE | `/api/v2/DealsService/DealUnits/{dealUnitId}/Lines/{dealUnitLineId}` | `deal_units_delete` | Workspace member | Delete a deal unit line |

Generated from the source at commit 05da3e4078.
<!-- generated:end -->
