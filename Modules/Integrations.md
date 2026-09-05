# Official integrations

*Connect your Suite to the services you already use.*

An integration links your Alliance Business Suite to an outside service: a payment provider, a marketplace, a carrier, a signing service. Integrations install and behave like [modules](~/Modules/index.md).

The difference is reach. A module works inside your business. An integration reaches across the boundary into someone else's system, which is why integrations add protection around credentials, message authenticity, and repeated delivery.

## What you get

- **A place to connect.** Each integration adds its own settings page under your tenant
- **Actions you can use.** Charge a card, create a shipment, request a signature, pull a catalog
- **Two-way traffic.** Most integrations receive notifications, so your Suite reacts when something happens over there
- **Tenant separation.** Every tenant connects its own account and never sees another's

## Connect an integration

1. Open the integration's page in the Studio, under your tenant
2. Enter the credentials the service issued you. Usually that's an API key, or a client ID and secret from that service's dashboard
3. Save

You're connected for that tenant only.

Your credentials stay yours. You create them, you scope them, and you can revoke them in the provider's dashboard at any time without involving us.

Connecting isn't enabling. The integration still needs to be entitled to your tenant, and every action it performs is permission-checked against whoever invokes it.

### How we protect your credentials

We encrypt credentials at rest and scope them to your tenant.

Two limits, stated up front:

- **Customer-managed keys aren't available.** We manage the encryption keys. If your compliance programme requires you to hold the key material yourself, talk to us before you build on an integration
- **Rotation is manual.** Rotate a key in the provider's dashboard, then update it on the settings page. Nothing rotates automatically, and nothing warns you before a key expires

## Stay in sync with the outside service

When a payment succeeds or a shipment moves, the service notifies your Suite. We handle the awkward parts.

**We check the message is genuine.** Where a provider signs its notifications, we verify that signature before the message is allowed to do anything.

**We act on it exactly once.** Providers retry hard, so duplicate deliveries are ordinary rather than exceptional. A de-duplication guarantee in the database means a notification delivered five times creates one payment.

**We don't lose it.** Every message is stored the moment it arrives, before any work starts. Transient failures retry on their own. Permanent ones stop and get recorded instead of retrying forever. A restart doesn't lose work in flight.

Most teams end up building this themselves on other platforms, usually after the first duplicate charge.

## Governed by design

Integrations follow the same rules as everything else in the Suite:

- **Permission-checked.** Every action is checked against the identity performing it, as it runs. A denied action fails closed rather than being skipped quietly or escalated
- **Tenant-scoped.** An integration only touches its own tenant's data and credentials
- **Audited.** Every action records the real actor behind it
- **Least privilege when unattended.** Work with no person present runs under a dedicated application identity, never a borrowed user account

## Check maturity before you commit

Our catalogue covers a lot of services, and they sit at different stages. Some are complete and running in production. Others are connection points whose deeper functionality is still being built.

Before you plan a process around one:

- Open it and confirm the actions you need are actually there
- Read that integration's own page for what it supports today
- Ask us if it matters commercially, and we'll tell you where it stands

We'd rather answer that in a sales call than have you find the gap the week you launch.

## Build your own

Anything an official integration does, yours can do too. Integrations are modules that happen to talk to an outside service, so you build and install them the same way. Start with [module development](~/Module-Development.md), then read [application parts](~/Module-Development/Application-Parts.md) for what a module can contribute.

## Where it fits

An integration strengthens whichever [capability](~/Capabilities/index.md) it serves. Payment connectors feed [Finance](~/Capabilities/Finance.md). Marketplaces feed [Commerce](~/Capabilities/Commerce.md). Model providers feed [Intelligence](~/Capabilities/Intelligence.md). All of them run on the [Alliance Business Platform](~/Capabilities/Alliance-Business-Platform.md), and their actions compose into [Workflows Studio](~/Modules/Workflows.md) like any other operation.
