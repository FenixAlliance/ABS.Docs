# REST API development

*The production surface. Full model coverage, reads and writes, and what our own clients run on.*

## Shape of the API

Every business endpoint follows one pattern:

```text
/api/v2/{Module}Service/{Resource}
/api/v2/{Module}Service/{Resource}/{id}
/api/v2/{Module}Service/{Resource}/{id}/{SubResource}
```

So orders live at `/api/v2/OrdersService/Orders`, and the lines on one order at `/api/v2/OrdersService/Orders/{orderId}/Lines`.

There's one exception worth memorising. Your own user and profile sit at `/api/v2/Me`, outside any service group, because they aren't tenant-scoped.

Only `v2` exists. There's no `v1`, and `v3` refers to GraphQL rather than a newer REST.

Both JSON and XML are accepted and returned. Set `Content-Type` and `Accept` to `application/json` unless you have a reason not to.

## Find the endpoint you need

Your instance publishes its own documentation, which always matches the version you're running:

- Interactive docs at `/api/v2/documentation`
- Raw specification per service at `/swagger/{ServiceName}/swagger.json` or `.yaml`

There are 46 service specifications and roughly 1,400 operations.

> **Important:** The specifications don't yet describe the filtering and paging query parameters, and they model list endpoints in a way most generators mishandle. A client generated straight from the spec will fetch the first 120 records and offer you no way to ask for more. Read [filtering and paging](#filter-sort-and-page) and add those parameters by hand. We're fixing the generation; until then, plan for it.

## Authenticate

Three token endpoints exist. Pick by who's calling.

### A user signing in

```http
POST /login
Content-Type: application/json

{ "email": "you@example.com", "password": "…" }
```

Response:

```json
{
  "tokenType": "Bearer",
  "accessToken": "CfDJ8…",
  "expiresIn": 3600,
  "refreshToken": "CfDJ8…"
}
```

Send the access token on every call:

```http
Authorization: Bearer {accessToken}
```

Refresh with `POST /refresh` and `{ "refreshToken": "…" }`.

> **Important:** This token is opaque. It isn't a JWT, so don't decode it, read claims from it, or validate its signature. Hold the string and send it back.

Lifetimes follow the framework defaults, currently one hour for the access token and fourteen days for the refresh token. We don't override them, so treat those numbers as defaults rather than a contract, and refresh on `401` instead of on a timer.

If the account has two-factor enabled, sign-in returns `401` with `detail` set to `RequiresTwoFactor`. Resend the same request with `twoFactorCode` included.

### A server with no user

Use client credentials:

```http
POST /api/v2/OAuth/Token
Content-Type: application/json

{
  "client_id": "…",
  "client_secret": "…",
  "grant_type": "client_credentials",
  "requested_scopes": "orders.read orders.write"
}
```

Two things about this endpoint catch people out. The body is **JSON**, not form-encoded, even though the field names are snake_case. And the response arrives wrapped in the standard envelope rather than as a bare OAuth response, so the token is at `result.access_token`.

You get an RS256 JWT valid for one hour.

> **Note:** `client_credentials` is the only grant this endpoint implements. Sending `grant_type: "refresh_token"` returns an error saying the request was unsuccessful. Request a new token instead.

### Which one to use

| You are | Use |
|---|---|
| A user signing into your own front end | `POST /login` |
| A backend service acting on its own behalf | `POST /api/v2/OAuth/Token` |

There's no API key or personal access token scheme. If you want long-lived machine access, create an application and use client credentials.

## Tell us which tenant

Nearly every business operation is tenant-scoped. Supply the tenant either way:

```http
X-TenantId: 8f2c…
```

```text
GET /api/v2/OrdersService/Orders?tenantId=8f2c…
```

They're equivalent. The header is usually cleaner, particularly with a generated client.

Endpoints under `/api/v2/Me`, the version endpoint, and the auth endpoints don't need it.

> **Important:** Omit the tenant and you get a `400` whose body is **not** the standard envelope. It's an RFC 7807 problem document. A client that only knows how to parse the envelope will break on it, so handle both shapes. A malformed tenant id produces the same response as a missing one, so don't expect a message telling you the value was invalid.

The two shapes:

```json
{
  "type": "https://tools.ietf.org/html/rfc9110#section-15.5.1",
  "title": "One or more validation errors occurred.",
  "status": 400,
  "errors": { "tenantId": ["The tenantId field is required."] }
}
```

```json
{
  "isSuccess": false,
  "errorMessage": "Order 8f2c… was not found.",
  "errorCode": "NotFound",
  "httpStatus": 404,
  "correlationId": "0HN7…"
}
```

## Read the response

Every business response uses one envelope:

| Field | What it's for |
|---|---|
| `result` | Your data, absent on failure |
| `isSuccess` | Check this first |
| `errorMessage` | Human-readable, for logs rather than for branching |
| `errorCode` | Stable symbol, safe to branch on |
| `httpStatus` | Present on failures |
| `validationDetails` | Field-level errors, keyed by field name |
| `correlationId` | Quote this to support |
| `timestamp` | When we handled it |

