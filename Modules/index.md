# Modules

Modules are how you turn on [capabilities](~/Capabilities/index.md). Each module is a self-contained feature package, with its own screens, menus, and data, that the platform loads into your instance. Enable the modules your plan entitles you to and they appear in the Studio for your tenant. Nothing is forked, and new modules arrive without changing the platform.

## How modules work

- **Self-contained.** A module brings its own pages and navigation, and can add APIs, business operations, and background work
- **Discovered automatically.** Your Suite finds every installed module at startup and wires in its services, menus, and screens. There's no list to maintain
- **Scoped per tenant.** Each tenant sees only what it's entitled to, and a module only ever touches its own tenant's data
- **Extensible by you.** Anything our modules do, yours can too. See [module development](~/Module-Development.md)

## How a module reaches your tenant

Installed and available are two different things. A module reaches a tenant three ways.

**Your plan.** Most modules come with the plan you're licensed for. This is the usual route.

**An administrator's grant.** An administrator can grant a specific module to a specific tenant on top of the plan, with an optional expiry date. Grants only ever add access.

**The always-available baseline.** A few foundations come with every tenant because the rest of the Suite builds on them: customer records ([ContactSight](~/Modules/CRM.md)), [Sales](~/Modules/Sales-Hub.md), and [Logistics](~/Modules/Logistics.md), alongside your profile, tenant, wallet, and support surfaces.

Missing a module you expected? It's almost always one of three things. Not in your plan, not granted, or granted and since expired. An administrator can see and change grants for a tenant.

> **Note:** Grant changes take effect on the next sign-in or refresh, not instantly in an open session. Reload the Studio after granting a module.

## What a module brings

Modules use different parts of what the platform offers. Yours may contribute:

- **Screens** in the Studio, under your tenant, using the standard navigation and layout
- **Business operations**, which are governed actions that appear as steps in [Workflows Studio](~/Modules/Workflows.md) and as tools your AI agents can use
- **Business events**, which are durable announcements your workflows can react to
- **APIs** for your own systems to call
- **Background work** such as scheduled processing and reconciliation

The practical upshot is that modules compound. Turning one on adds building blocks the modules you already have can use, so your automation options grow without extra configuration.

## Governed by design

Modules are part of the Suite rather than plugins bolted on the side, so they inherit its guarantees:

- **Every operation is permission-checked** against the person or process performing it, as it runs. A denied action fails closed. It stops visibly rather than being skipped quietly or escalated
- **Tenant-scoped throughout.** A module only ever sees and touches its own tenant's data
- **Audited end to end.** Every action records the real actor, including automated ones
- **Unattended work runs under its own identity**, never a borrowed user account

> **Important:** Module entitlement controls the Studio catalogue and screens. It is not a security boundary over API endpoints, which are protected by permissions. Rely on permissions when you build on the API.

## Official modules

Browse the modules that ship with ABS, grouped by the capability each one delivers.

### Finance
- **[Accounting](~/Modules/Accounting.md)**: double-entry general ledger, journals, financial books, and multi-currency reporting.
- **[Subscriptions](~/Modules/Subscriptions.md)**: subscription plans and recurring billing.

### Commerce
- **[Commerce](~/Modules/eCommerce.md)**: online store, covering catalog, categories, carts, and sales channels.
- **[Sales Hub](~/Modules/Sales-Hub.md)**: quotes, orders, invoices, price lists, and loyalty.

### Operations
- **[Logistics](~/Modules/Logistics.md)**: items, warehouses, inventory, and stock movement.
- **[Assets Manager](~/Modules/Assets-Manager.md)**: fixed-asset tracking, transfers, and lifecycle.
- **[Manufacturing](~/Modules/MANUFACTURING.md)**: production planning, work orders, and workstations.
- **[Procurement](~/Modules/PROCUREMENT.md)**: purchase requests, suppliers, and requisition-to-order.
- **[Projects](~/Modules/PMS.md)**: projects, tasks, time tracking, and delivery.
- **[Quality](~/Modules/QMS.md)**: inspections, checks, and audits.
- **[Workflows](~/Modules/WORKFLOWS.md)**: visual workflow editor and process automation.

### Workforce
- **[Workforce](~/Modules/HRMS.md)**: employees, payroll, shifts, leave, appraisals, hiring, and training.
- **[Learning](~/Modules/Learning.md)**: courses, collections, instructors, and students.
- **[Workplace](~/Modules/WORKPLACE.md)**: shared file and document workspace.

### Customer Experience
- **[ContactSight (CRM)](~/Modules/CRM.md)**: unified contacts, organizations, and relationship profiles.
- **[Helpdesk](~/Modules/HelpDesk.md)**: support tickets, knowledge base, returns, and warranty.
- **[Marketing](~/Modules/MARKETING.md)**: campaigns, email, newsletters, social posts, and leads.
- **[Social](~/Modules/SOCIAL.md)**: member profiles, posts, reactions, and chat.
- **[Media Portals](~/Modules/CMS.md)**: external-facing websites and CMS content.

### Identity & Access
- **[IAM](~/Modules/IAM.md)**: users, roles, groups, and central access management.
- **[Security](~/Modules/SECURITY.md)**: tenant access, permissions, and security and audit logs.

### Trust & Compliance
- **[Signator](~/Modules/Signator.md)**: e-signatures, signing requests, certificates, and trust evidence.
- **[Sustainability](~/Modules/SUSTAINABILITY.md)**: ESG metrics and compliance reporting.

### Intelligence
- **[Analytics](~/Modules/ANALYTICS.md)**: governed BI, curated datasets, and a self-serve explorer.
- **[BotMaker](~/Modules/BOTS.md)**: design and manage conversational bots.

### Platform & Development
- **[CloudHub](~/Modules/CLOUD.md)**: provision and manage cloud resources.
- **[Blockchains](~/Modules/BLOCKCHAINS.md)**: connect chains and wallets, and on-chain assets.

## Modules and integrations

A module adds part of your business. An [integration](~/Modules/Integrations.md) connects your business to an outside service, such as a payment provider, a marketplace, or a carrier.

Both install, entitle, and behave the same way. Integrations simply reach further, so they add protection around credential storage, message authenticity, and duplicate delivery.

## Build your own

Modules you write are loaded, entitled, routed, and audited exactly like ours. Start at [module development](~/Module-Development.md).
