<!-- generated:start -->
# Payments service reference

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
| POST | `/api/v2/PaymentsService/ProviderOperations/{providerOperationId}/Refund` | `RefundPermission` | Workspace member | Refunds one collection through its own rail |

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
