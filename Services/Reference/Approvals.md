<!-- generated:start -->
# Approvals service reference

> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `ApprovalsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## Approvals

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ApprovalsService/Pending` | `approvals_read` | Workspace member | Get my approver inbox |
| GET | `/api/v2/ApprovalsService/Pending/Count` | `approvals_read` | Workspace member | Count my approver inbox |
| GET | `/api/v2/ApprovalsService/{ticketId}` | `approvals_read` | Workspace member | Get one approval + its full assignment set |
| POST | `/api/v2/ApprovalsService/{ticketId}/Cancel` | `approvals_manage` | Workspace member | Withdraw a pending approval |
| POST | `/api/v2/ApprovalsService/{ticketId}/Decide` | `approvals_decide` | Workspace member | Record a decision on a pending approval |
| POST | `/api/v2/ApprovalsService/{ticketId}/Reassign` | `approvals_manage` | Workspace member | Reassign a pending approval to a different approver |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
