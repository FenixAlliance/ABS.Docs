# The Platform

## Why ABS exists

The Alliance Business Suite exists to help organizations **reach beyond expectations** — by giving them a business platform they can shape to their own reality.

Most software forces the business to adapt to the software. ABS was built on the opposite belief:

> **Businesses should not adapt to software. Software should adapt to the business.**

That single idea explains everything else about ABS — why it is modular, why it is multi-tenant, why you extend it with your own modules, why you can host it yourself or let us host it, and why it speaks open standards.

## What ABS is

**ABS is a modular business development platform** that provides the capabilities organizations need to **build, run, extend, and evolve** their operations.

It is not an ERP, a CRM, an accounting package, or a CMS. Those are *capabilities* — and ABS provides them — but ABS itself is the **platform** beneath them, where they share one identity model, one business model, one security model, and one way of being extended.

## What ABS believes

A handful of principles have held across every generation of the product. They are the reason the pieces fit together:

- **A platform, not an application.** ABS is something you build *with*, not just something you use.
- **Capabilities, not features.** You buy outcomes — identity, finance, commerce, operations — not a list of screens.
- **Multi-tenant by design.** Isolation between tenants is foundational, never retrofitted.
- **Extensibility through modules.** Customize and extend without ever forking the platform.
- **Yours to run.** Hosted, self-hosted, hybrid, or embedded in your own app — every model is first-class.
- **Open through standards.** REST, GraphQL, gRPC, OAuth/OIDC, UBL, PEPPOL, MCP — ABS joins ecosystems rather than building silos.

## The capabilities

ABS is organized around **business capabilities** — the things your organization actually needs to do, and what you actually adopt:

| | |
|---|---|
| **Identity & Trust** | authentication, authorization, federation, SSO, governance |
| **Commerce** | catalogs, pricing, orders, payments, marketplace |
| **Finance** | accounting, billing, fiscalization, tax, treasury |
| **Operations** | projects, assets, logistics, workflow, automation |
| **Workforce** | HR, learning, certifications, collaboration |
| **Customer Experience** | CRM, support, marketing, communications |
| **Intelligence** | analytics, reporting, AI, knowledge, decision support |
| **Platform & Development** | modules, SDKs, APIs, integrations, dev tools, marketplace |

These capabilities coexist because they all speak the same canonical business language. **Solutions** package them for an industry or use-case; **modules** implement them. See **[Components](/Components.md)**.

## Platform foundations

Those capabilities aren't loosely-coupled apps — they cohere because they rest on five **platform foundations**: enduring concepts that have held through every generation, even as their implementation matured. You don't adopt these directly; they're *why the platform works as one*:

- **The Shared Kernel** — the platform's common language and stable foundations: the abstractions, contracts, and standards every part depends on. *([Alliance Core Libraries / ACL](/Components/Alliance-Core-Libraries.md).)*
- **The Business Language** — the canonical, shared model of business entities that lets every capability coexist. *([Alliance Business Model / ABM](/Components/Alliance-Business-Model.md).)*
- **Trust** — identity, permissions, authorization, federation, security, and governance. *([Alliance Passport Service / APS](/Components/Alliance-Passport-Service.md).)*
- **Integration** — connectivity over REST, GraphQL, gRPC, MCP, SignalR, events, and SDKs. *([Alliance Business Platform / ABP](/Components/Alliance-Business-Platform.md).)*
- **Operations** — the cockpit where organizations shape ABS to fit their reality. *([Alliance Business Studio](/Components/Alliance-Business-Studio.md).)*

## Built to be yours

ABS is one product with several **distribution models**, none of them second-class — hosted as **ABS Online**, **self-hosted**, run from a **container**, or **embedded** in your own application. You extend it with **modules** (in C#, no forks), and it stays **open through standards** so it fits the systems you already run. See **[Module Development](/Module-Development.md)**, **[Hosting](/Fundamentals/Hosting.md)**, and **[Integrations](/Integrations.md)**.

## How ABS has evolved

ABS got here intentionally:

- **2020 — Foundation.** Shipped as a platform from day one: multi-tenant, multi-portal, modular, extensible.
- **2022 — Platform Era.** The Studio, licensing, identity, and business-management foundations (v2.0).
- **2023–2025 — Platformization.** Clean architecture, separated services, SDKs, and a full API surface.
- **2026 and beyond — The Composable Enterprise Platform.** Open standards, AI, MCP, global fiscalization, and a capability-first architecture.

See the full **[Changelog](/Changelog.md)**.

## Where to go next

- **[Getting Started](/Getting-started.md)** — install and run your first instance.
- **[Components](/Components.md)** — a closer look at each pillar.
- **[Module Development](/Module-Development.md)** — build on the platform.
