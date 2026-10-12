# Approvals service

The Approvals service lets the people who approve work in your workspace see what waits for them and record their decisions.

**Who uses it:** developers who build an approver inbox into an app, a portal or a chat tool.

**Base route:** `/api/v2/ApprovalsService/...`

## What you can do

- **Show an approver inbox:** list and count the approvals waiting for the signed-in user.
- **Read an approval:** get one approval with every approver of every stage, and where each one stands.
- **Decide:** approve or reject a pending approval, with an optional reason. The decision is recorded as the signed-in user, never as a name sent in the request.
- **Reassign or withdraw:** route the current stage of a pending approval to a different approver, or withdraw an approval before it is decided.

Approvals are always decided by a person. An approver must be a person, not an automated account, and each approver holds one seat per approval stage.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every call.
- **Permissions:** `approvals_read` to see the inbox and read an approval, `approvals_decide` to approve or reject, and `approvals_manage` to reassign or withdraw.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
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
