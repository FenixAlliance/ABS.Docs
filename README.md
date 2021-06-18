---
description: >-
  Welcome to the open-source documentation for the Alliance Business Suite.
  Please review this README file to understand how you can assist in contributing to the project.
---

# Alliance Business Suite
![Alliance Business Suite](https://absuite.net/wp-content/uploads/sites/13/2020/03/Logo.Blue_.NoBG_.h40.png "Alliance Business Suite")

<p>
  <a href="https://docs.absuite.net/reference/1.1.7/" target="_blank">
     <img alt="Version" src="https://img.shields.io/badge/Version-1.1.7-blue.svg?cacheSeconds=2592000" />
  </a>
  <a href="https://docs.absuite.net" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/Documentation-yes-brightgreen.svg" />
  </a>
  <a href="http://absuite.net/eula" target="_blank">
    <img alt="License: ABS EULA" src="https://img.shields.io/static/v1?label=License&message=ABS%20EULA&color=blue" />
  </a>
  <a href="https://twitter.com/fenixalliance" target="_blank">
    <img alt="Twitter: fenixalliance" src="https://img.shields.io/twitter/follow/fenixalliance.svg?style=social" />
  </a>
</p>

Welcome to the Alliance Business Suite!

The Alliance Business Suite is a set of intelligent, extensible, multi-tenant business applications that enable users to jumpstart their business through the acceleration of several core aspects of any given business.

The Alliance Business Suite gives users a Full-Stack, Modular Application Framework built on top of the [Alliance Business Platform](https://absuite.net). 

Both client and server code are written in C#, allowing users to extend the product with their own code through Module libraries. It builds upon next-generation technologies such as Blazor, SignalR, Razor Pages, and MVC through ASP.NET Core, an open-source and cross-platform web UI framework for building web apps using .NET and C# with or without the use of JavaScript.

ABS Apps are composed of reusable web UI components implemented using C#, HTML, and CSS. 

## About the Alliance Creed

We're designed to succeed when you and your business succeed; that's why we're committed to helping as many people as possible to harness their entire potential. By building on top of word-class technologies, we're designing this solution to jumpstart your business without having to worry about any of the complexity and technical aspects. We simply want to help you make your life easier while increasing your odds for success through the right tools and support on the path to digitalization.

The fact is, since our inception, we've steered towards creating a culture designed to reach beyond expectations together by building an organization whose success strategy is to help others to succeed.

### Well then. What do I get?

We are creating our applications in such a form that they deliver as much value to your business and cause as we can. They work primarily as an interface for users to manage their services, products, and cloud resources. But the truth is that isn't limited to just that.

Our applications are being developed to give you access to every functionality that we implement for our business, to power your business and vision as well. This is because if we can add value to our business and gain a competitive advantage through these tools, chances are you can too!

So far, we've created a few extensions and connectors for the Alliance Business Suite, but you can extend it too! Some of these extensions are open source, so feel free to check their code for extension reference.

Connectors are always free and you can find them on your ABS Extensions page, and some of our extensions have free tiers. You will get the Alliance Business Suite Community Edition, for free, with the following Modules:

- ABS ContactSight. (CRM)
- ABS Content Portals (CMS)
- ABS Accounting. (AMS)
- ABS Social Networks. (Intranet Social Network)
- ABS IAM (Identity and Access Management)
- Infinity Comex (eCommerce Engine)

To learn more about our privacy policy, please visit: https://fenixalliance.com.co/legal/policies/privacypolicy 

### User Guide
- [Documentation](https://docs.absuite.net)
- [Roadmap](https://dev.azure.com/fenixalliance/ABS.Docs/_workitems/recentlyupdated)

# Getting Started

- Install **[.NET 5 SDK (v5.0.100)](https://dotnet.microsoft.com/download/dotnet/5.0)**.
   
- Install the latest edition (v16.8 or higher) of [Visual Studio 2019](https://visualstudio.microsoft.com/vs/) (Community, Professional, or Enterprise Editions) with the **ASP.NET and web development** workload enabled. Alliance Business Suite works with ALL editions of Visual Studio from Community to Enterprise. If you do not have a SQL Server installation available already and you wish to use LocalDB for development, you must also install the **.NET desktop development workload**.  

- Download a release or Clone the ABS. Portal repository to your local system using Git. Open the **FenixAlliance.ABS.Portal.sln** solution file and Build the solution. Make sure you specify FenixAlliance.ABS.Portal as the Startup Project and then Run the application.


**Installing an official release:**

- A detailed set of instructions for installing Alliance Business Suite on IIS is located here: [Installing Alliance Business Suite on IIS](https://absuite.net/blog/installing-abs-on-iis)
- Instructions for upgrading Alliance Business Suite are located here: [Upgrading Alliance Business Suite ](https://absuite.net/blog/upgrading-abs)

**Additional Instructions**

- If you have already installed a previous version of Alliance Business Suite and you wish to do a clean database install, simply point the DefaultConnection value in the ABS Portal Settings Manager to a fresh database record. This will trigger a re-install when you run the application which will execute the database installation scripts.
   
- Every ABS Repo ignores appsettings.json by default, so as long as you don't delete the directive from .gitignore, you're cleared to submit a pull request. 

**Video Series**

- If you are getting started with Alliance Business Suite, a [series of videos](https://www.youtube.com/playlist?list=PLGYfOT42OgSZdmYctCWeiRkPfGVQbCRWM) are available which explain how to install the product, interact with the user interface, and develop custom modules.

## Documentation
There is a separate [Documentation repository](https://dev.azure.com/fenixalliance/ABS.Docs), which contains various types of documentation for the Alliance Business Suite, including the C# API documentation for every class on every library. The contents of the repository are available at [https://docs.absuite.net](https://docs.absuite.net) as interactive documentation.

---

### Easy Install

The Easy Way: As a Docker Container.

```powershell
docker pull FenixAlliance.ABS:latest
```

### Conventional Install

```powershell
git clone https://github.com/FenixAlliance/ABS.Bin
```
```powershell
cd ABS.Bin
```
```sh
./FenixAlliance.ABS.Studio.exe
```
or
```sh
dotnet FenixAlliance.ABS.Studio.dll
```

### As application dependency

Add the NuGet package

```sh
dotnet add package FenixAlliance.ABS.Hub --version latest
```

## Register Services and Configuration

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



# Roadmap
This project is a work in progress and the schedule for implementing enhancements is dependent upon the availability of community members who are willing/able to assist. For a more comprehensive look at our roadmap, please visit our **[Progess Board](https://dev.azure.com/fenixalliance/ABS.Docs/_workitems/recentlyupdated)**.

V.1.7.5 ( release in 2022 S1 )
- [ ] UBL 2.1 Support
- [ ] Process Canvas.
- [ ] PowerShell SDK 

V.1.5.0 ( release in 2021 S2 )
- [ ] gRPC Modularization
- [ ] Reporting Dashboard
- [ ] Dynamic Dashboards
- [ ] Granular Property Set Access
- [ ] gRPC Modularization
- [ ] ACS Modularization

V.1.2.5 ( release in 2021 S1 )
- [ ] Custom Macro Definitions
- [ ] Virtual Entity Data Sources
- [ ] Studio Static Localization
- [ ] Custom Portal Profile Definitions
- [ ] Identity Server Integration (Local accounts)
- [ ] Template Definitions
    - [ ] Agreement Template Definitions
    - [ ] Email Template Definitions
    - [ ] Email Signature Template Definitions
    - [ ] Document Template Definitions
    - [ ] Article Template Definitions
- ✅ Virtual SPA Support (Angular/React)
- ✅ Razor Templating Engine
- ✅ Live Web Designer Integration
- ✅ Dynamic Entity Views
- ✅ Content Live Builder
- ✅ Custom Controller Definitions
- ✅ Portal Settings Manager UI
- ✅ Custom Option Definitions
- ✅ Custom Service Endpoint Definitions
- ✅ Custom Web Portal Resources
- ✅ Module Manager Dashboard
    - ✅ Trusted Publisher Rules
    - ✅ Module Assembly Manager
    - ✅ Managed Module Support
    - ✅ Unmanaged Module Support

V.1.0.0 ( released in Dec 31, 2020 )
- ✅ Authentication / User Management / Profile Management
- ✅ Authorization / Roles Management / Granular Permissions
- ✅ Blazor Support
- ✅ Cross-Platform Database Support ( MySQL, MSSQL )
- ✅ Dynamic CSS/Lazy Loading
- ✅ Dynamic Page Compositing Model / Site & Page Management
- ✅ Dynamic Routing
- ✅ Dynamic Swagger Specs
- ✅ EF Core Migrations for Database Installation / Upgrade
- ✅ Enabled for Infinity Comex (eCommerce Extension)
- ✅ Event Logging / Audit Trail
- ✅ Extensibility via Custom Modules
- ✅ Extensibility via Custom Themes
- ✅ Folder / File Management (Azure Storage, File System)
- ✅ GraphQl API with Voyager, GraphiQl y GraphQl Playground
- ✅ Headless API with Swagger Support
- ✅ HealthCheck Rules with UI Support
- ✅ i18n Enabled (Based on GeoAPI and Custom Settings)
- ✅ Improved JavaScript reference support
- ✅ In-App CLI (Studio Commander)
- ✅ Infinity Comex Support (ABS' eCommerce Engine)
- ✅ JavaScript Lazy Loading
- ✅ Modular Architecture
- ✅ Multi-Currency Support
- ✅ Multi-Portal ( Monolith & Microservice Distributed )
- ✅ Multi-Tenant ( Shared Database & Isolated Database )
- ✅ Notifications / Email Delivery
- ✅ Notifications / SMTP Delivery
- ✅ Progressive Web Application Support
- ✅ Recycle Bin
- ✅ REST API with Swagger Support
- ✅ Scheduled Flows ( Background Processing )
- ✅ Scheduled Jobs ( Background Processing )
- ✅ Seamless Upgrade Experience
- ✅ Slack integration (OAuth)
- ✅ Support For Additional Authentication Providers (OAuth)

Constant Consideration

- ✅ Code Annotations
- ✅ A11y Improvements
- ✅ i18n Improvements
- ✅ UI/UX Improvements 
- ✅ Security Improvements
- ✅ SOLID Code Improvements
- ✅ Performance Improvements 
- ✅ Extensibility Improvements 
- ✅ Generic Integrations Improvements
- ✅ Developer productivity enhancements
- ✅ Bug fixes & core Dependency Management


# Release Announcements

[Alliance Business Suite v1.2.5](https://absuite.net/Blog/announcing-1-25-for-net-5)

# Example Screenshots

## APS IAM Social Providers:
Alliance Passport Services provides Internal, B2B, and B2C identity as a service. It allows users to use their preferred social, enterprise, or local account identities to get single sign-on access to the Alliance Business Suite.

Alliance Passport Services (APS) is Fenix Alliance's cloud-based identity and access management service, which helps your customers and employees to sign in and access resources in your deployment, such as apps on your tenant, portal instances, Infinity Comex Deployments, along with any cloud apps developed by your own organization.


![Alliance Passport Services](https://github.com/fenixalliance/abs.docs/blob/master/.attachments/image-a85a71aa-0553-47b3-bde4-0f2a7cb8b220.png?raw=true "Alliance Passport Services")

## ABS Extensions:
The ABS is absolutely modular. Whether you need to add pages, products, or posts with no code at all (using the ABS Web Designer), modify the style or layout, or add your own Types, Controllers, Pages, Views, Components, or Tag Helpers

![ABS Extensions](https://github.com/fenixalliance/abs.docs/blob/master/.attachments/YLVYb8WhDf.gif?raw=true "ABS Extensions")

## ABS Commander Terminal:
The ABS Commander Terminal is a Built-In functionality that allows users to execute commands against the ABP set of APIs.

![ABS Commander Terminal](https://github.com/fenixalliance/abs.docs/blob/master/.attachments/8Jbl76YPxD.gif?raw=true "ABS Commander Terminal")

## ABS WOPI Connector:

The ABS Workplace Module allows users to create, view, and edit Office files with Office for the web, right from their ABS Instances. It also allows users to manage files for pretty much every entity type.

![ABS WOPI Connector](https://github.com/fenixalliance/abs.docs/blob/master/.attachments/E9Or7BZKnX.gif?raw=true "ABS WOPI Connector")

## ACS Bot Maker:

The Alliance Conversational Services Bot Maker Platform is an ABS extension that allows users to create conversational flows using NLP and a graphical UI.

![ABS Bot Maker](https://github.com/fenixalliance/abs.docs/blob/master/.attachments/2id1XVYuYR.gif?raw=true "ABS Bot Maker")


# Versioning

Maintaining forward and backward compatibility is a key goal of the ABS. Therefore, the ABS now uses only additive versioning, which means any revision of the ABM following the "2.0" release will not:

* Introduce new mandatory attributes on previously published entities, or change an optional attribute to be mandatory
* Rename previously published attributes or entities
* Remove previously published attributes

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/FenixAlliance/ABM.Models/issues). You can also take a look at the [contributing guide](https://fenixalliance.com.co/technologies/opensource/codeofconduct).

1. [Issue Guidelines](https://github.com/fenixalliance/abs.portal/wiki/Issue-Guidelines)
1. [Report Security Vulnerabilities](https://fenixalliance.com.com/security)
1. [Pull Request Requirements](https://github.com/fenixalliance/ABS/wiki/Contribution-Guidelines)
1. [Translations](https://translate.fenixalliance.com.co)
1. [Chart of Accounts](https://charts.fenixalliance.com.co)

---


## Show your support

Give this project a ⭐️ if this project helped you!


## Author

👤 **Fenix Alliance Inc.**

- Website: https://fenix-alliance.com
- Twitter: [@fenixalliance](https://twitter.com/fenixalliance)
- Github: [@fenixalliance](https://github.com/fenixalliance)
- LinkedIn: <a href="https://www.linkedin.com/company/FenixAlliance/" target="_blank">Fenix Alliance on LinkedIn</a>

## Logo and Trademark

The brand name Alliance Business Suite and its logos are trademarks of Fenix Alliance S.A.S in Colombia and Fenix Alliance Inc in other countries ("Fenix Alliance").

Fenix Alliance owns and oversees the trademarks for the ABS name and logos. We have developed this trademark usage policy with the following goals in mind:

- We’d like to make it easy for anyone to use the ABS name or logo for community-oriented efforts that help spread and improve ABS.
- We’d like to make it clear how ABS-related businesses and projects can (and cannot) use the ABS name and logo.
- We’d like to make it hard for anyone to use the ABS name and logo to unfairly profit from, trick, or confuse people who are looking for official ABS resources.


## Licensing and Contributions

Your access to and use of the Alliance Business Suite's source code is governed by the Fenix Alliance's [End User License Agreement "EULA"](http://absuite.net/eula). If you don't agree to those terms, as amended from time to time, you are not permitted to access or use the Alliance Business Suite.

We welcome any contributions to the Alliance Business Suite development through pull requests on GitHub. Most of our active development is in the develop branch, so we prefer to take pull requests there (particularly for new features). We try to make sure that all new code adheres to the Fenix Alliance coding standards. All contributions are governed by the terms of the EULA.


**A note about your account and the privacy of your information.**

The Alliance Passport Services engine is built on top of a highly compliant service to keep your identity private. This engine supports Facebook, Microsoft Accounts, Google+, LinkedIn, and many other identity providers, but you can also integrate your own.

We think that it's also worth pointing out that we DO NOT store any identity information into our databases; instead, that data is always encrypted and sent to the same systems that governments and enterprises worldwide are using to keep your data safe, and then we access that data by using industry-standard protocols so that you can rest assured that your sensitive information is protected through various security controls in addition to multi-factor authentication.

To learn more about our privacy policy, please visit: https://fenixalliance.com.co/legal/policies/privacypolicy 

# Legal Notices

Fenix Alliance and any contributors grant you a license to the documentation and other content in this repository under the [Creative Commons Attribution 4.0 International Public License](https://creativecommons.org/licenses/by/4.0/legalcode) and grant you a license to any code in the repository under the [ABS EULA](http://absuite.net/eula).

Fenix Alliance, Alliance Business Suite, Infinity Comex, and/or other Fenix Alliance's products and services referenced in the documentation may be trademarks or registered trademarks of Fenix Alliance Inc. in the United States/or other countries. The licenses for this project do not grant you rights to use any of Fenix Alliance's names, logos, or trademarks. Fenix Alliance's general trademark guidelines can be found at http://docs.fenix-alliance.com.

Privacy information can be found at https://fenix-alliance.com/legal/policies/privacypolicy

Fenix Alliance and any contributors reserve all other rights, whether under their respective copyrights, patents, or trademarks, whether by implication, estoppel, or otherwise.
