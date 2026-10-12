# Quotes service

The Quotes service lets you create, price and send quotes, and lets the customer who receives a quote place the order from it.

**Who uses it:** developers who build quoting into a sales tool or a customer portal.

**Base route:** `/api/v2/QuotesService/...`

## What you can do

- **Create and price a quote:** create the quote, add, update or remove its lines, and calculate the quote or a single line. See [Quotes](~/Modules/Sales-Hub/Sales-Records/Quotes.md).
- **Send a quote:** preview the quote email and send it to its recipients.
- **Close or reopen a quote** when the offer ends or you want to revise it.
- **Create an order from your own quote.** See [Orders](~/Modules/Sales-Hub/Sales-Records/Orders.md).
- **Read the quotes you received:** list the quotes sent to your workspace or to you personally, with their lines.
- **Place an order from a quote you received** while it is open and not expired. A repeat call returns the same order.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** `quotes_read`, `quotes_create`, `quotes_update` and `quotes_delete` for quotes and their lines; `orders_create` to place an order from a received quote; `email_send` to preview or send the quote email.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `QuotesService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## Quotes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/QuotesService/Quotes` | `quotes_read` | Workspace member | Get a list of quotes. |
| POST | `/api/v2/QuotesService/Quotes` | `quotes_create` | Workspace member | Create a new quote. |
| GET | `/api/v2/QuotesService/Quotes/Count` | `quotes_read` | Workspace member | Get the count of quotes. |
| GET | `/api/v2/QuotesService/Quotes/Extended` | `quotes_read` | Workspace member | Get a list of extended quotes. |
| GET | `/api/v2/QuotesService/Quotes/Me/Received` | `quotes_read` | Signed-in user, or workspace member with a workspace | List the quotes the current user received. |
| GET | `/api/v2/QuotesService/Quotes/Me/Received/Count` | `quotes_read` | Signed-in user, or workspace member with a workspace | Count the quotes the current user received. |
| GET | `/api/v2/QuotesService/Quotes/Me/Received/{quoteId}` | `quotes_read` | Signed-in user, or workspace member with a workspace | Get a quote the current user received. |
| GET | `/api/v2/QuotesService/Quotes/Me/Received/{quoteId}/Lines` | `quotes_read` | Signed-in user, or workspace member with a workspace | List the lines of a quote the current user received. |
| POST | `/api/v2/QuotesService/Quotes/Me/{quoteId}/PlaceOrder` | `orders_create` | Signed-in user, or workspace member with a workspace | Place an order from a quote the current user received. |
| GET | `/api/v2/QuotesService/Quotes/Received` | `quotes_read` | Signed-in user, or workspace member with a workspace | List the quotes the tenant received. |
| GET | `/api/v2/QuotesService/Quotes/Received/Count` | `quotes_read` | Signed-in user, or workspace member with a workspace | Count the quotes the tenant received. |
| GET | `/api/v2/QuotesService/Quotes/Received/{quoteId}` | `quotes_read` | Signed-in user, or workspace member with a workspace | Get a quote the tenant received. |
| GET | `/api/v2/QuotesService/Quotes/Received/{quoteId}/Lines` | `quotes_read` | Signed-in user, or workspace member with a workspace | List the lines of a quote the tenant received. |
| GET | `/api/v2/QuotesService/Quotes/{quoteId}` | `quotes_read` | Workspace member | Get a quote by ID. |
| PUT | `/api/v2/QuotesService/Quotes/{quoteId}` | `quotes_update` | Workspace member | Update an existing quote. |
| PATCH | `/api/v2/QuotesService/Quotes/{quoteId}` | `quotes_update` | Workspace member | Patch an existing quote. |
| DELETE | `/api/v2/QuotesService/Quotes/{quoteId}` | `quotes_delete` | Workspace member | Delete a quote. |
| PUT | `/api/v2/QuotesService/Quotes/{quoteId}/Calculate` | `quotes_update` | Workspace member | Calculate a quote. |
| PUT | `/api/v2/QuotesService/Quotes/{quoteId}/Close` | `quotes_update` | Workspace member | Close a quote. |
| POST | `/api/v2/QuotesService/Quotes/{quoteId}/Emails/Preview` | `email_send` | Workspace member | Preview the rendered email for an invoice. |
| POST | `/api/v2/QuotesService/Quotes/{quoteId}/Emails/Send` | `email_send` | Workspace member | Send a quote transactional email to recipients. |
| GET | `/api/v2/QuotesService/Quotes/{quoteId}/Lines` | `quotes_read` | Workspace member | Get quote lines for a quote. |
| POST | `/api/v2/QuotesService/Quotes/{quoteId}/Lines` | `quotes_create` | Workspace member | Create a new quote line. |
| GET | `/api/v2/QuotesService/Quotes/{quoteId}/Lines/Count` | `quotes_read` | Workspace member | Get the count of quote lines. |
| GET | `/api/v2/QuotesService/Quotes/{quoteId}/Lines/Exists` | `quotes_read` | Workspace member | Check if a quote line exists. |
| GET | `/api/v2/QuotesService/Quotes/{quoteId}/Lines/{quoteLineId}` | `quotes_read` | Workspace member | Get a quote line by ID. |
| PUT | `/api/v2/QuotesService/Quotes/{quoteId}/Lines/{quoteLineId}` | `quotes_update` | Workspace member | Update a quote line. |
| PATCH | `/api/v2/QuotesService/Quotes/{quoteId}/Lines/{quoteLineId}` | `quotes_update` | Workspace member | Patch a quote line. |
| DELETE | `/api/v2/QuotesService/Quotes/{quoteId}/Lines/{quoteLineId}` | `quotes_delete` | Workspace member | Delete a quote line. |
| PUT | `/api/v2/QuotesService/Quotes/{quoteId}/Lines/{quoteLineId}/Calculate` | `quotes_update` | Workspace member | Calculate a quote line. |
| PUT | `/api/v2/QuotesService/Quotes/{quoteId}/Lines/{quoteLineId}/Upsert` | `quotes_update` | Workspace member | Upsert a quote line. |
| POST | `/api/v2/QuotesService/Quotes/{quoteId}/Orders` | `quotes_update` | Workspace member | Create an order from a quote. |
| POST | `/api/v2/QuotesService/Quotes/{quoteId}/PlaceOrder` | `orders_create` | Signed-in user, or workspace member with a workspace | Place an order from a quote the tenant received. |
| PUT | `/api/v2/QuotesService/Quotes/{quoteId}/Reopen` | `quotes_update` | Workspace member | Reopen a closed quote. |

Generated from the source at commit 642fb3c3ad.
<!-- generated:end -->
