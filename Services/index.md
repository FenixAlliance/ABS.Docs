# Services

The Alliance Business Suite exposes its features through more than 40 REST services. Each service groups the operations for one business area, under a base route such as `/api/v2/InvoicingService/...`.

Every service page starts with what the service is for and what you can do with it, followed by a reference of its operations: the HTTP verb and path, the permission it needs and who can call it. The reference is generated from the platform's source for each release, so it matches the release it describes.

## Before you call a service

- Sign in to get a token. See [REST API development](~/Web-API-Development/REST-API-Development.md) and [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md).
- Workspace operations need the workspace's ID, sent in the `X-TenantId` header (or the `tenantId` query parameter), and run within the permissions your membership in that workspace grants. See [REST API development](~/Web-API-Development/REST-API-Development.md).
- The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

## Finance

- [Accounting](Reference/Accounting.md)
- [Invoicing](Reference/Invoicing.md)
- [Payments](Reference/Payments.md)
- [Wallets](Reference/Wallets.md)
- [Pricing](Reference/Pricing.md)
- [Currencies and exchange rates](Reference/Forex.md)
- [Subscriptions](Reference/Subscriptions.md)
- [Licensing and usage](Reference/Licensing.md)
- [Blockchain records](Reference/Blockchains.md)

## Commerce

- [Sales](Reference/Sales.md)
- [Quotes](Reference/Quotes.md)
- [Orders](Reference/Orders.md)
- [Deals](Reference/Deals.md)
- [Carts](Reference/Cart.md)
- [Catalog](Reference/Catalog.md)
- [Logistics](Reference/Logistics.md)
- [Shipments](Reference/Shipments.md)
- [Locations](Reference/Locations.md)

## Customers and content

- [Contacts](Reference/Contacts.md)
- [Marketing](Reference/Marketing.md)
- [Notifications and reach](Reference/Reach.md)
- [Social](Reference/Social.md)
- [Support](Reference/Support.md)
- [Content and portals](Reference/Content.md)

## Workforce and operations

- [Human resources](Reference/HR.md)
- [Learning](Reference/Learning.md)
- [Projects](Reference/Projects.md)
- [Manufacturing](Reference/Manufacturing.md)
- [Assets](Reference/Assets.md)
- [Service management](Reference/Services.md)
- [Activities](Reference/Activities.md)
- [Approvals](Reference/Approvals.md)
- [Workflows](Reference/Workflows.md)

## Platform

- [Workspaces](Reference/Tenants.md)
- [Accounts and profiles](Reference/Holders.md)
- [Identity and sign-in](Reference/Identity.md)
- [Security](Reference/Security.md)
- [Trust and signing](Reference/Trust.md)
- [System](Reference/System.md)
- [Intelligence](Reference/Intelligence.md)
- [Analytics](Reference/Analytics.md)
- [Global reference data](Reference/Globe.md)
