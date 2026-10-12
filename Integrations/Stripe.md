# Stripe

Connect your own Stripe account so your customers can pay your invoices through Stripe's checkout, and so you can refund those payments.

**Who it is for:** workspace administrators who set up how the business gets paid, and developers who automate payment operations.

**Availability:** Stripe works today in test mode only. Live payments are coming. In Studio, open your workspace and go to **Integrations** > **Stripe**. Creating the payment connection and requesting a refund are done through the API. Creating the payment connection needs permission to manage payments.

## What you can do with Stripe

- **Collect payment for an invoice.** Your customer opens the invoice's payment link, chooses Stripe and pays on Stripe's own checkout. See [Payments](~/Modules/Accounting/Billing/Billing-Records/Payments.md).
- **Refund a payment.** You return the money of a completed Stripe payment through the API.

Payments run through your own Stripe account and the funds settle to that account. The platform starts the checkout, receives Stripe's notifications and records the result against your invoice.

The payer enters card details on Stripe's own checkout. The platform never accepts raw card numbers or security codes.

## Before you start

From your Stripe Dashboard, have these ready:

- your Stripe account ID;
- your test publishable key and test secret key;
- the signing secret of the test-mode webhook endpoint you create in step 5 below. You can create the endpoint first with any address and update the address later.

## Connect Stripe

1. In Studio, open your workspace and go to **Integrations** > **Stripe**.
2. On the **Stripe Options** tab, fill in **Stripe Account**, **Publishable Key (pk_)**, **Secret Key (sk_)** and **Webhook Signing Secret (whsec_)**. Optionally, set **Checkout Line Item Name**, the item name your customer sees on Stripe's checkout. Select **Save Changes**.
3. Create the payment connection with `POST /api/v2/PaymentsService/PaymentProviderRegistrations`. Send the provider code `stripe`, your Stripe account ID, the webhook signing secret (the same value you entered in step 2) and the environment `Test`. The environment has no default; a request without one is refused.
4. The response contains your notification URL. It is shown only once, so copy it now.
5. In your Stripe Dashboard, add that URL as a webhook endpoint in test mode, and subscribe it to the `payment_intent.succeeded`, `payment_intent.payment_failed` and `payment_intent.requires_action` events.

Your provider keys and signing secret are kept in your workspace's settings for Stripe. The payment connection itself stores no keys. Use test keys with your test connection.

## Test mode

Stripe works today in test mode only. Use test keys and a test connection. A test payment runs end to end on Stripe's checkout but never marks an invoice as paid.

Live payments are coming. When live payments are available, a completed live payment marks the invoice as paid.

## Refund a payment

Refunds are available through the API only; Studio has no refund action. Request a refund with `POST /api/v2/PaymentsService/ProviderOperations/{providerOperationId}/Refund`. It needs permission to create payment refunds.

The refund goes back through Stripe, the rail that collected the payment. Each refund request is sent once. If you repeat it, the request is refused with a conflict. If Stripe's answer is lost, the refund is reconciled instead of sent again. Read the outcome's certainty in the response.

## How notifications are protected

- Each notification is checked against your own webhook signing secret before it changes anything.
- A notification is applied only to payments in your own workspace. A notification that fails the check, or that refers to a payment outside your workspace, changes nothing.
- Each payment is applied once, even if Stripe sends the same notification several times.

## Rotate the notification URL

Your notification URL does not reveal your workspace or your Stripe account. To replace it, call `POST /api/v2/PaymentsService/PaymentProviderRegistrations/{registrationId}/RotateKey`. The response shows the new URL once, and the old URL stops working. Update the endpoint in your Stripe Dashboard right away.

To replace your Stripe keys or signing secret, create new ones in your Stripe Dashboard, then enter them on the Stripe Integrations page and select **Save Changes**.

## For developers

- List your connections with `GET /api/v2/PaymentsService/PaymentProviderRegistrations`. No response ever contains a secret.
- `PUT /api/v2/PaymentsService/PaymentProviderRegistrations/{registrationId}` updates the connection's account ID and enabled capabilities. It never accepts a secret or an environment.
- A payment whose outcome Stripe has not confirmed is listed by `GET /api/v2/PaymentsService/ProviderOperations/AwaitingOutcome` and reconciled with `POST /api/v2/PaymentsService/ProviderOperations/{providerOperationId}/ReconcileOutcome`.

## Related

- [Payments](~/Modules/Accounting/Billing/Billing-Records/Payments.md)
- [Official integrations](~/Modules/Integrations.md)
