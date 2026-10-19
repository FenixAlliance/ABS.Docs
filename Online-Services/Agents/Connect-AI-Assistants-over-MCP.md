# Connect Claude, ChatGPT or Grok over MCP

> **Coming.** Connecting an AI assistant to Alliance Business Suite over the Model Context Protocol (MCP) is built and switched off in 2.7.0. This page describes how it works so you can plan for it. We will announce when it is on.

## How it will work

Your AI assistant connects to one Alliance Business Suite endpoint, `/mcp` on your Alliance Business Suite address. The assistant never sees your password: you sign in to Alliance Business Suite yourself and approve the connection.

1. In Claude or ChatGPT, add a custom connector and enter the Alliance Business Suite MCP address.
2. The assistant sends you to the Alliance Business Suite sign-in page. Sign in with your own account.
3. A consent page shows "*App* wants to access your Alliance account" and the access it asks for. Select **Allow** or **Deny**.
4. After you allow it, the assistant is connected. You are not asked again on later sign-ins.

The sign-in uses OAuth with PKCE, so only the assistant that started the sign-in can finish it. Access tokens last 60 minutes, and the assistant renews them for up to 14 days.

## What the assistant can do

- The first tools are **read-only** and only about you: your profile, your workspaces and memberships, your follows, your cart and your wallet.
- The assistant never gets more than you have. Its access is your own permissions narrowed to what you approved, so it can never do something you can't.
- A token issued for MCP works only on the MCP endpoint, not on the REST or GraphQL APIs.
- An assistant connected over MCP can never act on your behalf through token exchange.

## Supported assistants

| Assistant | Status |
|---|---|
| Claude | Ready when MCP is switched on |
| ChatGPT | Ready when MCP is switched on |
| Grok | Coming later |

## Related

- [Agent capabilities and limits](Agent-Capabilities.md)
- [Conecta Claude, ChatGPT o Grok por MCP (español)](Connect-AI-Assistants-over-MCP.es.md)
