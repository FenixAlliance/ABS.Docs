# Hosting self-hosted ABS

This page explains how to run self-hosted ABS in production: the container image, the data to keep, HTTPS, health checks, replicas and updates.

**Who it is for:** the instance owner or IT team that runs self-hosted ABS.

**Availability:** self-hosted ABS. ABS Online, hosted by Fenix Alliance, is the alternative if you do not want to host ABS yourself.

## Supported hosting

Containers are the supported way to run self-hosted ABS. Fenix Alliance publishes the image `fenixalliance/absuite` on Docker Hub, tagged with release numbers. To set up a new instance, follow [Install self-hosted ABS](~/Fundamentals/Installation.md).

Internet Information Services (IIS) is not the supported path. See [Hosting on IIS](~/Fundamentals/Hosting/Hosting-on-IIS.md).

## The container image

| Property | Value |
|---|---|
| Image | `fenixalliance/absuite:<version>` |
| Platform | Linux, x64 (amd64) |
| HTTP ports | 80 and 8080 |
| Hosting environment | `Production` (see [Environments](~/Fundamentals/Environments.md)) |
| Configuration file | `/app/suitesettings.json`, supplied through `/app/config` |

Pin a version tag in production. The `latest` tag moves with every release.

## Keep your data outside the container

Mount these folders to storage on the host, or to volumes, so that recreating the container keeps them.

| Path in the container | What it holds |
|---|---|
| `/app/config` | Your `suitesettings.json`, and optionally `appsettings.json`. Read-only is enough. |
| `/app/Modules` | Module packages you install. See [Installing a module](~/Module-Development/Installing-a-Module.md). |
| `/app/logs` | The log files the instance writes. See [Logging](~/Fundamentals/Logging.md). |
| `/app/AppData` | Themes and public files the instance serves. |

Your business data lives in the database, not in the container. Back up the database and these folders together.

### How the configuration file is applied

Each time the container starts, it copies `suitesettings.json` and `appsettings.json` from `/app/config` over the copies the instance reads. The files in `/app/config` are therefore the source of truth.

Some settings pages in Studio save their changes to the instance's own copy of `suitesettings.json`. After you change settings that way, copy the file back to your `config` folder, or the next restart of the container restores the older file:

```sh
docker cp absuite:/app/suitesettings.json /srv/absuite/config/suitesettings.json
```

If no file is mounted, the container still starts, so a new instance can reach the web installer. See [Configuration](~/Fundamentals/Configuration.md) for what happens when the file is missing.

## Serve HTTPS

Put a reverse proxy or load balancer in front of the container. Terminate HTTPS there, and forward requests to port 8080 of the container. The image already accepts the forwarded headers that a proxy sends, so ABS sees the original host name and scheme.

## Check health

| Endpoint | Purpose |
|---|---|
| `GET /health` | Anonymous health probe. Answers `200` when the instance is healthy or degraded, and `503` when it is unhealthy. The body carries only the overall status. |
| `GET /version` | Returns the version of the running instance. |

Point your orchestrator's liveness and readiness probes, or your load balancer's health check, at `/health`.

## Run more than one replica

You can run several containers of the same instance behind a load balancer.

- Point every replica at the same database.
- Give every replica the same `suitesettings.json` and the same module packages.
- Sign-in cookies and other protected data stay valid across replicas, because ABS stores its data protection keys in the database by default.
- If you turn on distributed events, connect every replica to the same RabbitMQ. See [System requirements](~/get-started/Requirements.md#messaging).

## Update to a new release

1. Read the [changelog](~/reference/Changelog.md) for the release you are moving to.
2. Back up the database and the folders listed above.
3. Pull the new version tag, then recreate the container with the same mounts.
4. Check for pending database migrations, and apply them. As an instance administrator, `GET /api/v2/SystemService/Migrations?pending=true` lists them, and `POST /api/v2/SystemService/Migrations/Migrate` applies them.
5. Confirm that `/health` answers `200` and `/version` shows the new release.
