# gRPC API

> **Not yet available.** gRPC is planned, not shipped. It appears on the [Roadmap](~/get-started/Roadmap.md) as *gRPC Modularization*.

The `FenixAlliance.ABP.API.gRPC` project currently contains only the default .NET gRPC template (a sample `Greeter` service). It does **not** expose the Alliance Business Model, and it should not be used or planned against.

## Use these instead

| Surface | Where |
|---|---|
| REST | [REST API](~/Capabilities/Alliance-Business-Platform/APIs/REST-API.md) — `https://{yourinstancedomain}/api/v2/documentation` |
| GraphQL | [GraphQL API](~/Capabilities/Alliance-Business-Platform/APIs/GraphQl-API.md) — `https://{yourinstancedomain}/api/v3/playground` |
| MCP | Model Context Protocol server, for AI agent clients |
| SignalR | Real-time push |

If you need a high-performance binary transport today, use REST with the .NET SDK. This page will be updated when gRPC ships.
