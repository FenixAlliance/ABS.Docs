# Modules

Modules are how you turn on [capabilities](~/Capabilities/index.md). Each module is a self-contained feature package — its own screens, menus, and data — that the platform loads into your instance. You enable the modules your plan entitles you to, and they appear in the Studio for your tenant. Nothing is forked, and new modules can be added without changing the platform.

## How modules work

- **Self-contained.** A module brings its own pages, navigation, and (optionally) APIs and background work.
- **Discovered automatically.** When ABS starts, it finds every installed module — whether it's built in or added later as a package — and registers its services, menu, and screens.
- **Scoped per tenant.** Each tenant only sees and can open the modules its plan entitles it to; access is enforced by [Identity & Access](~/Capabilities/Identity-and-Access.md).
- **Extensible by you.** You can write your own modules in C# and load them the same way. See [Module development](~/get-started/Module-Development.md).

## Official modules

Browse the modules that ship with ABS, grouped by the capability each one delivers.

### Finance
- **[Accounting](~/Modules/Accounting.md)** — double-entry general ledger, journals, financial books, and multi-currency reporting.
- **[Subscriptions](~/Modules/Subscriptions.md)** — subscription plans and recurring billing.

### Commerce
- **[Commerce](~/Modules/eCommerce.md)** — online store: catalog, categories, carts, and sales channels.
- **[Sales Hub](~/Modules/Sales-Hub.md)** — quotes, orders, invoices, price lists, and loyalty.

### Operations
- **[Logistics](~/Modules/Logistics.md)** — items, warehouses, inventory, and stock movement.
- **[Assets Manager](~/Modules/Assets-Manager.md)** — fixed-asset tracking, transfers, and lifecycle.
- **[Manufacturing](~/Modules/MANUFACTURING.md)** — production planning, work orders, and workstations.
- **[Procurement](~/Modules/PROCUREMENT.md)** — purchase requests, suppliers, and requisition-to-order.
- **[Projects](~/Modules/PMS.md)** — projects, tasks, time tracking, and delivery.
- **[Quality](~/Modules/QMS.md)** — inspections, checks, and audits.
- **[Workflows](~/Modules/WORKFLOWS.md)** — visual workflow editor and process automation.

### Workforce
- **[Workforce](~/Modules/HRMS.md)** — employees, payroll, shifts, leave, appraisals, hiring, and training.
- **[Learning](~/Modules/Learning.md)** — courses, collections, instructors, and students.
- **[Workplace](~/Modules/WORKPLACE.md)** — shared file and document workspace.

### Customer Experience
- **[ContactSight (CRM)](~/Modules/CRM.md)** — unified contacts, organizations, and relationship profiles.
- **[Helpdesk](~/Modules/HelpDesk.md)** — support tickets, knowledge base, returns, and warranty.
- **[Marketing](~/Modules/MARKETING.md)** — campaigns, email, newsletters, social posts, and leads.
- **[Social](~/Modules/SOCIAL.md)** — member profiles, posts, reactions, and chat.
- **[Media Portals](~/Modules/CMS.md)** — external-facing websites and CMS content.

### Identity & Access
- **[IAM](~/Modules/IAM.md)** — users, roles, groups, and central access management.
- **[Security](~/Modules/SECURITY.md)** — tenant access, permissions, and security & audit logs.

### Trust & Compliance
- **[Signator](~/Modules/Signator.md)** — e-signatures, signing requests, certificates, and trust evidence.
- **[Sustainability](~/Modules/SUSTAINABILITY.md)** — ESG metrics and compliance reporting.

### Intelligence
- **[Analytics](~/Modules/ANALYTICS.md)** — governed BI, curated datasets, and a self-serve explorer.
- **[BotMaker](~/Modules/BOTS.md)** — design and manage conversational bots.

### Platform & Development
- **[CloudHub](~/Modules/CLOUD.md)** — provision and manage cloud resources.
- **[Blockchains](~/Modules/BLOCKCHAINS.md)** — connect chains and wallets, and on-chain assets.

## Integrations

Official **[integrations](~/Modules/Integrations.md)** connect ABS to outside services — payment providers, marketplaces, social channels, and more.
