<!-- generated:start -->
# System service reference

> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `SystemService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## Antiforgery

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SystemService/Antiforgery/GetAndStoreTokens` |  |  | Get and store antiforgery tokens |
| GET | `/api/v2/SystemService/Antiforgery/IsRequestValid` |  |  | Validate antiforgery request |

## IntegrationConnections

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/Integrations/Connections` | `integrations_read` | Workspace member | Lists the tenant's integration connections across every provider, optionally narrowed to one. Descriptor-only: this reads the tenant-wide connection index and never a credential key, so the response carries account labels, ids, statuses and clocks - and no secret of any kind. That property is structural rather than filtered, because IntegrationConnectionDto has nowhere to put a credential. |
| DELETE | `/api/v2/Integrations/Connections/{connectionId}` | `integrations_delete` | Workspace member | Disconnects one connection: the index entry and its stored credential are removed together. Idempotent - disconnecting something that is not connected is a success, so a double-clicked button or a replayed step converges instead of failing the second time. |

## IntegrationOAuthAuthorize

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/Integrations/OAuth/Authorize/{provider}` | `integrations_manage` | Workspace member | Start an outbound OAuth authorization for a provider |

## IntegrationOAuthCallback

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/Integrations/OAuth/Callback/{provider}` |  | Public | Complete an outbound OAuth authorization (provider redirect target) |

## LicenseAssignments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/SystemService/LicenseAssignments` | `licenses_manage` | Workspace member | Assign a license seat |
| GET | `/api/v2/SystemService/LicenseAssignments/{licenseId}` |  | Workspace member | List license seat assignments |
| DELETE | `/api/v2/SystemService/LicenseAssignments/{licenseId}/{enrollmentId}` | `licenses_manage` | Workspace member | Revoke a license seat |

## Licensing

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SystemService/Licensing/Licenses` | `licenses_read` | Workspace member | Retrieve a list of licenses |
| POST | `/api/v2/SystemService/Licensing/Licenses/Redeem` |  | Workspace member | Redeem a license |
| POST | `/api/v2/SystemService/Licensing/Licenses/Validate` |  | Public | Validate a license |
| GET | `/api/v2/SystemService/Licensing/Licenses/{licenseId}` | `licenses_read` | Workspace member | Retrieve a license by ID |
| GET | `/api/v2/SystemService/Licensing/Licenses/{licenseId}/Assignments` |  | Workspace member | Retrieve license assignments |
| GET | `/api/v2/SystemService/Licensing/Licenses/{licenseId}/Attributes` | `licenses_read` | Workspace member | Retrieve license attributes |
| GET | `/api/v2/SystemService/Licensing/Licenses/{licenseId}/Features` | `licenses_read` | Workspace member | Retrieve license features |
| GET | `/api/v2/SystemService/Licensing/Licenses/{licenseId}/Quota` |  | Workspace member | Retrieve license record quota |

## MyTasks

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TasksService/Me/Pending` |  | Signed-in user | Get my tasks across all my workspaces |
| GET | `/api/v2/TasksService/Me/Pending/Count` |  | Signed-in user | Count my tasks across all my workspaces |

## Outbox

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SystemService/Outbox/Tenants/{tenantId}/Poison` |  | Workspace member | List unresolved consumer poison on a tenant's own partition |
| POST | `/api/v2/SystemService/Outbox/Tenants/{tenantId}/Poison/Resolve` |  | Workspace member | Resolve a consumer poison position on a tenant's own partition |

## Tasks

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/TasksService` | `tasks_create` | Workspace member | Create a task |
| GET | `/api/v2/TasksService/Pending` | `tasks_read` | Workspace member | Get my task inbox |
| GET | `/api/v2/TasksService/Pending/Count` | `tasks_read` | Workspace member | Count my task inbox |
| GET | `/api/v2/TasksService/Tenant` | `tasks_read` | Workspace member | Get the tenant's task list |
| GET | `/api/v2/TasksService/Tenant/Count` | `tasks_read` | Workspace member | Count the tenant's task list |
| GET | `/api/v2/TasksService/{taskId}` | `tasks_read` | Workspace member | Get one task + its full assignee set |
| PUT | `/api/v2/TasksService/{taskId}` | `tasks_update` | Workspace member | Update a task |
| DELETE | `/api/v2/TasksService/{taskId}` | `tasks_delete` | Workspace member | Delete a task |
| POST | `/api/v2/TasksService/{taskId}/Assignments` | `tasks_manage` | Workspace member | Assign a task |
| DELETE | `/api/v2/TasksService/{taskId}/Assignments/{assignmentId}` | `tasks_manage` | Workspace member | Remove a task assignment |
| POST | `/api/v2/TasksService/{taskId}/Complete` | `tasks_complete` | Workspace member | Complete a task |
| POST | `/api/v2/TasksService/{taskId}/Reopen` | `tasks_update` | Workspace member | Reopen a task |

## Tenants

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/SystemService/Tenants/{tenantId}/Emails/Preview` | `email_send` | Workspace member | Preview the rendered email for a tenant. |
| POST | `/api/v2/SystemService/Tenants/{tenantId}/Emails/Send` | `email_send` | Workspace member | Send an email to a tenant. |

## Users

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/SystemService/Users/{userId}/Emails/Preview` | `email_send` | Workspace member | Preview the rendered email for a user. |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
