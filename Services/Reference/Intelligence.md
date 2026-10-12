# Intelligence service

The Intelligence service lets you configure your workspace's AI agents, review what AI did and what it used, and decide whether AI may advise on approvals.

**Who uses it:** workspace administrators who configure and audit AI, and developers who manage agents through the API.

**Base route:** `/api/v2/IntelligenceService/...`

## What you can do

- **Configure agents.** Create, update and delete your workspace's agents, assign skills to them, and set their variables. Create and maintain the skills your agents can use.
- **Keep agents within their permissions.** Check whether an agent holds the permissions its tools need, grant the missing ones, and revoke the ones its tools no longer use. Read the capability catalog to see what each capability does and which permission it requires.
- **Review agent conversations.** Read an agent's conversations, their messages and the tool approvals still waiting for a decision, and upload attachments to a conversation.
- **Audit AI activity.** Read the record of each AI run, the AI usage observations, a usage summary for a date range, and agent execution diagnostics.
- **Check AI providers.** List the AI providers and models available to your workspace.
- **Decide on AI advice for approvals.** AI advice on approvals is off until you opt in. Read the disclosure first: the provider and model that would be used and which approval fields are shared. Then opt in to that disclosure, or opt out at any time. Advice only informs the people who decide.
- **Install definitions from the Gallery.** Validate, install, update and uninstall definitions published to the Gallery, and read which ones your workspace has installed.

## Before you call it

