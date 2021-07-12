# Tutorial: Get started with the Alliance Business Suite

[[_TOC_]]


This tutorial shows how to create and run your first Alliance Business Suite instance.

You'll learn how to:

- [✔] Install an Alliance Business Suite instance.
- [✔] (optional) Trust the development certificate.
- [✔] Run the app.

In the end, you'll have a working Alliance Business Suite instance running on your local machine.

## Prerequisites

- .NET Core 6.0 SDK or later
- MySQL Server 8.0 or later

## Installation



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

### Development Install


#### Install as a Docker Container.

```powershell
docker pull FenixAlliance.ABS:latest
```

#### Install as an Application Extension

There are certain cases where customers prefer to install the Alliance Business Suite so that they can extend the standard functionalities, create modules, integrations, SPAs, or really, any kind of extensions without having to worry about all the required wiring for it to work properly.


In these cases, the best approach is to install the Alliance Business Suite as an application extension into a new or existing ASP.NET Application.

To do this:

1. **Add the NuGet package**

```sh
dotnet add package FenixAlliance.ABS.Hub --version latest
```

2. **Register Services and Configuration**

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

3. **Trust the HTTPS development certificate**:

![cert.png](/.attachments/cert-55b026f6-2aae-45a7-837b-491015fb5dca.png)

Select Yes if you agree to trust the development certificate.

### Installation wizard
The Alliance Business Suite uses the `suitesettings.json` configuration file to determine whether or not the Alliance Business Suite instance is already configured to work. The Status section of the configuration file is used to instruct the system on the current configuration step.

The first step towards having an operational instance is to set up the basic options such as Database Connections Strings, seeding the database, create the primary Business Tenant, and the root account holder.

Customers can achieve this installation through a web wizard aimed to beat WordPress's 5 Minutes installation.


On this wizard, you'll be prompted with a few configuration steps:

**1. Primary Database Options**

![Primary Database Options](/.attachments/image-1225dbea-223d-42dd-ac65-cd6cd3c6305a.png)

**2. Business Tenant Basic Information**

![Business Tenant Basic Information](/.attachments/image-c187a4ce-806b-43bd-a9f4-78537123f237.png)

**3. Primary Portal Basic Information**

![Primary Portal Basic Information](/.attachments/image-f629e01c-1650-432b-bf92-389c31f8a960.png)

**4. Identity Provider Options**

![Identity Provider Options](/.attachments/image-b29e9ac0-67d6-497d-8e13-75904b9a00c9.png)

**5. Root Account Credentials**

![Root Account Credentials](/.attachments/image-331f6185-4104-4ac6-ac37-d66477a6275b.png)

Fill in the required information on each step and click on "Install". This will create the ABM Scheme to the Database, seed data such as countries, currencies, states, cities, timezones, the selected COA, and other important, standardized data. The creation and seeding process might take up to 5 minutes, depending on your connection and system's specifications.

![Seeding Process](/.attachments/image-9a7225cf-ba75-4625-ba1c-64a0289c4755.png)

Let the application finish this process, reload the page & log in with the Root Account credentials defined in previous steps.