# Workflows Studio

*Automate the work — model any business process as a governed, visual workflow that runs itself, safely.*

Workflows Studio is the Suite's visual automation engine. You draw a process once on a drag-and-drop canvas, and it runs inside your Alliance Business Suite — on the same business model, identity, and security as the rest of your data. Every step is a real, governed Suite operation; every run is permission-checked, tenant-scoped, and audited. There is no separate automation server to license or operate, and no scripting language to learn.

## What you can do

- **Design visually.** Build a workflow by dragging nodes onto a canvas and wiring them together, and configure each step right on the node — no code, and no forms buried in side panels.
- **Compose real capabilities.** Each action node runs a genuine governed Suite operation — read a tenant wallet, fetch an invoice, look up a contact, place an order — chosen from a curated catalog. A node can never do more than the identity running the workflow is allowed to do.
- **Add logic and control.** Branch on conditions, run branches in parallel and join them back together, loop over a collection or while a condition holds, and catch failures with bounded retries — all configured visually.
- **Flow data between steps.** Connect one step's output to a later step's input by drawing it on the canvas. A guided binder does the mapping and validates it before you publish — there are no expressions to hand-write.
- **Test before you ship.** Run a draft and watch each node light up live — running, succeeded, failed, or skipped — with the values every step produced, so you can see exactly what a workflow does before it goes live.
- **Track every run.** The Executions view lists each run with its status, when it started, who or what started it, and the detail behind any fault.
- **Run unattended.** Publish a workflow and let it run with no person in the loop — under a dedicated, least-privilege application identity, never a borrowed user account — so background automation stays governed and fully audited.
- **Version safely.** A published workflow is immutable; editing it opens a new draft version, so a running process never changes underneath you.

## Governed by design

Workflows Studio is part of the Suite, not a bolt-on, so it inherits the platform's governance end to end:

- **Every step is permission-checked.** A workflow acts with the permissions of the identity that runs it, and each capability re-checks its own permission at run time. A step the runner isn't allowed to perform **fails closed** — it is never silently skipped or quietly escalated.
- **Tenant-scoped throughout.** A workflow only ever sees and touches its own tenant's data.
- **Structured logic, not scripting.** Conditions, loops, and data mapping are safe, validated configuration — not an embedded scripting language. That keeps workflows portable, reviewable, and free of the security and maintenance burden of hand-written code.
- **Audited end to end.** Every run records the real actor — including automated runs, which record the application identity and, when a person set them in motion, on whose behalf.
- **Automation has its own identity.** Unattended workflows run as a governed application principal with its own least-privilege permissions — so a background process is fully accountable and never impersonates a person.

## Where it fits

Workflows Studio delivers the **automation** thread of the [Operations](~/Capabilities/Operations.md) and [Platform & Development](~/Capabilities/Platform-and-Development.md) capabilities, and runs on the [Alliance Business Platform](~/Capabilities/Alliance-Business-Platform.md). The operations you compose into a workflow are contributed by the other capabilities you've enabled — [Finance](~/Capabilities/Finance.md), [Commerce](~/Capabilities/Commerce.md), [Intelligence](~/Capabilities/Intelligence.md), and more — so a workflow is simply your business, wired together and set to run.
