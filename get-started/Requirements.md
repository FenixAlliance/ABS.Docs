# System requirements

This page lists what you need to run self-hosted ABS.

**Who it is for:** the instance owner or IT team that installs and runs self-hosted ABS.

**Availability:** self-hosted ABS. If you use ABS Online, hosted by Fenix Alliance, you only need a supported browser.

## Browsers

Studio runs in the browser and needs WebSocket support. Use a current version of one of these browsers:

- Google Chrome and other Chromium-based browsers
- Microsoft Edge
- Apple Safari
- Mozilla Firefox

## Runtime and container image

- **Container image:** the supported way to run self-hosted ABS is the published container image, `fenixalliance/absuite` on Docker Hub. See [Install self-hosted ABS](~/Fundamentals/Installation.md).
- **Platform:** the image is a Linux image for x64 (amd64) processors.
- **Container runtime:** any OCI-compatible runtime or orchestrator that runs Linux containers, such as a Docker host, Kubernetes or a managed container service.
- **.NET:** ABS runs on .NET 10. The runtime ships inside the image, so you do not install .NET on the host.

Internet Information Services (IIS) is not the supported path. See [Hosting on IIS](~/Fundamentals/Hosting/Hosting-on-IIS.md).

## Databases

ABS stores its data in one relational database. Choose one of these four engines:

- MySQL
- PostgreSQL
- Microsoft SQL Server
- Oracle Database

MariaDB and SQLite are not supported.

The installer creates the database schema for you. Give it a database account that can create and change tables in the ABS database.

## Messaging

RabbitMQ is optional.

- With messaging turned on and distributed events turned off, ABS handles its events inside the same process. No message broker is needed.
- With distributed events turned on, ABS sends events through RabbitMQ. RabbitMQ is the only supported message broker.

A new installation starts with messaging turned off. To turn it on for a single instance without a broker, set `ABP` > `Messaging` > `Enable` to `true` and `ABP` > `Messaging` > `EnableDistributedEvents` to `false`.

See [Configuration](~/Fundamentals/Configuration.md) for the settings that control messaging.

## Network access

- The installer needs outbound HTTPS access. During installation it downloads reference data, such as country data and the charts of accounts, and the base website theme.
- ABS needs a network path to your database server, and to RabbitMQ if you use it.
- Plan to put a reverse proxy or load balancer in front of the container to serve HTTPS. See [Hosting self-hosted ABS](~/Fundamentals/Hosting.md).

## Hardware guidance

Sizing depends on the number of workspaces, the modules you use and your traffic. As a starting point for a small to medium instance:

- **CPU:** 2 to 4 x64 cores
- **Memory:** 8 to 16 GB
- **Disk:** 20 GB or more free, SSD recommended, plus capacity for your data, uploads and logs

Size the database server separately, according to your data volume.
