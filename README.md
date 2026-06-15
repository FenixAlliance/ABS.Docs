![Alliance Business Suite](https://cdn.absuite.net/_content/FenixAlliance.ABS.Assets/images/branding/logo.png "Alliance Business Suite")

<p>
  <a href="https://docs.absuite.net" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/Documentation-docs.absuite.net-brightgreen.svg" />
  </a>
  <a href="https://absuite.net/eula" target="_blank">
    <img alt="License: ABS EULA" src="https://img.shields.io/static/v1?label=License&message=ABS%20EULA&color=blue" />
  </a>
</p>

# Welcome to the Alliance Business Suite

Aiming to help organizations **reach beyond expectations**, the **Alliance Business Suite (ABS)** is a **business development platform** built to augment businesses across industries worldwide.

ABS was conceived not as an application, but as a **platform** — a low-code, modular, multi-tenant foundation that lets any organization jump-start its digitalization and shape the software to *its* business, rather than the other way around. It covers the core processes of a business — accounting, billing, commerce, logistics, CRM, HR, content, and identity — as a suite of **capabilities** you can run, host, extend, and build on.

Everything is extensible by design: you add your own functionality as **modules**, written in C#, without forking the platform. Today ABS runs cross-platform on **.NET 10**, ships as container images and packages, and exposes everything over **REST, GraphQL, gRPC, and MCP** — so you can transact with it from any language, or build entirely new experiences on top of it.

> Power that scales from a single storefront to the operations of a large enterprise.

## What ABS believes

The ideas ABS was founded on have held across every generation of the product:

- **A platform, not an application.** ABS is something you build *with*, not just something you use.
- **Capabilities, not features.** Identity, billing, commerce, workflow and the rest are first-class capabilities you compose into the solution you need.
- **Multi-tenant from the first line of code.** Isolation between tenants is foundational, never bolted on.
- **Extensible through modules.** New functionality is a library you add — distributed as a package, not a fork.
- **Yours to run.** Hosted as ABS Online, self-hosted, in a container, or embedded in your own app — no model is second-class.

## The components

ABS is organized into the same conceptual building blocks it was designed around — evolved, but intact, across successive generations:

- **[Alliance Core Libraries (ACL)](/Components/Alliance-Core-Libraries.md)** — the **shared kernel**: the common language and stable foundations — abstractions, contracts, and standards — that everything else builds on.
- **[Alliance Business Model (ABM)](/Components/Alliance-Business-Model.md)** — the **canonical, declarative model** of standard business entities (Accounts, Business Units, Contacts, Leads, Opportunities, Items, and more): multi-tenant by design, and extensible by anyone to capture business-specific scenarios.
- **[Alliance Passport Service (APS)](/Components/Alliance-Passport-Service.md)** — originally introduced as the identity engine of ABS; today it powers authentication, authorization, federated sign-in, MFA, and identity lifecycle for every contact — customer, employee, partner, or guest — alongside data protection, HTTPS enforcement, secrets, CSRF/XSRF, and CORS.
- **[Alliance Business Platform (ABP)](/Components/Alliance-Business-Platform.md)** — the multi-protocol API surface (REST, GraphQL, gRPC, MCP, and SignalR) for transacting with the model from any client, in any language.
- **[Alliance Business Studio](/Components/Alliance-Business-Studio.md)** — the graphical administration experience and application core, where you manage your implementation, transact data, generate views and reports, and customize and extend the system.

See **[Advanced](/Advanced.md)** for the dependency tree and design overview.

## How you build on ABS

You extend ABS in C# by writing **modules** — self-contained feature libraries (Blazor components, pages, APIs, background work) that the platform loads into any instance. Build on next-generation .NET (Blazor, SignalR, Razor, MVC), with or without JavaScript, and reach the platform's data and services through the ABP APIs.

Start with **[Getting Started](/Getting-started.md)**, the **[Fundamentals](/Fundamentals.md)**, and **[Module Development](/Module-Development.md)**.

## Running ABS

ABS meets you where you are — one product, several **distribution models**, none of them second-class:

- **ABS Online** — the fully-hosted suite (Fenix Alliance runs its own public portals on it).
- **Self-hosted** — run it on your own infrastructure.
- **Docker** — pull the published container images and run anywhere.
- **As a dependency** — bring the suite into your own ASP.NET app with a single registration.

### Quick start (Docker)

```powershell
docker pull fenixalliance/absuite-platform:latest
docker run -p 8080:8080 fenixalliance/absuite-platform:latest
```

Open the provided URL and complete the installation wizard. See **[Hosting](/Fundamentals/Hosting.md)** for production options.

### Quick start (as a dependency, .NET 10)

Add the ABS SDK packages, then register and use the suite in your app's startup:

```csharp
var builder = WebApplication.CreateBuilder(args);

builder.Services.AddAllianceBusinessSuite(builder.Configuration, builder.Environment);

var app = builder.Build();

app.UseAllianceBusinessSuite(builder.Configuration, builder.Environment);

app.Run();
```

The exact packages and current versions are listed in the **[SDK reference](/Components/Alliance-Business-Platform/SDKs.md)**.

## Versioning

Backward and forward compatibility is a core goal. ABS uses **additive versioning**: past the 2.0 release, no revision of the model will

- introduce a new mandatory attribute on a published entity, or make an optional attribute mandatory,
- rename a published attribute or entity, or
- remove a published attribute.

Your integrations keep working as the platform grows.

## Low-code & extensibility

Beyond modules, ABS includes a low-code surface so you can do a lot with little or no code:

- a **Web Designer** to add and style pages, products, and posts;
- an in-Studio **command terminal** that runs commands against the platform APIs;
- an **Office-for-the-web (WOPI)** connector to create, view, and edit documents in place;
- conversational and AI building blocks for assistants and automated flows.

## Licensing & contributions

Your access to and use of the ABS source and binaries is governed by the **[Alliance Business Systems EULA](https://absuite.net/eula)**. Documentation in this repository is licensed under **[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/legalcode)**. Contributions are welcome under the terms of the EULA — see **[Contributing](/Contributing.md)** and the **[Code of Conduct](/CODE_OF_CONDUCT.md)**.

## Trademarks

"Alliance Business Suite", "Infinity Comex", and the related logos are trademarks of **Alliance Business Systems** (S.A.S. in Colombia; Inc. elsewhere). These licenses do not grant rights to use Alliance Business Systems' names, logos, or trademarks; see the trademark guidelines at https://docs.fenix-alliance.com.

## Author

**Alliance Business Systems Inc.** — [fenix-alliance.com](https://fenix-alliance.com) · [LinkedIn](https://www.linkedin.com/company/FenixAlliance/)

---

*Privacy: https://fenix-alliance.com/legal/policies/privacypolicy · Alliance Business Systems and contributors reserve all other rights under their respective copyrights, patents, and trademarks.*
