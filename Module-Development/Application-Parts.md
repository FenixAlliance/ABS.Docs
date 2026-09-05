# Application parts

*Everything your module can contribute, and how each piece is found.*

A module contributes **parts**. The platform assembles the parts from every installed module into one running application.

One rule holds throughout: declare what you have, and the platform discovers it. There's no central list to edit.

## Screens

Pages your module adds to the Studio, inside the standard tenant shell. Header, side menu, breadcrumbs, and command bar come with it.

- Declare each page's address under your own path segment. See [application areas](~/Module-Development/Application-Areas.md)
- Skip the layout. Pages get the Studio layout automatically, and overriding it is what makes a module look bolted on
- Include your module's own imports, because imports don't cross package boundaries

> **Note:** Pages are only reachable for tenants entitled to your module. Develop against a tenant without a grant and your pages return "not found" with nothing to explain why. Check entitlement first when a page seems to vanish.

## Navigation

Your module's description supplies the display name, category, and icon used by the catalogue, the switcher, and the side menu. It also carries the address of your landing page, which is what people actually click.

Keep that address and your page's declared address identical. They're separate declarations, so drift gives you a page that works perfectly and a catalogue entry pointing somewhere else.

## APIs

Your module can serve HTTP endpoints on the same host and authentication as the rest of the API. They're discovered automatically.

> **Important:** Module entitlement does not gate your API. Entitlement controls the Studio catalogue and which screens are routable. It is not an authorization layer over HTTP endpoints, and your module's endpoints are served whether or not the calling tenant is entitled to your module.

Protect any endpoint that needs restricting with a permission check inside the endpoint. Entitlement answers which product a customer bought. Permissions answer what this person can do. Different questions, enforced in different places.

Adopt the platform's endpoint conventions where you can. Endpoints using the standard base class inherit response shaping, error handling, and tenant resolution.

## Services

Register your components during your module's startup hook, then inject them anywhere in your module.

Load order isn't guaranteed, so register in a way that survives any order and tolerates running twice. Prefer conditional registration that leaves an existing implementation alone.

Anything needing a fully built application belongs in your module's later configuration hook instead. Registering a handler with a component that only exists once startup finishes is the usual case. Guard it, so your module carries on quietly when the feature it depends on is switched off in an instance.

## Business operations

Declare an operation once and it appears wherever governed operations are offered. As a step in [Workflows Studio](~/Modules/Workflows.md). As a tool an AI agent can call. You write no workflow code and no AI code.

Declare five things:

- **A stable name.** It identifies the operation permanently, inside workflows customers have already built. Renaming your internal code must never change it
- **The permission it requires.** Enforced at run time, on every call, from every surface
- **What it does to state.** Reads, writes, deletes, or performs an action
- **What makes it sensitive.** Personal data, money, legal weight, destructive, irreversible, or reaching outside the platform. This is independent of what it does, so a read of regulated data is still regulated
- **Where it may appear.** Automation, AI, or neither

Lean on that last one. Nothing is exposed by default. Declaring an operation and exposing it are separate decisions, so your module can add fifty internal operations and offer three. No future release will quietly widen that.

> **Important:** Operations that change something outside the platform need a way to guarantee a retry can't fire the same effect twice. Without that guarantee the operation won't run automatically, and approval doesn't override it. Design for safe retry from the start if your operation charges a card or dispatches goods.

## Events

Announce that something happened. An order placed, a document signed, a threshold crossed. Events are how modules cooperate without knowing about each other.

You get three guarantees:

- **Durable and transactional.** The event is recorded in the same transaction as the change that caused it, so there's no window where your data changed but the announcement vanished
- **A stable contract.** An event carries a published name and version independent of your internal code, so renaming a class never breaks a consumer
- **An explicit payload.** You declare what it carries. Identity and security context stay with the platform rather than being published in your payload

Starting a workflow is the reaction available today, so customers can automate against your event with no further work from you. More reaction surfaces are being built. Build on what's live now.

## Background work

Add scheduled or long-running work that starts with the host, such as polling or reconciliation.

- **Use a proper non-human identity.** The platform provides one. Never borrow a user's identity or cache it for later
- **Expect every instance to run it.** In a multi-instance deployment your process starts in each one. Coordinate through durable shared state when the work should happen once overall

## Static assets

Ship icons, images, stylesheets, and scripts from a per-module address derived from your package name. Two modules can both ship `icon.png` safely.

> **Note:** Asset addresses are case-sensitive in production, even where a Windows development machine is forgiving. Match the case on disk exactly.

## What the platform keeps

Three things stay with the platform:

- **Layout and chrome.** Your pages render inside the Studio shell
- **Authentication.** Users arrive signed in
- **Entitlement.** A module can't make itself available to a tenant

## Related

- [Application areas](~/Module-Development/Application-Areas.md) covers claiming names, paths, and assets
- [Application filters](~/Module-Development/Application-Filters.md) covers how requests get authorized and scoped
