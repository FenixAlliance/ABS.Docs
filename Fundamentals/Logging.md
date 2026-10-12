# Logging

This page explains what self-hosted ABS writes to its logs, where the log files are kept, and where you read logs in Studio.

**Who it is for:** instance owners and administrators who troubleshoot an instance, and workspace administrators who review activity and security events.

**Availability:** the host log files and the **Admin** logs page are for self-hosted ABS instance administrators. The workspace logs pages are available in every workspace to people with the matching permission.

## What the instance writes

ABS uses Serilog for its application error log, and the standard ASP.NET Core logging for the rest of its console output.

- **Log files:** errors and more severe events are written as JSON to the `logs` folder next to the application, `/app/logs` in the container. A new file starts each day. The minimum level of the files is fixed at error and is not configurable.
- **Console:** the same error records also go to the console, together with the standard ASP.NET Core host output, which includes information messages such as startup progress. Your container runtime collects the console. Read it with `docker logs absuite`, or with your orchestrator's log tools.
- **Console levels:** to change how much the standard host output shows, use the standard `Logging` section of an `appsettings.json` file. Supply the file through `/app/config`, as described in [Hosting self-hosted ABS](~/Fundamentals/Hosting.md#how-the-configuration-file-is-applied).

Mount `/app/logs` to storage on the host to keep the files when you recreate the container. See [Hosting self-hosted ABS](~/Fundamentals/Hosting.md#keep-your-data-outside-the-container). The instance keeps the 31 most recent daily files and removes older ones. To keep logs longer, archive the files before then, or collect the console output with your own log tools.

### Request logging

To also log HTTP requests, set both `ABP` > `Logging` > `Enable` and `ABP` > `Logging` > `Serilog` > `Enable` to `true` in `suitesettings.json`, or set `ABSUITE_LOGGING_ENABLED` and `ABSUITE_SERILOG_ENABLED` to `true`. Because the minimum level of the log files is error, only requests that fail with a server error are recorded there. See [Configuration](~/Fundamentals/Configuration.md#environment-variable-overrides).

## Read logs in Studio

These Studio pages show the logs of the instance and its workspaces. Each one shows a different kind of log.

| Page | What it shows | Who can open it |
|---|---|---|
| The Admin logs page, at `/Studio/Admin/Logs` | The host log files described above. | Administrators of the instance's root workspace. |
| A workspace's **Tools** > **Logs** | The workspace's activity log, with an **Activity** tab and a **Security** tab. | People with permission to read the workspace's logs. The **Security** tab needs permission to read security logs. |
| **Security** module > **Logs** | The workspace's security events. | People with permission to read security logs. |

### Read the host log files

1. Sign in as an administrator of the root workspace.
2. Go to `/Studio/Admin/Logs` on your instance.
3. In **Log files**, select a file. The newest file is first.
4. In **Records**, find the record you need. Each record shows its **Timestamp**, **Level**, **Message** and **Exception**. You can filter and sort the list.
5. Select a record to see its details, including the original record.

### Read a workspace's activity and security logs

1. Open the workspace in Studio.
2. Go to **Tools** > **Logs**.
3. Select **Activity** for the activity log, or **Security** for security events.
4. Select an entry to see its details.

Security events are also listed in the **Security** module, under **Logs**.
