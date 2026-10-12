# Logistics service

The Logistics service lets you run warehouse operations and record how goods travel by air, rail, road and sea, up to the proof of delivery.

**Who uses it:** developers who connect a warehouse system, a transport management system or a carrier to a workspace.

**Base route:** `/api/v2/LogisticsService/...`

## What you can do

- **Manage warehouses and stock movements:** keep warehouses, record restocks, pick lists and packing slips with their entries, and keep retain samples.
- **Issue transport documents:** create airway bills, rail waybills, road waybills and seaway bills, add their lines, and move each one through the steps of its type (such as issue, transit, arrival, delivery or release), or cancel it.
- **Run your own trucks:** keep trucks and truck drivers, activate or deactivate drivers, and dispatch, depart, arrive, deliver or cancel each trip.
- **Plan sea voyages:** keep vessels and ports, add port calls to a voyage, and start, complete or cancel it.
- **Confirm delivery:** record a proof of delivery with its lines, and sign, reject or dispute it.
- **Keep supplier profiles** for the companies you buy from.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** each resource has its own permissions, such as `warehouses_read`, `item_restocks_create` or `trucks_read`. Status changes such as issue, cancel, sign or dispatch need the resource's `_manage` permission, for example `road_waybills_manage` or `truck_trips_manage`. Retain samples use the `stock_items_*` permissions.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `LogisticsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## AirwayBills

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/AirwayBills` | `airway_bills_read` | Workspace member | Get all airway bills |
| POST | `/api/v2/LogisticsService/AirwayBills` | `airway_bills_create` | Workspace member | Create an airway bill |
| GET | `/api/v2/LogisticsService/AirwayBills/Count` | `airway_bills_read` | Workspace member | Get airway bills count |
| GET | `/api/v2/LogisticsService/AirwayBills/{billId}` | `airway_bills_read` | Workspace member | Get airway bill by ID |
| PUT | `/api/v2/LogisticsService/AirwayBills/{billId}` | `airway_bills_update` | Workspace member | Update an airway bill |
| PATCH | `/api/v2/LogisticsService/AirwayBills/{billId}` | `airway_bills_update` | Workspace member | Patch an airway bill |
| DELETE | `/api/v2/LogisticsService/AirwayBills/{billId}` | `airway_bills_delete` | Workspace member | Delete an airway bill |
| POST | `/api/v2/LogisticsService/AirwayBills/{billId}/Cancel` | `airway_bills_manage` | Workspace member | Cancel an airway bill |
| POST | `/api/v2/LogisticsService/AirwayBills/{billId}/Issue` | `airway_bills_manage` | Workspace member | Issue an airway bill |
| POST | `/api/v2/LogisticsService/AirwayBills/{billId}/Lines` | `airway_bills_update` | Workspace member | Add a line to airway bill |
| PUT | `/api/v2/LogisticsService/AirwayBills/{billId}/Lines/{lineId}` | `airway_bills_update` | Workspace member | Update an airway bill line |
| PATCH | `/api/v2/LogisticsService/AirwayBills/{billId}/Lines/{lineId}` | `airway_bills_update` | Workspace member | Patch an airway bill line |
| DELETE | `/api/v2/LogisticsService/AirwayBills/{billId}/Lines/{lineId}` | `airway_bills_update` | Workspace member | Remove an airway bill line |
| POST | `/api/v2/LogisticsService/AirwayBills/{billId}/MarkArrived` | `airway_bills_manage` | Workspace member | Mark airway bill arrived |
| POST | `/api/v2/LogisticsService/AirwayBills/{billId}/MarkDelivered` | `airway_bills_manage` | Workspace member | Mark airway bill delivered |
| POST | `/api/v2/LogisticsService/AirwayBills/{billId}/MarkInTransit` | `airway_bills_manage` | Workspace member | Mark airway bill in transit |

## ItemPackingSlips

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/ItemPackingSlips` | `item_packing_slips_read` | Workspace member | Get all item packing slips |
| POST | `/api/v2/LogisticsService/ItemPackingSlips` | `item_packing_slips_create` | Workspace member | Create an item packing slip |
| GET | `/api/v2/LogisticsService/ItemPackingSlips/Count` | `item_packing_slips_read` | Workspace member | Get item packing slips count |
| GET | `/api/v2/LogisticsService/ItemPackingSlips/{packingSlipId}` | `item_packing_slips_read` | Workspace member | Get item packing slip by ID |
| PUT | `/api/v2/LogisticsService/ItemPackingSlips/{packingSlipId}` | `item_packing_slips_update` | Workspace member | Update an item packing slip |
| PATCH | `/api/v2/LogisticsService/ItemPackingSlips/{packingSlipId}` | `item_packing_slips_update` | Workspace member | Patch an item packing slip |
| DELETE | `/api/v2/LogisticsService/ItemPackingSlips/{packingSlipId}` | `item_packing_slips_delete` | Workspace member | Delete an item packing slip |
| GET | `/api/v2/LogisticsService/ItemPackingSlips/{packingSlipId}/Entries` | `item_packing_slips_read` | Workspace member | Get packing slip entries |
| POST | `/api/v2/LogisticsService/ItemPackingSlips/{packingSlipId}/Entries` | `item_packing_slips_create` | Workspace member | Create a packing slip entry |
| GET | `/api/v2/LogisticsService/ItemPackingSlips/{packingSlipId}/Entries/Count` | `item_packing_slips_read` | Workspace member | Get packing slip entries count |
| GET | `/api/v2/LogisticsService/ItemPackingSlips/{packingSlipId}/Entries/{entryId}` | `item_packing_slips_read` | Workspace member | Get packing slip entry by ID |
| PUT | `/api/v2/LogisticsService/ItemPackingSlips/{packingSlipId}/Entries/{entryId}` | `item_packing_slips_update` | Workspace member | Update a packing slip entry |
| PATCH | `/api/v2/LogisticsService/ItemPackingSlips/{packingSlipId}/Entries/{entryId}` | `item_packing_slips_update` | Workspace member | Patch a packing slip entry |
| DELETE | `/api/v2/LogisticsService/ItemPackingSlips/{packingSlipId}/Entries/{entryId}` | `item_packing_slips_delete` | Workspace member | Delete a packing slip entry |

