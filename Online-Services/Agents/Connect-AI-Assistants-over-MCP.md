# Connect Claude, ChatGPT or any MCP client

> **From 2.8.0.** Connecting an AI assistant over the Model Context Protocol (MCP) ships in 2.8.0, and it is switched on shortly after the release goes live. We will announce when it is on. Until then the address below does not answer.

An AI assistant that speaks MCP can work with your Alliance Business Suite account: it reads and, where your workspace allows it, creates records for you. You stay in control. You sign in yourself, you approve the connection, and the assistant never sees your password.

## The address

Every assistant connects to one address:

```
https://absuite.net/mcp
```

The assistant finds everything else on its own (the sign-in page, the token endpoint and what it may ask for) from the standard discovery documents at `https://absuite.net/.well-known/oauth-protected-resource/mcp` and `https://absuite.net/.well-known/oauth-authorization-server`. You never type them.

## Connect Claude

1. In Claude, open **Settings** > **Connectors** and add a custom connector.
2. Enter `https://absuite.net/mcp` as the connector URL and save.
3. Claude opens the Alliance Business Suite sign-in page. Sign in with your own account, and choose the workspace if you are asked.
4. A consent page shows "*Claude* wants to access your Alliance account" and the access it asks for. Select **Allow**.
5. Claude is connected. You are not asked again when it renews its access.

## Connect ChatGPT

1. In ChatGPT, add a custom connector (in **Settings**, under **Connectors** or **Apps**, depending on your plan).
2. Enter `https://absuite.net/mcp` as the MCP server URL and choose OAuth sign-in.
3. Sign in to Alliance Business Suite with your own account, choose the workspace if you are asked, then select **Allow** on the consent page.

Claude and ChatGPT are registered with Alliance Business Suite, so their consent page shows their registered names.

## Connect any other MCP client

Once this is switched on (we will announce it), any MCP client that follows the MCP authorization standard can connect, for example Cursor or VS Code. Give it the address `https://absuite.net/mcp`. The client registers itself with Alliance Business Suite through OAuth dynamic client registration (or a client ID metadata document), then sends you to sign in and approve it, the same way as above.

A client that registered itself is not registered by us, so its consent page marks it **Unverified**. The page also shows the web address it will return you to. A client whose name imitates a known app is shown only as "Unverified app". Check that address before you select **Allow**. If you don't recognise the client or the address, select **Deny**.

## What the assistant can do

- **Only what you can do.** The assistant's access is your own permissions, narrowed to what you approved. It can never do something you can't.
- **One workspace at a time.** Every request names the workspace it acts in. The assistant never falls back to another workspace.
- **Only what the workspace allows AI to do.** Each workspace decides which kinds of AI action are allowed. A new workspace allows reading and creating records, and every other kind of action is off until a workspace administrator turns it on. A workspace that existed before 2.8.0 keeps working as before: AI may read, create and change records until a workspace administrator turns changing off. Exporting and publishing are off in every workspace until an administrator turns them on. Some actions, such as payments, also need a person's approval.
- **MCP tokens work only on MCP.** A token issued to an assistant works only at `https://absuite.net/mcp`, not on the REST or GraphQL APIs, and an assistant can never exchange it to act as you somewhere else.

## Sign-in and tokens

The sign-in uses OAuth 2.1 with PKCE, so only the assistant that started a sign-in can finish it.

Access tokens last 15 minutes. The assistant renews them without asking you again, as long as it uses them at least once every 14 days. Claude and ChatGPT can keep renewing for up to 60 days, and a client that registered itself for up to 14 days. After that, you sign in again.

## Disconnect an assistant

Remove the connector in the assistant itself. Removing it there stops the assistant, but our side of the grant stays until it has gone 14 days unused, and then it lapses. If a workspace is deleted, every assistant's access to it ends at once.

To end our side at once, open your account menu (under your name and picture) > **Connected apps**. Each connection is listed per workspace. Select **Disconnect** next to the assistant, then confirm. It loses access at once.

## Supported assistants

| Assistant | Status in 2.8.0 |
|---|---|
| Claude | Supported, registered with Alliance Business Suite |
| ChatGPT | Supported, registered with Alliance Business Suite |
| Other MCP clients (Cursor, VS Code and others) | Off at launch; supported through self-registration once it is switched on |
| Grok | Not yet |

## Related

- [Agent capabilities and limits](Agent-Capabilities.md)
- [Changelog 2.8.0](../../reference/Changelog.md)
- [Conecta Claude, ChatGPT o cualquier cliente MCP (español)](Connect-AI-Assistants-over-MCP.es.md)