Branch on `errorCode`. The values are compile-time symbols we don't rename: `Validation`, `NotFound`, `Conflict`, `Authorization`, `Authentication`, `UnprocessableEntity`, and others.

Status codes in use are `400`, `401`, `402`, `403`, `404`, `409`, `418`, `422`, `426`, `429`, and the `5xx` range. Two mappings differ from what people expect. Domain rule violations return `422` rather than `400`. Duplicate records, concurrency conflicts, and business-rule conflicts return `409`.

> **Note:** Authorization failures are deliberately indistinguishable from one another. We collapse the status, code, and message so the check can't be probed to learn what exists. Don't build logic that depends on telling one denial from another.

## Filter, sort, and page

List endpoints accept a subset of OData query options.

| Option | Supported |
|---|---|
| `$filter` | Yes |
| `$orderby` | Yes |
| `$search` | Yes |
| `$skip` | Yes |
| `$top` | Yes |
| `$count` | Yes |
| `$select` | No, returns `400` |
| `$expand` | No, returns `400` |

Responses are strongly typed, which is why `$select` and `$expand` are rejected rather than ignored. Use GraphQL if you need to shape a graph.

```http
GET /api/v2/OrdersService/Orders?$filter=orderStatus eq 'Draft'&$orderby=createdOn desc&$top=50
X-TenantId: 8f2c…
```

### Paging

**The page size is 120 and it's enforced.** Leave `$top` out and we set it to 120 for you. Ask for more than 120 and you get a `400`. There's no way to fetch an unbounded list, by design.

Page with `$skip` and `$top`:

```http
GET /api/v2/OrdersService/Orders?$skip=240&$top=120
```

Or use the friendlier pair, which we translate for you:

```http
GET /api/v2/OrdersService/Orders?pageNumber=3&pageSize=120
```

Send both `pageNumber` and `pageSize` together. A `pageSize` above 120 is quietly reduced to 120 rather than rejected, so don't rely on the number you sent.

### Counting

Every list endpoint has a `/Count` sibling that takes the same filter options:

```http
GET /api/v2/OrdersService/Orders/Count?$filter=orderStatus eq 'Draft'
```

It returns `Envelope<int>`. Paging parameters are ignored there, so you get the total for your filter rather than the size of a page. Call it before paging to know how many pages to expect.

## Write data

`POST` creates, `PUT` replaces, `DELETE` removes, and `PATCH` applies a standard JSON Patch document:

```http
PATCH /api/v2/OrdersService/Orders/{orderId}
Content-Type: application/json
X-TenantId: 8f2c…

[
  { "op": "replace", "path": "/orderStatus", "value": "Confirmed" },
  { "op": "add", "path": "/notes", "value": "Approved by finance" }
]
```

That's RFC 6902, so any standard JSON Patch library will produce it.

> **Important:** There's no idempotency key. A `POST` that times out may or may not have succeeded, and sending it again may create a second record. Query for the record before retrying a create.

## Data contract details

**Enums are strings.** You'll see `"orderStatus": "Draft"`, not a number.

**Null fields are omitted.** A property with no value is absent from the payload rather than present as `null`. Write clients that tolerate a missing key.

**Identifiers are strings** containing a GUID. The one exception is `tenantId`, which is parsed as a real GUID, so an id that isn't a valid GUID is treated as if you hadn't sent one.

**Money is an object**, not a number:

```json
{ "amount": 149.99, "currency": "USD" }
```

**A `type` property on a read model isn't writable.** Some records carry a `type` that identifies what kind of record they are. It's set when the record is created and never appears on a create or update model.

## Operational limits

**Rate limiting** may be applied per deployment. Nothing is enforced in a default installation, but don't design on the assumption that you can call without restraint. Handle `429` and back off.

**CORS** ships with no policy enabled, so browser calls from another origin are blocked until an operator configures one. Treat this as a server-to-server API and keep your credentials out of a browser.

**Request decompression** is off by default. Send uncompressed bodies unless your operator has enabled it.

## Build a client

There's no published package to install for any language. Two supported routes:

**Generate from the specification.** Point your generator at `/swagger/{ServiceName}/swagger.json`. Remember the caveat above and add the query parameters for filtering and paging yourself.

**Use the Postman collection.** We maintain a curated collection of around 295 requests covering the common flows, which is the fastest way to explore the API by hand before you write code.

## Checklist

- Send `Authorization: Bearer {token}` on every call
- Send `X-TenantId` on everything except `/api/v2/Me`
- Check `isSuccess`, then branch on `errorCode`
- Handle both the envelope and the RFC 7807 problem shape for `400`
- Expect 120 records per page and page explicitly
- Log `correlationId`
- Don't blind-retry a `POST`
