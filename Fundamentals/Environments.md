# Environments

This page explains the hosting environment of self-hosted ABS and what changes between `Production` and `Development`.

**Who it is for:** the instance owner or IT team that runs self-hosted ABS.

**Availability:** self-hosted ABS.

## Set the environment

ABS reads its hosting environment from the standard ASP.NET Core variable `ASPNETCORE_ENVIRONMENT`. The container image sets it to `Production`. Leave it at `Production` for any instance that serves real users or holds real data.

## What changes

| Behavior | `Production` | `Development` |
|---|---|---|
| Missing `suitesettings.json` | Runs on built-in defaults plus environment variables, logs a warning and writes no file. | Creates a blank `suitesettings.json`. |
| Development mode | Off unless you turn it on in `suitesettings.json`. | On, unless `ABSUITE_DEV_MODE_ENABLED` is `false`. |

Development mode turns on developer conveniences, such as the API explorer. Use it only for building and testing.

## Development mode in production

Development mode can also be turned on in `suitesettings.json` with `ABP` > `DevMode` > `Enable`. The web installer turns it on, so check it before you go live:

1. Set `ABP` > `DevMode` > `Enable` to `false` in the `suitesettings.json` in your `config` folder.
2. Restart the container.

You can also force it off with the environment variable `ABSUITE_DEV_MODE_ENABLED` set to `false`. The variable wins over both the file and the hosting environment. See [Configuration](~/Fundamentals/Configuration.md#environment-variable-overrides).

When development mode is on, the instance writes `RUNNING IN DEVELOPMENT MODE: True` to its console at startup. Check the container output to confirm the setting:

```sh
docker logs absuite
```
