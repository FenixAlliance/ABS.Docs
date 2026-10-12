<!-- generated:start -->
# Analytics service reference

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
| POST | `/api/v2/AnalyticsService/Queries/Execute` | `descriptor.RequiredPermission` | Workspace member | Execute a governed analytics query |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
