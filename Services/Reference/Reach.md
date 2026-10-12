<!-- generated:start -->
# Reach service reference

> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `ReachService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## Categories

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ReachService/Categories` |  | Signed-in user | Gets the declared Reach categories |
| GET | `/api/v2/ReachService/Categories/Reconciliation` | `notifications_manage` | Workspace member | Reports Reach rules and occurrences on categories this build no longer declares |

## Decisions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ReachService/Decisions` | `notifications_read` | Workspace member | Gets the current tenant Reach decisions |
| GET | `/api/v2/ReachService/Decisions/Count` | `notifications_read` | Workspace member | Gets the current tenant Reach decision count |
| GET | `/api/v2/ReachService/Decisions/Explain` | `notifications_read` | Workspace member | "Why did this person not receive this" - the support-desk entry point. Name the recipient by principalId OR by contactId, and ask about ONE reachOccurrenceId OR about a half-open fromUtc/toUtc window. Both coordinates at once, or both question forms at once, are refused with the reason rather than silently answered halfway. |
| GET | `/api/v2/ReachService/Decisions/{reachDecisionId}` | `notifications_read` | Workspace member | Gets one Reach decision |

## Deliveries

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ReachService/Deliveries` | `notifications_read` | Workspace member | Gets the current tenant Reach deliveries |
| GET | `/api/v2/ReachService/Deliveries/Count` | `notifications_read` | Workspace member | Gets the current tenant Reach delivery count |
| GET | `/api/v2/ReachService/Deliveries/{reachDeliveryId}` | `notifications_read` | Workspace member | Gets one Reach delivery |

## Occurrences

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ReachService/Occurrences` | `notifications_read` | Workspace member | Gets the current tenant Reach occurrences |
| GET | `/api/v2/ReachService/Occurrences/Count` | `notifications_read` | Workspace member | Gets the current tenant Reach occurrence count |
| GET | `/api/v2/ReachService/Occurrences/{reachOccurrenceId}` | `notifications_read` | Workspace member | Gets one Reach occurrence |
| GET | `/api/v2/ReachService/Occurrences/{reachOccurrenceId}/Explain` | `notifications_read` | Workspace member | Explains who a notification reached, and who it did not |

## Policy

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ReachService/Policy` | `notifications_manage` | Workspace member | Gets the workspace notification policy |
| PUT | `/api/v2/ReachService/Policy` | `notifications_manage` | Workspace member | Sets the workspace notification ruling |
| DELETE | `/api/v2/ReachService/Policy` | `notifications_manage` | Workspace member | Withdraws the workspace notification ruling |
| PUT | `/api/v2/ReachService/Policy/Defaults` | `notifications_manage` | Workspace member | Sets the workspace notification default |
| DELETE | `/api/v2/ReachService/Policy/Defaults` | `notifications_manage` | Workspace member | Withdraws the workspace notification default |

## Preferences

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ReachService/Preferences` | `notifications_manage` | Workspace member | Gets the current tenant Reach preference rows |
| GET | `/api/v2/ReachService/Preferences/Count` | `notifications_manage` | Workspace member | Gets the current tenant Reach preference count |
| GET | `/api/v2/ReachService/Preferences/Member` |  | Workspace member | Gets the calling person notification settings for one workspace |
| PUT | `/api/v2/ReachService/Preferences/Member` |  | Workspace member | Sets one notification setting for the calling person in one workspace |
| DELETE | `/api/v2/ReachService/Preferences/Member` |  | Workspace member | Clears one notification setting for the calling person in one workspace |
| GET | `/api/v2/ReachService/Preferences/Personal` |  | Signed-in user | Gets the calling person personal notification settings |
| PUT | `/api/v2/ReachService/Preferences/Personal` |  | Signed-in user | Sets one personal notification setting |
| DELETE | `/api/v2/ReachService/Preferences/Personal` |  | Signed-in user | Clears one personal notification setting |

## Rules

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ReachService/Rules` | `notifications_read` | Workspace member | Gets the current tenant Reach rules |
| POST | `/api/v2/ReachService/Rules` | `notifications_manage` | Workspace member | Authors a Reach rule |
| GET | `/api/v2/ReachService/Rules/Count` | `notifications_read` | Workspace member | Gets the current tenant Reach rule count |
| GET | `/api/v2/ReachService/Rules/{reachRuleId}` | `notifications_read` | Workspace member | Gets one Reach rule |
| PUT | `/api/v2/ReachService/Rules/{reachRuleId}` | `notifications_manage` | Workspace member | Re-points a Reach rule audience |
| POST | `/api/v2/ReachService/Rules/{reachRuleId}/Disable` | `notifications_manage` | Workspace member | Disarms a Reach rule |
| POST | `/api/v2/ReachService/Rules/{reachRuleId}/Enable` | `notifications_manage` | Workspace member | Arms a Reach rule |

## Suppressions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ReachService/Suppressions` | `notifications_read` | Workspace member | Gets the current tenant Reach suppressions |
| POST | `/api/v2/ReachService/Suppressions` | `notifications_manage` | Workspace member | Suppresses an address |
| GET | `/api/v2/ReachService/Suppressions/Count` | `notifications_read` | Workspace member | Gets the current tenant Reach suppression count |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
