# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

> Releases through **`2.0.0` LTS** were recorded contemporaneously. Subsequent releases were compiled from the project's development history and follow the same conventions.
>
> **About the release numbers.** From 2.1.2 (2026-10-02), release numbers are semantic versions, and each release is tagged when it is published. The sections marked *Product release* (2.1.0 to 2.8.0, from 2023 to 2026) used the earlier product release numbers. They are kept as they were, and their numbers do not match the package versions.


### Eras at a glance

- **[The foundation, 1.0.0 to 1.9.0](#100x---2020-12-31)**: a multi-tenant, modular platform takes shape, with portals, web content authoring, workflows and commerce.
- **[2.0.0 LTS](#200-lts---2022-08-11)**: the first long-term-support release, with Studio management engines and licensing.
- **[The re-architecture, 2.1.0 to 2.8.0](#product-release-210---2023-12-20--platform-re-architecture)**: Clean Architecture and CQRS, REST and OData service clients, new business services, and .NET 8 through .NET 10.
- **[The composable platform, 2.1.2 onwards](#212---2026-10-02-the-composable-platform)**: governed AI, workflows, trust and commerce, documented as each capability ships, under semantic version numbers.

## [Unreleased]

These changes are complete and verified, and they reach you with the next release.

### Added

- **Credit and debit notes.** You can issue a credit note or a debit note against an issued invoice. Each note takes the next number in your own note series, a credit note can never exceed what is still creditable on the invoice, and the reduction is posted to your accounts once the invoice is established. Colombian notes carry the reason and the full reference to the original invoice that DIAN requires.
- **Positions with several holders.** A position can now hold more than one person, up to a capacity you set, and belongs to a department. Each holder's assignment is recorded with its dates, and a position cannot be deleted while someone holds it.
- **Archive notifications.** In the Tools inbox you can archive and unarchive notifications, one at a time or a whole page, and switch to an Archived view. Archiving is per reader and never deletes anything.
- **AI advice on approvals, only if you turn it on.** Advice is off by default. An approvals manager opts the workspace in after seeing exactly which provider and model would be used and which approval fields are shared. Any later change to those suspends advice until the workspace confirms again, and opting out hides advice at once.
- **See what your workspace uses, and what it costs.** A new usage view in Studio shows your workspace's usage and its cost, and administrators can set limits on it.
- **Order numbers, and orders from quotes.** Every order gets a number in your own series, for example ORD-000123, that cannot be edited. You can place an order directly from a quote you received while the quote is open and not expired.
- **Selling courses.** Buying a course enrolls the buyer, a free course goes through a checkout at no cost, and a full refund ends the enrollment. Each enrollment shows as active, completed or revoked.
- **Banners.** Create banner sets in Studio and place them on your site's pages and posts. A visitor who clicks a banner is taken to its link.
- **Invoice-number range health.** Your invoice-number ranges show when they are expiring or nearly used up, and your billing administrators are notified when a range is used up.

### Changed

- **Signing in uses your email address.** You sign in with your email; an account that was given a generated handle signs in with its email too. Every email address can belong to only one account.
- **For developers: the legacy token endpoint is turned off.** `/api/v2/OAuth/Token`, which issued tokens for a client ID and secret, is off by default. There is no replacement for machine-to-machine sign-in in this release, so an integration that depends on it should contact us before upgrading.
- **Studio has a new look**, built on the latest version of its design system, and its pages now load their data through the platform's API.
- **Grids now show names instead of raw identifiers**, so a related record reads as its name, not a code.
- **Every document keeps its own currency.** The platform no longer falls back to US dollars anywhere a document has a currency of its own.
- **New workspaces choose their currency.** When you create a workspace you pick its currency, and its carts and documents use it.
- **Approvals are always decided by a person.** An approver must be a person, not an automated account, and each approver holds one seat per approval stage.
- The order summary now shows the workspace, the total and the date, and the sales and logistics pages use consistent icons.
- **For developers: Mercado Pago card routes.** `PUT /api/v2/Integrations/MercadoPago/Cards/Update` is retired and answers `410 Gone` with a link to its successor, `PUT .../Cards/UpdateByToken`, which updates a saved card from a Mercado Pago card token (`customerId` and `cardId` in the query). `PUT .../Cards/Delete` now takes `customerId` and `cardId` in the query and answers `400` when either is missing.
- **For developers: retired payment routes.** These routes now answer `410 Gone` with a `Deprecation` header and a `Link` to their successor. None of them reads a request body.
  - Mercado Pago refunds: `POST .../MercadoPago/Refunds/Create`, `POST .../MercadoPago/AdvancedPayments/Refund` and `POST .../MercadoPago/AdvancedPayments/RefundAll` (refund through `POST /api/v2/PaymentsService/ProviderOperations/{providerOperationId}/Refund`).
  - Mercado Pago cancellation: `POST .../MercadoPago/AdvancedPayments/Cancel` (cancel through `PUT .../MercadoPago/Cancellations/CancelPayment`).
  - Mercado Pago collections: `POST .../MercadoPago/Payments/Process`, `POST .../MercadoPago/Wrapper/CreatePreference`, `POST .../MercadoPago/Preferences/Create`, `PUT .../MercadoPago/Preferences/Update`, `POST .../MercadoPago/AdvancedPayments/Create`, `POST .../MercadoPago/AdvancedPayments/Capture`, `PUT .../MercadoPago/AdvancedPayments/Update`, `POST .../MercadoPago/Subscriptions/Create`, `PUT .../MercadoPago/Subscriptions/Update` and `PUT .../MercadoPago/InStoreOrders/Create` (payments are collected through the invoice's payment checkout, `/Payments/{token}`).
  - Mercado Pago card tokens: `POST .../MercadoPago/CardTokens/Create` (create card tokens in the payer's browser with MercadoPago.js and your public key).
  - ePayco: `POST .../ePayco/Payments/Process` and `POST .../ePayco/Payments/Global/Process` (payments are collected through the invoice's payment checkout), `POST .../ePayco/Withdraws/Withdraw` (no replacement in this release), and `GET .../ePayco/Syncronization/Sync/Primary` (reconcile a collection through `POST /api/v2/PaymentsService/ProviderOperations/{providerOperationId}/ReconcileOutcome`).
  - ABS never accepts raw card numbers or security codes on any route: the payer enters them on the payment provider's own checkout.

### Fixed

- **Emails sent in a language other than English, for example those you compose in Studio, are now delivered in that language.** Until this fix they arrived in English.
- Deleting a record from Studio works again.
- Every API documentation page renders again.
- Opening your own cart no longer fails.
- A message that was processed at the same moment as another is retried rather than set aside as failed.
- In Studio, the page title sits in the record header, the subheader fits on one line, roles can be revoked from the roles grid again, and amounts no longer clip.
- Row action menus in grids open again.
- The Studio onboarding tour no longer leaves the Studio stuck behind its overlay.
- The administration pages load and save settings correctly, the users list no longer reloads every row, and the server memory gauge no longer slows the server down.
- The workflow details panel no longer shows a developer note.
- The page you are on is now announced to screen readers.

### Security

- Sign-in hardening: an account with two-factor authentication can no longer sign in with its password alone on any path, a wrong password is refused on every path, and repeated failures always lock the account.
- Orders, invoices, payments and quotes read through a wallet are shown only to the wallet's owner.
- Contact records never carry the sign-in provider's access token.
- Sign-in tokens for AI connectors are now checked more strictly.

## [2.3.3] - 2026-10-06

The first 2.3 release with its complete set of packages and container images. It reached production on 2026-10-07, and with it every change in 2.3.0, 2.3.1 and 2.3.2.

### Fixed

- The release build now includes the Azure Communication integration, so the platform's container images build in full.

## [2.3.2] - 2026-10-05

Its NuGet packages were published on 2026-10-05. Its container images could not be built, so its fixes reached the images, and production, through 2.3.3.

### Fixed

- **A data list on a page rendered on the server no longer fails.** This fixed the error on the blog posts page.
- Container images are now built from the compiled release output.

## [2.3.1] - 2026-10-05

Its NuGet packages were published on 2026-10-05, carrying 2.3.0's changes as packages for the first time. Its container images could not be built, so its fixes reached the images, and production, through 2.3.3.

### Fixed

- **The Suite home page is now part of the standard platform image**, so every instance serves it.
- Packages are now built from exactly the build that passed validation.

## [2.3.0] - 2026-10-04

Tagged on 2026-10-04. Its NuGet packages were not published: these changes reached you as packages in 2.3.1, and in production through 2.3.3 on 2026-10-07.

### Added

- **Inviting someone no longer fails when the invitation email cannot be sent.** The invitation is kept, and you can resend it once mail is flowing again.
- **AI assistants such as ChatGPT can now connect to your workspace's MCP server.** The server publishes standard OAuth metadata, and the tokens it accepts are issued for that server alone.
- **The Suite home page now ships with the platform.** It appears only when its interface is fully loaded, never as a blank page.
- **For operators:** a new version can be staged beside the live one without both running background work. Background work runs only on the instance you choose.

### Changed

- **Releases are now built, tested, packaged and published by a single pipeline from a single build**, so every package and migration image in a release comes from exactly the same source.
- **Development and QA environments now run the same way as production**: on Azure Container Apps, with their configuration on a mounted share and their infrastructure defined as code. The release pipeline deploys to each one and then runs its tests against it.
- The health checks dashboard is switched off for now. The health endpoints, including the database check, keep working as before.

### Fixed

- **Studio no longer redraws its layout continuously while you are signed in.** Every open Studio tab now does far less work in your browser and on the server.
- In Pocket, a product's price before discount is now shown correctly.
- A page that cannot be found now shows a friendly error page instead of a blank one.
- Installing a new instance no longer fails at startup with an API versioning error.
- An instance now stops within its shutdown time even while background work is running, and pending messages are still flushed first.

### Security

- Invitations are now answered only by the person they were sent to, and managed only by the workspace that sent them.
- Public blog and web page listings now follow the same publication rules as the pages they belong to.

## [2.2.0] - 2026-10-02

Reached production on 2026-10-02.

### Added

- **New businesses start in their own currency.** When a business is created, its currency is set from its country, so a business in Colombia starts in Colombian pesos, and you can change it at any time. Where a country has no single currency, the business starts in US dollars.
- **Assistants and workflows can now search your workspace.** An assistant can draw on what it finds to answer you, through the same permission-checked search you use yourself.
- **Search stays current while it is rebuilt.** A new search index is checked and switched in automatically, even while your data keeps changing, and the changes you make during a rebuild are not lost.
- **Administrators can now see and resolve stuck integration messages** rather than leaving them to retry unseen.
- Licence verification can now run against a configured trust manifest, and refuses every licence if that manifest is missing or unusable.
- **For developers:** release numbers now follow semantic versioning, starting with 2.1.2, and each release is tagged when it is published.

### Fixed

- Subscriptions now identify their subscriber from the subscribed contact, and match each payment to its own invoice.
- An email no longer fails to send when one of its stylesheets cannot be downloaded.
- The approver inbox now lists requests in a fixed order.

### ABS Online

- `www` addresses now redirect to the main address, so every page has one canonical URL.
- Public catalog, blog, job and course pages show only published content.
- Invoices and quotes are now shown only to the people they were sent to.

## [2.1.2] - 2026-10-02: The Composable Platform

The first release under semantic versioning. It gathers everything built since product release 2.8.0, and was published on 2026-10-02. It reached production the same day, as part of 2.2.0.

### Documentation

- **Documentation now ships with the capability, not after it.** A capability is no longer considered finished until the pages describing it are written and published. Documentation is a release condition now, held to the same bar as the code being built and verified — so when something reaches you, the explanation of it reaches you at the same time.
- **Two audiences, written separately and deliberately.** The same change reads differently depending on how you meet it, so we write it twice:
  - **If you build on the platform** — API and SDK reference, module and extension guides, and explicit breaking-change notes, kept in step with what the platform actually exposes.
  - **If you run your business on the platform** — module and capability pages, get-started and how-to content, written in the language of the work rather than the code, so nothing in Studio, Client.Next or Pocket requires reading a developer page to understand.
- **This changelog is the front door to that evolution.** It is written for the people using the platform, in plain terms: what you can now do that you could not do before, and what to do differently. Start here when you return after a while.
- **New page:** [How this documentation is kept current](~/reference/Documentation-Currency.md) — the commitment in full, what to trust, and how to tell us where we fall short.
- **Documentation is written only after a capability is real.** If a page describes something, that thing exists today. Anything planned but not yet built stays on the [roadmap](~/get-started/Roadmap.md), marked as such.

### Added

- **Notifications now decide who to tell before they decide how to send.** When something happens in your workspace, the platform works out who genuinely needs to know, checks that each person is allowed to see what the notification is about, applies their preferences, and only then delivers. Someone who qualifies for several reasons is told once, not once per reason, and the person who caused the event is not notified about their own action.
- **You can now set notification preferences per category and channel**, and administrators can set what a workspace permits and what its members receive by default. Settings you are not allowed to change are shown locked with the reason, rather than appearing editable and being overruled somewhere you cannot see. Categories such as security and legal notices cannot be switched off.
- **Administrators can now ask why somebody was not notified.** Every recipient and channel leaves a recorded decision, allowed or not, so the question is answerable after the fact. It distinguishes two cases that look identical from outside: a person who was considered and ruled out on policy or preference, and a notification that never evaluated anybody at all, which is not a preference problem and needs an administrator rather than a settings change.
- Notifications reach you **in the app and by email**. Mobile push, web push and SMS are not available yet, and delivery feedback from your mail provider is not yet connected; see [Notifications](~/Capabilities/Notifications.md) for the current boundary stated in full.
- **AI agents as workflow steps** — invoke a governed AI agent from inside a [workflow](~/Modules/WORKFLOWS.md): hand it a question or a task, let it run to an answer, and use the result in later steps. The agent runs under the workflow's own identity, is permission-checked, and leaves a durable audit record.
- **Assistants that remember.** An assistant can durably remember useful details about the person it is helping and draw on them in later conversations, so you do not repeat yourself. What it remembers is private to that assistant and that person, stays within your tenant, and is governed like every other AI action. An administrator can turn it off for the whole environment.
- **Suite UI Kit** — a unified component design system across the Studio.
- **Platform-wide role-based access control**, with per-feature and per-action permissions.
- **Human Resources / Workforce** management — employee types, job titles, schedules, time intervals and rounding policies.
- **OpenAPI server** with parallelized, multi-language SDK generation.
- Tenant-scoped media upload; batch and domain-routed APIs.
- Expanded entity selectors, applets, grids and preview components across the SDK.
- **Signing keys can now be created inside their vault and never leave it.** The platform can mint a key that cannot be exported and link it to its certificate, so signing happens in place.
- **Signatures and trust records now name both parties.** Who performed the signing and who it was done for are both on the record, across all four signing providers.
- **Every accounting entry now records who made it and on whose behalf.** When an assistant or an automation posts on behalf of a person, both are recorded, and both are visible when the entry is read back.
- **Assistants now leave a step-by-step record of what they did.** Each run keeps its own identity and its sequence of steps, so a completed piece of agent work can be read back afterwards.
- **Work started by a workflow or an assistant runs once, even across interruptions.** If a step pauses for approval or the process restarts, the platform holds a single claim on that work rather than repeating it.
- **Delivery attempts that never resolved are now reconciled.** A notification whose outcome was never confirmed is swept up and settled, so the delivery record reflects what really happened.
- **Invoices now show when they expire and the effective rate applied**, computed by the server so every surface shows the same figure, with a matching summary view for payments.
- **Apps can now revoke their own sign-in tokens.** A client that signs a person out can tell the platform to retire that session's tokens straight away, rather than waiting for them to expire.
- **Developers get tenant-scoped entry points for wallet data.** Service clients can now ask for a business or contact wallet's locations, accounts and related records within a named tenant, the same way the Studio screens do.
- **Invoices are now issued as a deliberate step.** When you issue an invoice, its prices are frozen and it takes the next number in your own gap-free invoice sequence. Only an issued invoice can be paid.
- **Exchange rates tell you when they are out of date**, and missing historical rate sets can be rebuilt from a published rate history.
- **Colombian electronic invoices issued in another currency now carry the exchange rate to pesos that DIAN requires.** A document whose rate cannot be stated is refused rather than sent incomplete.
- **With ePayco, you can now refund a collected payment from the platform.** The refund is recorded before ePayco is contacted, so repeating the request never refunds twice. You can also list the bank accounts your own ePayco account pays out to, with account numbers masked.
- **Overdue approval requests are now escalated or expired on schedule**, and every decision is tied to the evidence it was made on.
- You can now rejoin a live communication session after leaving it.
- **Anonymous traffic can now be rate limited per client address**, with limits you configure. Signed-in use is not limited.
- Email images and styles are now served by your own instance, so emails look the same wherever the platform runs.
- **For developers:** every API operation has one stable, predictable operation id; the Colombian e-invoicing API now describes its responses in full; and OpenAPI snapshots can be compared to catch breaking changes before release.

### Changed

- Standardized the platform-wide result and error-handling model.
- Unified CQRS dispatch behind a single mediator.
- Standardized DTO mapping conventions across the SDK.
- Enhanced multi-currency billing and overall UI consistency.
- Setting up a development environment is faster and works on Linux as well as Windows, and the platform's repositories clone over HTTPS without extra credentials.
- **Wallet screens for businesses and contacts now read through tenant-scoped calls**, so the records you see are always the ones that belong to the wallet you opened.
- **A record's type is now fixed once it is created.** Contact, workforce and account relation edit forms show the type for reference but no longer change it, which keeps every record in the lists where you expect to find it.
- **Payment confirmations now arrive through one processing path**, with automatic recovery for any that are interrupted, so a payment is settled once and settled consistently.
- **An invoice always states its currency.** It never falls back to US dollars without saying so.
- Every automatic journal entry now goes through a single governed posting path.
- **The point of sale terminal loads through your workspace's own data**, on a reworked point of sale page.
- Apply voucher in the Studio cart now checks the code against your seller's coupons and tells you plainly whether it applies.

### Fixed

- **An edit form no longer saves when the record failed to load**, so an interrupted load can never blank out the record behind it.
- For API users, asking for a record that does not exist now returns not found rather than a server error.
- **Invoices now carry the right lines and quantities.** Order quantities flow through to invoice lines, and lines from a child order are invoiced once.
- Sign-in no longer fails with a server error when an account needs to complete a step first; the person is guided to that step instead.
- **The workflow designer now runs under a strict browser security policy**, so it loads in environments that enforce one.
- **Health checks now speak up about configuration they cannot find.** Missing module setup, a missing options manifest, and a notification reconciliation sweep that is switched off are all reported as degraded rather than passing quietly.
- **Workflows no longer open a fresh database connection on every background check.** Under load this had been slowing database access for everything else on the instance. Since the fix, database timeouts in production have fallen to zero.
- Workflows no longer change the database structure when the application starts.
- A percentage discount is now read as a percentage, so 10 means 10 percent, and it is checked when it is saved.
- Balancing an account whose parent accounts form a loop now returns a clear error naming the loop, so you can correct it, instead of stopping the service.
- The Studio cart no longer shows raw checkout errors.
- The JavaScript SDK formats amounts correctly again.

### Security

- Accounts now lock after repeated failed sign-in attempts, on every password sign-in path.
- Stored payment methods and bank accounts are now scoped to the wallet that owns them.
- Confidential learning records are confined to the tenant making the request.
- Approvals now allow one vote per approver at each stage, and an approval is refused if the policy it was granted under changed in the meantime.
- Requests arriving through a proxy are now trusted only within an explicit boundary.
- Developer tooling keeps certificate validation on, using the machine's own trusted roots.
- **Tenant isolation hardening** across AI agents and skills, the agent runtime, Learning, point of sale and order lines, Social, notifications, CRM contacts, system options, and the order and quote viewers in Studio.
- **Anonymous endpoints now return only public fields.** The public catalogue, public pricing, the merchant directory and the public course catalogue each show only what a business has chosen to publish.
- Learning certificates can be read only by the person who holds them.
- Guest cart merging is confined to the visitor's own cart, and cart data no longer carries the visitor's network address.
- Approval lists show a summary without the stored ticket details, and a decision is accepted only while the ticket is still at the stage it was made for.
- Sign-in requires the stronger S256 method for proof-key exchange on every client.
- Hardened how containers handle configuration secrets at startup.
- **Tenant isolation hardening** across files and storage, the catalog, payments, accounting, billing, licensing, subscriptions, CRM, marketing, digital assets, learning, content, sales and logistics, social, support, communications and identity.
- Avatar uploads are type-checked and scanned before they are stored, and uploaded documents are no longer displayed inline on public pages.
- Only a person can decide an approval. Assistants and automations can request one, never grant it.
- Workflows refuse to be saved, published or installed with a secret written into them.
- Logs no longer record identities, network addresses or query strings where they are not needed.
- The public blog shows only published posts, without management fields or author details.

## Product release 2.8.0 - 2026-01-07 — .NET 10 LTS & Asset Management

### Added
- **Asset management** with multi-currency cost tracking.
- Operations tooling for instance backup and restore.

### Changed
- Upgraded to **.NET 10 (LTS)**.
- Unified data and service namespaces.
- Streamlined messaging configuration.

## Product release 2.7.0 - 2025-11-10 — Domain Model, Messaging & Payments

### Added
- **Payment Allocation**.
- Resilient messaging — health checks, circuit breakers and configurable consumers.
- Published licensing and trademark terms.

### Changed
- Domain-driven design refactor across services and repositories.

### Security
- Hardened identity-provider key handling.

### Removed
- Module and integration packaging from the SDK distribution pipeline.

## Product release 2.6.0 - 2025-05-26 — Billing, Pricing, Email & MCP

### Added
- **Model Context Protocol (MCP) server** support.
- **Apple** sign-in.
- A new **email engine** for quotes, orders and invoices.
- Cart state-change events.

### Changed
- Improved quote calculation and multi-currency forex conversion.
- Improved pricing and billing.

### Removed
- Authorize.Net integration.

### Fixed
- OpenID Connect sign-in, guest-cart persistence and API-documentation generation.

## Product release 2.5.0 - 2024-12-21 — Platform Hardening & .NET 9

### Added
- **MercadoPago** payment integration.
- API documentation across all controllers.

### Changed
- Upgraded to **.NET 9**.
- Renamed portal configuration to `PortalSettings`.
- Improved the storage service and portal initialization.

### Removed
- Legacy API authorization; obsolete projects.

### Fixed
- Portal context when no tenant is selected; logging and error handling.

## Product release 2.4.0 - 2024-08-23 — REST/OData Migration & New Verticals

### Added
- **Human Resources (HRMS)** service; **Logistics** service.
- Support and Accounting REST endpoints.

### Changed
- Migrated module pages onto REST/OData service clients (Sales, Accounting, Marketing, Invoices, Orders, Quotes).
- Strengthened the OData engine; refactored strongly-typed identifiers.
- Refactored monetary types to decimal precision.
- Improved invoice, order and quote grids.

### Fixed
- Cart-management, data-grid and request-header defects.

## Product release 2.3.0 - 2024-06-13 — Microservices & SDK Platform

### Added
- **Commerce, Catalog, Licensing and Learning** services; the **Forex V3** multi-currency service.
- A **C# API client generator** with OpenAPI/Swagger annotations; Postman collections.
- Item images, category management, and merchant & blog features.

### Changed
- Centralized business logic in the Application layer (CQRS).
- Moved database providers behind repository interfaces.
- Modernized the codebase (primary constructors, file-scoped namespaces).

### Fixed
- Catalog, cart and tenant-validation defects.

## Product release 2.2.0 - 2024-02-22 — Services & Identity

### Added
- **Marketplace** and **Accounting** services.
- **OpenID Connect** identity with external-provider configuration; identity-management endpoints.
- **GraphQL** server API.
- Postman collections and an OpenAPI server option.

### Changed
- Improved the Holders & Tenants and Security services, and the role/permission system.
- Pipeline reporting and developer tooling.

### Fixed
- GraphQL server, Studio assembly loading and authentication-token defects.

## Product release 2.1.0 - 2023-12-20 — Platform Re-Architecture

### Added
- **CQRS** architecture with use-case dispatch and the **Projections** pattern.
- Repository pattern across all data access.
- **Accounting** module; shopping **Cart** service; theming micro-service.
- **Container (Docker)** support and images; load-test pipeline.
- Dedicated **Development, QA and Testing** environments.
- In-Studio full-text **search**; React + Redux client support.

### Changed
- **Re-architected the platform onto Clean Architecture**.
- Overhauled the Studio UI on **FluentUI**, with a new breadcrumb and navigation system.
- Upgraded to **.NET 8**.
- Improved the domain model, module loading and dependency injection.

### Fixed
- Tenant-initialization and workflow-execution defects; cart creation and persistence.

## [2.0.0] LTS - 2022-08-11

The first long-term-support release. Studio gained management screens for modules, enrollments, applications, security roles, permissions and certificates, licensing and subscriptions became services in their own right, and the interface was translated into five more languages.

### Added

- [ABS] In-Studio UI Improvements.
- [ABS] In-Studio Module Management Engine.
- [ABS] Business Enrollments Management Engine.
- [ABS] Business Applications Management Engine.
- [ABS] Business Security Roles Management Engine.
- [ABS] Business Security Permissions Management Engine.
- [ABS] Business Security Certificates Management Engine.
- [ABM] `ILicensingService` and default implementation (`LicensingService`).
- [ABM] `ISubscriptionsService` and default implementation (`LicensingService`).
- [ABM] `ISecurityCertificatesService` and default implementation  (`SecurityCertificatesService`).
- [ACL] Adds `pt-PT` Translations.
- [ACL] Adds `pt-BR` Translations.
- [ACL] Adds `de-DE` Translations.
- [ACL] Adds `it-IT` Translations.
- [ACL] Adds `fr-FR` Translations.
- [ACL] Enables Licensing Engine (ABS Now requires a license).

### Fixed
- [ABM] COA importing capabilities on Accounting Service.
- [ABS] Error when navigating to the Fiscal Authorities page.
- [ABS] Virtualize License Types List on Licenses Modal Form.
- [ABS] Virtualize Subscription Plans List on Subscriptions Modal Form.
- [ABS] Error when navigating to new created Organization (Contact) details page.

### Changed
- [ABS] Update Studio Base Theme for V2.
- [ABM] Improve `SecurityHelpers` class.
- [ABM] Improve overall performance & memory consumption.

## [1.9.0] - 2022-07-20

A polish release for the Studio interface and the way its services are wired together.

### Fixed
- [ABS] UI Improvements for UI & Core Components.
- [ABS] Contextual Menu showing when no business is selected.
- [ABP] Improve DI Tree for most services.

## [1.8.0] - 2022-07-04

Studio gained a dark theme, REST endpoints gained OData querying, and the platform added services for cookies, data protection and browser storage.

### Added
- [ABS] Dark Theme Support for Studio.
- [ABP] OData Support for REST Endpoints.
- [ABM] `ICookiesService` and default implementation (`CookiesService`).
- [ABM] `IDataProtectionService` and default implementation (`DataProtectionService`).
- [ABM] `IBrowserStorageService` and default implementation (`BrowserStorageService`).

### Changed
- [ABS] Update Studio Base Theme for V2.
- [ABS] Improve Studio Menus & Mobile Layout.

### Fixed
- [APS] NullRedException on SecurityDataService due to DI misconfiguration.

## [1.7.2] - 2022-06-04

Added web and date services, and registered the Fluent UI layout contexts they depend on.

### Added
- [ABM] `IWebUIService` and default implementation (`WebUIService`).
- [ABM] `IDateTimeService` and default implementation (`DateTimeService`).

### Changed
- [ABS] Register Fluent UI & Fast Design Layout Contexts.
- [ABP] Register `IWebUIService` default implementation (`WebUIService`) as Singleton Service.
- [ABP] Register `IDateTimeService` default implementation (`DateTimeService`) as Singleton Service.


## [1.7.1] - 2022-06-04

Fixed quick panels that could lock up the interface.

### Fixed
- [ABS] Quick Panels causing UI deadlocks.

## [1.7.0] - 2022-06-04

Studio began shipping bundled static assets and rendered more quickly.

### Added
- [ABS] Studio Static Asset Bundles

### Changed
- [ABS] Improve Country Flag Rendering.
- [ABS] Improve Country Flag Rendering.
- [ABS] Improve Studio Rendering Process.
- [ABM] Improve Curriculum Relations.
- [ACL] Update dependencies to the latest stable versions.

## [1.6.0] - 2022-05-28

The data model gained gigs and gig applications, the groundwork for job board work.

### Added
- [ABM] Gig Entity to Database Scheme.
- [ABM] GigApplication Entity to Database Scheme.

## [1.5.9] - 2022-05-27

Contact lookups moved onto the CRM data service.

### Fixed
- [ABM] IContactService's default implementation is now using ICrmDataService.

## [1.5.8] - 2022-05-26

Contact operations moved to their own per-operation data contexts.

### Added
- [ABM] IContactService's default implementation is now using per-operation Data Context instances.

## [1.5.7] - 2022-05-25

The portal context gained a contact synchronization strategy.
### Added
- [ABS] ContactSyncronizationStrategy on PortalContext.

## [1.5.6] - 2022-05-23

Fixed Studio module loading, and extended the job board model with migrations for MySQL, SQL Server and Oracle.

### Fixed
- [ABS] Fix error on Studio Modules Loading Process. More assemblies than necessary used to be passed to the router.
- [ABM] Adds additional properties to Alliance Business Model for Job Board Applications.
- [ABM] Adds V1.5.6 ABM Migration for MySQL, MS SQL, and Oracle Data Providers.

## [1.5.5] - 2022-05-22

Service lifetimes were made consistent, and the academy data service became the LMS data service.

### Added
- [ACL] Brazorize Library Dependency.

### Fixed

- [ABP] Improved ServiceLifetime consistency across default service implementations.
- [ABS] Improved Studio Rendering Process.

### Changed

- [ACL] Update dependencies to the latest stable versions.
- [ABS] IAcademyDataService and AcademyDataService are now ILmsDataService and LmsDataService respectively.

## [1.5.4] - 2022-05-19

Academy gained student, instructor, enrollment and certificate lookups, and MySQL migrations were squashed.

### Changed

- [ABM] Squash migrations for MySQL.
- [ABP] Update Service Registration Lifetime.
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Improve Academy Pages to use new methods on IAcademyService.
- [ABM] Use new scoped for Scoped Services used over Singleton Services.
- [ABM] Adds GetStudentCoursesAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetStudentProfilesAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetCourseEnrollmentAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetCourseEnrollmentsAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetInstructorCoursesAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetInstructorProfilesAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetCourseCompletionCertificatesAsync method to IAcademyService and Default Implementation.


### Fixed

- [ABS] Studio wasn't using the SelectedBusinessID for each holder, thus, when reloaded, business selection used to get override with null.


## [1.5.3] - 2022-05-15

Static assets were reorganised so packages install faster.

### Changed
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Refactor Static Assets to improve package installation time.


## [1.5.1] - 2022-05-14

Interface rendering improvements, with dependencies brought up to date.

### Changed
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Improve UI Rendering Process.


## [1.5.0] - 2022-05-13

Interface rendering improvements, with dependencies brought up to date.

### Changed
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Improve UI Rendering Process.


## [1.4.1] - 2022-05-12

Each portal became an independent module on Studio.Core, the theming engine moved onto model services, and a Monaco based code editor arrived.

### Added
- [ABM] ICmsDataService.
- [ABM] ICrmDataService.
- [ABM] ISocialDataService.
- [ABM] IMarketplaceDataService.
- [ABM] ISecurityDataService.
- [ABM] IGlobalDataService.
- [ABM] IForexDataService.
- [ABS] CodeEditorComponent with Monaco Editor.

### Fixed
- [ABS] Fixed Workflows Studio Designer not displaying on production.
- [ABM] Improve IPricingService implementations to always use the latest data to perform generic/historical/extensible/customizable multi-currency amount calculations.

### Changed
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Theming Engine now relies on interface services on the Alliance Business Model.
- [ABS] Theming Engine now relies on default service implementations on the Alliance Business Model.
- [ABS] PortalContext is now optimized to use DataServices.
- [ABS] StudioContext is now more efficient through PortalContext Optimization.
- [ABS] `Studio.Core` now contains the layout, components, and utilities for the ABS Studio.
- [ABS] Academy Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Admin Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Wallet Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Holders Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Tenants Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Social Network is now an independent dll compatible with `Studio.Core.`
- [ABS] Support Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Developer Portal is now an independent dll compatible with `Studio.Core`.

### Removed
- [ABM] I 

## [1.4.0] - 2022-01-12

A large release. Cart, store, wallet, academy, networks and job board arrived inside Studio, alongside .NET 6 support, storage across the file system, Azure and AWS, and services for sign-in, reCAPTCHA and certificates.

### Added

- [ACL] .NET 6.0 Support.
- [ABS] In-Studio Cart.
- [ABS] In-Studio Store.
- [ABS] In-Studio Wallet.
- [ABS] In-Studio Academy.
- [ABS] In-Studio Networks.
- [ABS] In-Studio JobBoard.
- [ABS] Lead Form Component.
- [ABS] Newsletter Form Component.
- [ABS] Create Business Modal Form.
- [ABS] Email Template Editor Pages.
- [ABS] Token Management Options Page.
- [ABS] Stock Items Categorizer.
- [APS] EN-US, ES-CO Localizations.
- [APS] Account Mgmt. Email Alerts.
- [APS] Google ReCaptcha Service.
- [APS] Certificates Manager Service.
- [APS] OAuth & IODC Service Support.
- [ABS] Social Feeds & Post Reactions Bar.
- [ABS] PortalContext Country Selector Form.
- [ABS] PortalContext Currency Selector Form.
- [ABS] PortalContext Language Selector Form.
- [ABS] Monaco Editor Component for WebContent.
- [ABM] AccountHolder Birthday & Gender Properties
- [ABM] IPortalContext Interface and default implementation (PortalContext Class)
- [ABM] ISocialDataService Interface and default implementation (SocialDataService Class)
- [ABM] IAssembliesService Interface and default implementation (AssembliesService Class)
- [ABM] IPaymentsService Interface and default implementation (BankTransferPaymentsService Class)
- [ABM] IStorageService Interface & implementation (FileSystemStorageService, AzureStorageStorageService & AwsS3StorageService Classes)

### Changed
- [ACL] Updated Dependencies to the latest version
- [ABM] Improved Queries
- [ABM] Improved MarketplaceData
- [ABM] Improved Memory Allocation
- [ABS] Studio Dashboard Icons.

### Removed
- [ACL] Remove deprecated dependencies

### Fixed
- [ABS] Portal & Tenant Selector.
- [ICX] Duplicated Recently Viewed Product Records.
- [ABS] Fix Invoice Outliner Glitch.
- [ABS] Fix Web Installer Versioning Glitch.
- [ABS] Fix FHIR Server Pooling Glitch.
- [ABS] Fix Portal Domain Bindings.
- [ABS] Fix Network Dashboard Deadlock on IP Verification.

## [1.3.0] - 2021-07-12

Added the Oracle database provider and a service for reading and writing options.

### Added
- [ABM] Oracle Database Provider.
- [ABM] IOptionsService Interface and default implementation (OptionsService)

### Changed
- [ACL] Updated Dependencies to the latest version.

### Removed
- [ACL] Remove deprecated dependencies.

### Fixed
- [ABS] Fix Workflows Data Provider (LiteSQL)
- [ABM] Entities Disambiguation


## [1.2.1] - 2021-07-13

Added a view rendering cache and assembly scoping.

This release carries a date one day later than 1.3.0 below it. Both published dates are preserved as recorded; the order here follows the version number.
### Added
- [ABS] View Rendering Cache
- [ABS] AppDomain Assembly Scoping


## [1.2] - 2021-07-12

The Razor theming engine arrived, with custom portal options and support for Angular and React single-page applications.
### Added
- [ABS] Razor Theming Engine
- [ABS] Custom Options Manager (API)
- [ABS] Portal Option Manager (UI)
- [ABS] Custom Portal Option Definitions
- [ABS] Virtual SPA Support (Angular/React)
- [ABS] Custom Service Endpoint Definitions

## [1.1.9] - 2021-06-30

Themes could be precompiled ahead of serving.
### Added
- [ABS] Theme Precompilation

## [1.1.8] - 2021-06-18

Workflows arrived.

### Added
- [ABS] Workflows Capability


## [1.1.7] - 2021-06-06

Web content authoring arrived: editable pages, components and templates, a blog editor, a drag and drop live editor in preview, invoice tools, and the first localization support.
### Added
- [ABS] Log Viewer
- [ABS] Template Views
- [ABS] View Components
- [ABS] Blog Post Editor
- [ABS] Drag 'n Drop Live Editor. (Preview)
- [ABS] Support for Angular and React+Redux SPAs
- [ABS] Initial Web Content (Editable Pages, Components & Templates)
- [ABS] Internal Web Content (Sys locked Pages, Components & Templates)
- [ABS] Frontend Admin Bar
- [ABS] Invoice Outliner
- [ABS] Invoice Manager
- [ABM] Marketing Module Models
- [ABS] Project Service Models
- [ABM] LMS Service Models
- [ABS] Add support for Bootstrap CSS
- [ABS] Add support for Foundation CSS
- [ABS] Adds support for Fabric JS and Fluent UI.
- [ABS] Ensure non-existence of viral licensed libraries. (e.g GNU)
- [ABS] Adds IViewBuffer, Resx, and Model Resolver to Theming Engine
- [ABS] Adds Localization String Manager. Initial Localization Capabilities.

### Changed
- [ABS] Fix HTTP context access on IIS making the installation process fail.
- [ABS] Fix HTTP context access on IIS when trying to create a new view.
- [ABS] Fix HTTP context access on IIS when trying to edit a new view.
- [ABS] Fix HTTP context access on IIS when trying to create a new post.
- [ABS] Fix HTTP context access on IIS when trying to edit a new post.
- [ABM] Fiscalization document Models
- [ABM] Project Service document Models
- [ABM] Pricing engine Models
- [ABM] Workflow engine Models
- [ABM] Web Content Records now share a single base class
- [ABM] ItemPriceList is now a PriceListRecord.
- [ABS] Fix error when referencing scripts into a Web Content being malformed by Theming engine.
- [ABS] Fix page tree navigation on the live editor.


## [1.1.6] - 2021-04-21

Search engine and analytics integrations arrived, along with view precompilation and dynamic portal metadata.
### Added
- [ABS] View Precompilation
- [ABS] Internal Plugin Support+
- [ABS] Dynamic Portal Metadata
- [ABS] Google Meta Tags Integration
- [ABS] Google Analytics Integration
- [ABS] Google Verification Code Integration
- [ABS] Bing Verification Code Integration
- [ABS] Pinterest Verification Code Integration
- [ABS] Facebook Pixel Verification Code Integration
- [ABS] ICX Taxonomies Creation Blazor Pages.
- [ACL] Store Configuration Objects.
- [APS] External Authentication Provider configuration pages.

### Changed
- [ABP] Fix error while previewing files on File System Explorer.
- [ICX] Fix error where new users got a 500 when visiting the store.
- [ICX] Update Swiper to the latest version.
- [ABS] Monaco editor now lives inside the project instead of as a node module.
- [ICX] ICX Static Files audit, bundling & minification.
- [ICX] Fix UI error on cart record addition/deletion.
- [APS] Fix Auth Error: when users do not belong to any tenant, they used to get an E500 on nested File Retrieval.
- [ABM] Model Modification to support DB-stored precompiled views.
### Removed
- [ICX] Taxonomies Creation Controllers/Views.

## [1.1.4.x] - 2021-04-13

Sign-in through eight external providers, and a wide set of search engine and storefront customizations.
### Added
- [ABS] Extension Updates Page
- [ABS] Razor Theming Engine
- [APS] Google Authentication
- [APS] Facebook Authentication
- [APS] Microsoft Authentication
- [APS] Twitter Authentication
- [APS] LinkedIn Authentication
- [APS] Instagram Authentication
- [APS] Github Authentication
- [SEO] Zift 123 Analytics Script Integration
- [SEO] Facebook Pixel Integration
- [SEO] Facebook Chat Widget Integration
- [SEO] Google Analytics integration
- [SEO] Google Merchant Center integration
- [SEO] Google Verification Code Integration
- [SEO] Google Tag Manager Integration
- [SEO] Bing Verification code integration
- [SEO] Pinterest verification code integration 
- [SEO] Dynamic Structured Metadata
- [UI] Adds Off-Canvas Cart Slider
- [UI] Dynamic Top Bar content
- [UI] Logo size customization options
- [UI] Footer Dynamic Content
- [UI] Footer/Header Dynamic styling


## [1.1.3.x] - 2021-04-09

The dependency set the platform is built on was established.
### Added
- [ACL] Radzen.Blazor is now a project dependency. 
- [ACL] RabbitMQ.Client is now a project dependency. 
- [ACL] Fluid.Core is now a project dependency. 
- [ACL] FluentValidation is now a project dependency. 
- [ACL] NuGet.Packaging is now a project dependency. 
- [ACL] FluentEmail.Core is now a project dependency. 
- [ACL] Flurl.Http is now a project dependency. 
- [ACL] Standard.Licensing is now a project dependency. 
- [ACL] NodaTime is now a project dependency. 
- [ACL] Serilog is now a project dependency. 
- [ACL] Autofac is now a project dependency. 
- [ACL] CsvHelper is now a project dependency. 
- [ACL] Dapper is now a project dependency. 
- [ACL] AngleSharp is now a project dependency. 
- [ACL] IdentityServer4 is now a project dependency. 
- [ACL] DotLiquid is now a project dependency. 
- [ACL] Emitter is now a project dependency. 
- [ACL] MediatR is now a project dependency. 
- [ACL] SixLabors.ImageSharp.Web is now a project dependency. 
- [ACL] RazorLight is now a project dependency. 
- [ACL] MassTransit is now a project dependency. 
- [ACL] ZXing.Net is now a project dependency. 
- [ACL] Z.EntityFramework.Plus.EFCore is now a project dependency. 

### Changed
- [ABP] Fix error where plugin assembly paths always returned null (IPluginManager Implementation)


## [1.1.2.x] - 2021-02-23

The extensions gallery, web installer and admin portal arrived, together with a file manager and antivirus scanning for uploads.
### Added
- Adds ABP Proxy
- Missing ACL configuration Types
- ABS Extensions Gallery
- ABS Extensions Installer
- ABS Web Installer
- ABS Admin Portal
- Dynamic Web Page/Post creation
- Assembly Explorer
- Roles and Permissions Explorer
- Admin Dashboard Initials
- Added support for SixLabors.ImageSharp.Web
- Forex service data is now scraped by Alliance Business Systems.
- Data Services are not coded to replaceable interface implementation.
- ABS.Hub project now contains everything we need to create a new ABS Instance.
- Added support for IdentityServer4 as a replacement for Alliance Passport Services.
- ACL.Licensing is now a part of the Alliance Business Suite.


### Changed

- Extracts interface for ACL configuration Types
- ACS is now ABP.BotEngine
- Plugin Manager is now loosely coupled to IPluginManager
- Adds File Manager and FileSystem Service
- Adds antivirus scanning extension for FileSystem Service (Windows Defender)
- AccountHolder is now the standard identity class.
- Fix minor UI glitches and broken links.
- Fix several bugs on application startup and related extensions.

### Removed
- Data Helpers marked for deprecation.
- ABS.Nucleus was deprecated and is no longer a part of this project.

## [1.1.1.x] - 2021-01-20

Infinity Comex support arrived, with the first set of portal interface components.
### Added
- Adds ABP Proxy
- Adds Infinity Comex Support
- Missing ACL configuration Types

### Changed
- Fix Namespaces
- ABS.Portal.Paperbits is now ABS.Portal.Editor
- Adds ABS.Portal.UI Components (20+ View Components)

### Removed


## [1.1.0.x] - 2021-01-12

The first published packages, and the Blazor admin application at /admin.
### Added
- Nuget Packages @1.1.0
- Initial Portal Admin Blazor Application at route /admin.

### Changed
- Standardize namespace at v1.1.0

### Removed

## [1.0.0.x] - 2020-12-31

The first release. Multi-tenant, multi-portal and modular from the start, with authentication and granular permissions, REST and GraphQL APIs, multi-currency support, storage, notifications and background processing.

### Added
- Authentication / User Management / Profile Management
- Authorization / Roles Management / Granular Permissions
- Blazor Support
- Cross-Platform Database Support ( MySQL, MSSQL )
- Dynamic CSS/Lazy Loading
- Dynamic Page Compositing Model / Site & Page Management
- Dynamic Routing
- Dynamic Swagger Specs
- EF Core Migrations for Database Installation / Upgrade
- Enabled for Infinity Comex (eCommerce Extension)
- Event Logging / Audit Trail
- Extensibility via Custom Modules
- Extensibility via Custom Themes
- Folder / File Management (Azure Storage, File System)
- graphql API with Voyager, GraphiQl y GraphQl Playground
- Headless API with Swagger Support
- HealthCheck Rules with UI Support
- i18n Enabled (Based on GeoAPI and Custom Settings)
- Improved JavaScript reference support
- In-App CLI (Studio Commander)
- Infinity Comex Support (ABS eCommerce Engine)
- JavaScript Lazy Loading
- Modular Architecture
- Multi-Currency Support
- Multi-Portal ( Monolith & Micro-Service Distributed )
- Multi-Tenant ( Shared Database & Isolated Database )
- Notifications / Email Delivery
- Notifications / SMTP Delivery
- Progressive Web Application Support
- Recycle Bin
- REST API with Swagger Support
- Scheduled Flows ( Background Processing )
- Scheduled Jobs ( Background Processing )
- Seamless Upgrade Experience
- Slack integration (OAuth)
- Support For Additional Authentication Providers (OAuth)