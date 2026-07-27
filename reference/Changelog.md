# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

> Releases through **`2.0.0` LTS** were recorded contemporaneously. Subsequent releases were compiled from the project's development history and follow the same conventions.

## [Unreleased] — The Composable Platform

### Added
- **Suite UI Kit** — a unified component design system across the Studio.
- **Platform-wide role-based access control**, with per-feature and per-action permissions.
- **Human Resources / Workforce** management — employee types, job titles, schedules, time intervals and rounding policies.
- **OpenAPI server** with parallelized, multi-language SDK generation.
- Tenant-scoped media upload; batch and domain-routed APIs.
- Expanded entity selectors, applets, grids and preview components across the SDK.

### Changed
- Standardized the platform-wide result and error-handling model.
- Unified CQRS dispatch behind a single mediator.
- Standardized DTO mapping conventions across the SDK.
- Enhanced multi-currency billing and overall UI consistency.

## [2.8.0] - 2026-01-07 — .NET 10 LTS & Asset Management

### Added
- **Asset management** with multi-currency cost tracking.
- Operations tooling for instance backup and restore.

### Changed
- Upgraded to **.NET 10 (LTS)**.
- Unified data and service namespaces.
- Streamlined messaging configuration.

## [2.7.0] - 2025-11-10 — Domain Model, Messaging & Payments

### Added
- **Payment Allocation**.
- Resilient messaging — health checks, circuit breakers and configurable consumers.
- Published licensing and trademark terms.

### Changed
- Domain-driven design refactor across services and repositories.

### Security
- Hardened identity-provider key handling.

### Removed
- Module and integration packaging from the SDK distribution pipeline.

## [2.6.0] - 2025-05-26 — Billing, Pricing, Email & MCP

### Added
- **Model Context Protocol (MCP) server** support.
- **Apple** sign-in.
- A new **email engine** for quotes, orders and invoices.
- Cart state-change events.

### Changed
- Improved quote calculation and multi-currency forex conversion.
- Improved pricing and billing.

### Removed
- Authorize.Net integration.

### Fixed
- OpenID Connect sign-in, guest-cart persistence and API-documentation generation.

## [2.5.0] - 2024-12-21 — Platform Hardening & .NET 9

### Added
- **MercadoPago** payment integration.
- API documentation across all controllers.

### Changed
- Upgraded to **.NET 9**.
- Renamed portal configuration to `PortalSettings`.
- Improved the storage service and portal initialization.

### Removed
- Legacy API authorization; obsolete projects.

### Fixed
- Portal context when no tenant is selected; logging and error handling.

## [2.4.0] - 2024-08-23 — REST/OData Migration & New Verticals

### Added
- **Human Resources (HRMS)** service; **Logistics** service.
- Support and Accounting REST endpoints.

### Changed
- Migrated module pages onto REST/OData service clients (Sales, Accounting, Marketing, Invoices, Orders, Quotes).
- Strengthened the OData engine; refactored strongly-typed identifiers.
- Refactored monetary types to decimal precision.
- Improved invoice, order and quote grids.

### Fixed
- Cart-management, data-grid and request-header defects.

## [2.3.0] - 2024-06-13 — Microservices & SDK Platform

### Added
- **Commerce, Catalog, Licensing and Learning** services; the **Forex V3** multi-currency service.
- A **C# API client generator** with OpenAPI/Swagger annotations; Postman collections.
- Item images, category management, and merchant & blog features.

### Changed
- Centralized business logic in the Application layer (CQRS).
- Moved database providers behind repository interfaces.
- Modernized the codebase (primary constructors, file-scoped namespaces).

### Fixed
- Catalog, cart and tenant-validation defects.

## [2.2.0] - 2024-02-22 — Services & Identity

### Added
- **Marketplace** and **Accounting** services.
- **OpenID Connect** identity with external-provider configuration; identity-management endpoints.
- **GraphQL** server API.
- Postman collections and an OpenAPI server option.

### Changed
- Improved the Holders & Tenants and Security services, and the role/permission system.
- Pipeline reporting and developer tooling.

### Fixed
- GraphQL server, Studio assembly loading and authentication-token defects.

## [2.1.0] - 2023-12-20 — Platform Re-Architecture

