# Workflows Studio

*Automate the work — model a business process as a governed, visual workflow that runs inside your Suite, safely.*

Workflows Studio is the Suite's visual automation engine. You draw a process on a drag-and-drop canvas, and it runs inside your Alliance Business Suite — on the same business model, identity, and security as the rest of your data. Every step is a real, governed Suite operation; every run is permission-checked, tenant-scoped, and audited. There is no separate automation server to license or operate, and no scripting language to learn.

## What you can do today

- **Design visually.** Build a workflow by dragging nodes onto a canvas and wiring them together, and configure each step right on the node — no code, and no forms buried in side panels.
- **Compose real capabilities.** Each action node runs a genuine governed Suite operation — read a tenant wallet, fetch an invoice, look up a contact — chosen from a curated catalog. A node can never do more than the identity running the workflow is allowed to do.
- **Ask an AI agent.** Add an AI agent as a step — pose a question or hand it a task, let it run to an answer, and use the result in the steps that follow. The agent runs as a governed capability under the same identity as the rest of the workflow, is permission-checked like any other step, and leaves the same auditable record — so intelligence becomes just another building block in your process, not a separate system to trust.
- **Add logic and control.** Branch on conditions, run branches in parallel and join them back together, loop over a collection or while a condition holds, and catch failures with bounded retries — all configured visually.
- **Flow data between steps.** Connect one step's output to a later step's input by drawing it on the canvas. A guided binder does the mapping and validates it before you publish — there are no expressions to hand-write.
- **Assign work to a person.** Add a user task step that hands work to a specific person or to a role. The workflow pauses, the task appears in that person's Tasks inbox, and the run continues on its own when they mark it complete. A cancelled or expired task takes the step's negative path instead of continuing as done.
- **Compose smaller workflows.** Call another published workflow as a single step. You choose the child workflow and pin the exact version it runs, so a parent process never silently picks up a new revision of a workflow it depends on. A child can run start to finish in one pass, and it can also pause partway, for a person, a task, or a timer. When a child pauses, the calling step waits for it, and that wait is durable: the parent continues from exactly where it left off once the child finishes, even if the Suite restarts in between.
- **Test before you ship.** Run a draft and watch each node light up live — running, succeeded, failed, or skipped — with the values every step produced, so you can see exactly what a workflow does before it goes live.
- **Track every run.** The Executions view lists each run with its status, when it started, and the detail behind any fault.
- **Version safely.** A published workflow is not edited in place — editing one opens a new draft version, so a workflow already in use never changes underneath you.

## Working with tasks

A user task step routes work to a person and waits for them to finish it. The people you assign see and complete that work in **Tools > Tasks** in Studio, or in the **Tasks** area of the web client.

- **My tasks** lists the tasks assigned to you (pending by default), with a count badge for how many are waiting.
- **Tenant tasks** lists the tasks across your organisation's workflow task list, so a manager can see everything in flight.
- Opening a task shows its title, description, instructions, due date, and who it is assigned to. Completing it, with an optional note, marks it done and lets the waiting workflow continue. Completing a task needs the complete-tasks permission (`tasks_complete`); viewing the inbox needs read-tasks (`tasks_read`).

A person is assigned either directly or through a role. When a step is assigned to a role, every current member of that role receives the task, and each member sees only their own copy.

## Adding and configuring steps in the designer

These steps are in the node palette, and you configure them on the node like any other.

**User task** (in the Human group). Set who the task goes to and the human-facing content:

- **Assignee**: the person or the role that receives the task. This is required; a step with no assignee will not publish.
- **Title, description, and instructions**: what the assignee sees and what you want them to do.
- **Due date and expiry** (both optional): the due date is shown to the assignee, and an expiry is carried for a later automatic-cancel sweep.

When the run reaches the step it creates the task, hands it to the assignee, and pauses. Marking the task complete continues the workflow from that step.

**Sub-workflow** (in the Composition group). Use the child-workflow picker to choose which workflow to call:

- The picker lists your published workflows, grouped by workflow, with one row per published version (newest first). Pick the exact version you want. The step always runs that pinned version, never the latest, so a parent never changes behaviour because someone published a new revision of the child.
- Optionally map values from the parent into the child's inputs, and name an output variable to capture the child's result for later steps.
- The picker hides the workflow you are editing, so you cannot point a workflow at itself, and the engine refuses any deeper loop between workflows.

The child can run to completion in one pass, or it can pause partway (for a person, a task, or a timer). When it pauses, the sub-workflow step waits for the child and resumes on its own once the child finishes. The wait is durable, so a long-running child, and a parent waiting on it, both survive a restart.

