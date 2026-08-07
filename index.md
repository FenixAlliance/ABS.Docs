# Alliance Business Suite documentation

*Reach beyond expectations — build, run, and extend your whole operation on one shared business platform.*

The **Alliance Business Suite (ABS)** is a low-code, modular, multi-tenant platform for running a business. It covers the core processes every organization depends on — accounting, billing, commerce, logistics, CRM, workforce, content, and identity — as a suite of **capabilities** you can run, host, extend, and build on.

ABS was conceived as a **platform, not an application** — something you build *with*, not just something you use. It runs cross-platform on **.NET 10**, ships as container images and packages, and exposes everything over **REST, GraphQL, and MCP**, so you can work with it from any language or build entirely new experiences on top of it.

> Power that scales from a single storefront to the operations of a large enterprise.

## Start here

- **[The platform](~/get-started/The-Platform.md)** — what ABS is, and how it's put together.
- **[Getting started](~/get-started/Getting-started.md)** — install and run your first instance.
- **[Capabilities](~/Capabilities/index.md)** — the business capabilities the platform provides, from identity to finance to commerce.
- **[Modules](~/Modules/index.md)** — the features you turn on: accounting, CRM, commerce, logistics, workflows, and more.
- **[Web API development](~/get-started/Web-API-Development.md)** — build on the platform's REST, GraphQL, and MCP APIs.

## What ABS believes

A few ideas have held across every generation of the product:

- **A platform, not an application.** ABS is something you build with, not just something you use.
- **Capabilities, not features.** Identity, billing, commerce, workflow, and the rest are first-class capabilities you compose into the solution you need.
- **Multi-tenant from the first line of code.** Isolation between tenants is foundational, never bolted on.
- **Extensible through modules.** New functionality is a library you add — distributed as a package, not a fork.
- **Yours to run.** Hosted as ABS Online, self-hosted, in a container, or embedded in your own app — no model is second-class.

## How you build on ABS

You extend ABS in C# by writing **modules** — self-contained feature libraries (Blazor pages and components, APIs, background work) that the platform loads into any instance, without forking. Reach the platform's data and services through the ABP APIs, and use the published SDK packages to build on it from your own app.

Start with the **[Fundamentals](~/get-started/Fundamentals.md)**, then **[Module development](~/get-started/Module-Development.md)** and **[Web API development](~/get-started/Web-API-Development.md)**.

## Run it your way

ABS meets you where you are — one product, several distribution models, none of them second-class:

- **ABS Online** — the fully-hosted suite.
- **Self-hosted** — run it on your own infrastructure.
- **Docker** — pull the published container images and run anywhere.
- **As a dependency** — bring the suite into your own ASP.NET app with a single registration.

```powershell
docker pull fenixalliance/absuite-platform:latest
docker run -p 8080:8080 fenixalliance/absuite-platform:latest
```

See **[Getting started](~/get-started/Getting-started.md)** to install, and the **[Fundamentals](~/get-started/Fundamentals.md)** for hosting and production options.
