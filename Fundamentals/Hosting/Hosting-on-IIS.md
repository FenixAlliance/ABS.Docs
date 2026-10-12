# Hosting on IIS

Internet Information Services (IIS) is not the supported path for self-hosted ABS.

**Who it is for:** instance owners who run Windows servers and are deciding how to host ABS.

## What is supported

Containers are the supported way to run self-hosted ABS. Fenix Alliance publishes the Linux container image `fenixalliance/absuite-hub`, tagged with release numbers, and does not publish a separate build for IIS.

To run ABS on a Windows server, run the Linux container image on a container runtime that supports Linux containers on Windows. Then follow [Install self-hosted ABS](~/Fundamentals/Installation.md) and [Hosting self-hosted ABS](~/Fundamentals/Hosting.md).

## If you already run ABS on IIS

ABS is an ASP.NET Core application on .NET 10. A build you produce yourself can run under IIS like any ASP.NET Core application, with the .NET 10 Hosting Bundle installed. Fenix Alliance does not document or support that setup.

To move to the supported path:

1. Back up your database and your `suitesettings.json` file.
2. Copy `suitesettings.json` into the `config` folder that you mount into the container.
3. Copy the module packages from your `Modules` folder into the `modules` folder that you mount into the container.
4. Start the container with the mounts described in [Install self-hosted ABS](~/Fundamentals/Installation.md). Because your configuration file marks the instance as installed, the web installer does not run.
5. Apply any pending database migrations, as described in [Update to a new release](~/Fundamentals/Hosting.md#update-to-a-new-release), and confirm that `/health` answers `200`.
