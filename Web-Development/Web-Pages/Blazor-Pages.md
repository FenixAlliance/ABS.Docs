# Getting started with ABS Blazor Pages

The Alliance Business Suite Portals include Blazor Support (Server-Side). ABS Blazor Pages are based on components. A component in Blazor is an element of UI, such as a page, dialog, or data entry form.

To the Alliance Business Suite, Blazor Components are .NET C# classes built into .NET assemblies that:

- Define flexible UI rendering logic.
- Handle user events.
- Can be nested and reused.
- Live scoped to a Web Portal, therefore, to a Business Tenant.
- Are stored in the Alliance Business Model as Web Pages / Web Components.
- Can be shared and distributed as Razor class libraries or NuGet packages.

Creating a Blazor Component inside the Alliance Business Suite requires some basic knowledge of how traditional Blazor Components work.

The component class is usually written in the form of a Razor markup page. Components in Blazor are formally referred to as Razor components and their only difference with ABS Components is the way they are compiled.

Razor is a syntax for combining HTML markup with C# code designed for developer productivity. Razor allows you to switch between HTML markup and C# in the same file with IntelliSense programming support in Visual Studio. Razor Pages and MVC also use Razor. Unlike Razor Pages and MVC, which are built around a request/response model, components are used specifically for client-side UI logic and composition.


Blazor uses natural HTML tags for UI composition. The following Razor markup demonstrates a Blazor Page that displays a list of Stock Items stored into the Alliance Business Model:

``` razor
@page "/Pages/test"

@using Microsoft.EntityFrameworkCore
@inject FenixAlliance.ABM.Data.DataContext db

@foreach(var item in Model){
    <h1>@item.Title</h1>
}

<button class="btn btn-primary" @onclick="IncrementCount">Click me</button>


@code {
    List<FenixAlliance.ABM.Models.Logistics.Stock.Item.Item> Model {get;set;} = new();

    private void GetProducts()
    {
        Model = db.Item.ToList();
    }

}

```

In this example, GetProducts is a C# method triggered by the button's `onclick` event. This method queries the Alliance Business Model for Stock items and then projects the results onto a List of Stock Items.


## Fundamentals

### Enabling Blazor Support

Enabling Blazor Support is a process that's done at the Template/Page Level. This means that to enable Blazor Support, both Web Page and Web Template should meet certain conditions.

#### Initializing Blazor at the Template level:

To enable Blazor support on a Web Template, you should add at least these two tags to it, as following:

``` HTML
<!DOCTYPE html>

<html class="no-js" lang="en">

<head>
    <!-- This tag is required to enable blazor support -->
    <base href="/" />
    ....
</head>
<body>
    ....

    @Body

    ....

    <!-- This tag is required to enable blazor support -->
    <script src="_framework/blazor.server.js"></script>

</body>

</html>


```
#### Initialize Blazor when the document is ready
The following example starts Blazor when the document is ready:


``` HTML
<body>
    ....

    @Body

    ....

    <script src="_framework/blazor.server.js" autostart="false"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function() {
        Blazor.start();
      });
    </script>
</body>

```
#### Initializing Blazor at the Page/Component level:

To enable Blazor for a page or component, you just need to select .razor as the Code Type for any WebPage/WebComponent. If .razor Code Type is selected, the Templating Engine will compile that Web Content as a Blazor Component, enabling syntaxis and diagnostics.

## Difference between ABS Blazor Pages and ABS Blazor Components.

At a fundamental level, pages and components differ in that pages contain the @page directive. The Templating Engine will enforce this directive on WebPages marked as .razor Code Type and disallow components containing this directive. 