### Added
- **CQRS** architecture with use-case dispatch and the **Projections** pattern.
- Repository pattern across all data access.
- **Accounting** module; shopping **Cart** service; theming micro-service.
- **Container (Docker)** support and images; load-test pipeline.
- Dedicated **Development, QA and Testing** environments.
- In-Studio full-text **search**; React + Redux client support.

### Changed
- **Re-architected the platform onto Clean Architecture**.
- Overhauled the Studio UI on **FluentUI**, with a new breadcrumb and navigation system.
- Upgraded to **.NET 8**.
- Improved the domain model, module loading and dependency injection.

### Fixed
- Tenant-initialization and workflow-execution defects; cart creation and persistence.

## [2.0.0] LTS - 2022-08-11

### Added 

- [ABS] In-Studio UI Improvements.
- [ABS] In-Studio Module Management Engine.
- [ABS] Business Enrollments Management Engine.
- [ABS] Business Applications Management Engine.
- [ABS] Business Security Roles Management Engine.
- [ABS] Business Security Permissions Management Engine.
- [ABS] Business Security Certificates Management Engine.
- [ABM] `ILicensingService` and default implementation (`LicensingService`).
- [ABM] `ISubscriptionsService` and default implementation (`LicensingService`).
- [ABM] `ISecurityCertificatesService` and default implementation  (`SecurityCertificatesService`).
- [ACL] Adds `pt-PT` Translations.
- [ACL] Adds `pt-BR` Translations.
- [ACL] Adds `de-DE` Translations.
- [ACL] Adds `it-IT` Translations.
- [ACL] Adds `fr-FR` Translations.
- [ACL] Enables Licensing Engine (ABS Now requires a license).

### Fixed
- [ABM] COA importing capabilities on Accounting Service.
- [ABS] Error when navigating to the Fiscal Authorities page.
- [ABS] Virtualize License Types List on Licenses Modal Form.
- [ABS] Virtualize Subscription Plans List on Subscriptions Modal Form.
- [ABS] Error when navigating to new created Organization (Contact) details page.

### Changed
- [ABS] Update Studio Base Theme for V2.
- [ABM] Improve `SecurityHelpers` class.
- [ABM] Improve overall performance & memory consumption.

## [1.9.0] - 2022-07-20

### Fixed
- [ABS] UI Improvements for UI & Core Components.
- [ABS] Contextual Menu showing when no business is selected.
- [ABP] Improve DI Tree for most services.

## [1.8.0] - 2022-07-04

### Added
- [ABS] Dark Theme Support for Studio.
- [ABP] OData Support for REST Endpoints.
- [ABM] `ICookiesService` and default implementation (`CookiesService`).
- [ABM] `IDataProtectionService` and default implementation (`DataProtectionService`).
- [ABM] `IBrowserStorageService` and default implementation (`BrowserStorageService`).

### Changed
- [ABS] Update Studio Base Theme for V2.
- [ABS] Improve Studio Menus & Mobile Layout.

### Fixed
- [APS] NullRedException on SecurityDataService due to DI misconfiguration.

## [1.7.2] - 2022-06-04

### Added
- [ABM] `IWebUIService` and default implementation (`WebUIService`).
- [ABM] `IDateTimeService` and default implementation (`DateTimeService`).

### Changed
- [ABS] Register Fluent UI & Fast Design Layout Contexts.
- [ABP] Register `IWebUIService` default implementation (`WebUIService`) as Singleton Service.
- [ABP] Register `IDateTimeService` default implementation (`DateTimeService`) as Singleton Service.


## [1.7.1] - 2022-06-04

### Fixed
- [ABS] Quick Panels causing UI deadlocks.

## [1.7.0] - 2022-06-04

### Added
- [ABS] Studio Static Asset Bundles

### Changed
- [ABS] Improve Country Flag Rendering.
- [ABS] Improve Country Flag Rendering.
- [ABS] Improve Studio Rendering Process.
- [ABM] Improve Curriculum Relations.
- [ACL] Update dependencies to the latest stable versions.

## [1.6.0] - 2022-05-28

### Added
- [ABM] Gig Entity to Database Scheme.
- [ABM] GigApplication Entity to Database Scheme.

## [1.5.9] - 2022-05-27

### Fixed
- [ABM] IContactService's default implementation is now using ICrmDataService.

## [1.5.8] - 2022-05-26