**Delay** (in the Timing group). Set how long the step waits before the workflow continues, as a duration such as `PT8H` or a plain number of seconds. The wait is durable: the run parks and picks up on its own when the time is up.

You can also begin a workflow with a **schedule start** or an **event start** node from the palette, and the workflow publishes and runs. Firing a workflow automatically on that schedule or event is still being built, so for now you start such a workflow yourself or through the start API.

## Governed by design

Workflows Studio is part of the Suite, not a bolt-on, so it inherits the platform's governance:

- **Every step is permission-checked.** A workflow acts with the permissions of the identity that runs it, and each capability re-checks its own permission at run time. A step the runner isn't allowed to perform **fails closed** — it is never silently skipped or quietly escalated.
- **Tenant-scoped throughout.** A workflow only ever sees and touches its own tenant's data.
- **Structured logic, not scripting.** Conditions, loops, and data mapping are safe, validated configuration — not an embedded scripting language. That keeps workflows portable, reviewable, and free of the security and maintenance burden of hand-written code.
- **Audited end to end.** Every run records the real actor behind it.

## For developers: the Tasks API and node configuration

### The Tasks inbox API

Tasks are exposed under `/api/v2/TasksService`, alongside the rest of the REST surface. Every call carries the tenant as `?tenantId={tenantId}`, and the acting identity is always the authenticated caller, never a value in the request body.

| Method and path | What it returns | Permission |
|---|---|---|
| `GET /api/v2/TasksService/Pending` | The caller's assigned tasks (pending by default; `?completed=true` for completed). Each row pairs the task with the caller's own assignment. | `tasks_read` |
| `GET /api/v2/TasksService/Pending/Count` | The count of that same set, for a badge. | `tasks_read` |
| `GET /api/v2/TasksService/Tenant` | The tenant's workflow task list (`?completed=false` or `true` to filter; omit for both). | `tasks_read` |
| `GET /api/v2/TasksService/Tenant/Count` | The count of the tenant list. | `tasks_read` |
| `GET /api/v2/TasksService/{taskId}` | One task with its full assignee set. A task owned by another tenant returns 404. | `tasks_read` |
| `POST /api/v2/TasksService/{taskId}/Complete` | Marks the task completed and, if it is linked to a workflow run, resumes that run exactly once. Idempotent. | `tasks_complete` |

The complete call takes an optional note only:

```json
POST /api/v2/TasksService/{taskId}/Complete?tenantId={tenantId}
{ "note": "Reviewed and approved." }
```

Task reads never include a `Type` field. The underlying task's type is an internal database discriminator, and is never exposed or editable.

### Node configuration

Workflow steps are stored in the definition under each node's `config` object, with camelCase field names.

**User task** (`type: "UserTask"`):

```json
"config": {
  "assigneeRef": "a user id, an enrollment id, a role id, or a role name",
  "assigneeKind": "Person",
  "title": "Review the invoice",
  "description": "Check the totals against the purchase order.",
  "instructions": "Approve to continue, or leave a note and cancel.",
  "dueDate": "2026-09-01T00:00:00Z",
  "expiryDuration": "PT8H"
}
```

- `assigneeRef` is required. `assigneeKind` is `Person` (a specific person, the default) or `Role` (every current member of the role receives the task).
- `dueDate` is an ISO-8601 instant. `expiryDuration` is an ISO-8601 duration such as `PT8H`, or a plain number of seconds.

**Sub-workflow** (`type: "SubWorkflow"`):

```json
"config": {
  "childDefinitionKey": "invoice-approval",
  "childVersion": 3,
  "inputMapping": { "invoiceId": "{{steps.lookup.invoiceId}}" },
  "outputVar": "approval"
}
```

- `childDefinitionKey` is the child workflow's stable key, and `childVersion` is the exact published version to run. The version is never resolved to the latest. (Definitions authored before this field was renamed used `childDefinitionId`; that name still binds.)
- `inputMapping` maps parent values into the child's inputs using the same `{{…}}` bindings as any other step. `outputVar` names the run variable that captures the child's result for later steps.

## Where it fits

Workflows Studio delivers the **automation** thread of the [Operations](~/Capabilities/Operations.md) and [Platform & Development](~/Capabilities/Platform-and-Development.md) capabilities, and runs on the [Alliance Business Platform](~/Capabilities/Alliance-Business-Platform.md). The operations you compose into a workflow are contributed by the other capabilities you've enabled — [Finance](~/Capabilities/Finance.md), [Commerce](~/Capabilities/Commerce.md), [Intelligence](~/Capabilities/Intelligence.md), and more — so a workflow is simply your business, wired together and set to run.
