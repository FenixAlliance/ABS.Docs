# Mercado Pago

Connect your own Mercado Pago account so your customers can pay your invoices through Mercado Pago's checkout, and so you can cancel or refund those payments.

**Who it is for:** workspace administrators who set up how the business gets paid, and developers who automate payment operations.

**Availability:** in Studio, open your workspace and go to **Integrations** > **MercadoPago**. Creating the payment connection, cancelling and refunding are done through the API. Creating the payment connection needs permission to manage payments.

## What you can do with Mercado Pago

- **Collect payment for an invoice.** Your customer opens the invoice's payment link, chooses Mercado Pago and pays on Mercado Pago's own checkout. See [Payments](~/Modules/Accounting/Billing/Billing-Records/Payments.md).
- **Cancel a payment**, where Mercado Pago allows it to be cancelled.
- **Refund a payment** that Mercado Pago has completed.

Payments run through your own Mercado Pago account and the funds settle to that account. The platform starts the checkout, receives Mercado Pago's notifications and records the result against your invoice.

The payer enters card details on Mercado Pago's own checkout. The platform never accepts raw card numbers or security codes.

## Before you start

From your Mercado Pago developer dashboard, have these ready:

- your public key and access token, from the same mode (test or production) as the connection you plan to create;
- the secret signature of your notifications (webhooks) configuration.

## Connect Mercado Pago

1. In Studio, open your workspace and go to **Integrations** > **MercadoPago**.
2. On the **MercadoPago Options** tab, fill in **Public Key**, **Access Token** and **Webhook Signing Secret**. Optionally, set **Checkout Item Title**, the item name your customer sees on Mercado Pago's checkout.
3. Turn on **Production** for a live connection, or leave it off for a test connection. Select **Save Changes**.
4. Create the payment connection with `POST /api/v2/PaymentsService/PaymentProviderRegistrations`. Send the provider code `mercadopago`, the webhook signing secret (the same value you entered in step 2) and the environment, `Test` or `Live`, matching the **Production** switch. The environment has no default; a request without one is refused.
5. The response contains your notification URL. It is shown only once, so copy it now.
6. In your Mercado Pago developer dashboard, add that URL as the notification URL for payment events.

The connection never stores your public key or access token. They stay on the Mercado Pago Integrations page.

### How stored secrets appear

The page never shows a stored secret. Next to **Access Token** and **Webhook Signing Secret** it shows only whether a value is **Set** or **Not set**.

- To keep a stored value, leave its field empty.
- To replace it, type the new value.
- To remove it, select the matching clear option, for example **Clear the stored access token**.

## Test and live

The **Production** switch decides whether checkout runs in Mercado Pago's sandbox or in production. Keep it in the same mode as the connection: off with a test connection, on with a live connection.

A test payment runs end to end in Mercado Pago's sandbox but never marks an invoice as paid. Only a live payment does.

To change the environment of an existing connection, use `POST /api/v2/PaymentsService/PaymentProviderRegistrations/{registrationId}/Environment`, then set the **Production** switch to match.

## Cancel or refund a payment

Both actions are available through the API only. Studio has no cancel or refund action.

- **Cancel:** `PUT /api/v2/Integrations/MercadoPago/Cancellations/CancelPayment?providerOperationId={providerOperationId}`. It needs permission to manage payments.
- **Refund:** `POST /api/v2/PaymentsService/ProviderOperations/{providerOperationId}/Refund`. It needs permission to create payment refunds.

Both take the platform's provider operation ID, not a Mercado Pago payment ID. The platform finds the Mercado Pago payment from its own records.

Each request is sent once. If you repeat it, the request is refused with a conflict. If Mercado Pago's answer is lost, the outcome is reconciled instead of sent again. Read the outcome's certainty in the response.

## How notifications are protected

- Each notification is checked against your webhook signing secret before it changes anything.
- The platform confirms each notification with Mercado Pago before it records a payment.
- Each payment is applied once, even if Mercado Pago sends the same notification several times.

## Rotate secrets and the notification URL

- **Signing secret:** to rotate without missing notifications, add the new secret under **Additional Webhook Signing Secrets (rotation, one per line)** and select **Save Changes**. Notifications signed with either secret are accepted. After you switch the secret in Mercado Pago, remove the old one. To remove all additional secrets, select **Clear the stored rotation secrets**.
- **Notification URL:** call `POST /api/v2/PaymentsService/PaymentProviderRegistrations/{registrationId}/RotateKey`. The response shows the new URL once, and the old URL stops working. Update the notification URL in Mercado Pago right away.

## Retired routes

Older Mercado Pago routes for payments, preferences, refunds, cancellations and card tokens are retired. They answer `410 Gone` with a link to their successor. For the full list, see the [changelog](~/reference/Changelog.md#unreleased).

## For developers

- List your connections with `GET /api/v2/PaymentsService/PaymentProviderRegistrations`. No response ever contains a secret.
- A payment whose outcome Mercado Pago has not confirmed is listed by `GET /api/v2/PaymentsService/ProviderOperations/AwaitingOutcome` and reconciled with `POST /api/v2/PaymentsService/ProviderOperations/{providerOperationId}/ReconcileOutcome`.

## Related

- [Payments](~/Modules/Accounting/Billing/Billing-Records/Payments.md)
- [Official integrations](~/Modules/Integrations.md)
- [Stripe](~/Integrations/Stripe.md), [PayU](~/Integrations/PayU.md) and [ePayco](~/Integrations/ePayco.md)
