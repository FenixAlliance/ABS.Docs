# Understanding the Alliance Business Suite dependency tree

> 🏛️ **Archaeology — Status: Evolved.** *~2021, audited 2026.*
> The *principle* — strict layering, components usable as app-or-library, override-via-abstraction — still holds. But the **tiers evolved into Clean Architecture**: **ABM → ABS.Domain**, **ABP → ABS.Infrastructure**, business logic centralized in the new **ABS.Application** (CQRS use cases), and DB providers became **implementation details behind repository interfaces**. This page describes the *original* dependency tree, not the current one.
> Full finding: **Architecture Archaeology Register** (Developer Handbook → `Strategy/Archaeology`).

The Alliance Business Suite is designed as a set of Application Layers dependant upon their service predecessor. Each Layer constitutes a [Component](~/Capabilities/index.md) for the Alliance Business Suite. 

Components can be provisioned as Standalone Applications or used as stand-alone libraries. This means that it is possible to bring the Alliance Business Platform (`FenixAlliance.ABP.*`) into a new/existing application without having to include any dependency from the Alliance Business Studio (`FenixAlliance.ABS.*`). The same is true for the Alliance Business Model (`FenixAlliance.ABM.*`), which can be included without any reference to the Alliance Business Platform namespace (`FenixAlliance.ABP.*`).

Components rely on their Service Predecessor through abstractions, allowing customers to override almost every functionality through custom implementations.

![DependencyTree.1.2.0.jpg](~/.attachments/DependencyTree.1.2.0-3235684e-1b84-410b-8cae-f6b01f809c4e.jpg)

Note: Because other services on the Alliance Business Suite instance might rely on default implementations performing some work, it is imperative for customers who bring their own implementations to make sure their implementations stay compliant with each specification.

## Understanding external dependencies

External dependencies required by the Alliance Business Suite are managed centrally through `Directory.Packages.props`, which pins one version of every third-party package for the whole platform. Components receive them through normal transitive dependency resolution.

Older documentation describes these dependencies as being bounded to the Alliance Core Libraries component and surfaced through a `FenixAlliance.ACL.Deps` base package. That is no longer accurate: ACL has been retired, and no `ACL.Deps` package exists. See [Alliance Core Libraries](~/Capabilities/Alliance-Core-Libraries.md) for what replaced it.




