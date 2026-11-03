# Agent capabilities and limits

From version 2.7.0 each workspace decides which built-in capabilities its agents may use, such as web search or reading a web page. Every capability is off until a workspace manager turns it on.

## Where to find it

- **Nucleus Web:** **Workspace > Configuration > Policies** lists every capability with its switch and its limits.
- **Studio:** **Tenants > your workspace > Settings > AI options** holds the workspace AI options described below.

Anyone in the workspace can see the list. Changing a capability or its limits needs the permission to manage workspace settings.

## The capabilities

| Capability | Per-run limit (default) |
|---|---|
| Web search | 10 |
| Page fetch (read a web page) | 10, editable from 1 to 100 |
| Social search | 10 |
| Code sandbox | 5 |
| Provider file store | 10 |
| Computer use | 50 |
| Voice session | 1 |
| Image generation | 5 |
| MCP connections (external tools) | 20 |

All of them are off by default.

### "Not available yet"

Some capabilities carry a **Not available yet** badge. That means the platform has no tool or provider route for it today, so an agent cannot use it even when you switch it on. For MCP connections the badge shows while MCP connections are switched off on the platform. You can still set the switch, so your choice is ready when the capability arrives.

## Limits

- **Per run:** how many times an agent may use the capability in one run. Today only **page fetch** has an editable per-run limit, and it is enforced: when a run reaches it, the agent is told "This run has reached its web fetch limit." The other per-run values are shown for information and cannot be changed yet.
- **Per day:** web search (500), page fetch (500) and social search (200) show a per-day value. These daily values are not enforced yet, so they cannot be changed.
- Only a person acting as themselves can change a limit. Agents and automations cannot.

## Workspace AI options (Studio)

- **Computer use:** on or off. When it is on, every action an agent takes on a computer still needs a person's approval.
- **Voice recording:** off (default), or keep audio and transcripts. It applies once voice sessions are available.
- **AI vendor data retention:** not allowed (default), zero-data-retention vendors only, or allowed.

Changes to these options take effect as soon as you save them.

## Coming

- **Scheduled agent runs:** schedule an agent to run on its own, within limits you set. Built and switched off until it is ready.
- **Agents acting on your behalf (token exchange):** an agent working for a person with that person's own delegated access. Built and switched off until it is ready.

## Related

- [Connect Claude, ChatGPT or any MCP client](Connect-AI-Assistants-over-MCP.md)
- [Capacidades y límites de los agentes (español)](Agent-Capabilities.es.md)
