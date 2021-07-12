# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2] - 2021-07-12

### Added

- [ABS] Portals: Theme Updater.
- [ABS] Portals: Centralized Portal Manager.
- [ABS] Portals: Core Template (Turing).
- [ABS] ICX: Templating Capabilities.
- [ABS] ICX: Courses Commerce Capabilities.
- [ABS] Logistics: Stock Items Manager.
- [ABS] Logistics: Warehouses Manager.
- [ABS] Marketing: Campaigns Manager.
- [ABS] Sales Companion: Deal Units Manager.
- [ABS] Sales Companion: Sales Invoices Manager.
- [ABS] Contact Sight: Individuals Manager.
- [ABS] Contact Sight: Organizations Manager.
- [ABS] Contact Sight: Activity Feed (beta).
- [ABS] Social Networks: Social Pofile Feed (beta).
- [ABS] Education: Courses Manager.
- [ABS] Studio: Contextual Command Bar.
- [ABS] Studio: Primary Entities Outlook Cards (Tenant Scoped).
- [ABS] Studio: Local Storage Calculator Widget.
- [ABS] Studio: Improved ABS Terminal UI.
- [ABS] Studio: Quick Record Panels.
- [ABS] Studio: Multi Portal Static Files Manager.
- [ABS] Live Editor: ABS Razor CodeMarkers (Alerts, Errors & Hints highlighting).
- [ABS] Patterns: CQRS Initial implementation, reducing complexity for Modules Development.
- [ABS] Portals: Live Editor: Tidy-HTML Formatting Option (Experimental).

### Changed

- [ABS] StudioContext is now more secure and efficient when managing Studio Access.
- [ABS] BuilderContext now derives from StudioContext to get all its goodness.
- [ABS] Improved Record Ownership.
- [ABS] Improved Portal Theme Resolution.
- [ABS] Improved Users Management workflow.
- [ABS] Improved Portal Resolution Workflow.
- [ABS] Improved Security Roles Management workflow.
- [ABS] Improved Security Permissions Management workflow.
- [ABS] Improved Business Profile Record Management workflow.
- [ABS] Live Editor: Improved Web Content diagnostics.
- [ABS] Live Editor: Email Templates Manager.

### Removed
- [ABS] Individual Portal Manager

## [1.1.9] - 2021-06-30
### Added

- [ABS] Static Files Manager Modal.
- [ABS] Portals Network Manager.
- [ABS] Tenant Dashboard.
- [ABS] Force GC option.
- [ABS] BuilderContext Service.
- [ABS] Tenant Profile Editor.

## [1.1.8] - 2021-06-18
### Added

- [ABS] Live Components Editor.
- [ABS] Live Templates Editor.


## [1.1.7] - 2021-06-06
### Added
- [ABS] Log Viewer.
- [ABS] Template Views.
- [ABS] View Components.
- [ABS] Blog Post Editor.
- [ABS] Live Pages Editor. (Preview)
- [ABS] Support for Angular and React+Redux SPAs.
- [ABS] Initial Web Content. (Editable Pages, Components & Templates)
- [ABS] Internal Web Content. (Sys locked Pages, Components & Templates)
- [ABS] Frontend Admin Bar.
- [ABS] Invoice Outliner.
- [ABS] Invoice Manager.
- [ABM] Marketing Module Models.
- [ABS] Project Service Models.
- [ABM] LMS Service Models.
- [ABS] Add support for Bootstrap CSS.
- [ABS] Add support for Foundation CSS.
- [ABS] Adds support for Fabric JS and Fluent UI.
- [ABS] Ensure non-existence of viral licensed libraries. (e.g GNU).
- [ABS] Adds IViewBuffer, Resx, and Model Resolver to Templating Engine.
- [ABS] Adds Localization String Manager. Initial Localization Capabilities.