## ItemPickLists

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/ItemPickLists` | `item_pick_lists_read` | Workspace member | Get all item pick lists |
| POST | `/api/v2/LogisticsService/ItemPickLists` | `item_pick_lists_create` | Workspace member | Create an item pick list |
| GET | `/api/v2/LogisticsService/ItemPickLists/Count` | `item_pick_lists_read` | Workspace member | Get item pick lists count |
| GET | `/api/v2/LogisticsService/ItemPickLists/{pickListId}` | `item_pick_lists_read` | Workspace member | Get item pick list by ID |
| PUT | `/api/v2/LogisticsService/ItemPickLists/{pickListId}` | `item_pick_lists_update` | Workspace member | Update an item pick list |
| PATCH | `/api/v2/LogisticsService/ItemPickLists/{pickListId}` | `item_pick_lists_update` | Workspace member | Patch an item pick list |
| DELETE | `/api/v2/LogisticsService/ItemPickLists/{pickListId}` | `item_pick_lists_delete` | Workspace member | Delete an item pick list |
| GET | `/api/v2/LogisticsService/ItemPickLists/{pickListId}/Entries` | `item_pick_lists_read` | Workspace member | Get pick list entries |
| POST | `/api/v2/LogisticsService/ItemPickLists/{pickListId}/Entries` | `item_pick_lists_create` | Workspace member | Create a pick list entry |
| GET | `/api/v2/LogisticsService/ItemPickLists/{pickListId}/Entries/Count` | `item_pick_lists_read` | Workspace member | Get pick list entries count |
| GET | `/api/v2/LogisticsService/ItemPickLists/{pickListId}/Entries/{entryId}` | `item_pick_lists_read` | Workspace member | Get pick list entry by ID |
| PUT | `/api/v2/LogisticsService/ItemPickLists/{pickListId}/Entries/{entryId}` | `item_pick_lists_update` | Workspace member | Update a pick list entry |
| PATCH | `/api/v2/LogisticsService/ItemPickLists/{pickListId}/Entries/{entryId}` | `item_pick_lists_update` | Workspace member | Patch a pick list entry |
| DELETE | `/api/v2/LogisticsService/ItemPickLists/{pickListId}/Entries/{entryId}` | `item_pick_lists_delete` | Workspace member | Delete a pick list entry |

## ItemRestocks

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/ItemRestocks` | `item_restocks_read` | Workspace member | Get all item restocks |
| POST | `/api/v2/LogisticsService/ItemRestocks` | `item_restocks_create` | Workspace member | Create an item restock |
| GET | `/api/v2/LogisticsService/ItemRestocks/Count` | `item_restocks_read` | Workspace member | Get item restocks count |
| GET | `/api/v2/LogisticsService/ItemRestocks/{restockId}` | `item_restocks_read` | Workspace member | Get item restock by ID |
| PUT | `/api/v2/LogisticsService/ItemRestocks/{restockId}` | `item_restocks_update` | Workspace member | Update an item restock |
| PATCH | `/api/v2/LogisticsService/ItemRestocks/{restockId}` | `item_restocks_update` | Workspace member | Patch an item restock |
| DELETE | `/api/v2/LogisticsService/ItemRestocks/{restockId}` | `item_restocks_delete` | Workspace member | Delete an item restock |
| GET | `/api/v2/LogisticsService/ItemRestocks/{restockId}/Entries` | `item_restocks_read` | Workspace member | Get restock entries |
| POST | `/api/v2/LogisticsService/ItemRestocks/{restockId}/Entries` | `item_restocks_create` | Workspace member | Create a restock entry |
| GET | `/api/v2/LogisticsService/ItemRestocks/{restockId}/Entries/Count` | `item_restocks_read` | Workspace member | Get restock entries count |
| GET | `/api/v2/LogisticsService/ItemRestocks/{restockId}/Entries/{entryId}` | `item_restocks_read` | Workspace member | Get restock entry by ID |
| PUT | `/api/v2/LogisticsService/ItemRestocks/{restockId}/Entries/{entryId}` | `item_restocks_update` | Workspace member | Update a restock entry |
| PATCH | `/api/v2/LogisticsService/ItemRestocks/{restockId}/Entries/{entryId}` | `item_restocks_update` | Workspace member | Patch a restock entry |
| DELETE | `/api/v2/LogisticsService/ItemRestocks/{restockId}/Entries/{entryId}` | `item_restocks_delete` | Workspace member | Delete a restock entry |

