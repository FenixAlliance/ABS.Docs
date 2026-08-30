# Intelligence

*Turn what your business records into insight — and put an assistant next to every user.*

Intelligence is how ABS helps you understand and act on your own data. Because every capability writes into one governed business model, analytics and AI read from a single, trusted source — no exports, no drift. That means curated dashboards, self-serve exploration, and AI assistants that actually know your business context.

## What you can do

- **Report and analyze** — governed BI with curated datasets and a self-serve explorer.
- **Explore your data** — ask questions across finance, commerce, operations, and more, all from one model.
- **Put AI to work** — an assistant (Andy) that answers questions and helps users get things done in context.
- **Let the assistant act safely** — beyond answering, Andy can use approved tools to look things up and complete tasks, always within the same permissions, tenant boundaries, and audit trail as the person it is helping.
- **Assistants that remember.** An agent can durably remember useful facts about the person it is helping (a stated preference, a detail you shared) and draw on them in later conversations, so people do not have to repeat themselves. What an agent remembers is private to that agent and that person, stays inside your tenant, and is governed like every other AI action. A platform administrator can turn durable memory off for the whole environment.
- **Run agents as a step in a process** — invoke an AI agent from a workflow or automation, not just from a chat. The agent runs under a governed application identity **on behalf of** the person (or process) that triggered it — within their permissions and your tenant boundary — so an agent can triage a request, draft a response, or look something up as part of how work gets done.
- **Configure AI agents** — manage cognitive agents, skills, and the models behind them.
- **Build bots** — design conversational bots for support, sales, and automation.

## Governed by design

AI in ABS operates under the same governance as the rest of the platform. An assistant only ever sees and does what the current user is allowed to — every tool it uses is permission-checked, scoped to your tenant, and recorded — so putting AI to work never widens who can see or change what. You decide which models, skills, and tools each agent may use, and read-only actions come first, with anything more sensitive gated for review.

The same rules hold when an agent runs **unattended** — triggered by a workflow or automation rather than a live chat. Such a run executes under a governed application identity acting **on behalf of** a person, and can never do more than that person is allowed to. Every agent run — attended or unattended — leaves a durable, auditable record of who ran it, what it did, which tools it used, and how it ended.

## Modules that deliver it

| Module | What it does |
|---|---|
| [Analytics](~/Modules/ANALYTICS.md) | Governed BI, curated datasets, and a self-serve explorer |
| [BotMaker](~/Modules/BOTS.md) | Design and manage conversational bots |

The **Andy** assistant and **Cognitive Services** (AI agents and skills) also live in this family. Built on the **[Alliance Business Model (ABM)](~/Capabilities/Alliance-Business-Model.md)** foundation, so intelligence reads from the same trusted data your business runs on.
