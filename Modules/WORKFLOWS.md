# Workflows Studio

*Automate the work — model a business process as a governed, visual workflow that runs inside your Suite, safely.*

Workflows Studio is the Suite's visual automation engine. You draw a process on a drag-and-drop canvas, and it runs inside your Alliance Business Suite — on the same business model, identity, and security as the rest of your data. Every step is a real, governed Suite operation; every run is permission-checked, tenant-scoped, and audited. There is no separate automation server to license or operate, and no scripting language to learn.

## What you can do today

- **Design visually.** Build a workflow by dragging nodes onto a canvas and wiring them together, and configure each step right on the node — no code, and no forms buried in side panels.
- **Compose real capabilities.** Each action node runs a genuine governed Suite operation — read a tenant wallet, fetch an invoice, look up a contact — chosen from a curated catalog. A node can never do more than the identity running the workflow is allowed to do.
- **Ask an AI agent.** Add an AI agent as a step — pose a question or hand it a task, let it run to an answer, and use the result in the steps that follow. The agent runs as a governed capability under the same identity as the rest of the workflow, is permission-checked like any other step, and leaves the same auditable record — so intelligence becomes just another building block in your process, not a separate system to trust.
- **Add logic and control.** Branch on conditions, run branches in parallel and join them back together, loop over a collection or while a condition holds, and catch failures with bounded retries — all configured visually.
- **Flow data between steps.** Connect one step's output to a later step's input by drawing it on the canvas. A guided binder does the mapping and validates it before you publish — there are no expressions to hand-write.
- **Test before you ship.** Run a draft and watch each node light up live — running, succeeded, failed, or skipped — with the values every step produced, so you can see exactly what a workflow does before it goes live.
- **Track every run.** The Executions view lists each run with its status, when it started, and the detail behind any fault.
- **Version safely.** A published workflow is not edited in place — editing one opens a new draft version, so a workflow already in use never changes underneath you.

## Coming next: durable, long-running automation

Today the engine runs a workflow start-to-finish in a single pass. The next milestone adds **durable** execution — processes that can wait, pause for people, and react to events, and that survive a service restart:

- **Delays and schedules** — pause a step for a set time or until a scheduled moment, then continue on its own.
- **Human approvals** — route a step to a person for sign-off, with assignment, expiry, and a recorded decision.
- **Event-driven start and resume** — start or continue a workflow when a business event happens elsewhere in the Suite.
- **Restart-safe long-running processes** — a suspended workflow is persisted and resumes correctly even across a service restart.
- **Unattended background runs** — run a published workflow with no person in the loop, under a dedicated least-privilege application identity (never a borrowed user account), fully audited.

## Governed by design

Workflows Studio is part of the Suite, not a bolt-on, so it inherits the platform's governance:

- **Every step is permission-checked.** A workflow acts with the permissions of the identity that runs it, and each capability re-checks its own permission at run time. A step the runner isn't allowed to perform **fails closed** — it is never silently skipped or quietly escalated.
- **Tenant-scoped throughout.** A workflow only ever sees and touches its own tenant's data.
- **Structured logic, not scripting.** Conditions, loops, and data mapping are safe, validated configuration — not an embedded scripting language. That keeps workflows portable, reviewable, and free of the security and maintenance burden of hand-written code.
- **Audited end to end.** Every run records the real actor behind it.

## Where it fits

Workflows Studio delivers the **automation** thread of the [Operations](~/Capabilities/Operations.md) and [Platform & Development](~/Capabilities/Platform-and-Development.md) capabilities, and runs on the [Alliance Business Platform](~/Capabilities/Alliance-Business-Platform.md). The operations you compose into a workflow are contributed by the other capabilities you've enabled — [Finance](~/Capabilities/Finance.md), [Commerce](~/Capabilities/Commerce.md), [Intelligence](~/Capabilities/Intelligence.md), and more — so a workflow is simply your business, wired together and set to run.