## ItemRetainSamples

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/ItemRetainSamples` | `stock_items_read` | Workspace member | Get all item retain samples |
| POST | `/api/v2/LogisticsService/ItemRetainSamples` | `stock_items_create` | Workspace member | Create an item retain sample |
| GET | `/api/v2/LogisticsService/ItemRetainSamples/Count` | `stock_items_read` | Workspace member | Get item retain samples count |
| GET | `/api/v2/LogisticsService/ItemRetainSamples/{retainSampleId}` | `stock_items_read` | Workspace member | Get item retain sample by ID |
| PUT | `/api/v2/LogisticsService/ItemRetainSamples/{retainSampleId}` | `stock_items_update` | Workspace member | Update an item retain sample |
| PATCH | `/api/v2/LogisticsService/ItemRetainSamples/{retainSampleId}` | `stock_items_update` | Workspace member | Patch an item retain sample |
| DELETE | `/api/v2/LogisticsService/ItemRetainSamples/{retainSampleId}` | `stock_items_delete` | Workspace member | Delete an item retain sample |

## Ports

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/Ports` | `ports_read` | Workspace member | Get all ports |
| POST | `/api/v2/LogisticsService/Ports` | `ports_create` | Workspace member | Create a port |
| GET | `/api/v2/LogisticsService/Ports/Count` | `ports_read` | Workspace member | Get ports count |
| GET | `/api/v2/LogisticsService/Ports/{portId}` | `ports_read` | Workspace member | Get port by ID |
| PUT | `/api/v2/LogisticsService/Ports/{portId}` | `ports_update` | Workspace member | Update a port |
| PATCH | `/api/v2/LogisticsService/Ports/{portId}` | `ports_update` | Workspace member | Patch a port |
| DELETE | `/api/v2/LogisticsService/Ports/{portId}` | `ports_delete` | Workspace member | Delete a port |

