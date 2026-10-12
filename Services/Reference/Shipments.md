# Shipments service

The Shipments service lets you record shipments and set up how your workspace ships: methods, couriers, classes, zones, regions and labels.

**Who uses it:** developers who connect a shipping platform, a carrier or a fulfilment tool to a workspace.

**Base route:** `/api/v2/ShipmentsService/...`

## What you can do

- **Record shipments** for the goods you send.
- **Keep bills of lading** with their lines.
- **Set up shipping:** keep shipping methods, couriers, classes, zones and regions.
- **Keep shipping labels** for your shipments.
- **Keep item shipping policies** that set how each item ships.
- An order shows its shipments in Studio. See [Orders](~/Modules/Sales-Hub/Sales-Records/Orders.md).

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** `shipments_read`, `shipments_create`, `shipments_update` and `shipments_delete` cover shipments and the shipping setup. Bills of lading use `bills_of_lading_read`, `bills_of_lading_create`, `bills_of_lading_update` and `bills_of_lading_delete`.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `ShipmentsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## BillsOfLading

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ShipmentsService/BillsOfLading` | `bills_of_lading_read` | Workspace member | Get all bills of lading |
| POST | `/api/v2/ShipmentsService/BillsOfLading` | `bills_of_lading_create` | Workspace member | Create a bill of lading |
| GET | `/api/v2/ShipmentsService/BillsOfLading/Count` | `bills_of_lading_read` | Workspace member | Get bills of lading count |
| GET | `/api/v2/ShipmentsService/BillsOfLading/{billOfLadingId}` | `bills_of_lading_read` | Workspace member | Get bill of lading by ID |
| PUT | `/api/v2/ShipmentsService/BillsOfLading/{billOfLadingId}` | `bills_of_lading_update` | Workspace member | Update a bill of lading |
| PATCH | `/api/v2/ShipmentsService/BillsOfLading/{billOfLadingId}` | `bills_of_lading_update` | Workspace member | Patch a bill of lading |
| DELETE | `/api/v2/ShipmentsService/BillsOfLading/{billOfLadingId}` | `bills_of_lading_delete` | Workspace member | Delete a bill of lading |
| GET | `/api/v2/ShipmentsService/BillsOfLading/{billOfLadingId}/Lines` | `bills_of_lading_read` | Workspace member | Get bill of lading lines |
| POST | `/api/v2/ShipmentsService/BillsOfLading/{billOfLadingId}/Lines` | `bills_of_lading_update` | Workspace member | Create a bill of lading line |
| GET | `/api/v2/ShipmentsService/BillsOfLading/{billOfLadingId}/Lines/Count` | `bills_of_lading_read` | Workspace member | Get bill of lading lines count |
| GET | `/api/v2/ShipmentsService/BillsOfLading/{billOfLadingId}/Lines/{lineId}` | `bills_of_lading_read` | Workspace member | Get bill of lading line by ID |
| PUT | `/api/v2/ShipmentsService/BillsOfLading/{billOfLadingId}/Lines/{lineId}` | `bills_of_lading_update` | Workspace member | Update a bill of lading line |
| PATCH | `/api/v2/ShipmentsService/BillsOfLading/{billOfLadingId}/Lines/{lineId}` | `bills_of_lading_update` | Workspace member | Patch a bill of lading line |
| DELETE | `/api/v2/ShipmentsService/BillsOfLading/{billOfLadingId}/Lines/{lineId}` | `bills_of_lading_update` | Workspace member | Delete a bill of lading line |

## ItemShippingPolicies

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ShipmentsService/ItemShippingPolicies` | `shipments_read` | Workspace member | Get all item shipping policies |
| POST | `/api/v2/ShipmentsService/ItemShippingPolicies` | `shipments_create` | Workspace member | Create an item shipping policy |
| GET | `/api/v2/ShipmentsService/ItemShippingPolicies/Count` | `shipments_read` | Workspace member | Get item shipping policies count |
| GET | `/api/v2/ShipmentsService/ItemShippingPolicies/{policyId}` | `shipments_read` | Workspace member | Get item shipping policy by ID |
| PUT | `/api/v2/ShipmentsService/ItemShippingPolicies/{policyId}` | `shipments_update` | Workspace member | Update an item shipping policy |
| PATCH | `/api/v2/ShipmentsService/ItemShippingPolicies/{policyId}` | `shipments_update` | Workspace member | Patch an item shipping policy |
| DELETE | `/api/v2/ShipmentsService/ItemShippingPolicies/{policyId}` | `shipments_delete` | Workspace member | Delete an item shipping policy |

## Shipments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ShipmentsService/Shipments` | `shipments_read` | Workspace member | Get all shipments |
| POST | `/api/v2/ShipmentsService/Shipments` | `shipments_create` | Workspace member | Create a shipment |
| GET | `/api/v2/ShipmentsService/Shipments/Count` | `shipments_read` | Workspace member | Get shipments count |
| GET | `/api/v2/ShipmentsService/Shipments/{shipmentId}` | `shipments_read` | Workspace member | Get shipment by ID |
| PUT | `/api/v2/ShipmentsService/Shipments/{shipmentId}` | `shipments_update` | Workspace member | Update a shipment |
| PATCH | `/api/v2/ShipmentsService/Shipments/{shipmentId}` | `shipments_update` | Workspace member | Patch a shipment |
| DELETE | `/api/v2/ShipmentsService/Shipments/{shipmentId}` | `shipments_delete` | Workspace member | Delete a shipment |