- **Sign in.** Sign in with your email address to get a token, or use the OpenID Connect flows. See [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md) and [REST API development](~/Web-API-Development/REST-API-Development.md).
- **Name the workspace.** Every call takes the workspace from the `X-TenantId` header or the `tenantId` request value. See [Tell us which tenant](~/Web-API-Development/REST-API-Development.md#tell-us-which-tenant).
- **Hold the permission.** Agents, skills, runs, usage and definitions need `bots_read`, `bots_create`, `bots_update`, `bots_delete` or `bots_manage`. Reading conversations needs `bots_read`, and reading every member's conversations also needs `bots_manage`. Attachments need `conversations_manage`. AI advice needs `approvals_read` to read the disclosure and consent, and `approvals_manage` to opt in or out. Checking an agent's permissions needs `bots_read`, and granting or revoking them needs `security_permissions_manage`.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `IntelligenceService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## AgentExecutionDiagnostics

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/AgentExecutionDiagnostics` | `bots_read` | Workspace member | Get agent execution diagnostics |
| GET | `/api/v2/IntelligenceService/AgentExecutionDiagnostics/Count` | `bots_read` | Workspace member | Get agent execution diagnostics count |
| GET | `/api/v2/IntelligenceService/AgentExecutionDiagnostics/{id}` | `bots_read` | Workspace member | Get agent execution diagnostic by ID |

## AgentRuntimeFabric

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/IntelligenceService/AgentRuntimeFabric/Claim` | `bots_manage` | Workspace member | Claim the next eligible work order |
| POST | `/api/v2/IntelligenceService/AgentRuntimeFabric/Complete` | `bots_manage` | Workspace member | Complete a leased work order |
| POST | `/api/v2/IntelligenceService/AgentRuntimeFabric/Execute` | `bots_manage` | Workspace member | Request a work order's governed effect |
| POST | `/api/v2/IntelligenceService/AgentRuntimeFabric/Fault` | `bots_manage` | Workspace member | Fault a leased work order |
| POST | `/api/v2/IntelligenceService/AgentRuntimeFabric/Pools` | `bots_manage` | Workspace member | Provision an agent runtime pool |
| POST | `/api/v2/IntelligenceService/AgentRuntimeFabric/Register` | `bots_manage` | Workspace member | Register an agent runtime worker |
| GET | `/api/v2/IntelligenceService/AgentRuntimeFabric/WorkOrders/{workOrderId}/Cancelled` | `bots_read` | Workspace member | Read a work order's cancel state |
| POST | `/api/v2/IntelligenceService/AgentRuntimeFabric/Workers/{workerId}/Activate` | `bots_manage` | Workspace member | Activate an agent runtime worker |
| POST | `/api/v2/IntelligenceService/AgentRuntimeFabric/Workers/{workerId}/Heartbeat` | `bots_manage` | Workspace member | Heartbeat an agent runtime worker |

## AgentRuntimeStatus

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/AgentRuntimeStatus/WorkOrders` | `bots_read` | Workspace member | Get agent runtime work orders |
| GET | `/api/v2/IntelligenceService/AgentRuntimeStatus/WorkOrders/Count` | `bots_read` | Workspace member | Get agent runtime work orders count |
| GET | `/api/v2/IntelligenceService/AgentRuntimeStatus/WorkOrders/{id}` | `bots_read` | Workspace member | Get agent runtime work order by ID |

## AiProviders

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/AiProviders` |  | Checked by the service | Get the available AI providers |
| GET | `/api/v2/IntelligenceService/AiProviders/Availability` | `bots_read` | Workspace member | Get AI provider/model availability for a tenant |

## AiRuns

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/AiRuns` | `bots_read` | Workspace member | Get all AI runs |
| GET | `/api/v2/IntelligenceService/AiRuns/Count` | `bots_read` | Workspace member | Get AI runs count |
| GET | `/api/v2/IntelligenceService/AiRuns/{id}` | `bots_read` | Workspace member | Get AI run by ID |

## AiUsage

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/AiUsage/Summary` | `bots_read` | Workspace member | Get the AI usage summary |

## AiUsageObservations

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/AiUsageObservations` | `bots_read` | Workspace member | Get all AI usage observations |
| GET | `/api/v2/IntelligenceService/AiUsageObservations/Count` | `bots_read` | Workspace member | Get AI usage observations count |
| GET | `/api/v2/IntelligenceService/AiUsageObservations/{id}` | `bots_read` | Workspace member | Get AI usage observation by ID |

## ApprovalAdvice

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/ApprovalAdvice/Consent` | `approvals_read` | Workspace member | Get the tenant's AI approval advice consent |
| GET | `/api/v2/IntelligenceService/ApprovalAdvice/Disclosure` | `approvals_read` | Workspace member | Get the AI approval advice disclosure |
| POST | `/api/v2/IntelligenceService/ApprovalAdvice/OptIn` | `approvals_manage` | Workspace member | Opt the tenant in to AI approval advice |
| POST | `/api/v2/IntelligenceService/ApprovalAdvice/OptOut` | `approvals_manage` | Workspace member | Opt the tenant out of AI approval advice |

## Capabilities

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/Capabilities` |  | Workspace member | Get the annotated capability catalog |
| GET | `/api/v2/IntelligenceService/Capabilities/Count` |  | Workspace member | Get the capability catalog count |
| GET | `/api/v2/IntelligenceService/Capabilities/{key}` |  | Workspace member | Get a capability by key |

## CognitiveAgentConversationAttachments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{conversationId}/Attachments` | `conversations_manage` | Workspace member | Upload an attachment to a cognitive agent conversation |

## CognitiveAgentConversations

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations` | `bots_read` (bots_manage too, to reach every user's conversations) | Workspace member | Get all conversations for a cognitive agent |
| POST | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations` | `bots_create` | Workspace member | Create a new cognitive agent conversation |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/Count` | `bots_read` (bots_manage too, to reach every user's conversations) | Workspace member | Get conversation count for a cognitive agent |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{id}` | `bots_read` (bots_manage too, to reach every user's conversations) | Workspace member | Get a cognitive agent conversation by ID |
| PUT | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{id}` | `bots_update` (bots_manage too, to reach every user's conversations) | Workspace member | Update a cognitive agent conversation |
| DELETE | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{id}` | `bots_delete` (bots_manage too, to reach every user's conversations) | Workspace member | Delete a cognitive agent conversation |

## CognitiveAgentMessages

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{conversationId}/Messages` | `bots_read` (bots_manage too, to reach every user's conversations) | Workspace member | Get all messages for a cognitive agent conversation |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{conversationId}/Messages/Count` | `bots_read` (bots_manage too, to reach every user's conversations) | Workspace member | Get message count for a cognitive agent conversation |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{conversationId}/Messages/{id}` | `bots_read` (bots_manage too, to reach every user's conversations) | Workspace member | Get a cognitive agent conversation message by ID |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{conversationId}/PendingApprovals` | `bots_read` (bots_manage too, to reach every user's conversations) | Workspace member | Get unresolved approvals for a cognitive agent conversation |

## CognitiveAgentSkills

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Skills` | `bots_read` | Workspace member | Get all skill assignments for a cognitive agent |
| POST | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Skills` | `bots_create` | Workspace member | Assign a skill to a cognitive agent |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Skills/Count` | `bots_read` | Workspace member | Get skill assignment count for a cognitive agent |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Skills/{id}` | `bots_read` | Workspace member | Get a cognitive agent skill assignment by ID |
| PUT | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Skills/{id}` | `bots_update` | Workspace member | Update a cognitive agent skill assignment |
| DELETE | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Skills/{id}` | `bots_delete` | Workspace member | Remove a skill assignment from a cognitive agent |

## CognitiveAgentVariables

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Variables` | `bots_read` | Workspace member | Get all variables for a cognitive agent |
| POST | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Variables` | `bots_create` | Workspace member | Add a variable to a cognitive agent |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Variables/Count` | `bots_read` | Workspace member | Get variable count for a cognitive agent |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Variables/{id}` | `bots_read` | Workspace member | Get a cognitive agent variable by ID |
| PUT | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Variables/{id}` | `bots_update` | Workspace member | Update a cognitive agent variable |
| DELETE | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Variables/{id}` | `bots_delete` | Workspace member | Remove a variable from a cognitive agent |

## CognitiveAgents

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/CognitiveAgents` | `bots_read` | Workspace member | Get all cognitive agents |
| POST | `/api/v2/IntelligenceService/CognitiveAgents` | `bots_create` | Workspace member | Create a new cognitive agent |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/BuiltInCapabilities` | `bots_read` | Workspace member | Get the intrinsic built-in capabilities every agent possesses |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/Count` | `bots_read` | Workspace member | Get cognitive agents count |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/PermissionReadiness` | `bots_read` | Workspace member | Get a cognitive agent's permission readiness |
| POST | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Permissions/Grant` | `security_permissions_manage` | Workspace member | Grant required tool permissions to a cognitive agent |
| POST | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Permissions/Revoke` | `security_permissions_manage` | Workspace member | Revoke orphaned tool permissions from a cognitive agent |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{id}` | `bots_read` | Workspace member | Get cognitive agent by ID |
| PUT | `/api/v2/IntelligenceService/CognitiveAgents/{id}` | `bots_update` | Workspace member | Update a cognitive agent |
| DELETE | `/api/v2/IntelligenceService/CognitiveAgents/{id}` | `bots_delete` | Workspace member | Delete a cognitive agent |

## CognitiveSkills

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/CognitiveSkills` | `bots_read` | Workspace member | Get all cognitive skills |
| POST | `/api/v2/IntelligenceService/CognitiveSkills` | `bots_create` | Workspace member | Create a new cognitive skill |
| GET | `/api/v2/IntelligenceService/CognitiveSkills/Count` | `bots_read` | Workspace member | Get cognitive skills count |
| GET | `/api/v2/IntelligenceService/CognitiveSkills/{id}` | `bots_read` | Workspace member | Get cognitive skill by ID |
| PUT | `/api/v2/IntelligenceService/CognitiveSkills/{id}` | `bots_update` | Workspace member | Update a cognitive skill |
| DELETE | `/api/v2/IntelligenceService/CognitiveSkills/{id}` | `bots_delete` | Workspace member | Delete a cognitive skill |

## DefinitionDistribution

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/IntelligenceService/DefinitionDistribution/Install` | `bots_create` | Workspace member | Install a repository-backed definition |
| GET | `/api/v2/IntelligenceService/DefinitionDistribution/InstalledState` | `bots_read` | Workspace member | Get the installed-definition state for a tenant |
| POST | `/api/v2/IntelligenceService/DefinitionDistribution/Uninstall` | `bots_delete` | Workspace member | Uninstall a Gallery-installed definition |
| POST | `/api/v2/IntelligenceService/DefinitionDistribution/Update` | `bots_update` | Workspace member | Update an installed repository-backed definition |
| POST | `/api/v2/IntelligenceService/DefinitionDistribution/Validate` | `bots_read` | Workspace member | Validate a repository-backed definition |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