### Added
- [ABM] IContactService's default implementation is now using per-operation Data Context instances.

## [1.5.7 - 2022-05-25
### Added
- [ABS] ContactSyncronizationStrategy on PortalContext.

## [1.5.6] - 2022-05-23

### Fixed
- [ABS] Fix error on Studio Modules Loading Process. More assemblies than necessary used to be passed to the router.
- [ABM] Adds additional properties to Alliance Business Model for Job Board Applications.
- [ABM] Adds V1.5.6 ABM Migration for MySQL, MS SQL, and Oracle Data Providers.

## [1.5.5] - 2022-05-22

### Added
- [ACL] Brazorize Library Dependency.

### Fixed

- [ABP] Improved ServiceLifetime consistency across default service implementations.
- [ABS] Improved Studio Rendering Process.

### Changed

- [ACL] Update dependencies to the latest stable versions.
- [ABS] IAcademyDataService and AcademyDataService are now ILmsDataService and LmsDataService respectively.

## [1.5.4] - 2022-05-19

### Changed

- [ABM] Squash migrations for MySQL.
- [ABP] Update Service Registration Lifetime.
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Improve Academy Pages to use new methods on IAcademyService.
- [ABM] Use new scoped for Scoped Services used over Singleton Services.
- [ABM] Adds GetStudentCoursesAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetStudentProfilesAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetCourseEnrollmentAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetCourseEnrollmentsAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetInstructorCoursesAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetInstructorProfilesAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetCourseCompletionCertificatesAsync method to IAcademyService and Default Implementation.


### Fixed

- [ABS] Studio wasn't using the SelectedBusinessID for each holder, thus, when reloaded, business selection used to get override with null.


## [1.5.3] - 2022-05-15

### Changed
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Refactor Static Assets to improve package installation time.


## [1.5.1] - 2022-05-14

### Changed
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Improve UI Rendering Process.


## [1.5.0] - 2022-05-13

### Changed
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Improve UI Rendering Process.


## [1.4.1] - 2022-05-12

### Added
- [ABM] ICmsDataService.
- [ABM] ICrmDataService.
- [ABM] ISocialDataService.
- [ABM] IMarketplaceDataService.
- [ABM] ISecurityDataService.
- [ABM] IGlobalDataService.
- [ABM] IForexDataService.
- [ABS] CodeEditorComponent with Monaco Editor.

### Fixed
- [ABS] Fixed Workflows Studio Designer not displaying on production.
- [ABM] Improve IPricingService implementations to always use the latest data to perform generic/historical/extensible/customizable multi-currency amount calculations.

### Changed
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Theming Engine now relies on interface services on the Alliance Business Model.
- [ABS] Theming Engine now relies on default service implementations on the Alliance Business Model.
- [ABS] PortalContext is now optimized to use DataServices.
- [ABS] StudioContext is now more efficient through PortalContext Optimization.
- [ABS] `Studio.Core` now contains the layout, components, and utilities for the ABS Studio.
- [ABS] Academy Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Admin Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Wallet Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Holders Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Tenants Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Social Network is now an independent dll compatible with `Studio.Core.`
- [ABS] Support Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Developer Portal is now an independent dll compatible with `Studio.Core`.

### Removed
- [ABM] I 

## [1.4.0] - 2022-01-12

### Added

- [ACL] .NET 6.0 Support.
- [ABS] In-Studio Cart.
- [ABS] In-Studio Store.
- [ABS] In-Studio Wallet.
- [ABS] In-Studio Academy.
- [ABS] In-Studio Networks.
- [ABS] In-Studio JobBoard.
- [ABS] Lead Form Component.
- [ABS] Newsletter Form Component.
- [ABS] Create Business Modal Form.
- [ABS] Email Template Editor Pages.
- [ABS] Token Management Options Page.
- [ABS] Stock Items Categorizer.
- [APS] EN-US, ES-CO Localizations.
- [APS] Account Mgmt. Email Alerts.
- [APS] Google ReCaptcha Service.
- [APS] Certificates Manager Service.
- [APS] OAuth & IODC Service Support.
- [ABS] Social Feeds & Post Reactions Bar.
- [ABS] PortalContext Country Selector Form.
- [ABS] PortalContext Currency Selector Form.
- [ABS] PortalContext Language Selector Form.
- [ABS] Monaco Editor Component for WebContent.
- [ABM] AccountHolder Birthday & Gender Properties
- [ABM] IPortalContext Interface and default implementation (PortalContext Class)
- [ABM] ISocialDataService Interface and default implementation (SocialDataService Class)
- [ABM] IAssembliesService Interface and default implementation (AssembliesService Class)
- [ABM] IPaymentsService Interface and default implementation (BankTransferPaymentsService Class)
- [ABM] IStorageService Interface & implementation (FileSystemStorageService, AzureStorageStorageService & AwsS3StorageService Classes)

