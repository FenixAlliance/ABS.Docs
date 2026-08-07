# How this documentation is kept current

Documentation that lags the product is worse than no documentation, because it teaches something that is no longer true. This page explains the commitment we hold ourselves to, so you know what these pages are and how much to trust them.

## The commitment

**A capability is not considered shipped until it is documented here.**

Documentation is not a task that follows a release. It is one of the conditions a release has to satisfy before it counts as finished, alongside the code being built, tested and verified. If a change is something you can observe — in the interface, in an API, in how a process behaves — then the page describing it is updated in the same pass that ships it.

Where a change is genuinely invisible to you, an internal refactor with no effect on behaviour, nothing appears here. That is deliberate, not an omission.

## We write for two audiences, and you are probably one of them

The same capability reads very differently depending on how you meet it. We treat both readings as first-class, and a change that affects both is not finished until both are written.

### If you build on the platform

You are integrating, extending or automating: the SDKs, the REST and GraphQL APIs, the MCP surface, or your own modules written in C#.

You need contracts, not prose. So for you we keep current:

- **API and SDK reference** — signatures, shapes and versions.
- **Module and extension guides** — the seams you build against.
- **[Platform and development](~/Capabilities/Platform-and-Development.md)** — how the pieces compose.
- **Breaking-change notes**, called out explicitly in the [changelog](~/reference/Changelog.md).

### If you run your business on the platform

You are working in Studio, in Client.Next, on Pocket, or another interface. You are not writing code, and you should not need to read any to understand what changed.

You need to know what something does in business terms and where to find it. So for you we keep current:

- **Module pages** — what each module manages, in the language of the work it supports.
- **[Capability pages](~/Capabilities/index.md)** — what the platform does, grouped the way a business thinks about it.
- **Get-started and how-to content** — the path through a task.
- **Changelog entries** written plainly, describing what you can now do that you could not do before.

If you ever find a change explained only in developer terms, that is a defect in our documentation, not a gap in your knowledge. The same is true in reverse.

## What this means when you read these pages

- **The [changelog](~/reference/Changelog.md) is the front door to the evolution.** Read it first when you return after a while. It is written for people, not for engineers reviewing their own work.
- **Documentation is written after a capability is real**, never in anticipation of it. If a page describes something, that thing exists. Work that is planned but not yet built lives on the [roadmap](~/get-started/Roadmap.md), clearly marked as such.
- **Coverage is still expanding.** The platform is large and some module pages are further along than others. The commitment above governs everything from here forward; older corners are being brought up to the same standard as we work through them.

## Telling us where we fall short

If a page is wrong, stale, or written for the wrong audience, that is worth reporting the same way you would report a defect in the product. See [contributing](~/reference/Contributing.md).
