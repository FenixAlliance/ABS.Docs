# Configuration

This page describes the configuration file of self-hosted ABS, `suitesettings.json`, and the environment variables that override some of its settings.

**Who it is for:** the instance owner or IT team that runs self-hosted ABS.

**Availability:** self-hosted ABS. On ABS Online, hosted by Fenix Alliance, you do not manage this file.

## The configuration file

`suitesettings.json` holds the instance-wide configuration: which database to use and how to reach it, which platform services are on, and how sign-in works. Workspace settings, such as your company details, live in the database and are managed in Studio.

- **Where it lives:** next to the application, at `/app/suitesettings.json` in the container.
- **How you supply it:** mount a folder that contains it at `/app/config`. The container copies it into place each time it starts. See [Hosting self-hosted ABS](~/Fundamentals/Hosting.md#how-the-configuration-file-is-applied).
- **How it is created:** the web installer writes it when you install the instance. See [Install self-hosted ABS](~/Fundamentals/Installation.md).

The file contains connection strings and other secrets. Store it with restricted access, and keep a backup with your database backups.

## Sections

The file is a JSON object with six top-level sections.

| Section | What it configures |
|---|---|
| `Status` | The installation status of the instance. |
| `ABM` | The data layer: the database engine and connection, and data protection keys. |
| `ABS` | Studio, the web portals and the web interface. |
| `ABP` | Platform services, such as the APIs, HTTP behavior, messaging, health checks, logging, modules and development mode. |
| `APS` | Sign-in and identity providers. |
| `ACL` | Licensing. |

### Status

`Status` > `Installed` tells the instance whether it is installed. While it is `false`, the instance serves only the web installer. The installer sets it to `true`. The section also holds other status markers that the instance records. Do not edit them.

### Database

`ABM` > `Provider` names the database engine. It is one of `MySQL`, `PGSQL` (PostgreSQL), `MSSQL` (Microsoft SQL Server) or `ODPSQL` (Oracle Database). The connection string is in the matching entry of `ABM` > `Providers`.

## When the file is missing

- **In the `Production` environment** (the container default), the instance starts on built-in defaults plus any environment variables, and writes a warning to its log. It does not create a file. A new instance in this state opens the web installer.
- **In the `Development` environment**, the instance creates a blank `suitesettings.json`.

See [Environments](~/Fundamentals/Environments.md).

## Environment variable overrides

A set of settings can also be given as environment variables. When a variable is set, it wins over the value in `suitesettings.json` for that setting. Settings without a variable come only from the file.

Set Boolean variables to `true` or `false`.

| Variable | Overrides |
|---|---|
| `ABSUITE_MODEL_DATA_CONTEXT_CONNECTION_STRING` | The connection string of the main database. `MODEL_DATA_CONTEXT_CONNECTION_STRING` is also accepted. |
| `ABSUITE_WORKFLOWS_DATA_CONTEXT_CONNECTION_STRING` | `ABP` > `Workflows` > `ConnectionString`. `WORKFLOWS_DATA_CONTEXT_CONNECTION_STRING` is also accepted. |
| `ABSUITE_HEALTH_CHECKS_DATA_CONTEXT_CONNECTION_STRING` | `ABP` > `HealthChecks` > `ConnectionString`. `HEALTH_CHECKS_DATA_CONTEXT_CONNECTION_STRING` is also accepted. |
| `ABSUITE_INSTALLED` | `Status` > `Installed`. |
| `ABSUITE_DEV_MODE_ENABLED` | `ABP` > `DevMode` > `Enable`. |
| `ABSUITE_MESSAGING_ENABLED` | `ABP` > `Messaging` > `Enable`. |
| `ABSUITE_MESSAGING_DISTRIBUTED_ENABLED` | `ABP` > `Messaging` > `EnableDistributedEvents`. |
| `ABSUITE_HTTPS_REDIRECTION_ENABLED` | `ABP` > `HTTP` > `HttpsRedirection` > `Enable`. |
| `ABSUITE_LOGGING_ENABLED` | `ABP` > `Logging` > `Enable`. |
| `ABSUITE_SERILOG_ENABLED` | `ABP` > `Logging` > `Serilog` > `Enable`. |
| `ABSUITE_DATA_PROTECTION_ENABLED` | `ABM` > `DataProtection` > `Enable`. |
| `ABSUITE_DATA_PROTECTION_PROVIDER` | `ABM` > `DataProtection` > `Provider`: `Database`, `FileSystem` or `Azure`. |
| `ABSUITE_DATA_PROTECTION_KEY_RING_PATH` | `ABM` > `DataProtection` > `KeyRingPath`, the folder used by the `FileSystem` provider. |
| `ABSUITE_DATA_PROTECTION_KEY_LIFETIME_DAYS` | `ABM` > `DataProtection` > `KeyLifetimeDays`. |
| `ABSUITE_DATA_PROTECTION_APPLICATION_NAME` | `ABM` > `DataProtection` > `ApplicationName`. |
| `ASPNETCORE_ENVIRONMENT` | The hosting environment. See [Environments](~/Fundamentals/Environments.md). |

Pass variables to the container with your runtime's usual option, for example `docker run -e ABSUITE_DEV_MODE_ENABLED=false`. Environment variables are read at startup, so restart the container after you change one.

### Data protection keys

ABS protects sign-in cookies and other sensitive data with keys. By default, `Database` stores the keys in the ABS database, so they survive restarts and are shared by every replica. Use `FileSystem` only with a folder that every replica shares and that outlives the container.

## Change the configuration

1. Edit the `suitesettings.json` in your `config` folder on the host.
2. Restart the container. The new file is copied into place, and the instance reads it at startup.
3. Confirm that `/health` answers `200`, and check the [logs](~/Fundamentals/Logging.md) if it does not.
