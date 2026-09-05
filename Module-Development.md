# Module development

*Extend the Suite the same way we do.*

Every capability in the Alliance Business Suite ships as a module. Accounting, commerce, logistics, workflows, the whole integrations catalogue. The modules we build use the same contract you get, so there's no privileged internal path and no forked build. Your module is discovered, entitled, routed, and audited exactly like ours.

> **Note:** Deciding *which* modules to turn on rather than building one? Start at [Modules](~/Modules/index.md).

## What a module is

A module is a self-contained package the Suite loads at startup. It brings its own screens and navigation. It can also add APIs, services, background work, and business operations.

You describe it once, giving it a name, a category, an icon, and the address of its main page. The platform handles the rest.

Three ideas shape the model:

- **Self-contained.** Your module owns its surface and never reaches into another module
- **Discovered, not registered.** There's no central list to edit. The platform finds every installed module at startup and wires it in
- **Entitled per tenant.** Installed isn't the same as available. A module reaches a tenant through that tenant's plan, an administrator's grant, or the always-available baseline

## What you can contribute

| Contribution | What it gives you |
|---|---|
| Screens | Pages inside the Studio, under your tenant |
| Navigation | Entries in the catalogue, side menu, and breadcrumbs |
| APIs | HTTP endpoints on the same host and authentication |
| Services | Your own components, resolved by dependency injection |
| Business operations | Governed actions for automation and AI agents |
| Events | Durable facts other parts of the Suite can react to |
| Background work | Scheduled or long-running processes |

Business operations give you the most back, and they're the one most people find last. Declare an operation once and it becomes a step in [Workflows Studio](~/Modules/Workflows.md) and a tool your AI agents can call. You write no workflow code and no AI code.

Events are the second. Your module announces that something happened, and other modules react without your module knowing they exist. Announcing costs nothing if nobody listens, so declare the facts you produce early and let the integrations arrive later.

[Application parts](~/Module-Development/Application-Parts.md) covers each contribution properly.

## Be a good neighbour

Your module shares a process with every other module in the instance. A few habits keep everyone healthy.

- **Pick a distinctive, stable name.** Names identify modules across the catalogue and entitlement. Two modules sharing a name collide, and one drops out of the catalogue without saying anything
- **Keep every page under your own path segment.** Namespace by module, not by feature. Feature names collide across vendors
- **Make registration order-independent and repeatable.** Load order isn't guaranteed and can change between releases. Register so any order works and running twice is harmless
- **Ship your module's own imports.** Imports don't cross package boundaries. A module relying on the host's will produce pages that compile and never render
- **Validate your configuration and log clearly.** A module that fails to register gets skipped, so one bad module can't stop the instance from starting. The trade is that your problem surfaces later, disguised as something else not working

[Application areas](~/Module-Development/Application-Areas.md) has the detail on names, paths, and assets.

## What you get for free

Your module inherits the platform's guarantees instead of rebuilding them:

- **Authentication.** Users arrive signed in, with tenant and permissions resolved
- **Tenant isolation.** Your data is scoped to its tenant
- **Permission enforcement.** Operations are checked before they run, and fail closed when denied
- **Audit.** Actions record the real actor, including non-human ones
- **Automation and AI reach.** Declared operations show up in workflows and agents on their own

Reach for the platform's version rather than your own. Writing a tenant filter or a permission check around a business operation is a signal to stop and look again, because the platform's version is the one that's enforced, audited, and kept correct across releases.

[Application filters](~/Module-Development/Application-Filters.md) shows exactly which parts are yours.

## Next steps

- [Application parts](~/Module-Development/Application-Parts.md) covers everything a module can contribute
- [Application areas](~/Module-Development/Application-Areas.md) covers claiming names, paths, and assets cleanly
- [Application filters](~/Module-Development/Application-Filters.md) covers how requests get authorized and scoped
- [Creating a Module](~/Module-Development/Create-a-Module.md) covers packaging for distribution
- [Installing a Module](~/Module-Development/Installing-a-Module.md) covers getting it into an instance

> **Important:** A module can't grant itself access to a tenant. Entitlement is an administrator's decision, by design.

## A note on hosting

Full module installation applies to self-hosted instances, where you control the deployment. Hosted instances on `absuite.net` offer configuration and theming instead, because an arbitrary module runs in the same process as everything else there. Plan for a self-hosted deployment if you need to run your own modules.