### Changed
- [ACL] Updated Dependencies to the latest version
- [ABM] Improved Queries
- [ABM] Improved MarketplaceData
- [ABM] Improved Memory Allocation
- [ABS] Studio Dashboard Icons.

### Removed
- [ACL] Remove deprecated dependencies

### Fixed
- [ABS] Portal & Tenant Selector.
- [ICX] Duplicated Recently Viewed Product Records.
- [ABS] Fix Invoice Outliner Glitch.
- [ABS] Fix Web Installer Versioning Glitch.
- [ABS] Fix FHIR Server Pooling Glitch.
- [ABS] Fix Portal Domain Bindings.
- [ABS] Fix Network Dashboard Deadlock on IP Verification.

## [1.3.0] - 2021-07-12

### Added
- [ABM] Oracle Database Provider.
- [ABM] IOptionsService Interface and default implementation (OptionsService)

### Changed
- [ACL] Updated Dependencies to the latest version.

### Removed
- [ACL] Remove deprecated dependencies.

### Fixed
- [ABS] Fix Workflows Data Provider (LiteSQL)
- [ABM] Entities Disambiguation


## [1.2.1] - 2021-07-13 
### Added
- [ABS] View Rendering Cache
- [ABS] AppDomain Assembly Scoping


## [1.2] - 2021-07-12
### Added
- [ABS] Razor Theming Engine
- [ABS] Custom Options Manager (API)
- [ABS] Portal Option Manager (UI)
- [ABS] Custom Portal Option Definitions
- [ABS] Virtual SPA Support (Angular/React)
- [ABS] Custom Service Endpoint Definitions

## [1.1.9] - 2021-06-30
### Added
- [ABS] Theme Precompilation

## [1.1.8] - 2021-06-18

### Added
- [ABS] Workflows Capability


## [1.1.7] - 2021-06-06
### Added
- [ABS] Log Viewer
- [ABS] Template Views
- [ABS] View Components
- [ABS] Blog Post Editor
- [ABS] Drag 'n Drop Live Editor. (Preview)
- [ABS] Support for Angular and React+Redux SPAs
- [ABS] Initial Web Content (Editable Pages, Components & Templates)
- [ABS] Internal Web Content (Sys locked Pages, Components & Templates)
- [ABS] Frontend Admin Bar
- [ABS] Invoice Outliner
- [ABS] Invoice Manager
- [ABM] Marketing Module Models
- [ABS] Project Service Models
- [ABM] LMS Service Models
- [ABS] Add support for Bootstrap CSS
- [ABS] Add support for Foundation CSS
- [ABS] Adds support for Fabric JS and Fluent UI.
- [ABS] Ensure non-existence of viral licensed libraries. (e.g GNU)
- [ABS] Adds IViewBuffer, Resx, and Model Resolver to Theming Engine
- [ABS] Adds Localization String Manager. Initial Localization Capabilities.

