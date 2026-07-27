# System requirements

The Alliance Business Suite is a cross-platform **.NET 10** application. You can run it in a container, self-host it on Linux, Windows, or macOS, or use the fully-hosted **ABS Online**. Requirements depend mostly on how you run it and your workload.

## Browsers

ABS Studio is a modern Blazor application and works on current, evergreen browsers (WebSocket support required):

- Google Chrome and other Chromium-based browsers
- Microsoft Edge
- Apple Safari
- Mozilla Firefox

Always-up-to-date (evergreen) versions are recommended.

## Runtime & hosting

- **Runtime:** .NET 10 (LTS) — cross-platform (Linux, Windows, macOS).
- **Containers:** a container runtime (Docker / OCI). The published images are the simplest way to run a production instance.
- **Hosting targets:** anything that runs a .NET 10 app or a Linux container — Azure Container Apps, Kubernetes, a Docker host, or a traditional Linux/Windows server. (IIS hosting is still possible on Windows but is no longer the primary model.)
- **Messaging (optional):** RabbitMQ, for cross-service integration events in distributed deployments.

## Databases

Choose one relational provider for the platform's data; ABS ships Entity Framework Core providers and migration tooling for:

- Microsoft SQL Server (and Azure SQL)
- PostgreSQL
- MySQL / MariaDB
- Oracle Database
- SQLite (recommended for local development and small instances)

A document store (MongoDB) is used by specific subsystems such as the workflow engine.

## Hardware guidance

Sizing depends on tenants, modules in use, and load. As a practical starting point for a small-to-medium instance:

- **CPU:** 2–4 cores (x64 or ARM64)
- **Memory:** 8–16 GB
- **Disk:** 20 GB+ free, SSD recommended (plus capacity for your data and uploads)

Scale up, or scale out across multiple container replicas, as your tenants and traffic grow. For the hosted option, capacity is managed for you — see [Hosting](~/Fundamentals/Hosting.md) and [Online Services](~/Online-Services/index.md).