## ProofsOfDelivery

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/ProofsOfDelivery` | `proofs_of_delivery_read` | Workspace member | Get all proofs of delivery |
| POST | `/api/v2/LogisticsService/ProofsOfDelivery` | `proofs_of_delivery_create` | Workspace member | Create a proof of delivery |
| GET | `/api/v2/LogisticsService/ProofsOfDelivery/Count` | `proofs_of_delivery_read` | Workspace member | Get proofs of delivery count |
| GET | `/api/v2/LogisticsService/ProofsOfDelivery/{podId}` | `proofs_of_delivery_read` | Workspace member | Get proof of delivery by ID |
| PUT | `/api/v2/LogisticsService/ProofsOfDelivery/{podId}` | `proofs_of_delivery_update` | Workspace member | Update a proof of delivery |
| PATCH | `/api/v2/LogisticsService/ProofsOfDelivery/{podId}` | `proofs_of_delivery_update` | Workspace member | Patch a proof of delivery |
| DELETE | `/api/v2/LogisticsService/ProofsOfDelivery/{podId}` | `proofs_of_delivery_delete` | Workspace member | Delete a proof of delivery |
| POST | `/api/v2/LogisticsService/ProofsOfDelivery/{podId}/DeliveryNotes/{noteId}` | `proofs_of_delivery_update` | Workspace member | Attach a delivery note |
| DELETE | `/api/v2/LogisticsService/ProofsOfDelivery/{podId}/DeliveryNotes/{noteId}` | `proofs_of_delivery_update` | Workspace member | Detach a delivery note |
| POST | `/api/v2/LogisticsService/ProofsOfDelivery/{podId}/Dispute` | `proofs_of_delivery_manage` | Workspace member | Dispute a proof of delivery |
| POST | `/api/v2/LogisticsService/ProofsOfDelivery/{podId}/Lines` | `proofs_of_delivery_update` | Workspace member | Add a line to proof of delivery |
| PUT | `/api/v2/LogisticsService/ProofsOfDelivery/{podId}/Lines/{lineId}` | `proofs_of_delivery_update` | Workspace member | Update a proof of delivery line |
| PATCH | `/api/v2/LogisticsService/ProofsOfDelivery/{podId}/Lines/{lineId}` | `proofs_of_delivery_update` | Workspace member | Patch a proof of delivery line |
| DELETE | `/api/v2/LogisticsService/ProofsOfDelivery/{podId}/Lines/{lineId}` | `proofs_of_delivery_update` | Workspace member | Remove a proof of delivery line |
| POST | `/api/v2/LogisticsService/ProofsOfDelivery/{podId}/Reject` | `proofs_of_delivery_manage` | Workspace member | Reject a proof of delivery |
| POST | `/api/v2/LogisticsService/ProofsOfDelivery/{podId}/Sign` | `proofs_of_delivery_manage` | Workspace member | Sign a proof of delivery |

## RailWaybills

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/RailWaybills` | `rail_waybills_read` | Workspace member | Get all rail waybills |
| POST | `/api/v2/LogisticsService/RailWaybills` | `rail_waybills_create` | Workspace member | Create a rail waybill |
| GET | `/api/v2/LogisticsService/RailWaybills/Count` | `rail_waybills_read` | Workspace member | Get rail waybills count |
| GET | `/api/v2/LogisticsService/RailWaybills/{waybillId}` | `rail_waybills_read` | Workspace member | Get rail waybill by ID |
| PUT | `/api/v2/LogisticsService/RailWaybills/{waybillId}` | `rail_waybills_update` | Workspace member | Update a rail waybill |
| PATCH | `/api/v2/LogisticsService/RailWaybills/{waybillId}` | `rail_waybills_update` | Workspace member | Patch a rail waybill |
| DELETE | `/api/v2/LogisticsService/RailWaybills/{waybillId}` | `rail_waybills_delete` | Workspace member | Delete a rail waybill |
| POST | `/api/v2/LogisticsService/RailWaybills/{waybillId}/Cancel` | `rail_waybills_manage` | Workspace member | Cancel a rail waybill |
| POST | `/api/v2/LogisticsService/RailWaybills/{waybillId}/Issue` | `rail_waybills_manage` | Workspace member | Issue a rail waybill |
| POST | `/api/v2/LogisticsService/RailWaybills/{waybillId}/Lines` | `rail_waybills_update` | Workspace member | Add a line to rail waybill |
| PUT | `/api/v2/LogisticsService/RailWaybills/{waybillId}/Lines/{lineId}` | `rail_waybills_update` | Workspace member | Update a rail waybill line |
| PATCH | `/api/v2/LogisticsService/RailWaybills/{waybillId}/Lines/{lineId}` | `rail_waybills_update` | Workspace member | Patch a rail waybill line |
| DELETE | `/api/v2/LogisticsService/RailWaybills/{waybillId}/Lines/{lineId}` | `rail_waybills_update` | Workspace member | Remove a rail waybill line |
| POST | `/api/v2/LogisticsService/RailWaybills/{waybillId}/MarkDelivered` | `rail_waybills_manage` | Workspace member | Mark rail waybill delivered |
| POST | `/api/v2/LogisticsService/RailWaybills/{waybillId}/MarkInTransit` | `rail_waybills_manage` | Workspace member | Mark rail waybill in transit |

