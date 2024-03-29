# Alliance Business Suite Components

## The Alliance Business Suite is composed out of 5 Components.

The Alliance Business Suite was architected as a modular Application Framework. This means that components are able to work without their higher-level components. The lowest Component is the Alliance Core Libraries Component and the highest Component is the Alliance Business Studio Component.


![ABS Components.jpg](/.attachments/ABS%20Components-7ac6c5e0-f6cb-42b2-be6b-9219a6ec14e5.jpg)


## [Alliance Core Libraries](/Components/Alliance-Core-Libraries.md)

The Alliance Core Libraries contains the core abstractions and default implementations required by the Alliance Business Model and dependent components. It is also the external dependency source for the entire Alliance Business Suite, which means that external dependencies, which are dependencies outside the `FenixAlliance.*` namespace are referred to by the `FenixAlliance.ACL.Deps` Package, which is the base ACL Package and, therefore, it could be referred to as the Core Package.

For more information on the dependency tree, design overview and external dependencies, please refer to [Advanced Topics](/Advanced.md).

## [Alliance Business Model](/Components/Alliance-Business-Model.md)

The Alliance Business Model is a declarative specification and definition of standard entities that represent commonly used concepts and activities across business and productivity applications and is being extended to observational and analytical data as well. ABM provides well-defined, modular, and extensible business entities such as Account, Business Unit, Case, Contact, Lead, Opportunity, and Items (Products/Services), as well as interactions with vendors, workers, and customers, such as activities and service level agreements. that serve as the dynamic data layer for the entire Alliance Business Suite.

Anyone can build on and extend ABM definitions to capture additional business-specific scenarios.

## [Alliance Passport Service](/Components/Alliance-Passport-Service.md)

The Alliance Passport Service enables developers and non-developers alike 
The Alliance Passport Service is an Authentication/Authorization Engine designed to enable customers to easily configure and manage businesses identity scenarios by assigning (or connecting) a digital identity to their contacts, whether they are customers, employees, partners, guests, and more. 

It also provides common features for managing authentication, authorization, data protection, HTTPS enforcement, app secrets, XSRF/CSRF prevention, and CORS management. These security features allow you to build robust, yet secure Alliance Business Suite apps.


## [Alliance Business Platform](Components/Alliance-Business-Platform.md)

The Alliance Business Platform is a Modular API Framework. It leverages .NET 5.0 with the best of REST, SignalR, GraphQl y gRPCto transact with the Alliance Business Model Schema (AMB). The Alliance Business Platform is an open-source and cross-platform framework for integrating next-generation functionalities into your applications. It allows you to build spectacular single-page apps using .NET and C# with or without JavaScript. ABP apps can connect and transact to the data layer (The Alliance Business Modal Schema) using any language through standard requests through the various GrPC, HTTP, and GraphQL Endpoints. 

Anyone can build on and extend The Alliance Business Platform through ASP.NET + Angular / React (And pretty much any Framework), to capture additional business-specific scenarios.

## [Alliance Business Studio](/Components/Alliance-Business-Studio.md)

The Alliance Business Studio is the Graphical Administration Engine for the Alliance Business Suite. It allows users to manage their implementations, transact data through the Alliance Business Platform, generate and consume views, reports, customize and extend the system, and much more.

Anyone can build on and extend The Alliance Business Studio to capture additional business-specific scenarios.


## [Alliance Business Cloud](Online-Services/Alliance-Business-Cloud.md)

The Alliance Business Cloud is an HTTP-based service for hosting Alliance Business Suite Instances and other kinds of applications. These can be developed in your favorite language, be it .NET, .NET Core, Java, Ruby, Node.js, PHP, or Python. Applications run and scale with ease on both Windows-based environments.

The Alliance Business Cloud not only adds the power of Microsoft Azure to your Alliance Business Suite instance, such as security, load balancing, autoscaling, and automated management features; You can also take advantage of its DevOps capabilities, such as continuous deployment from Azure DevOps, GitHub, Docker Hub, and other sources, package management, staging environments, custom domain, and free/paid TLS/SSL certificates.

With Alliance Business Cloud, you pay for the compute resources you use. The compute resources you use are determined by the Service plan that you run your Alliance Business Suite instance on.
