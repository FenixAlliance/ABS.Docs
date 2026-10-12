<!-- generated:start -->
# Subscriptions service reference

> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `SubscriptionsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## CommercialSubscriptions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SubscriptionsService/CommercialSubscriptions` | `subscriptions_read` | Workspace member | List commercial subscriptions |
| POST | `/api/v2/SubscriptionsService/CommercialSubscriptions` | `subscriptions_create` | Workspace member | Establish (purchase) a commercial subscription |
| GET | `/api/v2/SubscriptionsService/CommercialSubscriptions/Count` | `subscriptions_read` | Workspace member | Count commercial subscriptions |
| POST | `/api/v2/SubscriptionsService/CommercialSubscriptions/Purchase` | `subscriptions_create` | Workspace member | Purchase a platform-published offering |
| GET | `/api/v2/SubscriptionsService/CommercialSubscriptions/{subscriptionId}/PayableObligation` | `subscriptions_read` | Workspace member | Get a commercial subscription's current payable obligation |

## PlatformPricing

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SubscriptionsService/PlatformPricing` |  | Public | Get the platform plans priced in a currency |

## SubscriptionPlans

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SubscriptionsService/SubscriptionPlans` | `subscriptions_read` | Workspace member | Get all subscription plans |
| POST | `/api/v2/SubscriptionsService/SubscriptionPlans` | `subscriptions_create` | Workspace member | Create a subscription plan |
| GET | `/api/v2/SubscriptionsService/SubscriptionPlans/Count` | `subscriptions_read` | Workspace member | Get subscription plans count |
| GET | `/api/v2/SubscriptionsService/SubscriptionPlans/{planId}` | `subscriptions_read` | Workspace member | Get a subscription plan by ID |
| PUT | `/api/v2/SubscriptionsService/SubscriptionPlans/{planId}` | `subscriptions_update` | Workspace member | Update a subscription plan |
| PATCH | `/api/v2/SubscriptionsService/SubscriptionPlans/{planId}` | `subscriptions_update` | Workspace member | Patch a subscription plan |
| DELETE | `/api/v2/SubscriptionsService/SubscriptionPlans/{planId}` | `subscriptions_delete` | Workspace member | Delete a subscription plan |

## Subscriptions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SubscriptionsService/Subscriptions` | `subscriptions_read` | Workspace member | Get all subscriptions |
| POST | `/api/v2/SubscriptionsService/Subscriptions` | `subscriptions_create` | Workspace member | Create a subscription |
| GET | `/api/v2/SubscriptionsService/Subscriptions/Count` | `subscriptions_read` | Workspace member | Get subscriptions count |
| GET | `/api/v2/SubscriptionsService/Subscriptions/{subscriptionId}` | `subscriptions_read` | Workspace member | Get a subscription by ID |
| PUT | `/api/v2/SubscriptionsService/Subscriptions/{subscriptionId}` | `subscriptions_update` | Workspace member | Update a subscription |
| PATCH | `/api/v2/SubscriptionsService/Subscriptions/{subscriptionId}` | `subscriptions_update` | Workspace member | Patch a subscription |
| DELETE | `/api/v2/SubscriptionsService/Subscriptions/{subscriptionId}` | `subscriptions_delete` | Workspace member | Delete a subscription |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