## RoadWaybills

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/RoadWaybills` | `road_waybills_read` | Workspace member | Get all road waybills |
| POST | `/api/v2/LogisticsService/RoadWaybills` | `road_waybills_create` | Workspace member | Create a road waybill |
| GET | `/api/v2/LogisticsService/RoadWaybills/Count` | `road_waybills_read` | Workspace member | Get road waybills count |
| GET | `/api/v2/LogisticsService/RoadWaybills/{waybillId}` | `road_waybills_read` | Workspace member | Get road waybill by ID |
| PUT | `/api/v2/LogisticsService/RoadWaybills/{waybillId}` | `road_waybills_update` | Workspace member | Update a road waybill |
| PATCH | `/api/v2/LogisticsService/RoadWaybills/{waybillId}` | `road_waybills_update` | Workspace member | Patch a road waybill |
| DELETE | `/api/v2/LogisticsService/RoadWaybills/{waybillId}` | `road_waybills_delete` | Workspace member | Delete a road waybill |
| POST | `/api/v2/LogisticsService/RoadWaybills/{waybillId}/Cancel` | `road_waybills_manage` | Workspace member | Cancel a road waybill |
| POST | `/api/v2/LogisticsService/RoadWaybills/{waybillId}/Dispute` | `road_waybills_manage` | Workspace member | Dispute a road waybill |
| POST | `/api/v2/LogisticsService/RoadWaybills/{waybillId}/Issue` | `road_waybills_manage` | Workspace member | Issue a road waybill |
| POST | `/api/v2/LogisticsService/RoadWaybills/{waybillId}/Lines` | `road_waybills_update` | Workspace member | Add a line to road waybill |
| PUT | `/api/v2/LogisticsService/RoadWaybills/{waybillId}/Lines/{lineId}` | `road_waybills_update` | Workspace member | Update a road waybill line |
| PATCH | `/api/v2/LogisticsService/RoadWaybills/{waybillId}/Lines/{lineId}` | `road_waybills_update` | Workspace member | Patch a road waybill line |
| DELETE | `/api/v2/LogisticsService/RoadWaybills/{waybillId}/Lines/{lineId}` | `road_waybills_update` | Workspace member | Remove a road waybill line |
| POST | `/api/v2/LogisticsService/RoadWaybills/{waybillId}/MarkDelivered` | `road_waybills_manage` | Workspace member | Mark road waybill delivered |
| POST | `/api/v2/LogisticsService/RoadWaybills/{waybillId}/MarkInTransit` | `road_waybills_manage` | Workspace member | Mark road waybill in transit |

## SeawayBills

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/SeawayBills` | `seaway_bills_read` | Workspace member | Get all seaway bills |
| POST | `/api/v2/LogisticsService/SeawayBills` | `seaway_bills_create` | Workspace member | Create a seaway bill |
| GET | `/api/v2/LogisticsService/SeawayBills/Count` | `seaway_bills_read` | Workspace member | Get seaway bills count |
| GET | `/api/v2/LogisticsService/SeawayBills/{billId}` | `seaway_bills_read` | Workspace member | Get seaway bill by ID |
| PUT | `/api/v2/LogisticsService/SeawayBills/{billId}` | `seaway_bills_update` | Workspace member | Update a seaway bill |
| PATCH | `/api/v2/LogisticsService/SeawayBills/{billId}` | `seaway_bills_update` | Workspace member | Patch a seaway bill |
| DELETE | `/api/v2/LogisticsService/SeawayBills/{billId}` | `seaway_bills_delete` | Workspace member | Delete a seaway bill |
| POST | `/api/v2/LogisticsService/SeawayBills/{billId}/Cancel` | `seaway_bills_manage` | Workspace member | Cancel a seaway bill |
| POST | `/api/v2/LogisticsService/SeawayBills/{billId}/Issue` | `seaway_bills_manage` | Workspace member | Issue a seaway bill |
| POST | `/api/v2/LogisticsService/SeawayBills/{billId}/Lines` | `seaway_bills_update` | Workspace member | Add a line to seaway bill |
| PUT | `/api/v2/LogisticsService/SeawayBills/{billId}/Lines/{lineId}` | `seaway_bills_update` | Workspace member | Update a seaway bill line |
| PATCH | `/api/v2/LogisticsService/SeawayBills/{billId}/Lines/{lineId}` | `seaway_bills_update` | Workspace member | Patch a seaway bill line |
| DELETE | `/api/v2/LogisticsService/SeawayBills/{billId}/Lines/{lineId}` | `seaway_bills_update` | Workspace member | Remove a seaway bill line |
| POST | `/api/v2/LogisticsService/SeawayBills/{billId}/MarkArrived` | `seaway_bills_manage` | Workspace member | Mark seaway bill arrived |
| POST | `/api/v2/LogisticsService/SeawayBills/{billId}/MarkInTransit` | `seaway_bills_manage` | Workspace member | Mark seaway bill in transit |
| POST | `/api/v2/LogisticsService/SeawayBills/{billId}/Release` | `seaway_bills_manage` | Workspace member | Release a seaway bill |

