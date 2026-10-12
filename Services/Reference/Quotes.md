<!-- generated:start -->
# Quotes service reference

> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `QuotesService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## Quotes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/QuotesService/Quotes` | `quotes_read` | Workspace member | Get a list of quotes. |
| POST | `/api/v2/QuotesService/Quotes` | `quotes_create` | Workspace member | Create a new quote. |
| GET | `/api/v2/QuotesService/Quotes/Count` | `quotes_read` | Workspace member | Get the count of quotes. |
| GET | `/api/v2/QuotesService/Quotes/Extended` | `quotes_read` | Workspace member | Get a list of extended quotes. |
| GET | `/api/v2/QuotesService/Quotes/Me/Received` | `quotes_read` | Workspace member | List the quotes the current user received. |
| GET | `/api/v2/QuotesService/Quotes/Me/Received/Count` | `quotes_read` | Workspace member | Count the quotes the current user received. |
| GET | `/api/v2/QuotesService/Quotes/Me/Received/{quoteId}` | `quotes_read` | Workspace member | Get a quote the current user received. |
| GET | `/api/v2/QuotesService/Quotes/Me/Received/{quoteId}/Lines` | `quotes_read` | Workspace member | List the lines of a quote the current user received. |
| POST | `/api/v2/QuotesService/Quotes/Me/{quoteId}/PlaceOrder` | `orders_create` | Workspace member | Place an order from a quote the current user received. |
| GET | `/api/v2/QuotesService/Quotes/Received` | `quotes_read` | Workspace member | List the quotes the tenant received. |
| GET | `/api/v2/QuotesService/Quotes/Received/Count` | `quotes_read` | Workspace member | Count the quotes the tenant received. |
| GET | `/api/v2/QuotesService/Quotes/Received/{quoteId}` | `quotes_read` | Workspace member | Get a quote the tenant received. |
| GET | `/api/v2/QuotesService/Quotes/Received/{quoteId}/Lines` | `quotes_read` | Workspace member | List the lines of a quote the tenant received. |
| GET | `/api/v2/QuotesService/Quotes/{quoteId}` | `quotes_read` | Workspace member | Get a quote by ID. |
| PUT | `/api/v2/QuotesService/Quotes/{quoteId}` | `quotes_update` | Workspace member | Update an existing quote. |
| PATCH | `/api/v2/QuotesService/Quotes/{quoteId}` | `quotes_update` | Workspace member | Patch an existing quote. |
| DELETE | `/api/v2/QuotesService/Quotes/{quoteId}` | `quotes_delete` | Workspace member | Delete a quote. |
| PUT | `/api/v2/QuotesService/Quotes/{quoteId}/Calculate` | `quotes_update` | Workspace member | Calculate a quote. |
| PUT | `/api/v2/QuotesService/Quotes/{quoteId}/Close` | `quotes_update` | Workspace member | Close a quote. |
| POST | `/api/v2/QuotesService/Quotes/{quoteId}/Emails/Preview` | `email_send` | Workspace member | Previews the rendered invoice email for the given invoice ID. |
| POST | `/api/v2/QuotesService/Quotes/{quoteId}/Emails/Send` | `email_send` | Workspace member | Sends a basic transactional email to recipients. Only global admins are permitted. |
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
| POST | `/api/v2/QuotesService/Quotes/{quoteId}/PlaceOrder` | `orders_create` | Workspace member | Place an order from a quote the tenant received. |
| PUT | `/api/v2/QuotesService/Quotes/{quoteId}/Reopen` | `quotes_update` | Workspace member | Reopen a closed quote. |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
