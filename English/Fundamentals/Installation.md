# Tutorial: Get started with the Alliance Business Suite

[[_TOC_]]


This tutorial shows how to create and run your first Alliance Business Suite instance.

You'll learn how to:

- [✔] Install an Alliance Business Suite instance.
- [✔] Trust the development certificate.
- [✔] Run the app.
- [✔] Edit a Razor page.

In the end, you'll have a working Alliance Business Suite instance running on your local machine.

## Prerequisites

- .NET Core 6.0 SDK or later
- MySQL Server 8.0 or later

## Installation

### Development Install
The Easy Way: As a Docker Container.

```powershell
docker pull FenixAlliance.ABS:latest
```

### Conventional Install

``` sh
git clone https://github.com/FenixAlliance/ABS.Bin
```
``` sh
cd ABS.Bin
```
```sh
./FenixAlliance.ABS.Studio.exe
```
or
```sh
dotnet FenixAlliance.ABS.Studio.dll
```
### Install as an Application Extension

Add the NuGet package

```sh
dotnet add package FenixAlliance.ABS.Hub --version latest
```

#### Register Services and Configuration

```cs
using FenixAlliance.ABS.Hub.Extensions;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting.Server.Features;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;

namespace FenixAlliance.ABS
{
    public class Startup
    {
        public IHostEnvironment Environment { get; set; }
        public IConfiguration Configuration { get; set; }

        // Constructor
        public Startup(IConfiguration Configuration, IHostEnvironment Environment)
        {
            this.Environment = Environment;
            this.Configuration = Configuration;
        }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
          services.AddAllianceBusinessSuite(Configuration, Environment);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app)
        {
          app.UseAllianceBusinessSuite(Configuration, Environment);
        }
    }
}
```

### Trust the HTTPS development certificate:

![cert.png](/.attachments/cert-55b026f6-2aae-45a7-837b-491015fb5dca.png)

Select Yes if you agree to trust the development certificate.

### Go through the installation wizard
The Alliance Business Suite uses the `suitesettings.json` configuration file to determine whether or not the Alliance Business Suite instance is already configured to work. The Status section of the configuration file is used to instruct the system on the current configuration step.

The first step towards having an operational instance is to set up the basic options such as Database Connections Strings, seeding the database, create the primary Business Tenant, and the root account holder.

Customers can achieve this installation through a web wizard aimed to beat WordPress's 5 Minutes installation.


On this wizard, you'll be prompted with a few configuration steps:

1. Primary Database Options
1. Business Tenant Basic Information
1. Primary Portal Basic Information
1. Identity Provider Options
1. Root Account Credentials

Fill in the required information on each step and click on "Finish". This will create the ABM Scheme to the Database, seed data such as countries, currencies, states, cities, timezones, the selected COA, and other important, standardized data. The creation and seeding process found to take up to 5 minutes, depending on your connection and system's specifications.

Once finished with this process, reload the page & log in with the Root Account credentials defined in previous steps.