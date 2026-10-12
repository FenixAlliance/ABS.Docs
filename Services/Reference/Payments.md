# Payments service

The Payments service lets you connect your payment provider account, get paid for your invoices through payment links, refund payments, and keep your payment records.

**Who uses it:** developers who automate how a workspace gets paid, and finance teams who reconcile payments.

**Base route:** `/api/v2/PaymentsService/...`

**Availability:** payments run today in test mode, through Stripe. Live payments and other providers are coming.

## What you can do

- **Connect your payment provider:** create the connection to your own Stripe account, list your connections, update the account ID and enabled capabilities, and rotate the notification URL. See [Stripe](~/Integrations/Stripe.md).
- **Get paid for an invoice:** create a payment link for one of your invoices, or a payment reference you can print on a document. The payer enters card details on the provider's own checkout. See [Payments](~/Modules/Accounting/Billing/Billing-Records/Payments.md).
- **Refund a payment:** return a completed payment through the provider that collected it. Each refund request is sent once.
- **Reconcile outcomes:** list the provider operations whose outcome is not yet confirmed, and ask the provider what became of one.
- **Keep payment records:** create, read, update and delete payments, payment methods, payment modes and payment terms.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** `payments_read`, `payments_create`, `payments_update` and `payments_delete` for payment records; `payments_manage` to connect a provider and to create payment links and references; `payment_refunds_create` to refund a payment.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `PaymentsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## PaymentMethods

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/PaymentsService/PaymentMethods` | `payments_read` | Workspace member | Retrieves all payment methods |
| POST | `/api/v2/PaymentsService/PaymentMethods` | `payments_create` | Workspace member | Creates a new payment method |
| GET | `/api/v2/PaymentsService/PaymentMethods/Count` | `payments_read` | Workspace member | Counts payment methods |
| GET | `/api/v2/PaymentsService/PaymentMethods/{paymentMethodId}` | `payments_read` | Workspace member | Gets a payment method by ID |
| PUT | `/api/v2/PaymentsService/PaymentMethods/{paymentMethodId}` | `payments_update` | Workspace member | Updates a payment method |
| PATCH | `/api/v2/PaymentsService/PaymentMethods/{paymentMethodId}` | `payments_update` | Workspace member | Patch a payment method |
| DELETE | `/api/v2/PaymentsService/PaymentMethods/{paymentMethodId}` | `payments_delete` | Workspace member | Deletes a payment method |

## PaymentModes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/PaymentsService/PaymentModes` | `payments_read` | Workspace member | Retrieves all payment modes |
| POST | `/api/v2/PaymentsService/PaymentModes` | `payments_create` | Workspace member | Creates a new payment mode |
| GET | `/api/v2/PaymentsService/PaymentModes/Count` | `payments_read` | Workspace member | Counts payment modes |
| GET | `/api/v2/PaymentsService/PaymentModes/{paymentModeId}` | `payments_read` | Workspace member | Gets a payment mode by ID |
| PUT | `/api/v2/PaymentsService/PaymentModes/{paymentModeId}` | `payments_update` | Workspace member | Updates a payment mode |
| PATCH | `/api/v2/PaymentsService/PaymentModes/{paymentModeId}` | `payments_update` | Workspace member | Patch a payment mode |
| DELETE | `/api/v2/PaymentsService/PaymentModes/{paymentModeId}` | `payments_delete` | Workspace member | Deletes a payment mode |

