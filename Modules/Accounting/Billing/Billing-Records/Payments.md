# Payments

Payments record the money your customers pay against your invoices, collected through the payment provider account you connect to your workspace.

**Who it is for:** billing administrators who collect payment for invoices and finance teams who follow up on what has been paid.

**Availability:** in Studio, open your workspace and go to **Modules** > **Accounting** > **Billing** > **Payments**. Payment links are created from the invoice in **Invoices**, or from **Wallet** > **Invoices**. Generating a payment link needs permission to manage payments. Connecting a payment provider is done from your workspace's **Integrations**.

## Payment providers you can connect

You collect payments through your own account with a payment provider. Payments are processed by that provider and the funds settle to your provider account. The platform starts the checkout, receives the provider's confirmation and records the result against your invoice.

Today you can connect Stripe, in test mode. See [Stripe](~/Integrations/Stripe.md). Live payments, and Mercado Pago, PayU and ePayco, are coming.

To connect Stripe, enter your Stripe test credentials on the Stripe page under your workspace's **Integrations** in Studio. Then create the payment connection through the API (see [For developers](#for-developers)). It returns your notification URL once; add that URL in your Stripe dashboard.

Today connections run in test mode only. Use it to try the full checkout with your provider's test credentials. A test payment runs end to end but never marks an invoice as paid.

For how connections, credentials and provider notifications work, see [Integrations](~/Modules/Integrations.md).

## Collect payment for an invoice

1. Open the invoice from **Invoices**. The invoice must be issued, have a balance due and must not be paid, closed or on hold.
2. In the actions menu, select **Generate Payment Link**.
3. Copy the link with the copy button. The dialog shows the link only once, together with its expiry date when it has one. Anyone with the link can pay the invoice.
4. Send the link to your customer.

You can also create the link from **Wallet** > **Invoices**: open the invoice and select **Payment link**.

To create another link later, select **Generate Payment Link** (or **Payment link** in Wallet) again. Each time you select it, a new link is created. Earlier links stay usable until they expire. A link cannot be revoked yet.

## What your customer sees

1. The link opens a payment page that shows who they are paying, the **Amount due**, the due date and the invoice reference.
2. Under **Payment options**, they choose a **Payment method** and select **Continue to payment**.
3. They complete the payment on your payment provider's own checkout. Card numbers and security codes are entered there. The platform never accepts raw card numbers or security codes.
4. They return to a status page that updates by itself. It shows **Payment received** when the payment succeeds, and tells them when the payment was cancelled, did not go through or needs one more step.

If no payment method is available for the invoice yet, the payment page says so. Check that a payment provider is connected to your workspace.

## When a payment arrives

- A test payment that completes is recorded against the invoice and never marks the invoice as paid. When live payments are available, a completed live payment marks the invoice as paid.
- Recording a payment you received outside the payment checkout, such as cash or a bank transfer, against an invoice is not available yet. A payment you create by hand does not mark the invoice as paid.
- The platform confirms each provider notification before it changes any payment, and applies each payment once, even if the provider sends the same notification several times.
- When **Post journal entries automatically** is turned on in your Accounting settings, the platform posts the payment's journal entry. See [Accounting](~/Modules/Accounting.md).

## Review payments

**Payments** lists the payments in your workspace. Select **View** to open a payment. The details page shows:

- the **Timestamp**, **Currency**, **Total Amount**, **Total Taxes** and **Base Amount**;
- the **Forex Rate** used for reporting;
- the **Payment Status**, the **Reported Payment Status** from the provider and the provider's reference and authorization codes;
- whether the payment was made in test mode.

You can also see the payments for one invoice through the API.

## For developers

- Payments are available under `/api/v2/PaymentsService/Payments`, and an invoice's payments under `/api/v2/InvoicingService/Invoices/{invoiceId}/Payments`.
- Payment provider connections are managed under `/api/v2/PaymentsService/PaymentProviderRegistrations`, including setting the environment, updating the credential and rotating the notification key. Today only Stripe connections in test mode can be created.
- A refund is requested with `POST /api/v2/PaymentsService/ProviderOperations/{providerOperationId}/Refund`. Refunds work for Stripe through the API; Studio has no refund action.
- An operation whose outcome the provider has not confirmed is listed by `GET /api/v2/PaymentsService/ProviderOperations/AwaitingOutcome`, and reconciled with `POST /api/v2/PaymentsService/ProviderOperations/{providerOperationId}/ReconcileOutcome`.
- A payment link is created with `POST /api/v2/PaymentsService/PublicPaymentLinks`, which needs permission to manage payments. The payment page for a link is `/Payments/{token}`. The token is part of the link and is shown only when the link is created.
