# Stripe

Connect your own **Stripe** account to Alliance Business Suite to accept card payments. Stripe is a *bring-your-own* (BYO) gateway: payments are processed through **your** Stripe account, funds settle to **you**, and Alliance Business Suite orchestrates the checkout and records the results against your tenant.

## How it works

- You register your Stripe account and credentials against your tenant.
- Alliance Business Suite generates a **unique, private webhook URL** for that registration.
- You add that URL as a webhook endpoint in your Stripe Dashboard.
- Every event Stripe sends is **cryptographically verified** against your tenant's own signing secret. An event that fails verification is rejected and never changes a payment.

## What you need

- A Stripe account (test or live).
- From your Stripe Dashboard: your **Account ID**, **Publishable key**, **Secret key**, and a **Webhook signing secret** (`whsec_...`).

## Connect Stripe

1. In your tenant's **payment provider settings**, add a **Stripe** registration and enter your Account ID, keys, and Webhook signing secret.
2. Save. Alliance Business Suite returns a **webhook URL** unique to your registration (shown once) — copy it.
3. In your **Stripe Dashboard -> Developers -> Webhooks -> Add endpoint**, paste the URL and subscribe to the payment events you use (for example `payment_intent.succeeded`, `payment_intent.payment_failed`).
4. Send a test event from Stripe to confirm the endpoint is accepted and healthy.

## Security

- Your signing secret stays on your tenant's configuration; it is never displayed again after saving and is never shared with any other tenant.
- The webhook URL is **opaque** — it does not reveal your tenant or account — and can be **rotated** at any time. Rotating issues a new URL and retires the old one.
- Alliance Business Suite verifies the signature **and** confirms the event belongs to your tenant *before* it changes any payment. Unverified or misattributed events are rejected with no effect.

## Rotate or disable

- **Rotate** the webhook key to get a fresh URL (update the endpoint in Stripe afterward).
- **Disable** the registration to stop accepting events without deleting your configuration.

> Other gateways such as ePayco and Mercado Pago connect the same way: register your account, copy the generated webhook URL into the provider's dashboard, and Alliance Business Suite verifies every event per tenant.
