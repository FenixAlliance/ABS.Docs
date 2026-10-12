# Service management service

The Service management service lets you define the services you deliver and track each service case from request to delivery.

**Who uses it:** developers who connect service desks, field service apps or customer portals to a workspace.

**Base route:** `/api/v2/ServicesService/...`

## What you can do

- **Define your services:** create and update the services you offer, and the service levels of each one.
- **Agree on service levels:** keep the service level agreements that apply to your cases.
- **Track service cases:** open a case for a customer with its instructions, work location and promised dates, and classify it with a case type.
- **Route the work:** keep service queues and place each case in the queue that handles it.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every call.
- **Permissions:** `services_read`, `services_create`, `services_update` and `services_delete` cover every call in this service.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `ServicesService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## ServiceCaseTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ServicesService/ServiceCaseTypes` | `services_read` | Workspace member | Get all service case types |
| POST | `/api/v2/ServicesService/ServiceCaseTypes` | `services_create` | Workspace member | Create a service case type |
| GET | `/api/v2/ServicesService/ServiceCaseTypes/Count` | `services_read` | Workspace member | Get service case types count |
| GET | `/api/v2/ServicesService/ServiceCaseTypes/{serviceCaseTypeId}` | `services_read` | Workspace member | Get a service case type by ID |
| PUT | `/api/v2/ServicesService/ServiceCaseTypes/{serviceCaseTypeId}` | `services_update` | Workspace member | Update a service case type |
| PATCH | `/api/v2/ServicesService/ServiceCaseTypes/{serviceCaseTypeId}` | `services_update` | Workspace member | Patch a service case type |
| DELETE | `/api/v2/ServicesService/ServiceCaseTypes/{serviceCaseTypeId}` | `services_delete` | Workspace member | Delete a service case type |

## ServiceCases

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ServicesService/ServiceCases` | `services_read` | Workspace member | Get all service cases |
| POST | `/api/v2/ServicesService/ServiceCases` | `services_create` | Workspace member | Create a service case |
| GET | `/api/v2/ServicesService/ServiceCases/Count` | `services_read` | Workspace member | Get service cases count |
| GET | `/api/v2/ServicesService/ServiceCases/{serviceCaseId}` | `services_read` | Workspace member | Get a service case by ID |
| PUT | `/api/v2/ServicesService/ServiceCases/{serviceCaseId}` | `services_update` | Workspace member | Update a service case |
| PATCH | `/api/v2/ServicesService/ServiceCases/{serviceCaseId}` | `services_update` | Workspace member | Patch a service case |
| DELETE | `/api/v2/ServicesService/ServiceCases/{serviceCaseId}` | `services_delete` | Workspace member | Delete a service case |

## ServiceLevelAgreements

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ServicesService/ServiceLevelAgreements` | `services_read` | Workspace member | Get all service level agreements |
| POST | `/api/v2/ServicesService/ServiceLevelAgreements` | `services_create` | Workspace member | Create a service level agreement |
| GET | `/api/v2/ServicesService/ServiceLevelAgreements/Count` | `services_read` | Workspace member | Get service level agreements count |
| GET | `/api/v2/ServicesService/ServiceLevelAgreements/{serviceLevelAgreementId}` | `services_read` | Workspace member | Get a service level agreement by ID |
| PUT | `/api/v2/ServicesService/ServiceLevelAgreements/{serviceLevelAgreementId}` | `services_update` | Workspace member | Update a service level agreement |
| PATCH | `/api/v2/ServicesService/ServiceLevelAgreements/{serviceLevelAgreementId}` | `services_update` | Workspace member | Patch a service level agreement |
| DELETE | `/api/v2/ServicesService/ServiceLevelAgreements/{serviceLevelAgreementId}` | `services_delete` | Workspace member | Delete a service level agreement |

## ServiceLevels

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ServicesService/ServiceLevels` | `services_read` | Workspace member | Get all service levels |
| GET | `/api/v2/ServicesService/ServiceLevels/Count` | `services_read` | Workspace member | Get all service levels count |
| GET | `/api/v2/ServicesService/Services/{serviceId}/ServiceLevels` | `services_read` | Workspace member | Get all service levels |
| POST | `/api/v2/ServicesService/Services/{serviceId}/ServiceLevels` | `services_create` | Workspace member | Create a service level |
| GET | `/api/v2/ServicesService/Services/{serviceId}/ServiceLevels/Count` | `services_read` | Workspace member | Get service levels count |
| GET | `/api/v2/ServicesService/Services/{serviceId}/ServiceLevels/{serviceLevelId}` | `services_read` | Workspace member | Get a service level by ID |
| PUT | `/api/v2/ServicesService/Services/{serviceId}/ServiceLevels/{serviceLevelId}` | `services_update` | Workspace member | Update a service level |
| PATCH | `/api/v2/ServicesService/Services/{serviceId}/ServiceLevels/{serviceLevelId}` | `services_update` | Workspace member | Patch a service level |
| DELETE | `/api/v2/ServicesService/Services/{serviceId}/ServiceLevels/{serviceLevelId}` | `services_delete` | Workspace member | Delete a service level |

## ServiceQueues

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ServicesService/ServiceQueues` | `services_read` | Workspace member | Get all service queues |
| POST | `/api/v2/ServicesService/ServiceQueues` | `services_create` | Workspace member | Create a service queue |
| GET | `/api/v2/ServicesService/ServiceQueues/Count` | `services_read` | Workspace member | Get service queues count |
| GET | `/api/v2/ServicesService/ServiceQueues/{serviceQueueId}` | `services_read` | Workspace member | Get a service queue by ID |
| PUT | `/api/v2/ServicesService/ServiceQueues/{serviceQueueId}` | `services_update` | Workspace member | Update a service queue |
| PATCH | `/api/v2/ServicesService/ServiceQueues/{serviceQueueId}` | `services_update` | Workspace member | Patch a service queue |
| DELETE | `/api/v2/ServicesService/ServiceQueues/{serviceQueueId}` | `services_delete` | Workspace member | Delete a service queue |

## Services

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ServicesService/Services` | `services_read` | Workspace member | Get all services |
| POST | `/api/v2/ServicesService/Services` | `services_create` | Workspace member | Create a service |
| GET | `/api/v2/ServicesService/Services/Count` | `services_read` | Workspace member | Get services count |
| GET | `/api/v2/ServicesService/Services/{serviceId}` | `services_read` | Workspace member | Get a service by ID |
| PUT | `/api/v2/ServicesService/Services/{serviceId}` | `services_update` | Workspace member | Update a service |
| PATCH | `/api/v2/ServicesService/Services/{serviceId}` | `services_update` | Workspace member | Patch a service |
| DELETE | `/api/v2/ServicesService/Services/{serviceId}` | `services_delete` | Workspace member | Delete a service |

Generated from the source at commit 05da3e4078.
<!-- generated:end -->
