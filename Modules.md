# Modules for the Alliance Business Suite

The Alliance Business Suite is a modular application platform. This means that you can create custom functionalities in the form of modules and add them to your ABS instance.

Modules are pieces of software that are designed to perform a specific set of functions or add a specific kind of feature, to any Alliance Business Suite instance. ABS Modules work only with self-hosted ABS instances. Hosted versions such as absuite.net typically offer theme options for customizing portals, but it isn’t possible to install plugins freely to customize portals on this platform.

ABS Modules are written in C#, the programming language for the Alliance Business Suite itself. When using ABS Modules, you can easily install or “plugin” the one you want to an existing ABS instance with no knowledge of code required. The power of the Alliance Business Suite can be leveraged from small personal blogs and professional portfolios to the infrastructure of large corporations and eCommerce platforms. The power of ABS Modules makes it possible to extend the functionality of the Alliance Business Suite sites while creating customer experiences that are completely unique.

The Alliance Business Platform provides an essential framework for building a basic website. Some specialized functions can be added to each module and integrated with every theme but those features usually relate to customizing the structure of the site itself. For example, a theme designed for photographers might include options for a gallery or slideshow, and an eCommerce theme might have basic functionality for setting up product pages. Plugins incorporate a fully developed set of functions into your Alliance Business Suite instance site and can include options for customization and configuration.

# Creating Modules

To create a Module for the Alliance Business Suite, you'll need to create a new Razor Class Library with DotNet. Then add a reference to the `FenixAlliance.ABP.SDK` Nuget package to your project and implement the `IModule` interface.

This will give you access to the entire dependency tree of the Alliance Business Suite, which includes things like Internal Services, Database Access, and Initialization Middleware Entrypoints (to register your own custom services or InternalServices implementations). From there, is just like developing any other ASP.NET Class Library, but without having to worry about things like StartUp processes or complex application dependency wiring.

Once your Module is ready for production, you can build it as a Nuget Package and install it into any ABS instance by uploading the .nupkg file to the Modules folder on the Root content path of your ABS instance or by uploading it to the [ABS Public Modules Gallery](https://gallery.absuite.net) and install it through your Admin Portal..



# What Can Modules Do?
Modules make it easy to convert a basic Alliance Business Suite instance into a fully functioning online storefront, a membership site, a blog, or a website capable of handling the complex professional needs of a multinational corporation. Generally, Modules can add essential functions that are useful for any Alliance Business Suite instance, as well as features for specific needs.

Modules can enhance your Alliance Business Suite instance by:
- **Adding Custom Functionalities.** Modules are extremely powerful when it comes to building custom functionalities on top of the Alliance Business Suite. Even when it is super easy to static assets and server-side logic to the Alliance Business Suite through Pages, Components, and Templates, and even SPA applications can be added with the click of a button, Modules allow customers to add fully functional sets of components for the ABS instance. Modules can contain Static Assets, MVC sets, Blazor Components, Tag Helpers, API Controllers, Bot Dialogs, Middlewares, and more.
- **Improving user experience.** Modules can add features to help users navigate through a portal, find content, leave comments, subscribe for updates, and contact site administrators.
- **Adding essential security features.** The core Alliance Business Suite install comes with a great set of security features, but Modules can add sophisticated firewalls, alerts, user verifications, authentication providers, and spam blockers for greater site security.
- Speeding up site loading time. Modules can speed up an Alliance Business Suite portal by enabling caching and optimizing static files such as images and even videos.
- Streamlining your workflow. Modules can help optimize your site for searchability, add server-side logic and API endpoints.
- **Improving the site’s appearance.** Modules can add designer fonts, galleries, sliders, and media players to your site. Some themes require certain Modules to perform properly.
- **Adding needed features for your site’s goals.** Modules can add features like product pages and shopping carts to eCommerce sites, landing pages, paywalls, and a long list of other features to support the site’s intended purpose.

# Best practices for ABS Module Development

- To reduce possible incompatibilities, it is recommended to create all your functionality inside an ASP.NET Area named after your Module. This will reduce the possibility to collide with other module namespaces and routes.  
- Whenever possible, use the default provided service interfaces under the `FenixAlliance.ABM.Data.Interfaces.Services` namespace.
- If you need to add a custom implementation for any service, it is recommended not to do so and instead create a new service; but in cases when there is no other choice, please consider inheriting from the Internal implementation and overriding the required virtual methods.

# Security Considerations

Due to the power of Modules, they can be used to add incredible functionalities to your ABS instance, but they can also result in breaking functionalities and even security breaches. 

Keep in mind some general ideas while considering security for each aspect of your system:

## Reduce exposure
First of all, make sure your Modules are always updated. Also, if you are not using a specific Module, delete it from the system.

## Limit access

Making smart Instance/Module/Theme configurations can drastically reduce possible entry points available to a malicious person.

## Containment

Your system should be configured to minimize the amount of damage that can be done in the event that it is compromised.

## Preparation and knowledge

Keeping backups and knowing the state of your Alliance Business Suite instance at regular intervals. Having a plan to backup and recover your installation in the case of catastrophe can help you get back online faster in the case of a problem.

## Trusted Sources

Do not get plugins/themes from untrusted sources. Restrict yourself to the Alliance Business Suite Gallery repository or well-known companies. Trying to get modules/themes from the outside may lead to issues.