### Changed
- [ABS] Fix HTTP context access on IIS making the installation process fail.
- [ABS] Fix HTTP context access on IIS when trying to create a new view.
- [ABS] Fix HTTP context access on IIS when trying to edit a new view.
- [ABS] Fix HTTP context access on IIS when trying to create a new post.
- [ABS] Fix HTTP context access on IIS when trying to edit a new post.
- [ABM] Fiscalization document Models.
- [ABM] Project Service document Models.
- [ABM] Pricing engine Models.
- [ABM] Workflow engine Models.
- [ABM] Web Content Records now share a single base class.
- [ABM] ItemPriceList is now a PriceListRecord.
- [ABS] Fix error when referencing scripts into a Web Content being malformed by templating engine.
- [ABS] Fix page tree navigation on the live editor.


## [1.1.6] - 2021-04-21
### Added
- [ABS] View Precompilation
- [ABS] Internal Plugin Support+
- [ABS] Dynamic Portal Metadata
- [ABS] Google Meta Tags Integration
- [ABS] Google Analytics Integration
- [ABS] Google Verification Code Integration
- [ABS] Bing Verification Code Integration
- [ABS] Pinterest Verification Code Integration
- [ABS] Facebook Pixel Verification Code Integration
- [ABS] ICX Taxonomies Creation Blazor Pages.
- [ACL] Store Configuration Objects.
- [APS] External Authentication Provider configuration pages.

### Changed
- [ABP] Fix error while previewing files on File System Explorer.
- [ICX] Fix error where new users got a 500 when visiting the store.
- [ICX] Update Swiper to the latest version.
- [ABS] Monaco editor now lives inside the project instead of as a node module.
- [ICX] ICX Static Files audit, bundling & minification.
- [ICX] Fix UI error on cart record addition/deletion.
- [APS] Fix Auth Error: when users do not belong to any tenant, they used to get an E500 on nested File Retrieval.
- [ABM] Model Modification to support DB-stored precompiled views.
### Removed
- [ICX] Taxonomies Creation Controllers/Views.

## [1.1.4.x] - 2021-04-13
### Added
- [ABS] Extension Updates Page.
- [ABS] Razor Templating Engine.
- [APS] Google Authentication.
- [APS] Facebook Authentication.
- [APS] Microsoft Authentication.
- [APS] Twitter Authentication.
- [APS] LinkedIn Authentication.
- [APS] Instagram Authentication.
- [APS] Github Authentication.
- [ABS] Zift 123 Analytics Script Integration.
- [ABS] Facebook Pixel Integration.
- [ABS] Facebook Chat Widget Integration.
- [ABS] Google Analytics integration.
- [ABS] Google Merchant Center integration.
- [ABS] Google Verification Code Integration.
- [ABS] Google Tag Manager Integration.
- [ABS] Bing Verification code integration.
- [ABS] Pinterest verification code integration.
- [ABS] Dynamic Structured Metadata.
- [ABS] Adds Off-Canvas Cart Slider.
- [ABS] Dynamic Top Bar content.
- [ABS] Logo size customization options.
- [ABS] Footer Dynamic Content.
- [ABS] Footer/Header Dynamic styling.


## [1.1.3.x] - 2021-04-09
### Added
- [ACL] Radzen.Blazor is now a project dependency. 
- [ACL] RabbitMQ.Client is now a project dependency. 
- [ACL] Fluid.Core is now a project dependency. 
- [ACL] FluentValidation is now a project dependency. 
- [ACL] NuGet.Packaging is now a project dependency. 
- [ACL] FluentEmail.Core is now a project dependency. 
- [ACL] Flurl.Http is now a project dependency. 
- [ACL] Standard.Licensing is now a project dependency. 
- [ACL] NodaTime is now a project dependency. 
- [ACL] Serilog is now a project dependency. 
- [ACL] Autofac is now a project dependency. 
- [ACL] CsvHelper is now a project dependency. 
- [ACL] Dapper is now a project dependency. 
- [ACL] AngleSharp is now a project dependency. 
- [ACL] IdentityServer4 is now a project dependency. 
- [ACL] DotLiquid is now a project dependency. 
- [ACL] Emitter is now a project dependency. 
- [ACL] MediatR is now a project dependency. 
- [ACL] SixLabors.ImageSharp.Web is now a project dependency. 
- [ACL] RazorLight is now a project dependency. 
- [ACL] MassTransit is now a project dependency. 
- [ACL] ZXing.Net is now a project dependency. 
- [ACL] Z.EntityFramework.Plus.EFCore is now a project dependency. 

