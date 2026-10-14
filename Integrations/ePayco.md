# ePayco

Connect your own ePayco account so your customers can pay your invoices through ePayco's checkout, so you can refund those payments, and so you can see the bank accounts your ePayco account pays out to.

**Who it is for:** workspace administrators who set up how the business gets paid, and developers who automate payment operations.

**Availability:** in Studio, open your workspace and go to **Integrations** > **ePayco**. Creating the payment connection, refunding and listing payout accounts are done through the API. Creating the payment connection needs permission to manage payments.

## What you can do with ePayco

- **Collect payment for an invoice.** Your customer opens the invoice's payment link, chooses ePayco and pays on ePayco's own checkout. See [Payments](~/Modules/Accounting/Billing/Billing-Records/Payments.md).
- **Refund a payment** that ePayco has completed.
- **List your payout bank accounts.** You see the bank accounts of your own ePayco account, with each account number masked to its last four characters.

Payments run through your own ePayco account and the funds settle to that account. The platform starts the checkout, receives ePayco's confirmation and records the result against your invoice.

The payer enters card details on ePayco's own checkout. The platform never accepts raw card numbers or security codes.

## Before you start

From your ePayco dashboard, have these ready:

- your customer ID (`P_CUST_ID_CLIENTE`) and your `P_KEY`;
- your API public key and private key, from the same mode (test or production) as the connection you plan to create.

## Connect ePayco

1. In Studio, open your workspace and go to **Integrations** > **ePayco**.
2. On the **ePayco Options** tab, fill in **Customer ID (P_CUST_ID_CLIENTE)**, **Public Key (API)**, **Private Key (API)** and **Confirmation Signing Secret (P_KEY)**. Optionally, set **Checkout Name**, the name your customer sees on ePayco's checkout.
3. Turn on **Production** for a live connection, or leave it off for a test connection. Select **Save Changes**.
4. Create the payment connection with `POST /api/v2/PaymentsService/PaymentProviderRegistrations`, using the provider code `epayco`, your `P_KEY` as the webhook signing secret and the environment, `Test` or `Live`, matching the **Production** switch. The environment has no default; a request without one is refused.
5. The response contains your webhook registration key and your notification URL. They are shown only once, so copy them now.
6. Back on the ePayco Integrations page, paste the key into **Webhook Registration Key** and select **Save Changes**.

Checkout does not start until **Webhook Registration Key** is set. The platform uses the key to tell ePayco, with each payment, where to send its confirmation.

The connection never stores your API keys. They stay on the ePayco Integrations page.

## Test and live

The **Production** switch decides whether ePayco processes a payment as a test or for real. Keep it in the same mode as the connection: off with a test connection, on with a live connection.

A test payment runs end to end on ePayco's checkout but never marks an invoice as paid. Only a live payment does.

To change the environment of an existing connection, use `POST /api/v2/PaymentsService/PaymentProviderRegistrations/{registrationId}/Environment`, then set the **Production** switch to match.

## Refund a payment

Request a refund with `POST /api/v2/PaymentsService/ProviderOperations/{providerOperationId}/Refund`. It needs permission to create payment refunds. Studio has no refund action.

The refund goes back through ePayco, the rail that collected the payment. Each refund request is sent once. If you repeat it, the request is refused with a conflict. If ePayco's answer is lost, the refund is reconciled instead of sent again. Read the outcome's certainty in the response.

## List your payout bank accounts

Call `POST /api/v2/Integrations/ePayco/Withdraws/WithdrawAccounts`. It needs permission to manage payments. Each account in the response shows:

- ePayco's own ID for the account;
- the account number, masked to its last four characters (the full number is never returned);
- the bank name and account type, when ePayco reports them;
- whether it is your default payout account.

Withdrawing money to these accounts is not available. The former withdrawal route is retired and has no replacement in this release.

## How confirmations are protected

- Each confirmation is checked against your `P_KEY` before it changes anything.
- The confirmation address carries your webhook registration key, so a confirmation reaches only your own workspace.
- Each payment is applied once, even if ePayco sends the same confirmation several times.

## Rotate the registration key

Call `POST /api/v2/PaymentsService/PaymentProviderRegistrations/{registrationId}/RotateKey`. The response shows the new key and URL once, and the old ones stop working. Paste the new key into **Webhook Registration Key** on the ePayco Integrations page right away.

## Retired routes

Older ePayco routes for processing payments, withdrawals and synchronization are retired. They answer `410 Gone` with a link to their successor. For the full list, see the [changelog](~/reference/Changelog.md#240---2026-10-13).

## For developers

- List your connections with `GET /api/v2/PaymentsService/PaymentProviderRegistrations`. No response ever contains a secret.
- To reconcile a payment whose outcome ePayco has not confirmed, use `POST /api/v2/PaymentsService/ProviderOperations/{providerOperationId}/ReconcileOutcome`. Payments awaiting an outcome are listed by `GET /api/v2/PaymentsService/ProviderOperations/AwaitingOutcome`.

## Related

- [Payments](~/Modules/Accounting/Billing/Billing-Records/Payments.md)
- [Official integrations](~/Modules/Integrations.md)
- [Stripe](~/Integrations/Stripe.md), [Mercado Pago](~/Integrations/Mercado-Pago.md) and [PayU](~/Integrations/PayU.md)
