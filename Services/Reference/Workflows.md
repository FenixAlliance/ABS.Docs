<!-- generated:start -->
# Workflows service reference

> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `WorkflowsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## WorkflowCapabilities

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/WorkflowsService/WorkflowCapabilities` | `workflows_read` | Workspace member | Get all workflow capabilities |
| GET | `/api/v2/WorkflowsService/WorkflowCapabilities/Count` | `workflows_read` | Workspace member | Get workflow capabilities count |

## WorkflowDefinitions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/WorkflowsService/WorkflowDefinitions` | `workflows_read` | Workspace member | Get all workflow definitions |
| POST | `/api/v2/WorkflowsService/WorkflowDefinitions` | `workflows_create` | Workspace member | Create a new workflow definition |
| GET | `/api/v2/WorkflowsService/WorkflowDefinitions/Count` | `workflows_read` | Workspace member | Get workflow definitions count |
| GET | `/api/v2/WorkflowsService/WorkflowDefinitions/{id}` | `workflows_read` | Workspace member | Get workflow definition by ID |
| PUT | `/api/v2/WorkflowsService/WorkflowDefinitions/{id}` | `workflows_update` | Workspace member | Update a draft workflow definition |
| POST | `/api/v2/WorkflowsService/WorkflowDefinitions/{id}/Archive` | `workflows_manage` | Workspace member | Archive a workflow definition |
| POST | `/api/v2/WorkflowsService/WorkflowDefinitions/{id}/Clone` | `workflows_create` | Workspace member | Clone a workflow definition into a new draft |
| POST | `/api/v2/WorkflowsService/WorkflowDefinitions/{id}/Publish` | `workflows_manage` | Workspace member | Publish a workflow definition |
| POST | `/api/v2/WorkflowsService/WorkflowDefinitions/{id}/Start` | (resolved at run time) | Workspace member | Start a workflow definition |
| POST | `/api/v2/WorkflowsService/WorkflowDefinitions/{id}/StartAsApplication` | (resolved at run time) | Workspace member | Start a workflow definition unattended, under an application principal |
| POST | `/api/v2/WorkflowsService/WorkflowDefinitions/{id}/TestRun` | (resolved at run time) | Workspace member | Test-run a DRAFT workflow definition |
| GET | `/api/v2/WorkflowsService/WorkflowDefinitions/{id}/TriggerReconciliation` | `workflows_manage_triggers` | Workspace member | Compute the publish-time trigger reconciliation for a workflow definition |
| GET | `/api/v2/WorkflowsService/WorkflowDefinitions/{id}/Validate` | `workflows_read` | Workspace member | Validate a workflow definition |

## WorkflowInstances

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/WorkflowsService/WorkflowInstances` | `workflows_read` | Workspace member | Get all workflow executions |
| GET | `/api/v2/WorkflowsService/WorkflowInstances/Count` | `workflows_read` | Workspace member | Get workflow executions count |
| GET | `/api/v2/WorkflowsService/WorkflowInstances/{id}` | `workflows_read` | Workspace member | Get workflow execution by ID |
| GET | `/api/v2/WorkflowsService/WorkflowInstances/{id}/Trace` | `workflows_read` | Workspace member | Get a workflow execution's per-node trace |

## WorkflowNodeDescriptors

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/WorkflowsService/WorkflowNodeDescriptors` | `workflows_read` | Workspace member | Get all workflow node descriptors |
| GET | `/api/v2/WorkflowsService/WorkflowNodeDescriptors/Count` | `workflows_read` | Workspace member | Get workflow node descriptors count |

## WorkflowTriggerBindings

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/WorkflowsService/WorkflowTriggerBindings` | `workflows_manage_triggers` | Workspace member | Get all schedule trigger bindings |
| POST | `/api/v2/WorkflowsService/WorkflowTriggerBindings` | (resolved at run time) | Workspace member | Create a trigger binding (schedule or domain-event) |
| GET | `/api/v2/WorkflowsService/WorkflowTriggerBindings/Count` | `workflows_manage_triggers` | Workspace member | Get schedule trigger bindings count |
| GET | `/api/v2/WorkflowsService/WorkflowTriggerBindings/EventContracts` | `workflows_manage_triggers` | Workspace member | List bindable business-event contracts |
| GET | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}` | `workflows_manage_triggers` | Workspace member | Get schedule trigger binding by ID |
| PUT | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}` | (resolved at run time) | Workspace member | Update a schedule trigger binding |
| DELETE | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}` | (resolved at run time) | Workspace member | Delete a schedule trigger binding |
| POST | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}/Disable` | (resolved at run time) | Workspace member | Disable a schedule trigger binding |
| POST | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}/Enable` | (resolved at run time) | Workspace member | Enable a schedule trigger binding |
| GET | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}/Occurrences` | `workflows_manage_triggers` | Workspace member | Get a schedule trigger binding's occurrence history |
| GET | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}/Occurrences/Count` | `workflows_manage_triggers` | Workspace member | Get a schedule trigger binding's occurrence history count |
| GET | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}/Readiness` | `workflows_manage_triggers` | Workspace member | Get a trigger binding's execution-identity readiness |
| POST | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}/RepointVersion` | (resolved at run time) | Workspace member | Re-point a schedule trigger binding at the current published version |
| POST | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}/Webhook/RotateCredentials` | (resolved at run time) | Workspace member | Rotate a webhook trigger binding's credentials (reveal once) |

## WorkflowWebhooks

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/WorkflowsService/Triggers/Webhooks/{webhookKey}` |  | Public |  |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
