<!-- generated:start -->
# Intelligence service reference

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
| GET | `/api/v2/IntelligenceService/ApprovalAdvice/Consent` | (resolved at run time) | Workspace member | Get the tenant's AI approval advice consent |
| GET | `/api/v2/IntelligenceService/ApprovalAdvice/Disclosure` | (resolved at run time) | Workspace member | Get the AI approval advice disclosure |
| POST | `/api/v2/IntelligenceService/ApprovalAdvice/OptIn` | (resolved at run time) | Workspace member | Opt the tenant in to AI approval advice |
| POST | `/api/v2/IntelligenceService/ApprovalAdvice/OptOut` | (resolved at run time) | Workspace member | Opt the tenant out of AI approval advice |

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
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations` | (resolved at run time) | Workspace member | Get all conversations for a cognitive agent |
| POST | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations` | `bots_create` | Workspace member | Create a new cognitive agent conversation |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/Count` | (resolved at run time) | Workspace member | Get conversation count for a cognitive agent |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{id}` | (resolved at run time) | Workspace member | Get a cognitive agent conversation by ID |
| PUT | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{id}` | (resolved at run time) | Workspace member | Update a cognitive agent conversation |
| DELETE | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{id}` | (resolved at run time) | Workspace member | Delete a cognitive agent conversation |

## CognitiveAgentMessages

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{conversationId}/Messages` | (resolved at run time) | Workspace member | Get all messages for a cognitive agent conversation |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{conversationId}/Messages/Count` | (resolved at run time) | Workspace member | Get message count for a cognitive agent conversation |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{conversationId}/Messages/{id}` | (resolved at run time) | Workspace member | Get a cognitive agent conversation message by ID |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Conversations/{conversationId}/PendingApprovals` | (resolved at run time) | Workspace member | Get unresolved approvals for a cognitive agent conversation |

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
| GET | `/api/v2/IntelligenceService/CognitiveAgents/BuiltInCapabilities` | (resolved at run time) | Workspace member | Get the intrinsic built-in capabilities every agent possesses |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/Count` | `bots_read` | Workspace member | Get cognitive agents count |
| GET | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/PermissionReadiness` | (resolved at run time) | Workspace member | Get a cognitive agent's permission readiness |
| POST | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Permissions/Grant` | (resolved at run time) | Workspace member | Grant required tool permissions to a cognitive agent |
| POST | `/api/v2/IntelligenceService/CognitiveAgents/{agentId}/Permissions/Revoke` | (resolved at run time) | Workspace member | Revoke orphaned tool permissions from a cognitive agent |
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
