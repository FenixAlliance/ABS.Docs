# Install self-hosted ABS

This guide installs self-hosted ABS from the published container image and walks you through the web installer.

**Who it is for:** the instance owner or IT team that runs self-hosted ABS.

**Availability:** self-hosted ABS. ABS Online, hosted by Fenix Alliance, needs no installation.

## Before you begin

Make sure you have:

- A host that meets the [system requirements](~/get-started/Requirements.md), with a container runtime such as Docker.
- A database server running MySQL, PostgreSQL, Microsoft SQL Server or Oracle Database, reachable from the container.
- An empty database for ABS, and an account that can create and change tables in it.
- Outbound HTTPS access from the container, for the downloads the installer makes.

## Install the instance

1. **Create folders on the host for the data the instance keeps.** The commands below use `/srv/absuite`. Create four folders under it: `config`, `modules`, `logs` and `appdata`. [Hosting self-hosted ABS](~/Fundamentals/Hosting.md#keep-your-data-outside-the-container) explains what each one holds.

2. **Pull the image.** Image tags match the release numbers in the [changelog](~/reference/Changelog.md). Use a version tag rather than `latest`, so you control when the instance changes.

   ```sh
   docker pull fenixalliance/absuite-hub:<version>
   ```

3. **Start the container.** Mount the four folders, and publish port 8080 only on the host itself. The restart policy matters: the installer stops the instance when it finishes, and the policy starts it again. `ABSUITE_REALTIME_DECLARED_REPLICAS=1` declares that you run a single replica, which is the supported topology.

   ```sh
   docker run -d --name absuite --restart unless-stopped \
     -p 127.0.0.1:8080:8080 \
     -e ABSUITE_REALTIME_DECLARED_REPLICAS=1 \
     -v /srv/absuite/config:/app/config:ro \
     -v /srv/absuite/modules:/app/Modules \
     -v /srv/absuite/logs:/app/logs \
     -v /srv/absuite/appdata:/app/AppData \
     fenixalliance/absuite-hub:<version>
   ```

   Never publish ports 80 or 8080 to the internet or to untrusted networks. Only your reverse proxy may reach them. If the proxy runs on another machine, publish the port only on a private network that the proxy uses. See [Serve HTTPS](~/Fundamentals/Hosting.md#serve-https).

4. **Open the instance in your browser.** On the host, go to `http://localhost:8080`, or open the instance through your reverse proxy. A new instance sends you to the web installer at `/Install`.

5. **Complete the Database step.** Select your **Engine**, then enter the **Host**, **Port**, **Database**, **Username** and **Password** of your database server. Select **Next**.

6. **Complete the Business Tenant step.** This creates your first workspace. Enter the **Business Name** and **Business Email**, select a **Chart of Accounts** (or **Empty**), and select the **Country** and **Default Currency**. Select **Next**.

7. **Complete the Web Portal step.** Enter the **Portal Title** and **Portal Description** of your first web portal. Select **Next**.

8. **Complete the Identity step.** Under **Engine**, keep **Default Identity** to manage sign-in in ABS. Select **Azure Active Directory B2C** only if you already run a B2C directory, and enter its details. Select **Next**.

9. **Complete the Admin Account step.** Enter the **Admin Name**, **Admin Last Name**, **Admin Email** and **Admin Password**. This account becomes the instance administrator.

10. **Select Install.** The installer creates the database schema, loads the reference data (countries, currencies and the chart of accounts you chose), creates your workspace and admin account, and saves the configuration file. This can take several minutes. When it finishes, the instance stops, and the restart policy starts it again.

    The installer also downloads a base website theme and keeps it inside the container, outside the mounted folders. A recreated container loses it. ABS uses it only when no theme is installed in `AppData`.

11. **Copy the configuration file to the host.** The installer saves `suitesettings.json` inside the container. Copy it into your `config` folder, so the instance keeps its configuration when you restart or recreate the container:

    ```sh
    docker cp absuite:/app/suitesettings.json /srv/absuite/config/suitesettings.json
    ```

    The file holds your database password. Restrict access to the `config` folder.

12. **Set the production settings. This step is required.** Edit the `suitesettings.json` in your `config` folder:

    - **Turn off development mode.** The installer turns on development mode. Set `ABP` > `DevMode` > `Enable` to `false`. You can instead set the environment variable `ABSUITE_DEV_MODE_ENABLED` to `false`.
    - **Turn on messaging, the outbox and the inbox.** Set `ABP` > `Messaging` > `Enable` to `true`, `ABP` > `Messaging` > `EnableDistributedEvents` to `false`, `ABP` > `Outbox` > `Enable` to `true` and `ABP` > `Inbox` > `Enable` to `true`. Without them, business events are not delivered. See [System requirements](~/get-started/Requirements.md#messaging).

    Then restart the container, so it copies the edited file into place:

    ```sh
    docker restart absuite
    ```

13. **Sign in.** Open the instance again and sign in with the admin email and password from step 9.

## Before you go live

- **Serve HTTPS.** Put a reverse proxy or load balancer in front of the container. See [Hosting self-hosted ABS](~/Fundamentals/Hosting.md#serve-https).
- **Check health.** A request to `/health` answers `200` when the instance is healthy or degraded, and `503` when it is unhealthy. A new instance often reports degraded until you finish its settings. See [Check health](~/Fundamentals/Hosting.md#check-health).

## Add modules

As the instance owner, you decide which modules the instance offers. Workspaces do not install modules themselves. To add a module, see [Installing a module](~/Module-Development/Installing-a-Module.md).

## Next steps

- [Hosting self-hosted ABS](~/Fundamentals/Hosting.md): storage, HTTPS, health checks and updates.
- [Configuration](~/Fundamentals/Configuration.md): the configuration file and environment variable overrides.
- [Logging](~/Fundamentals/Logging.md): where the instance writes logs and where you read them in Studio.