## SupplierProfiles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/SupplierProfiles` | `supplier_profiles_read` | Workspace member | Get all supplier profiles |
| POST | `/api/v2/LogisticsService/SupplierProfiles` | `supplier_profiles_create` | Workspace member | Create a supplier profile |
| GET | `/api/v2/LogisticsService/SupplierProfiles/Count` | `supplier_profiles_read` | Workspace member | Get supplier profiles count |
| GET | `/api/v2/LogisticsService/SupplierProfiles/{supplierProfileId}` | `supplier_profiles_read` | Workspace member | Get supplier profile by ID |
| PUT | `/api/v2/LogisticsService/SupplierProfiles/{supplierProfileId}` | `supplier_profiles_update` | Workspace member | Update a supplier profile |
| PATCH | `/api/v2/LogisticsService/SupplierProfiles/{supplierProfileId}` | `supplier_profiles_update` | Workspace member | Patch a supplier profile |
| DELETE | `/api/v2/LogisticsService/SupplierProfiles/{supplierProfileId}` | `supplier_profiles_delete` | Workspace member | Delete a supplier profile |

## TruckDrivers

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/TruckDrivers` | `truck_drivers_read` | Workspace member | Get all truck drivers |
| POST | `/api/v2/LogisticsService/TruckDrivers` | `truck_drivers_create` | Workspace member | Create a truck driver |
| GET | `/api/v2/LogisticsService/TruckDrivers/Count` | `truck_drivers_read` | Workspace member | Get truck drivers count |
| GET | `/api/v2/LogisticsService/TruckDrivers/{driverId}` | `truck_drivers_read` | Workspace member | Get truck driver by ID |
| PUT | `/api/v2/LogisticsService/TruckDrivers/{driverId}` | `truck_drivers_update` | Workspace member | Update a truck driver |
| PATCH | `/api/v2/LogisticsService/TruckDrivers/{driverId}` | `truck_drivers_update` | Workspace member | Patch a truck driver |
| DELETE | `/api/v2/LogisticsService/TruckDrivers/{driverId}` | `truck_drivers_delete` | Workspace member | Delete a truck driver |
| POST | `/api/v2/LogisticsService/TruckDrivers/{driverId}/Activate` | `truck_drivers_manage` | Workspace member | Activate a truck driver |
| POST | `/api/v2/LogisticsService/TruckDrivers/{driverId}/Deactivate` | `truck_drivers_manage` | Workspace member | Deactivate a truck driver |

## Trucks

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/Trucks` | `trucks_read` | Workspace member | Get all trucks |
| POST | `/api/v2/LogisticsService/Trucks` | `trucks_create` | Workspace member | Create a truck |
| GET | `/api/v2/LogisticsService/Trucks/Count` | `trucks_read` | Workspace member | Get trucks count |
| GET | `/api/v2/LogisticsService/Trucks/{truckId}` | `trucks_read` | Workspace member | Get truck by ID |
| PUT | `/api/v2/LogisticsService/Trucks/{truckId}` | `trucks_update` | Workspace member | Update a truck |
| PATCH | `/api/v2/LogisticsService/Trucks/{truckId}` | `trucks_update` | Workspace member | Patch a truck |
| DELETE | `/api/v2/LogisticsService/Trucks/{truckId}` | `trucks_delete` | Workspace member | Delete a truck |
| GET | `/api/v2/LogisticsService/Trucks/{truckId}/Trips` | `truck_trips_read` | Workspace member | Get truck trips |
| POST | `/api/v2/LogisticsService/Trucks/{truckId}/Trips` | `truck_trips_create` | Workspace member | Create a truck trip |
| GET | `/api/v2/LogisticsService/Trucks/{truckId}/Trips/Count` | `truck_trips_read` | Workspace member | Get truck trips count |
| PUT | `/api/v2/LogisticsService/Trucks/{truckId}/Trips/{tripId}` | `truck_trips_update` | Workspace member | Update a truck trip |
| PATCH | `/api/v2/LogisticsService/Trucks/{truckId}/Trips/{tripId}` | `truck_trips_update` | Workspace member | Patch a truck trip |
| DELETE | `/api/v2/LogisticsService/Trucks/{truckId}/Trips/{tripId}` | `truck_trips_delete` | Workspace member | Delete a truck trip |
| POST | `/api/v2/LogisticsService/Trucks/{truckId}/Trips/{tripId}/Arrive` | `truck_trips_manage` | Workspace member | Arrive a trip |
| POST | `/api/v2/LogisticsService/Trucks/{truckId}/Trips/{tripId}/Cancel` | `truck_trips_manage` | Workspace member | Cancel a trip |
| POST | `/api/v2/LogisticsService/Trucks/{truckId}/Trips/{tripId}/Deliver` | `truck_trips_manage` | Workspace member | Deliver a trip |
| POST | `/api/v2/LogisticsService/Trucks/{truckId}/Trips/{tripId}/Depart` | `truck_trips_manage` | Workspace member | Depart a trip |
| POST | `/api/v2/LogisticsService/Trucks/{truckId}/Trips/{tripId}/Dispatch` | `truck_trips_manage` | Workspace member | Dispatch a trip |

