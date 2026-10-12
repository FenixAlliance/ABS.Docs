# Workflows service

The Workflows service lets you create, publish and run the workflows of your workspace, start them on a schedule, a business event or a webhook, and follow every run.

**Who uses it:** developers who automate business processes or start workflows from other systems.

**Base route:** `/api/v2/WorkflowsService/...`

## What you can do

- **Design workflows:** create a workflow, update its draft, validate it, clone it into a new draft, and publish or archive it. List the steps and capabilities you can use in a workflow. See [Workflows Studio](~/Modules/WORKFLOWS.md).
- **Run workflows:** start a published workflow as yourself or unattended as an application, and test-run a draft before you publish it.
- **Follow runs:** list the runs of your workflows, and read the step-by-step trace of each run.
- **Start workflows automatically:** bind a published workflow to a schedule, a business event or a webhook. Enable, disable or delete a binding, point it at the latest published version, check that it is ready to run, and read the history of when it fired.
- **Receive webhooks:** a webhook binding gives you a private address and, by default, a signing secret for the system that calls it. Each delivery is checked against its signature before a run starts. For a sender that cannot sign, you can create a binding that relies on its private address alone. You can rotate the credentials, and the new ones are shown once.

An AI agent step in a workflow can read your data and answer, but it does not change your records.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics. The webhook address takes no token; the delivery signature, or for an unsigned binding the private address, authenticates it.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** `workflows_read` to read workflows and runs, `workflows_create` to create and clone, `workflows_update` to edit a draft, `workflows_manage` to publish and archive, and `workflows_manage_triggers` to read bindings. `workflows_execute` to start a run, as yourself or unattended, `workflows_update` to test-run a draft, and `workflows_manage_triggers` to create, change, enable, disable or delete a binding. A binding only fires when the identity it runs as also holds `workflows_execute`; the readiness check tells you if it doesn't.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `WorkflowsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

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
| POST | `/api/v2/WorkflowsService/WorkflowDefinitions/{id}/Start` | `workflows_execute` | Workspace member | Start a workflow definition |
| POST | `/api/v2/WorkflowsService/WorkflowDefinitions/{id}/StartAsApplication` | `workflows_execute` | Workspace member | Start a workflow definition unattended, under an application principal |
| POST | `/api/v2/WorkflowsService/WorkflowDefinitions/{id}/TestRun` | `workflows_update` | Workspace member | Test-run a DRAFT workflow definition |
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
| POST | `/api/v2/WorkflowsService/WorkflowTriggerBindings` | `workflows_manage_triggers` | Workspace member | Create a trigger binding (schedule or domain-event) |
| GET | `/api/v2/WorkflowsService/WorkflowTriggerBindings/Count` | `workflows_manage_triggers` | Workspace member | Get schedule trigger bindings count |
| GET | `/api/v2/WorkflowsService/WorkflowTriggerBindings/EventContracts` | `workflows_manage_triggers` | Workspace member | List bindable business-event contracts |
| GET | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}` | `workflows_manage_triggers` | Workspace member | Get schedule trigger binding by ID |
| PUT | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}` | `workflows_manage_triggers` | Workspace member | Update a schedule trigger binding |
| DELETE | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}` | `workflows_manage_triggers` | Workspace member | Delete a schedule trigger binding |
| POST | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}/Disable` | `workflows_manage_triggers` | Workspace member | Disable a schedule trigger binding |
| POST | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}/Enable` | `workflows_manage_triggers` | Workspace member | Enable a schedule trigger binding |
| GET | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}/Occurrences` | `workflows_manage_triggers` | Workspace member | Get a schedule trigger binding's occurrence history |
| GET | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}/Occurrences/Count` | `workflows_manage_triggers` | Workspace member | Get a schedule trigger binding's occurrence history count |
| GET | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}/Readiness` | `workflows_manage_triggers` | Workspace member | Get a trigger binding's execution-identity readiness |
| POST | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}/RepointVersion` | `workflows_manage_triggers` | Workspace member | Re-point a schedule trigger binding at the current published version |
| POST | `/api/v2/WorkflowsService/WorkflowTriggerBindings/{id}/Webhook/RotateCredentials` | `workflows_manage_triggers` | Workspace member | Rotate a webhook trigger binding's credentials (reveal once) |

## WorkflowWebhooks

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/WorkflowsService/Triggers/Webhooks/{webhookKey}` |  | Public |  |

Generated from the source at commit 05da3e4078.
<!-- generated:end -->
