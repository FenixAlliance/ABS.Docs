# Tutorial: Get started with the Alliance Business Suite
This tutorial shows how to create and run your first Alliance Business Suite instance.

You'll learn how to:

- [✔] Create a web app project.
- [✔] Trust the development certificate.
- [✔] Run the app.
- [✔] Edit a Razor page.

In the end, you'll have a working Alliance Business Suite instance running on your local machine.

## Prerequisites

- .NET Core 6.0 SDK or later
- MySQL Server 8.0 or later



### Easy Install

The Easy Way: As a Docker Container.
```powershell
docker pull FenixAlliance.ABS.Portal:latest
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
        public IConfiguration Configuration { get; }

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