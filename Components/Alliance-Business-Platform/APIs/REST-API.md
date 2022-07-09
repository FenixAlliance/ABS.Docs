# Welcome to the Alliance Business Platform REST API reference for the v2.0 endpoint.

[[_TOC_]]

API sets on the <a href="https://absuite.net/api/v2/documentation/index.html" target="_blank">ABS REST endpoint v2.0</a>
 are in general availability \(GA\) status, and have gone through a review-and-feedback process with customers to meet practical, production needs. Updates to APIs on this endpoint are additive in nature and do not break existing app scenarios.


Representational State Transfer (REST) APIs are service endpoints that support sets of HTTP operations (methods), which provide create, retrieve, update, or delete access to the service's resources. This section will give you an overall overview of processes like:

- How to call ABP REST APIs with Postman, CURL and the Powershell SDK.
- Common use cases for the ABP REST API.
- The basic components of a REST API request/response pair.
- How to register your client application with ABP Identity and access management (IAM) to secure your REST requests.
- Overviews of creating and sending a REST request, and handling the response.
- Additional resources about versioning and support contact information.

## How to call the ABP REST APIs with Postman
The following video will show you how to quickly authenticate with the [ABP REST API Authentication Endpoints](https://fenixalliance.com.co/api/v2/documentation) via the client id/secret method. We encourage you to continue reading below to learn about what constitutes a REST operation, but if you need to quickly call the APIs, this video is for you.

```javascript
// TODO: ADD Video explaining Postman process.
```
```javascript
// TODO: ADD Video explaining CURL process.
```
```javascript
// TODO: ADD Video explaining Powershell SDK process.
```

## Available Endpoint Sets - REST API Reference Browser 

The Alliance Business Platform REST API has been decoupled into modular, consumable REST Endpoint Sets as follows:

- ### Auth Set
- ### Holders Set
- ### Tenants Set
- ### Global Data Set

The [ABP REST API Browser](https://absuite.net/api/v2/documentation) – is a tool to allow internal and external developers to get the most out of the REST APIs from Fenix Alliance. If you have any feedback, create a new issue in the FenixAlliance/feedback repo on GitHub.

## OData Support
OData (Open Data Protocol) is an ISO/IEC approved, OASIS standard that defines a set of best practices for building and consuming REST APIs. It enables creation of REST-based services which allow resources identified using Uniform Resource Locators (URLs) and defined in a data model, to be published and edited by Web clients using simple HTTP messages.

OData is fully integrated ont the Alliance Business Platform to help developers to focus on business logic without worrying about the various API approaches to define request and response headers, status codes, HTTP methods, URL conventions, media types, payload formats, query options, etc. It provides guidance for tracking changes, defining functions/actions for reusable procedures, and sending asynchronous/batch requests.

### About the OData Protocol
The OData Protocol is an application-level protocol for interacting with data via RESTful interfaces. It supports the description of data models, editing and querying of data according to those models. REST APIs that are based on OData are easy to discover and consume due to the OData metadata, a machine-readable description of the data model which renders in a human readable format and enables the creation of powerful generic client proxies and tools.

OData improves semantic interoperability between systems and follows these design principles:

- Follow REST principles.
- Keep it simple. Address the common cases and provide extensibility where necessary.
- Build incrementally. A very basic, compliant service should be easy to build, with additional work necessary only to support additional capabilities.
- Extensibility is important. Services should be able to support extended functionality without breaking clients unaware of those extensions.
- Prefer mechanisms that work on a variety of data sources. In particular, do not assume a relational data model.

The OData Protocol is different from other REST-based web service approaches in that it provides a uniform way to describe both the data and the data model. This improves semantic interoperability between systems and allows an ecosystem to emerge. It follows these design principles:

## Common use cases 

The power of the Alliance Business Platform REST API Engine lies in being able to easily extend the Alliance Business Suite across different business-cases through services exposed on several REST endpoints.

A number of these services are designed to enable rich scenarios around Alliance ID Tenants and around Business Contexts.

### User-centric use cases in v2.0

1. Get the profile and photo of Anna, an Alliance ID Holder.
1. Get the profile information about Anna's Business Enrollments \(BPRs\) and IDs of her direct relations.
1. Access Anna's files on Alliance ID User Storage, find the identity of the last person who modified a file on Anna's enrolled businesses, and navigate to that person's social profile.
1. Access Anna's follows and followers on the Alliance ID Network, get information and manage their relationships and navigate to their profile endpoint.
1. Manage Subscriptions and communication options and track changes in Anna's change-log.
1. Set automatic replies and social statuses when Lisa is away from the office.
1. Get the people who are most relevant to Lisa, based on communication, collaboration, social activity, and business relationships.
1. Get Anna's projects and assigned tasks.
1. Get Anna's cart status, place and manage products, services, and cloud resource orders.
1. Navigate through Anna's wallet endpoints, which allow developers to extend their Anna's experience and easily conduct transactions directly trough their Alliance ID Wallet's secure federated payment capabilities.
1. Get Anna's notifications and filter the output through query parameters.
1. Set automatic reminder's on Anna's calendar. \(Soon at Winter Update\)

### Business use cases in v2.0

1. Run a report on an organization Anna belongs to and identify the group with the most communication among group members.
1. Run a report on the amounts of unpaid invoices, filtering through data using OData (Open Data Protocol).



## Other API versions

There are currently 2 versions of the Alliance ID REST APIs - v2.0 and v2.1 \(still in beta\). Be aware that APIs in beta status is subject to change, and may break existing scenarios without notice. Don't take a production dependency on APIs in the beta endpoint. Be aware that V1.x endpoints and SDKs were deprecated as of 31/12/2015  and are no longer functional.

Find more information about versioning and support.

## Connect with us

Are there additional APIs or features you'd like to see in the AiD API? Post new feature requests on UserVoice.

Have feedback for existing Fenix Alliance API Endpoints? Connect with us on [Github](https://github.com/fenixalliance).

