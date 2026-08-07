# Understanding the Alliance Core Libraries

> **Status: retired.** The Alliance Core Libraries are a historical component. This page is kept so existing links keep working, and to explain what replaced them.

## What ACL used to be

ACL was the platform's shared kernel: the core abstractions and default implementations that the Alliance Business Model and dependent components built on. It was also the single external dependency source for the whole suite. A base package, `FenixAlliance.ACL.Deps`, referenced every third-party dependency, and .NET's transitive dependency resolution made those available to everything downstream.

## What is true today

That arrangement no longer exists.

- There is no `FenixAlliance.ACL.Deps` project or package reference anywhere in the platform.
- `FenixAlliance.ACL.i18n` is the only ACL project that remains, and no project references it.
- Third-party dependencies are managed centrally through `Directory.Packages.props`, not through a base package.

If you are reading older documentation that describes `ACL.Deps` as the Core Package, that documentation is out of date.

## What replaced it

The shared kernel role is now split in two:

| Concern | Where it lives now |
|---|---|
| Seedwork: base entities, value objects, `Result<T, SmartError>`, specifications, `IUnitOfWork` | **`FenixAlliance.ABS.Sernel`** |
| Shared contracts: models, requests, responses, capabilities | **`FenixAlliance.ABS.Domain.SDK`** and **`FenixAlliance.ABS.Application.SDK`** |
| Third-party dependency versions | **`Directory.Packages.props`** (central package management) |
| Localization | **`FenixAlliance.ACL.i18n`** (the one surviving ACL project) |

For the architecture these sit inside, see [Platform and Development](~/Capabilities/Platform-and-Development.md).
