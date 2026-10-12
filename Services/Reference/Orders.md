# Orders service

The Orders service lets you create and manage the orders your workspace sells, and read the orders it receives from its suppliers.

**Who uses it:** developers who connect order processing, fulfilment or customer portals to a workspace.

**Base route:** `/api/v2/OrdersService/...`

## What you can do

- **Create and update orders:** create an order, add, update or remove its lines, and calculate the totals of the order or a single line. See [Orders](~/Modules/Sales-Hub/Sales-Records/Orders.md).
- **List your orders** with their count or their extended details.
- **Turn a cart into an order** by submitting it.
- **Send an order:** preview the order email and send it to its recipients.
- **Read the orders addressed to you:** list the orders other workspaces issued to your workspace, or to you personally, with their lines.
- To get paid for an order, issue an [invoice](~/Modules/Accounting/Billing/Billing-Records/Invoices.md) for it.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** `orders_read`, `orders_create`, `orders_update` and `orders_delete`; `carts_create` to submit a cart; `email_send` to preview or send the order email.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `OrdersService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## Orders

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/OrdersService/Orders` | `orders_read` | Workspace member | Gets a list of orders for a tenant. |
| POST | `/api/v2/OrdersService/Orders` | `orders_create` | Workspace member | Creates a new order. |
| GET | `/api/v2/OrdersService/Orders/Count` | `orders_read` | Workspace member | Gets the count of orders for a tenant. |
| GET | `/api/v2/OrdersService/Orders/Extended` | `orders_read` | Workspace member | Gets a list of extended orders for a tenant. |
| GET | `/api/v2/OrdersService/Orders/Me/Received` | `orders_read` | Signed-in user, or workspace member with a workspace | List the orders the current user received. |
| GET | `/api/v2/OrdersService/Orders/Me/Received/Count` | `orders_read` | Signed-in user, or workspace member with a workspace | Count the orders the current user received. |
| GET | `/api/v2/OrdersService/Orders/Me/Received/{orderId}` | `orders_read` | Signed-in user, or workspace member with a workspace | Get an order the current user received. |
| GET | `/api/v2/OrdersService/Orders/Me/Received/{orderId}/Lines` | `orders_read` | Signed-in user, or workspace member with a workspace | List the lines of an order the current user received. |
| GET | `/api/v2/OrdersService/Orders/Received` | `orders_read` | Signed-in user, or workspace member with a workspace | List the orders the tenant received. |
| GET | `/api/v2/OrdersService/Orders/Received/Count` | `orders_read` | Signed-in user, or workspace member with a workspace | Count the orders the tenant received. |
| GET | `/api/v2/OrdersService/Orders/Received/{orderId}` | `orders_read` | Signed-in user, or workspace member with a workspace | Get an order the tenant received. |
| GET | `/api/v2/OrdersService/Orders/Received/{orderId}/Lines` | `orders_read` | Signed-in user, or workspace member with a workspace | List the lines of an order the tenant received. |
| POST | `/api/v2/OrdersService/Orders/SubmitCart` | `carts_create` | Signed-in user, or workspace member with a workspace | Submits a cart and creates an order. |
| GET | `/api/v2/OrdersService/Orders/{orderId}` | `orders_read` | Workspace member | Gets a specific order by ID. |
| PUT | `/api/v2/OrdersService/Orders/{orderId}` | `orders_update` | Workspace member | Updates an existing order. |
| PATCH | `/api/v2/OrdersService/Orders/{orderId}` | `orders_update` | Workspace member | Partially updates an existing order. |
| DELETE | `/api/v2/OrdersService/Orders/{orderId}` | `orders_delete` | Workspace member | Deletes an order. |
| PUT | `/api/v2/OrdersService/Orders/{orderId}/Calculate` | `orders_update` | Workspace member | Calculates totals for an order. |
| POST | `/api/v2/OrdersService/Orders/{orderId}/Emails/Preview` | `email_send` | Workspace member | Preview the rendered email for an Order. |
| POST | `/api/v2/OrdersService/Orders/{orderId}/Emails/Send` | `email_send` | Workspace member | Send a transactional email for an order. |
| GET | `/api/v2/OrdersService/Orders/{orderId}/Lines` | `orders_read` | Workspace member | Gets order lines for an order. |
| POST | `/api/v2/OrdersService/Orders/{orderId}/Lines` | `orders_update` | Workspace member | Creates a new order line. |
| GET | `/api/v2/OrdersService/Orders/{orderId}/Lines/Count` | `orders_read` | Workspace member | Gets the count of order lines for an order. |
| GET | `/api/v2/OrdersService/Orders/{orderId}/Lines/{orderLineId}` | `orders_read` | Workspace member | Gets a specific order line. |
| PUT | `/api/v2/OrdersService/Orders/{orderId}/Lines/{orderLineId}` | `orders_update` | Workspace member | Updates an order line. |
| PATCH | `/api/v2/OrdersService/Orders/{orderId}/Lines/{orderLineId}` | `orders_update` | Workspace member | Partially updates an order line. |
| DELETE | `/api/v2/OrdersService/Orders/{orderId}/Lines/{orderLineId}` | `orders_update` | Workspace member | Deletes an order line. |
| PUT | `/api/v2/OrdersService/Orders/{orderId}/Lines/{orderLineId}/Calculate` | `orders_update` | Workspace member | Calculates totals for an order line. |

Generated from the source at commit 642fb3c3ad.
<!-- generated:end -->
