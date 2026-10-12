<!-- generated:start -->
# Orders service reference

> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `OrdersService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## Orders

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/OrdersService/Orders` | `orders_read` | Workspace member | Gets a list of orders for a tenant. |
| POST | `/api/v2/OrdersService/Orders` | `orders_create` | Workspace member | Creates a new order. |
| GET | `/api/v2/OrdersService/Orders/Count` | `orders_read` | Workspace member | Gets the count of orders for a tenant. |
| GET | `/api/v2/OrdersService/Orders/Extended` | `orders_read` | Workspace member | Gets a list of extended orders for a tenant. |
| GET | `/api/v2/OrdersService/Orders/Me/Received` | `orders_read` | Workspace member | List the orders the current user received. |
| GET | `/api/v2/OrdersService/Orders/Me/Received/Count` | `orders_read` | Workspace member | Count the orders the current user received. |
| GET | `/api/v2/OrdersService/Orders/Me/Received/{orderId}` | `orders_read` | Workspace member | Get an order the current user received. |
| GET | `/api/v2/OrdersService/Orders/Me/Received/{orderId}/Lines` | `orders_read` | Workspace member | List the lines of an order the current user received. |
| GET | `/api/v2/OrdersService/Orders/Received` | `orders_read` | Workspace member | List the orders the tenant received. |
| GET | `/api/v2/OrdersService/Orders/Received/Count` | `orders_read` | Workspace member | Count the orders the tenant received. |
| GET | `/api/v2/OrdersService/Orders/Received/{orderId}` | `orders_read` | Workspace member | Get an order the tenant received. |
| GET | `/api/v2/OrdersService/Orders/Received/{orderId}/Lines` | `orders_read` | Workspace member | List the lines of an order the tenant received. |
| POST | `/api/v2/OrdersService/Orders/SubmitCart` | `carts_create` | Workspace member | Submits a cart and creates an order. |
| GET | `/api/v2/OrdersService/Orders/{orderId}` | `orders_read` | Workspace member | Gets a specific order by ID. |
| PUT | `/api/v2/OrdersService/Orders/{orderId}` | `orders_update` | Workspace member | Updates an existing order. |
| PATCH | `/api/v2/OrdersService/Orders/{orderId}` | `orders_update` | Workspace member | Partially updates an existing order. |
| DELETE | `/api/v2/OrdersService/Orders/{orderId}` | `orders_delete` | Workspace member | Deletes an order. |
| PUT | `/api/v2/OrdersService/Orders/{orderId}/Calculate` | `orders_update` | Workspace member | Calculates totals for an order. |
| POST | `/api/v2/OrdersService/Orders/{orderId}/Emails/Preview` | `email_send` | Workspace member | Previews the rendered invoice email for the given Order ID. |
| POST | `/api/v2/OrdersService/Orders/{orderId}/Emails/Send` | `email_send` | Workspace member | Sends a Order transactional email to recipients. Only global admins are permitted. |
| GET | `/api/v2/OrdersService/Orders/{orderId}/Lines` | `orders_read` | Workspace member | Gets order lines for an order. |
| POST | `/api/v2/OrdersService/Orders/{orderId}/Lines` | `orders_update` | Workspace member | Creates a new order line. |
| GET | `/api/v2/OrdersService/Orders/{orderId}/Lines/Count` | `orders_read` | Workspace member | Gets the count of order lines for an order. |
| GET | `/api/v2/OrdersService/Orders/{orderId}/Lines/{orderLineId}` | `orders_read` | Workspace member | Gets a specific order line. |
| PUT | `/api/v2/OrdersService/Orders/{orderId}/Lines/{orderLineId}` | `orders_update` | Workspace member | Updates an order line. |
| PATCH | `/api/v2/OrdersService/Orders/{orderId}/Lines/{orderLineId}` | `orders_update` | Workspace member | Partially updates an order line. |
| DELETE | `/api/v2/OrdersService/Orders/{orderId}/Lines/{orderLineId}` | `orders_update` | Workspace member | Deletes an order line. |
| PUT | `/api/v2/OrdersService/Orders/{orderId}/Lines/{orderLineId}/Calculate` | `orders_update` | Workspace member | Calculates totals for an order line. |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
