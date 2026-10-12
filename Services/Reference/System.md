# System service

The System service lets you connect your workspace to outside services, manage licenses and tasks, send workspace emails and resolve failed deliveries.

**Who uses it:** workspace owners and administrators, and developers who automate licenses, tasks or integration connections.

**Base route:** `/api/v2/SystemService/...`. Integration connections live under `/api/v2/Integrations/...`, and tasks under `/api/v2/TasksService/...`.

## What you can do

- **Connect integrations.** List your workspace's integration connections or disconnect one. The list never includes credentials, and disconnecting removes the stored credential with the connection. You create a connection from the integration's own page in Studio. See [Official integrations](~/Modules/Integrations.md#connect-an-integration).
- **Manage licenses.** List your workspace's licenses with their features, attributes and record quota, redeem a license, and check whether a license key is valid. Checking a key needs no sign-in.
- **Assign license seats.** Assign a seat of a license to a member, list the assignments, and revoke a seat.
- **Work with tasks.** Create, update, assign, complete, reopen and delete workspace tasks, and read your task inbox. You can also read your pending tasks across every workspace you belong to. It includes only workspaces where you can read tasks. Tasks that a running workflow is waiting on can't be deleted or reopened. See [Working with tasks](~/Modules/WORKFLOWS.md#working-with-tasks).
- **Send workspace emails.** Preview an email rendered with your workspace's data, then send it to the recipients you choose.
- **Resolve failed deliveries (business owner).** List the deliveries that failed for your workspace and record a resolution for each. A resolution is recorded separately and does not change the original failure record.

## Before you call it

- **Sign in.** Sign in with your email address to get a token, or use the OpenID Connect flows. See [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md) and [REST API development](~/Web-API-Development/REST-API-Development.md).
- **Name the workspace.** Workspace calls take the workspace from the `X-TenantId` header or the `tenantId` request value. See [Tell us which tenant](~/Web-API-Development/REST-API-Development.md#tell-us-which-tenant). Your cross-workspace task list needs only a signed-in account.
- **Hold the permission.** Integration connections need `integrations_read`, `integrations_manage` or `integrations_delete`. Licenses need `licenses_read`, and seat changes need `licenses_manage`. Tasks need `tasks_read`, `tasks_create`, `tasks_update`, `tasks_delete`, `tasks_manage` or `tasks_complete`. Emails need `email_send`. Listing and resolving failed deliveries is for the workspace's business owner.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `SystemService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## IntegrationConnections

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/Integrations/Connections` | `integrations_read` | Workspace member | List the tenant's integration connections |
| DELETE | `/api/v2/Integrations/Connections/{connectionId}` | `integrations_delete` | Workspace member | Disconnect an integration connection |

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

Generated from the source at commit 05da3e4078.
<!-- generated:end -->
