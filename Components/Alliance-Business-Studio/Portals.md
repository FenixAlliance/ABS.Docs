# Working with Alliance Business Suite Portals

The Alliance Business Suite contains the tools and resources you need to create customer-facing business applications such as websites, intranets & extranets, content delivery platforms, service administration dashboards, and much more.

ABS Portals can use any number of NuGet/npm libraries as well as any UI Framework such as Blazor, ASP.NET, Bootstrap, Angular, VUE.js, React + Redux to create spectacular experiences for business users built on top of your line of business applications.

## Use cases for Alliance Business Suite Portals

Is exists a virtually infinite number of use cases for the Alliance Business Suite Portals. Portals are designed to provide basic (yet extremely powerful) building blocks for your business applications. These building blocks are known as the Alliance Business Suite Components, and they work together to provide you with a fluent development experience when creating internet-exposed applications that directly connect to your internal systems such as your CRM & ERP Solutions.

## Understanding the IPortalContext Interface

A Portal is just a .NET Razor Class Library containing the views and services required by that portal to work properly. Portals extend the Alliance Business Suite to allow you to run multiple portals off a single Alliance Business Suite instance. 

This makes it possible to control a network of portals (MultiPortal Network) under a single Alliance Business Studio dashboard. You can manage everything including the number of sites, businesses, users, features, themes, and more. It is possible to manage hundreds, thousands, and (theoretically) millions of sites that extend or modify the behavior of any Component, Module, or Integration. 

The best example of a MultiPortal Alliance Business Suite Network is fenix-alliance.com, which hosts Fenix Alliance's services such as [Alliance Pay Platform](https://fenix-alliance.com/Pay), [Infinity Comex](https://infinitycomex.com/marketplace), Propietarios.net, [Alliance Business Cloud](https://fenix-alliance.com/cloud), and many more.

Portals can start taking advantage of the Alliance Business Suite components just by injecting and initializing an instance of the IPortalContext interface. This interface contains an abstraction for several methods user Authentication/Authorization, Business Tenant Routing, Forex Services, eCommerce & Wallet Management, as well as Social Profile Data for internal B2B, B2C, C2C networks.

## Injecting and Initializing an IPortalContext Instance

The Alliance Business Suite comes with a default implementation of the IPortalContext Interface whose instance can easily be obtained as a Scoped Service through Dependency Injection.

File `_Imports.razor`:

``` razor
@inject IPortalContext PortalContext
```

File `Layout.razor`:

``` cs
@inherits LayoutComponentBase
<CascadingValue Value="this">

    @if (PortalContextis not null && !PortalContext.Busy)
    {
        <PortalCommandBarComponent PortalContext="PortalContext"></PortalCommandBarComponent>
        <HeaderComponent></HeaderComponent>

        @Body

        <FooterComponent></FooterComponent>

        <RadzenDialog />
        <RadzenNotification />
    }

</CascadingValue>

@code {
    [CascadingParameter]
    private Task<AuthenticationState> authenticationStateTask { get; set; }

    protected override async Task OnInitializedAsync()
    {
        PortalContext.Layout = this;

        var User = (await authenticationStateTask).User;

        await PortalContext.Init(User, NavManager, JS);
        this.StateHasChanged();
    }

    protected override async Task OnAfterRenderAsync(bool firstRender)
    {
        if (firstRender)
        {
            var lDotNetReference = DotNetObjectReference.Create(this);
            await JS.InvokeVoidAsync("blazorUtils.setLayout", lDotNetReference);
        }
        await JS.InvokeVoidAsync("interop.init");
    }


    public async Task RefreshLayout(string BusinessID)
    {
        PortalContext.Layout = this;

        if (BusinessID is not null)
        {
            await PortalContext.Init((await authenticationStateTask).User, NavManager, BusinessID);
        }
        else
        {
            await PortalContext.Flush();
        }

        this.StateHasChanged();
    }


    public async Task CallStateHasChanged()
    {
        this.StateHasChanged();
    }

}
```







