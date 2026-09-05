# Application areas

*Claim your own space so your module coexists cleanly.*

Every module in an instance shares one application, one address space, and one navigation tree. Your **area** is the space your module claims in them.

## Claim one path segment

Pick a single path segment named for your module, and keep every page underneath it. Tenant-facing pages follow the shape the Studio uses throughout:

```text
/Studio/Tenants/{tenant}/Modules/YourModule
/Studio/Tenants/{tenant}/Modules/YourModule/Things
/Studio/Tenants/{tenant}/Modules/YourModule/Things/Details
```

Integrations use the same shape with `Integrations` in place of `Modules`. Both carry the tenant in the address, which is what makes a page unambiguous about whose data it's showing.

The tenant part is supplied for you. Your module declares its landing address as a template with a placeholder, and the platform fills in the current tenant when it renders a link. You never build tenant URLs by hand.

## Namespace by module, not by feature

Two modules claiming the same address break navigation for that part of the Studio.

The rule is short: claim addresses that carry your module's name.

- Reach for `/Studio/Tenants/{tenant}/Modules/ContosoReports`
- Leave general addresses like `/Studio/Developer`, `/Studio/Settings`, or `/Studio/Reports` alone

Feature names collide across vendors. Module names don't. Stay inside your own segment even where the catalogue looks empty today, because the next platform release may fill it.

> **Important:** There's no per-module address sandbox that makes a collision harmless. Namespacing is the mechanism.

## Choose a distinctive name

Your module's display name identifies it across the catalogue, the switcher, and entitlement. Two modules sharing a name collide, and one stops appearing.

- Pick something distinctive and keep it stable. Names take part in entitlement matching, so renaming can change which tenants see your module
- Avoid names that are prefixes of other names. `Contoso` and `ContosoReports` sit close enough to be matched against each other

## Keep a module in one package

Keep your module's pages in your module's own package.

Split across a main package and a companion, such as a designer or a shared component library, and one package gets selected when your module's content is resolved. Pages in the sibling become unreachable.

Need several packages? Make each a module in its own right, with its own name and its own path segment.

## Ship assets under your own address

Your files are served from a per-module address derived from your package name, so two modules can both ship `icon.png` safely. Reference your own assets through that address.

> **Note:** Asset addresses are case-sensitive in production, even where a Windows development machine is forgiving. An asset that works locally and 404s in production is almost always a case mismatch.

## Stay consistent about capitalisation

Address matching is case-insensitive, so a link to `/integrations/contoso` reaches a page declared at `/Integrations/Contoso`. It works. The two forms still disagree wherever they get compared as text.

Match the capitalisation the rest of the Studio uses, and keep your page declarations and your module description identical.

## Before you ship

- One path segment, named for your module, holding every page
- Module description and page address agree exactly
- Display name is distinctive, stable, and not a prefix of another module's
- Pages and assets live in one package
- Asset references match the case on disk

## Related

- [Application parts](~/Module-Development/Application-Parts.md) covers what you can contribute
- [Application filters](~/Module-Development/Application-Filters.md) covers how requests get authorized and scoped