## ShippingClasses

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ShipmentsService/ShippingClasses` | `shipments_read` | Workspace member | Get all shipping classes |
| POST | `/api/v2/ShipmentsService/ShippingClasses` | `shipments_create` | Workspace member | Create a shipping class |
| GET | `/api/v2/ShipmentsService/ShippingClasses/Count` | `shipments_read` | Workspace member | Get shipping classes count |
| GET | `/api/v2/ShipmentsService/ShippingClasses/{classId}` | `shipments_read` | Workspace member | Get shipping class by ID |
| PUT | `/api/v2/ShipmentsService/ShippingClasses/{classId}` | `shipments_update` | Workspace member | Update a shipping class |
| PATCH | `/api/v2/ShipmentsService/ShippingClasses/{classId}` | `shipments_update` | Workspace member | Patch a shipping class |
| DELETE | `/api/v2/ShipmentsService/ShippingClasses/{classId}` | `shipments_delete` | Workspace member | Delete a shipping class |

## ShippingCouriers

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ShipmentsService/ShippingCouriers` | `shipments_read` | Workspace member | Get all shipping couriers |
| POST | `/api/v2/ShipmentsService/ShippingCouriers` | `shipments_create` | Workspace member | Create a shipping courier |
| GET | `/api/v2/ShipmentsService/ShippingCouriers/Count` | `shipments_read` | Workspace member | Get shipping couriers count |
| GET | `/api/v2/ShipmentsService/ShippingCouriers/{courierId}` | `shipments_read` | Workspace member | Get shipping courier by ID |
| PUT | `/api/v2/ShipmentsService/ShippingCouriers/{courierId}` | `shipments_update` | Workspace member | Update a shipping courier |
| PATCH | `/api/v2/ShipmentsService/ShippingCouriers/{courierId}` | `shipments_update` | Workspace member | Patch a shipping courier |
| DELETE | `/api/v2/ShipmentsService/ShippingCouriers/{courierId}` | `shipments_delete` | Workspace member | Delete a shipping courier |

## ShippingLabels

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ShipmentsService/ShippingLabels` | `shipments_read` | Workspace member | Get all shipping labels |
| POST | `/api/v2/ShipmentsService/ShippingLabels` | `shipments_create` | Workspace member | Create a shipping label |
| GET | `/api/v2/ShipmentsService/ShippingLabels/Count` | `shipments_read` | Workspace member | Get shipping labels count |
| GET | `/api/v2/ShipmentsService/ShippingLabels/{labelId}` | `shipments_read` | Workspace member | Get shipping label by ID |
| PUT | `/api/v2/ShipmentsService/ShippingLabels/{labelId}` | `shipments_update` | Workspace member | Update a shipping label |
| PATCH | `/api/v2/ShipmentsService/ShippingLabels/{labelId}` | `shipments_update` | Workspace member | Patch a shipping label |
| DELETE | `/api/v2/ShipmentsService/ShippingLabels/{labelId}` | `shipments_delete` | Workspace member | Delete a shipping label |

## ShippingMethods

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ShipmentsService/ShippingMethods` | `shipments_read` | Workspace member | Get all shipping methods |
| POST | `/api/v2/ShipmentsService/ShippingMethods` | `shipments_create` | Workspace member | Create a shipping method |
| GET | `/api/v2/ShipmentsService/ShippingMethods/Count` | `shipments_read` | Workspace member | Get shipping methods count |
| GET | `/api/v2/ShipmentsService/ShippingMethods/{methodId}` | `shipments_read` | Workspace member | Get shipping method by ID |
| PUT | `/api/v2/ShipmentsService/ShippingMethods/{methodId}` | `shipments_update` | Workspace member | Update a shipping method |
| PATCH | `/api/v2/ShipmentsService/ShippingMethods/{methodId}` | `shipments_update` | Workspace member | Patch a shipping method |
| DELETE | `/api/v2/ShipmentsService/ShippingMethods/{methodId}` | `shipments_delete` | Workspace member | Delete a shipping method |

## ShippingRegions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ShipmentsService/ShippingRegions` | `shipments_read` | Workspace member | Get all shipping regions |
| POST | `/api/v2/ShipmentsService/ShippingRegions` | `shipments_create` | Workspace member | Create a shipping region |
| GET | `/api/v2/ShipmentsService/ShippingRegions/Count` | `shipments_read` | Workspace member | Get shipping regions count |
| GET | `/api/v2/ShipmentsService/ShippingRegions/{regionId}` | `shipments_read` | Workspace member | Get shipping region by ID |
| PUT | `/api/v2/ShipmentsService/ShippingRegions/{regionId}` | `shipments_update` | Workspace member | Update a shipping region |
| PATCH | `/api/v2/ShipmentsService/ShippingRegions/{regionId}` | `shipments_update` | Workspace member | Patch a shipping region |
| DELETE | `/api/v2/ShipmentsService/ShippingRegions/{regionId}` | `shipments_delete` | Workspace member | Delete a shipping region |

## ShippingZones

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ShipmentsService/ShippingZones` | `shipments_read` | Workspace member | Get all shipping zones |
| POST | `/api/v2/ShipmentsService/ShippingZones` | `shipments_create` | Workspace member | Create a shipping zone |
| GET | `/api/v2/ShipmentsService/ShippingZones/Count` | `shipments_read` | Workspace member | Get shipping zones count |
| GET | `/api/v2/ShipmentsService/ShippingZones/{zoneId}` | `shipments_read` | Workspace member | Get shipping zone by ID |
| PUT | `/api/v2/ShipmentsService/ShippingZones/{zoneId}` | `shipments_update` | Workspace member | Update a shipping zone |
| PATCH | `/api/v2/ShipmentsService/ShippingZones/{zoneId}` | `shipments_update` | Workspace member | Patch a shipping zone |
| DELETE | `/api/v2/ShipmentsService/ShippingZones/{zoneId}` | `shipments_delete` | Workspace member | Delete a shipping zone |

Generated from the source at commit 05da3e4078.
<!-- generated:end -->