## PaymentProviderRegistrations

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/PaymentsService/PaymentProviderRegistrations` | `payments_read` | Workspace member | Lists the tenant's provider registrations |
| POST | `/api/v2/PaymentsService/PaymentProviderRegistrations` | `payments_manage` | Workspace member | Provisions a provider webhook registration |
| GET | `/api/v2/PaymentsService/PaymentProviderRegistrations/Count` | `payments_read` | Workspace member | Counts the tenant's provider registrations |
| PUT | `/api/v2/PaymentsService/PaymentProviderRegistrations/{registrationId}` | `payments_manage` | Workspace member | Updates an owned provider registration |
| POST | `/api/v2/PaymentsService/PaymentProviderRegistrations/{registrationId}/Credential` | `payments_manage` | Workspace member | Sets the credential authority a provider registration transacts under |
| POST | `/api/v2/PaymentsService/PaymentProviderRegistrations/{registrationId}/Environment` | `payments_manage` | Workspace member | Declares the world a provider registration transacts in |
| POST | `/api/v2/PaymentsService/PaymentProviderRegistrations/{registrationId}/RotateKey` | `payments_manage` | Workspace member | Rotates a registration's webhook key |

## PaymentTerms

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/PaymentsService/PaymentTerms` | `payments_read` | Workspace member | Retrieves all payment terms |
| POST | `/api/v2/PaymentsService/PaymentTerms` | `payments_create` | Workspace member | Creates a new payment term |
| GET | `/api/v2/PaymentsService/PaymentTerms/Count` | `payments_read` | Workspace member | Counts payment terms |
| GET | `/api/v2/PaymentsService/PaymentTerms/{paymentTermId}` | `payments_read` | Workspace member | Gets a payment term by ID |
| PUT | `/api/v2/PaymentsService/PaymentTerms/{paymentTermId}` | `payments_update` | Workspace member | Updates a payment term |
| PATCH | `/api/v2/PaymentsService/PaymentTerms/{paymentTermId}` | `payments_update` | Workspace member | Patch a payment term |
| DELETE | `/api/v2/PaymentsService/PaymentTerms/{paymentTermId}` | `payments_delete` | Workspace member | Deletes a payment term |

## Payments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/PaymentsService/Payments` | `payments_read` | Workspace member | Retrieves all payments |
| POST | `/api/v2/PaymentsService/Payments` | `payments_create` | Workspace member | Creates a new payment |
| GET | `/api/v2/PaymentsService/Payments/{paymentId}` | `payments_read` | Workspace member | Gets a payment by ID |
| PUT | `/api/v2/PaymentsService/Payments/{paymentId}` | `payments_update` | Workspace member | Updates a payment |
| PATCH | `/api/v2/PaymentsService/Payments/{paymentId}` | `payments_update` | Workspace member | Patch a payment |
| DELETE | `/api/v2/PaymentsService/Payments/{paymentId}` | `payments_delete` | Workspace member | Deletes a payment |

## ProviderOperations

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/PaymentsService/ProviderOperations/AwaitingOutcome` | `payments_read` | Workspace member | Lists provider instructions whose outcome is not established |
| GET | `/api/v2/PaymentsService/ProviderOperations/AwaitingOutcome/Count` | `payments_read` | Workspace member | Counts provider instructions whose outcome is not established |
| POST | `/api/v2/PaymentsService/ProviderOperations/{providerOperationId}/ReconcileOutcome` | `payments_manage` | Workspace member | Asks the rail what became of one instruction |
| POST | `/api/v2/PaymentsService/ProviderOperations/{providerOperationId}/Refund` | `payment_refunds_create` | Workspace member | Refunds one collection through its own rail |

## PublicPaymentLinks

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/PaymentsService/PublicPaymentLinks` | `payments_manage` | Workspace member | Issues a public payment link for one of the tenant's obligations |

## PublicPaymentReferences

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/PaymentsService/PublicPaymentReferences` | `payments_manage` | Workspace member | Issues the public payment reference for one of the tenant's obligations |

## Retired

These endpoints are still served but are retired. Do not build new integrations on them.

| Resource | Verb | Path | Reason |
| --- | --- | --- | --- |
| Payments | GET | `/api/v2/PaymentsService/Payments/{paymentId}/Details` | [Obsolete]: {paymentId}/Details is a deprecated way to access an endpoint, use GET {paymentId} instead |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
