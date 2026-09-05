# GraphQL API development

*A read-only preview for session context. Useful, narrow, and not a replacement for REST.*

We ship a GraphQL endpoint. Before you plan around it, understand what it is: four root fields covering the current session, no mutations, and roughly five percent of the business model. It exists so a client can pull the signed-in user, their tenant, and their cart in one round trip instead of three.

For anything else, use [REST](~/Web-API-Development/REST-API-Development.md).

## Endpoint

```text
POST /api/v3/graphql
```

The path is fixed and can't be moved by configuration. Send the same credentials you'd send to REST:

```http
Authorization: Bearer {accessToken}
X-TenantId: {your-tenant-id}
```

A `?tenantId=` query parameter works here too.

## What you can query

The root has four fields, and they're PascalCase:

| Field | Gives you |
|---|---|
| `CurrentUser` | The signed-in account holder |
| `CurrentTenant` | The tenant you're acting in |
| `CurrentCart` | The active cart |
| `ExecutionContext` | Identity and context for the current request |

```graphql
{
  CurrentUser {
    Id
    Email
  }
  CurrentTenant {
    Id
    Name
  }
}
```

> **Important:** There's no `node` field, no lookup by id, and no list root field. You can't ask for order 123. You reach records only by traversing down from `CurrentTenant`, and only where a resolver exists.

Around 39 types are exposed. Several collections on `CurrentTenant` have no resolver behind them yet and return null rather than data, which is worth checking before you build a screen on one.

## What it can't do

**No mutations.** The surface is read-only. Every write goes through REST.

**No subscriptions.** For live updates, poll REST.

**No field arguments.** You can't filter or paginate inside a query the way you normally would in GraphQL.

Filtering is available, but through an unusual route: OData query options on the HTTP request itself.

```text
POST /api/v3/graphql?$top=50&$filter=…
```

Those options apply globally to the whole request rather than to a single field, so you can't page two collections differently in one query. If you need that, make two calls or use REST.

## Errors arrive with a 200

GraphQL returns `200 OK` even when a call fails authentication or authorization. The failure shows up as an entry in the `errors` array rather than as a `401`.

```json
{
  "data": { "CurrentUser": null },
  "errors": [ { "message": "…" } ]
}
```

Check `errors` on every response. Don't rely on the status code.

## Exploring

Three browser tools ship with the endpoint:

```text
/api/v3/playground
/api/v3/graphiql
/api/v3/voyager
```

They're handy for exploring the schema during development.

> **Note:** Check with your operator whether these are reachable on your production instance, and ask for them to be closed there if so. A schema explorer is a development convenience rather than something to leave open to the internet.

## When to use it

Reach for GraphQL when you want the signed-in user, their tenant, and their cart in one call, and you'd rather not make three REST requests to assemble a page header.

Reach for [REST](~/Web-API-Development/REST-API-Development.md) for everything else: writes, lists, filtering, paging, reporting, and any resource outside the four root fields.

We'll expand this surface. Build on what's here now rather than on what it implies.
