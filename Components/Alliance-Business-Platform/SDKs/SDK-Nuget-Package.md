# Working with the Alliance Business Suite SDK

This topic provides information about where you can download the developer tools, assemblies, and code samples that are shipped as part of the Software Development Kit (SDK) for the Alliance Business Suite.

## SDK assemblies
The SDK assemblies are available as NuGet packages that you can directly use in your Visual Studio projects. For information about using a NuGet package in Visual Studio, see [Install and use a package in Visual Studio](https://docs.microsoft.com/en-us/nuget/quickstart/install-and-use-a-package-in-visual-studio)


The following SDK assemblies are available:


| Package Name |  Top Assembly | Package Location  |
|--------------|-------------|-------------------|
| FenixAllaince.ABS.SDK | FenixAllaince.ABS.SDK.dll | [https://www.nuget.org/packages/FenixAlliance.ABS.SDK/](https://www.nuget.org/packages/FenixAlliance.ABS.SDK/) |
| FenixAllaince.ABP.SDK | FenixAllaince.ABP.SDK.dll | [https://www.nuget.org/packages/FenixAlliance.ABP.SDK/](https://www.nuget.org/packages/FenixAlliance.ABP.SDK/) |
| FenixAllaince.APS.SDK | FenixAllaince.APS.SDK.dll | [https://www.nuget.org/packages/FenixAlliance.APS.SDK/](https://www.nuget.org/packages/FenixAlliance.APS.SDK/) |
| FenixAllaince.ABM.SDK | FenixAllaince.ABM.SDK.dll | [https://www.nuget.org/packages/FenixAlliance.ABM.SDK/](https://www.nuget.org/packages/FenixAlliance.ABM.SDK/) |


## Using the Alliance Business Suite SDK.

The Alliance Business Suite SDK provides several interfaces and default implementations designed to speed up business application development. By leveraging the SDK, developers can create outstanding personalized experiences for their customers, employees, providers, and more.

Although it is possible to combine programming models, the first step towards developing Alliance Business Suite Applications/Extensions is to decide the Programming Model to use.

**Note**: Alliance business Suite Applications/Extensions can be created using .NET or Node.js. This article focuses on the ABS SDK for .NET. As of version 1.2.x, the ABS SDK for Node.js hasn't been published, and requests have to be performed against the Alliance Business Platform Web APIs.

By using .NET and Visual Studio and the ABS SDK for .NET, developers can easily create extensions either by using ASP.NET MVC or Blazor to cover specific business needs while leveraging the power of C# and the Alliance Business Suite.

## Overriding Default Service Implementations.

Customers can also use the Alliance Business Suite to override the default Interface Implementations present on every Alliance Business Suite instance. To do so, just implement the desired interface and register it as a Service Override on the `ConfigureServices` method present on the `IModule` Interface.


 