## Vessels

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/Vessels` | `vessels_read` | Workspace member | Get all vessels |
| POST | `/api/v2/LogisticsService/Vessels` | `vessels_create` | Workspace member | Create a vessel |
| GET | `/api/v2/LogisticsService/Vessels/Count` | `vessels_read` | Workspace member | Get vessels count |
| GET | `/api/v2/LogisticsService/Vessels/{vesselId}` | `vessels_read` | Workspace member | Get vessel by ID |
| PUT | `/api/v2/LogisticsService/Vessels/{vesselId}` | `vessels_update` | Workspace member | Update a vessel |
| PATCH | `/api/v2/LogisticsService/Vessels/{vesselId}` | `vessels_update` | Workspace member | Patch a vessel |
| DELETE | `/api/v2/LogisticsService/Vessels/{vesselId}` | `vessels_delete` | Workspace member | Delete a vessel |

## Voyages

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/Voyages` | `voyages_read` | Workspace member | Get all voyages |
| POST | `/api/v2/LogisticsService/Voyages` | `voyages_create` | Workspace member | Create a voyage |
| GET | `/api/v2/LogisticsService/Voyages/Count` | `voyages_read` | Workspace member | Get voyages count |
| GET | `/api/v2/LogisticsService/Voyages/{voyageId}` | `voyages_read` | Workspace member | Get voyage by ID |
| PUT | `/api/v2/LogisticsService/Voyages/{voyageId}` | `voyages_update` | Workspace member | Update a voyage |
| PATCH | `/api/v2/LogisticsService/Voyages/{voyageId}` | `voyages_update` | Workspace member | Patch a voyage |
| DELETE | `/api/v2/LogisticsService/Voyages/{voyageId}` | `voyages_delete` | Workspace member | Delete a voyage |
| POST | `/api/v2/LogisticsService/Voyages/{voyageId}/Cancel` | `voyages_manage` | Workspace member | Cancel a voyage |
| POST | `/api/v2/LogisticsService/Voyages/{voyageId}/Complete` | `voyages_manage` | Workspace member | Complete a voyage |
| GET | `/api/v2/LogisticsService/Voyages/{voyageId}/PortCalls` | `voyages_read` | Workspace member | Get voyage port calls |
| POST | `/api/v2/LogisticsService/Voyages/{voyageId}/PortCalls` | `voyages_update` | Workspace member | Create a port call |
| GET | `/api/v2/LogisticsService/Voyages/{voyageId}/PortCalls/Count` | `voyages_read` | Workspace member | Get voyage port calls count |
| PUT | `/api/v2/LogisticsService/Voyages/{voyageId}/PortCalls/{portCallId}` | `voyages_update` | Workspace member | Update a port call |
| PATCH | `/api/v2/LogisticsService/Voyages/{voyageId}/PortCalls/{portCallId}` | `voyages_update` | Workspace member | Patch a voyage port call |
| DELETE | `/api/v2/LogisticsService/Voyages/{voyageId}/PortCalls/{portCallId}` | `voyages_update` | Workspace member | Delete a port call |
| POST | `/api/v2/LogisticsService/Voyages/{voyageId}/Start` | `voyages_manage` | Workspace member | Start a voyage |

## Warehouses

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LogisticsService/Warehouses` | `warehouses_read` | Workspace member | Get all warehouses |
| POST | `/api/v2/LogisticsService/Warehouses` | `warehouses_create` | Workspace member | Create a warehouse |
| GET | `/api/v2/LogisticsService/Warehouses/Count` | `warehouses_read` | Workspace member | Get warehouses count |
| GET | `/api/v2/LogisticsService/Warehouses/{warehouseId}` | `warehouses_read` | Workspace member | Get warehouse by ID |
| PUT | `/api/v2/LogisticsService/Warehouses/{warehouseId}` | `warehouses_update` | Workspace member | Update a warehouse |
| PATCH | `/api/v2/LogisticsService/Warehouses/{warehouseId}` | `warehouses_update` | Workspace member | Patch a warehouse |
| DELETE | `/api/v2/LogisticsService/Warehouses/{warehouseId}` | `warehouses_delete` | Workspace member | Delete a warehouse |

Generated from the source at commit 05da3e4078.
<!-- generated:end -->
