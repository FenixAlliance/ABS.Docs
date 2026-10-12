# Analytics service

The Analytics service lets you list the analytics datasets you can query in a workspace and run aggregate queries against them.

**Who uses it:** analysts and developers who build reports or dashboards from workspace data. In Studio, the same data is available in the workspace's Analytics module.

**Base route:** `/api/v2/AnalyticsService/...`

## What you can do

- **List the datasets you can query.** Read the catalog of datasets available to you in the workspace. Each dataset lists its measures, dimensions and filters by name and label, and the catalog shows only the datasets your permissions allow.
- **Run an aggregate query.** Choose a dataset, one measure, up to two dimensions and up to two filters, and receive the shaped result. You name measures, dimensions and filters by the identifiers the catalog returns, never by column or table names.
- **Stay within the query limits.** A second dimension is accepted only when the dataset allows that pair. A date range covers at most about three years. A query outside these limits, or one that names an unknown dataset, measure, dimension or filter, is refused.
- **Get results scoped to your workspace.** Every query reads only the workspace you name, and only datasets you hold the permission for.

## Before you call it

- **Sign in.** Sign in with your email address to get a token, or use the OpenID Connect flows. See [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md) and [REST API development](~/Web-API-Development/REST-API-Development.md).
- **Name the workspace.** Every call takes the workspace from the `X-TenantId` header or the `tenantId` request value. See [Tell us which tenant](~/Web-API-Development/REST-API-Development.md#tell-us-which-tenant).
- **Hold the permission.** Reading the catalog needs only workspace membership. Running a query needs the permission the dataset declares, which the catalog returns with each dataset.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `AnalyticsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## Datasets

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AnalyticsService/Datasets` |  | Workspace member | Get the permission-scoped analytics catalog |

## Queries

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/AnalyticsService/Queries/Execute` | Depends on the dataset | Workspace member | Execute a governed analytics query |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
