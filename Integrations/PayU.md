# PayU

Connect your own PayU Latam account so your customers can pay your invoices through PayU's web checkout.

**Who it is for:** workspace administrators who set up how the business gets paid, and developers who automate payment operations.

**Availability:** in Studio, open your workspace and go to **Integrations** > **PayU**. Creating the payment connection is done through the API and needs permission to manage payments.

## What you can do with PayU

- **Collect payment for an invoice.** Your customer opens the invoice's payment link, chooses PayU and pays on PayU's own web checkout. See [Payments](~/Modules/Accounting/Billing/Billing-Records/Payments.md).

Refunds through PayU are not available yet. Collection is the only PayU operation.

Payments run through your own PayU account and the funds settle to that account. The platform starts the checkout, receives PayU's confirmation and records the result against your invoice.

The payer enters card details on PayU's own checkout. The platform never accepts raw card numbers or security codes.

## Before you start

From your PayU merchant panel, have these ready:

- your merchant ID;
- the account ID for the country you sell in. PayU uses one account ID per country;
- your API key and API login, from the same mode (test or production) as the connection you plan to create.

## Connect PayU

1. In Studio, open your workspace and go to **Integrations** > **PayU**.
2. On the **PayU Options** tab, fill in **Merchant ID**, **Account ID**, **API Key** and **API Login**. Optionally, set **Checkout Description**, the description your customer sees on PayU's checkout.
3. Turn on **Sandbox (test) mode** for a test connection, or leave it off for a live connection. Select **Save Changes**.
4. Create the payment connection with `POST /api/v2/PaymentsService/PaymentProviderRegistrations`, using the provider code `payu`, your API key as the webhook signing secret (PayU signs its confirmations with your API key) and the environment, `Test` or `Live`, matching the **Sandbox (test) mode** switch. The environment has no default; a request without one is refused.
5. The response contains your notification URL. It is shown only once, so copy it now.
6. In your PayU merchant panel, set that URL as the confirmation URL.

The connection never stores your API key or API login. They stay on the PayU Integrations page.

## Test and live

The **Sandbox (test) mode** switch decides whether checkout runs in PayU's sandbox. Keep it in the same mode as the connection: on with a test connection, off with a live connection. Your customer cannot change it at checkout.

A test payment runs end to end in PayU's sandbox but never marks an invoice as paid. Only a live payment does.

To change the environment of an existing connection, use `POST /api/v2/PaymentsService/PaymentProviderRegistrations/{registrationId}/Environment`, then set the **Sandbox (test) mode** switch to match.

## How confirmations are protected

- Each confirmation is checked against the signature PayU computes with your API key before it changes anything.
- The confirmation URL is unique to your connection, so a confirmation reaches only your own workspace.
- Each payment is applied once, even if PayU sends the same confirmation several times.

## Rotate the notification URL

Call `POST /api/v2/PaymentsService/PaymentProviderRegistrations/{registrationId}/RotateKey`. The response shows the new URL once, and the old URL stops working. Update the confirmation URL in your PayU merchant panel right away.

To replace your API key, generate a new one in your PayU merchant panel, then enter it on the PayU Integrations page and select **Save Changes**.

## For developers

- List your connections with `GET /api/v2/PaymentsService/PaymentProviderRegistrations`. No response ever contains a secret.

## Related

- [Payments](~/Modules/Accounting/Billing/Billing-Records/Payments.md)
- [Official integrations](~/Modules/Integrations.md)
- [Stripe](~/Integrations/Stripe.md), [Mercado Pago](~/Integrations/Mercado-Pago.md) and [ePayco](~/Integrations/ePayco.md)
