# Capabilities

ABS is organized around **business capabilities** — the things your organization actually needs to do, and what you actually adopt. You don't buy a list of screens; you turn on the capabilities you need, and they work together because they share one business model, one identity, and one security model.

Three ideas keep the whole platform coherent:

- **Capabilities** are *what the platform does* — identity, finance, commerce, operations, and the rest.
- **[Modules](~/Modules/index.md)** are *how capabilities are delivered* — self-contained feature packages you enable per tenant. One capability may be delivered by several modules; a module always serves a capability.
- **Platform foundations** are *why it all coheres* — the shared kernel, business language, trust, integration, and operations layers beneath everything. You don't adopt these directly.

## The eight capability families

| Capability | What it covers |
|---|---|
| **[Identity & Access](~/Capabilities/Identity-and-Access.md)** | Authentication, authorization, federation, SSO, RBAC |
| **[Trust & Compliance](~/Capabilities/Trust-and-Compliance.md)** | E-signatures, certificates, trust evidence, non-repudiation, ESG |
| **[Finance](~/Capabilities/Finance.md)** | Accounting, billing, fiscalization, tax, subscriptions, licensing |
| **[Commerce](~/Capabilities/Commerce.md)** | Catalogs, pricing, orders, carts, point of sale, online stores |
| **[Operations](~/Capabilities/Operations.md)** | Logistics, inventory, manufacturing, procurement, projects, quality, assets, workflow |
| **[Workforce](~/Capabilities/Workforce.md)** | HR and payroll, learning, shared workspaces, collaboration |
| **[Customer Experience](~/Capabilities/Customer-Experience.md)** | CRM, support, marketing, social, chat, content portals |
| **[Intelligence](~/Capabilities/Intelligence.md)** | Analytics, reporting, AI assistants, bots, decision support |
| **[Platform & Development](~/Capabilities/Platform-and-Development.md)** | Modules, SDKs, APIs, integrations, automation, developer tools |

## How capabilities become your solution

- **Solutions** package capabilities for an industry or use case — a retail solution, a professional-services solution, a healthcare solution.
- **[Modules](~/Modules/index.md)** implement capabilities. You enable the modules your plan entitles you to, and their screens, menus, and APIs light up in the Studio for your tenant.
- **You extend** any capability with your own modules, in C#, without forking the platform. See **[Module development](~/get-started/Module-Development.md)**.

## Platform foundations

The capabilities coexist because they rest on five enduring **platform foundations**. These are the substrate — not something you adopt, but the reason everything works as one product:

- **[Alliance Core Libraries (ACL)](~/Capabilities/Alliance-Core-Libraries.md)** — the shared kernel: the common abstractions, contracts, and standards everything builds on.
- **[Alliance Business Model (ABM)](~/Capabilities/Alliance-Business-Model.md)** — the canonical business language: the shared model of entities that lets every capability coexist.
- **[Alliance Passport Service (APS)](~/Capabilities/Alliance-Passport-Service.md)** — trust: identity, authorization, federation, security, and governance.
- **[Alliance Business Platform (ABP)](~/Capabilities/Alliance-Business-Platform.md)** — integration: the REST, GraphQL, gRPC, MCP, and SignalR surface for every client.
- **[Alliance Business Studio](~/Capabilities/Alliance-Business-Studio.md)** — operations: the cockpit where you run, shape, and extend your implementation.

The mobile experience lives in **[Alliance Business Pocket](~/Capabilities/Alliance-Business-Pocket.md)**. For the full story, see **[The platform](~/get-started/The-Platform.md)**.