### Changed
- [ABS] Fix HTTP context access on IIS making the installation process fail.
- [ABS] Fix HTTP context access on IIS when trying to create a new view.
- [ABS] Fix HTTP context access on IIS when trying to edit a new view.
- [ABS] Fix HTTP context access on IIS when trying to create a new post.
- [ABS] Fix HTTP context access on IIS when trying to edit a new post.
- [ABM] Fiscalization document Models
- [ABM] Project Service document Models
- [ABM] Pricing engine Models
- [ABM] Workflow engine Models
- [ABM] Web Content Records now share a single base class
- [ABM] ItemPriceList is now a PriceListRecord.
- [ABS] Fix error when referencing scripts into a Web Content being malformed by Theming engine.
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
- [ABS] Extension Updates Page
- [ABS] Razor Theming Engine
- [APS] Google Authentication
- [APS] Facebook Authentication
- [APS] Microsoft Authentication
- [APS] Twitter Authentication
- [APS] LinkedIn Authentication
- [APS] Instagram Authentication
- [APS] Github Authentication
- [SEO] Zift 123 Analytics Script Integration
- [SEO] Facebook Pixel Integration
- [SEO] Facebook Chat Widget Integration
- [SEO] Google Analytics integration
- [SEO] Google Merchant Center integration
- [SEO] Google Verification Code Integration
- [SEO] Google Tag Manager Integration
- [SEO] Bing Verification code integration
- [SEO] Pinterest verification code integration 
- [SEO] Dynamic Structured Metadata
- [UI] Adds Off-Canvas Cart Slider
- [UI] Dynamic Top Bar content
- [UI] Logo size customization options
- [UI] Footer Dynamic Content
- [UI] Footer/Header Dynamic styling


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
- Adds ABP Proxy
- Missing ACL configuration Types
- ABS Extensions Gallery
- ABS Extensions Installer
- ABS Web Installer
- ABS Admin Portal
- Dynamic Web Page/Post creation
- Assembly Explorer
- Roles and Permissions Explorer
- Admin Dashboard Initials
- Added support for SixLabors.ImageSharp.Web
- Forex service data is now scraped by Alliance Business Systems.
- Data Services are not coded to replaceable interface implementation.
- ABS.Hub project now contains everything we need to create a new ABS Instance.
- Added support for IdentityServer4 as a replacement for Alliance Passport Services.
- ACL.Licensing is now a part of the Alliance Business Suite.


### Changed

- Extracts interface for ACL configuration Types
- ACS is now ABP.BotEngine
- Plugin Manager is now loosely coupled to IPluginManager
- Adds File Manager and FileSystem Service
- Adds antivirus scanning extension for FileSystem Service (Windows Defender)
- AccountHolder is now the standard identity class.
- Fix minor UI glitches and broken links.
- Fix several bugs on application startup and related extensions.

### Removed
- Data Helpers marked for deprecation.
- ABS.Nucleus was deprecated and is no longer a part of this project.

## [1.1.1.x] - 2021-01-20
### Added
- Adds ABP Proxy
- Adds Infinity Comex Support
- Missing ACL configuration Types

### Changed
- Fix Namespaces
- ABS.Portal.Paperbits is now ABS.Portal.Editor
- Adds ABS.Portal.UI Components (20+ View Components)

### Removed


## [1.1.0.x] - 2021-01-12
### Added
- Nuget Packages @1.1.0
- Initial Portal Admin Blazor Application at route /admin.

### Changed
- Standardize namespace at v1.1.0

### Removed

## [1.0.0.x] - 2020-12-31

### Added
- Authentication / User Management / Profile Management
- Authorization / Roles Management / Granular Permissions
- Blazor Support
- Cross-Platform Database Support ( MySQL, MSSQL )
- Dynamic CSS/Lazy Loading
- Dynamic Page Compositing Model / Site & Page Management
- Dynamic Routing
- Dynamic Swagger Specs
- EF Core Migrations for Database Installation / Upgrade
- Enabled for Infinity Comex (eCommerce Extension)
- Event Logging / Audit Trail
- Extensibility via Custom Modules
- Extensibility via Custom Themes
- Folder / File Management (Azure Storage, File System)
- graphql API with Voyager, GraphiQl y GraphQl Playground
- Headless API with Swagger Support
- HealthCheck Rules with UI Support
- i18n Enabled (Based on GeoAPI and Custom Settings)
- Improved JavaScript reference support
- In-App CLI (Studio Commander)
- Infinity Comex Support (ABS eCommerce Engine)
- JavaScript Lazy Loading
- Modular Architecture
- Multi-Currency Support
- Multi-Portal ( Monolith & Micro-Service Distributed )
- Multi-Tenant ( Shared Database & Isolated Database )
- Notifications / Email Delivery
- Notifications / SMTP Delivery
- Progressive Web Application Support
- Recycle Bin
- REST API with Swagger Support
- Scheduled Flows ( Background Processing )
- Scheduled Jobs ( Background Processing )
- Seamless Upgrade Experience
- Slack integration (OAuth)
- Support For Additional Authentication Providers (OAuth)