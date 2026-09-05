# Web API development

*Build against your Suite from your own systems.*

Your Alliance Business Suite exposes its business model over HTTP. Anything you can do in the Studio, you can do from your own code, under the same identity, permissions, and audit trail.

Two surfaces are available today, and they aren't equal.

**[REST](~/Web-API-Development/REST-API-Development.md)** is the production surface. It covers the whole model, it supports reads and writes, and it's what our own clients use. Start here.

**[GraphQL](~/Web-API-Development/GraphQl-API-Development.md)** is a read-only preview covering a small slice of the model. It's useful for pulling session context in one round trip. It isn't a replacement for REST.

> **Important:** gRPC isn't an API surface. The project in our source tree is an unmodified template and exposes nothing. Don't plan against it.

## Where the documentation lives

Your running instance publishes its own OpenAPI documentation, which is always accurate for the version you're on:

- Interactive docs: `https://{your-instance}/api/v2/documentation`
- Raw specification per service: `https://{your-instance}/swagger/{ServiceName}/swagger.json`

There are 46 service specifications covering roughly 1,400 operations. Browse the interactive docs to find the service you need, then work from its specification.

> **Note:** Read [REST](~/Web-API-Development/REST-API-Development.md) before you generate a client from those specifications. The specs don't currently describe the filtering and paging parameters, so a generated client will fetch the first page and nothing else until you add those by hand.

## Authenticate

Get a token, then send it as a bearer token on every request.

For a user signing in:

```http
POST /login
Content-Type: application/json

{ "email": "you@example.com", "password": "..." }
```

You get back `accessToken`, `refreshToken`, `tokenType`, and `expiresIn`. Send the access token on subsequent calls:

```http
Authorization: Bearer {accessToken}
```

Refresh it at `POST /refresh` with `{ "refreshToken": "..." }`.

> **Important:** The token from `/login` is opaque. Don't try to decode it, read claims from it, or validate it yourself. Treat it as a string you hold and send back.

For server-to-server work with no user, use client credentials. That flow, its exact field casing, and its limits are covered in [REST](~/Web-API-Development/REST-API-Development.md).

## Tell us which tenant

Almost every business operation needs to know which tenant it applies to. Send a header:

```http
X-TenantId: {your-tenant-id}
```

A `?tenantId={id}` query parameter does the same job if a header is awkward for your client. Either works.

Leave it out and you get a `400`. Note that this particular `400` uses a different body shape from every other error, which catches people out. [REST](~/Web-API-Development/REST-API-Development.md) shows both shapes.

## What a response looks like

Successful and failed calls both come back in the same envelope:

```json
{
  "result": { "id": "…", "orderStatus": "Draft" },
  "isSuccess": true,
  "errorMessage": null,
  "errorCode": null,
  "correlationId": "0HN7…",
  "timestamp": "2026-08-16T10:31:44Z"
}
```

Check `isSuccess`. On failure, branch on `errorCode`, which is a stable symbol such as `Validation`, `NotFound`, or `Conflict`. Keep `correlationId` in your logs, because it's what our support team will ask you for.

## Know before you build

Four things surprise people, and all four are easier to design around than to discover later.

**We're a server-to-server API by default.** No CORS policy ships enabled, so a browser application on a different origin will be blocked until an operator configures one. Call us from your backend.

**POST isn't safely retryable.** There's no idempotency key on our endpoints today. If a request times out, check whether it succeeded before sending it again.

**Null fields are omitted.** A property that's null won't appear in the response at all. Write clients that tolerate an absent key rather than expecting `null`.

**Client libraries aren't published.** Generate one from the OpenAPI specification, or use our Postman collection. There's no package to install.

## Next steps

- [REST API development](~/Web-API-Development/REST-API-Development.md) covers auth flows, filtering, paging, errors, and the full data contract
- [GraphQL API development](~/Web-API-Development/GraphQl-API-Development.md) covers what the preview surface can and can't do
