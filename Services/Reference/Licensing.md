# Licensing service

The Licensing service lets you read the licenses your workspace holds, define the license types you work with, and see your workspace's usage.

**Who uses it:** developers and administrators who track what a workspace is licensed for and how much of it the workspace uses.

**Base route:** `/api/v2/LicensingService/...`

## What you can do

- **Read your licenses:** list and count the licenses your workspace owns, and read one. You can also create, update and delete license records.
- **Define license types:** keep license types, with the features and attributes each one includes.
- **Update a licensing certificate:** patch the details of a licensing certificate.
- **See your usage:** read your workspace's usage per license: the plan, the current period and, for each licensed allowance, what you have consumed and what happens at the limit.
- **Read the usage meters:** list every usage meter, with its unit and the licensed allowance it counts against.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** `licenses_read`, `licenses_create`, `licenses_update` and `licenses_delete`. Reading usage and meters needs `licenses_read`.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `LicensingService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## LicenseAttributes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LicensingService/LicenseAttributes` | `licenses_read` | Workspace member | Get all license attributes |
| POST | `/api/v2/LicensingService/LicenseAttributes` | `licenses_create` | Workspace member | Create a new license attribute |
| GET | `/api/v2/LicensingService/LicenseAttributes/Count` | `licenses_read` | Workspace member | Get license attributes count |
| GET | `/api/v2/LicensingService/LicenseAttributes/{id}` | `licenses_read` | Workspace member | Get license attribute by ID |
| PUT | `/api/v2/LicensingService/LicenseAttributes/{id}` | `licenses_update` | Workspace member | Update a license attribute |
| PATCH | `/api/v2/LicensingService/LicenseAttributes/{id}` | `licenses_update` | Workspace member | Patch a license attribute |
| DELETE | `/api/v2/LicensingService/LicenseAttributes/{id}` | `licenses_delete` | Workspace member | Delete a license attribute |

## LicenseFeatures

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LicensingService/LicenseFeatures` | `licenses_read` | Workspace member | Get all license features |
| POST | `/api/v2/LicensingService/LicenseFeatures` | `licenses_create` | Workspace member | Create a new license feature |
| GET | `/api/v2/LicensingService/LicenseFeatures/Count` | `licenses_read` | Workspace member | Get license features count |
| GET | `/api/v2/LicensingService/LicenseFeatures/{id}` | `licenses_read` | Workspace member | Get license feature by ID |
| PUT | `/api/v2/LicensingService/LicenseFeatures/{id}` | `licenses_update` | Workspace member | Update a license feature |
| PATCH | `/api/v2/LicensingService/LicenseFeatures/{id}` | `licenses_update` | Workspace member | Patch a license feature |
| DELETE | `/api/v2/LicensingService/LicenseFeatures/{id}` | `licenses_delete` | Workspace member | Delete a license feature |

## LicenseTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LicensingService/LicenseTypes` | `licenses_read` | Workspace member | Get all license types |
| POST | `/api/v2/LicensingService/LicenseTypes` | `licenses_create` | Workspace member | Create a new license type |
| GET | `/api/v2/LicensingService/LicenseTypes/Count` | `licenses_read` | Workspace member | Get license types count |
| GET | `/api/v2/LicensingService/LicenseTypes/{id}` | `licenses_read` | Workspace member | Get license type by ID |
| PUT | `/api/v2/LicensingService/LicenseTypes/{id}` | `licenses_update` | Workspace member | Update a license type |
| PATCH | `/api/v2/LicensingService/LicenseTypes/{id}` | `licenses_update` | Workspace member | Patch a license type |
| DELETE | `/api/v2/LicensingService/LicenseTypes/{id}` | `licenses_delete` | Workspace member | Delete a license type |

## Licenses

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LicensingService/Licenses` | `licenses_read` | Workspace member | Get licenses |
| POST | `/api/v2/LicensingService/Licenses` | `licenses_create` | Workspace member | Create a new license |
| GET | `/api/v2/LicensingService/Licenses/Count` | `licenses_read` | Workspace member | Get licenses count |
| GET | `/api/v2/LicensingService/Licenses/{licenseId}` | `licenses_read` | Workspace member | Get license by ID |
| PUT | `/api/v2/LicensingService/Licenses/{licenseId}` | `licenses_update` | Workspace member | Update a license |
| DELETE | `/api/v2/LicensingService/Licenses/{licenseId}` | `licenses_delete` | Workspace member | Delete a license |

## LicensingCertificates

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| PATCH | `/api/v2/LicensingService/LicensingCertificates/{id}` | `licenses_update` | Workspace member | Patch a licensing certificate |

## Usage

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LicensingService/Usage` | `licenses_read` | Workspace member | Get the tenant's usage |
| GET | `/api/v2/LicensingService/Usage/Meters` | `licenses_read` | Workspace member | Get the usage meter registry |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