### Changed
- [ABP] Fix error where plugin assembly paths always returned null (IPluginManager Implementation)


## [1.1.2.x] - 2021-02-23
### Added
- [ABP] Adds ABP Proxy.
- [ACL] Missing ACL configuration Types.
- [ABS] Extensions Gallery.
- [ABS] Extensions Installer.
- [ABS] Web Installer.
- [ABS] Manager Portal.
- [ABS] Dynamic Web Page/Post creation.
- [ABS] Assembly Explorer.
- [ABS] Roles and Permissions Explorer.
- [ABS] Admin Dashboard Initials.
- [ABP] Added support for SixLabors.ImageSharp.Web.
- [ABS] Forex service data is now scraped by Fenix Alliance.
- [ABP] Data Services are now coded to replaceable interface implementations.
- [ABS] ABS.Hub project now contains everything we need to create a new ABS Instance.
- [APS] Added support for IdentityServer4 as a replacement for Alliance Passport Services.
- [ACL] ACL.Licensing is now a part of the Alliance Business Suite.


### Changed

- [ACL] Extracts interface for ACL configuration Types.
- [ABP] ACS is now ABP.BotEngine.
- [ABP] Plugin Manager is now loosely coupled to IPluginManager.
- [ABS] Adds File Manager and FileSystem Service.
- [ABP] Adds antivirus scanning extension for FileSystem Service. (Windows Defender)
- [APS] AccountHolder is now the standard identity class.
- [ABS] Fix minor UI glitches and broken links.
- [ABS] Fix several bugs on application startup and related extensions.

### Removed
- [ABM] Data Helpers marked for deprecation.
- [ABS] ABS.Nucleus was deprecated and is no longer a part of this project.

## [1.1.1.x] - 2021-01-20
### Added
- [ABP] Adds ABP Proxy.
- [ACL] Missing ACL configuration Types.

### Changed
- [ABS] Fix Namespaces.
- [ABS] ABS.Portal.Paperbits is now ABS.Portal.Editor.
- [ABS] Adds ABS.Portal.UI Components. (20+ View Components)

### Removed


## [1.1.0.x] - 2021-01-12
### Added
- [ABS] Initial Nuget Packages Upload. 
- [ABS] Initial Portal Admin Blazor Application at route /admin.

### Changed
- [ABP] Standardize namespace. 

## [1.0.0.x] - 2020-12-31

### Added
- [ABP] Authentication / User Management / Profile Management
- [ABP] Authorization / Roles Management / Granular Permissions
- [ABP] Blazor Support
- [ABP] Cross-Provider Database Support ( MySQL, MSSQL, MongoDB )
- [ABP] Dynamic CSS/Lazy Loading
- [ABP] Dynamic Page Compositing Model / Site & Page Management.
- [ABP] Dynamic Routing.
- [ABP] Dynamic Swagger Specs.
- [ABP] Event Logging / Audit Trail.
- [ABP] Extensibility via Custom Modules.
- [ABP] Extensibility via Custom Themes.
- [ABP] Folder / File Management. (Azure Storage, File System)
- [ABP] GraphQl API with Voyager, GraphiQl y GraphQl Playground.
- [ABP] Headless API with Swagger Support.
- [ABS] HealthCheck Rules with UI Support.
- [ABS] i18n Enabled. (Based on GeoAPI and Custom Settings)
- [ABS] Improved JavaScript reference support.
- [ABS] In-App CLI. (Studio Commander)
- [ICX] Infinity Comex Support. (ICX)
- [ABP] JavaScript Lazy Loading.
- [ABP] Modular Architecture.
- [ABP] Multi-Currency Support.
- [ABP] Multi-Portal Support. ( Monolith & Micro-Service Distributed )
- [ABP] Multi-Tenant Support. ( Shared Database & Isolated Database )
- [ABP] Notifications / Email Delivery.
- [ABP] Notifications / SMTP Delivery.
- [ABP] REST API with Swagger Support.
- [ABP] Scheduled Flows. ( Background Processing )
- [ABP] Scheduled Jobs. ( Background Processing )
- [ABP] Slack integration. (OAuth)
- [ABP] Support For Additional Authentication Providers. (OAuth)