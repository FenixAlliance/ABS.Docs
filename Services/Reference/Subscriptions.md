# Subscriptions service

The Subscriptions service lets you sell subscriptions from your own plans, buy a platform plan for your workspace, and read the platform's plan prices.

**Who uses it:** developers who build a subscription checkout or a pricing page, and who manage recurring billing for a workspace.

**Base route:** `/api/v2/SubscriptionsService/...`

## What you can do

- **Keep subscription plans:** create, update and delete the plans your workspace sells.
- **Keep subscriptions:** create, read, update and delete subscription records.
- **Start a subscription from your plan:** start a subscription to one of your own plans, billed to the customer you name, for a first billing period you set.
- **Buy a platform plan:** purchase a platform offering for your workspace, for the billing cycle you choose. The price is computed for you, in your workspace's currency. The Free plan needs no payment.
- **Find what to pay:** starting or buying a subscription does not take payment by itself. Its invoice appears shortly after; read the subscription's payable obligation to find that invoice, then pay it.
- **Show plan prices:** get the platform's plans priced in a currency you choose.

## Before you call it

- **Sign-in:** reading the platform's plan prices needs no sign-in.
- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Retries:** when you start or buy a subscription, send an idempotency key so a retry returns the original subscription instead of creating a second one.
- **Permissions:** `subscriptions_read`, `subscriptions_create`, `subscriptions_update` and `subscriptions_delete`.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `SubscriptionsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

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

Generated from the source at commit 05da3e4078.
<!-- generated:end -->
