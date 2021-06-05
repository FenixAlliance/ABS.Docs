The Alliance Business Suite supports creating RESTful services, also known as web APIs, using C#. To handle requests, a web API uses controllers. Controllers in the Alliance Business Suite can be added from several approaches, some of which will allow you to access every Alliance Business Suite feature that's available. Controllers are classes that derive from ControllerBase and can be added as Modules to the Alliance Business Suite by installing them as a Nuget Package or uploading them through your instance or File System. 

This article shows how to use controllers for handling web API requests.

## ControllerBase class

The Alliance Business Suite is written in C# using .NET, and several interfaces have been set in place to make it as extensible as it can be. 

The Alliance Business Suite allows customers to develop their own API Sets (which consists of one or more controller classes that derive from ControllerBase) just as if they were building a .NET API, with one main difference. You don't need to worry about wiring features and managing complicated stuff such as authentication processes, dependency injection, and application startup. Also, you can use the ABS SDK to build amazing custom functionalities with just a few lines of code.


Please consider the following class as an example of  the most basic custom API Controller for the Alliance Business Suite:

```csharp

[ApiController]
[Route("api/v2/[controller]")]
public class LicensesController : ControllerBase {

        // Constructor
        public LicensesController(){
        }

        [HttpGet("validate/{LicenceID}")]
        public async Task<ActionResult> Get(string LicenceID)
        {
            await Task.Delay(1000);
            return Ok(LicenceID);
        }

}
```

The previous controller will be available at `/api/v2/licenses` and the Get method can be invoked by making an HTTP GET request to `/api/v2/licenses/validate/{LicenseID}`

Also, it is worth pointing out that the Alliance Business Suite DOES have support for the MVC Pattern, so you should not create a web API controller by deriving from the `Controller` class. `Controller` derives from `ControllerBase` and adds support for views, so it's for handling web pages, not web API requests. There's an exception to this rule: if you plan to use the same controller for both views and web APIs, derive it from `Controller`."


In essence, creating an Alliance Business Suite compatible Controller is just as straightforward as creating a .NET API Controller with a few additions:

- You can inject, through dependency injection, any registered Alliance Business Suite Service. This includes every interface provided with the following schema: I{ServiceName}Service (e.g: IAuthService, IHolderService, IViewRenderingService, ICodeCompilationService, and other 100+).

Please consider the following class as an example of a Custom Complex Controller for the Alliance Business Suite:

```csharp

using FenixAlliance.ABM.Data;
using FenixAlliance.ABM.Data.Interfaces.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FenixAlliance.Areas.Licensing.Controllers
{
    [ApiController]
    [Route("api/v2/CustomMe")]
    [ApiExplorerSettings(IgnoreApi = true)]
    public class HolderController : ControllerBase {

        public DataContext DataContext { get; set; }
        public IAuthService AuthService { get; set; }
        public IStoreService StoreService { get; set; }
        public IConfiguration Configuration { get; set; }
        public IHostEnvironment Environment { get; set; }
        public IHolderService HolderService { get; set; }
        public ITenantService TenantService { get; set; }
        public IStorageService StorageService { get; set; }

        public LicensesController(
            DataContext DataContext,
            IConfiguration Configuration,
            IHostEnvironment Environment,
            IStoreService StoreService,
            ITenantService TenantService,
            IHolderService HolderService,
            IAuthService AuthService,
            IStorageService StorageService
        )
        {
            this.AuthService = AuthService;
            this.DataContext = DataContext;
            this.Environment = Environment;
            this.StoreService = StoreService;
            this.Configuration = Configuration;
            this.HolderService = HolderService;
            this.TenantService = TenantService;
            this.StorageService = StorageService;
        }

        /// <summary>
        /// Get the current user profile
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Produces("application/json")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(Holder), StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ResponseStatus), StatusCodes.Status401Unauthorized)]
        public async Task<ActionResult<APIResponse>> GetMe()
        {
            var apiResponse = JsonConvert.DeserializeObject<APIResponse>(
                JsonConvert.SerializeObject(
                    await AuthService.BindAPIBaseResponse(
                        DataContext,
                        HttpContext,
                        Request,
                        HolderService,
                        User
                        )
                    )
                );

            if (apiResponse == null || !apiResponse.Status.Success || apiResponse.Holder == null)
            {
                return Unauthorized(apiResponse?.Status);
            }

            return Ok(apiResponse.Holder);
        }
    }
}

```


## Installing a Custom Controller

To install a custom controller you just need to build the Razor Class Library containing your custom Controllers as a NuGet Package and then upload it into your Alliance Business Suite instance. 

If your RCL depends on other Nuget Packages, those DLLs will need to be copied into your Module's NuGet Package for your custom functionality to work.

To do this, you can extract the .nupkg file using something like 7-Zip (NuGet Packages are just Zipped files with a different extension), and then copy into the lib/ folder every non-ABS Dll required for your RCL to work properly. Then, re-compress the files, and change the re-compressed file extension to .nupkg to be uploaded into your Alliance Business Suite Instance as a Module. 

To install a module into your Alliance Business Suite:

- Upload your NuGet Package to the [Alliance Business Suite Gallery](https://gallery.absuite.net) and then install it through the Modules Manager. (This method will make your Module available to every Alliance Business Suite installation out there, and is best suited for those who create commercial modules and integrations)

- Upload the NuGet package right into your Alliance Business Suite instance using your instance's Modules Manager.
- Copy the NuGet Package into the Modules folder at the root of your Alliance Business Suite installation. (If the folder does not exist yet, you can confidently create it) and then enable it through your instance's admin portal.


