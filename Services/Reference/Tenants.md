# Tenants service

The Tenants service lets you create workspaces and manage who belongs to them and how each workspace is organized.

**Who uses it:** workspace owners and administrators, and developers who automate workspace setup or membership.

**Base route:** `/api/v2/TenantsService/...`

## What you can do

- **Create and run workspaces.** Create a workspace as any signed-in user, read and update its details, and set or clear the workspace your account opens by default. See [Business tenants](~/Capabilities/Alliance-Passport-Service/Business-Tenants.md).
- **Invite people.** Send, resend and withdraw invitations, and list them by state: pending, redeemed or revoked. The person invited accepts or declines with their own account. See [Business users](~/Capabilities/Alliance-Passport-Service/Business-Users.md).
- **Manage memberships.** List, read, update and remove the memberships (enrollments) in a workspace, and read the permissions, licenses and features each membership holds.
- **Organize the workspace.** Maintain departments, positions, teams, team records and territories. Record employee memberships, and link teams to contacts and projects.
- **Describe the organization.** Maintain the workspace's industries, segments, sizes, types and business relationships.
- **Set up units of measure.** Maintain unit groups and the units inside each group.
- **Store workspace settings.** Read and write workspace options by ID or by key.

## Before you call it

- **Sign in.** Sign in with `POST /login` (your email address and password) to get an access token, and renew it with `POST /refresh`, or use the OpenID Connect flows. See [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md) and [REST API development](~/Web-API-Development/REST-API-Development.md).
- **Name the workspace.** Workspace calls take the workspace from the `X-TenantId` header or the `tenantId` request value. See [Tell us which tenant](~/Web-API-Development/REST-API-Development.md#tell-us-which-tenant). Creating a workspace and answering an invitation need only a signed-in account.
- **Hold the permission.** Each call needs the permission shown in the table, for example `tenants_read`, `tenants_update`, `tenants_manage`, `enrollments_read`, `departments_create`, `positions_update`, `teams_read`, `territories_read` or `units_create`.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `TenantsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## BusinessRelationships

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/BusinessRelationships` | `tenants_read` | Workspace member | Get business relationships |
| POST | `/api/v2/TenantsService/BusinessRelationships` | `tenants_create` | Workspace member | Create a business relationship |
| GET | `/api/v2/TenantsService/BusinessRelationships/Count` | `tenants_read` | Workspace member | Get business relationships count |
| GET | `/api/v2/TenantsService/BusinessRelationships/{businessRelationshipId}` | `tenants_read` | Workspace member | Get business relationship by ID |
| PUT | `/api/v2/TenantsService/BusinessRelationships/{businessRelationshipId}` | `tenants_update` | Workspace member | Update a business relationship |
| DELETE | `/api/v2/TenantsService/BusinessRelationships/{businessRelationshipId}` | `tenants_delete` | Workspace member | Delete a business relationship |

## Departments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/Departments` | `departments_read` | Workspace member | Retrieve a list of tenant departments |
| POST | `/api/v2/TenantsService/Departments` | `departments_create` | Workspace member | Create a new tenant department |
| GET | `/api/v2/TenantsService/Departments/Count` | `departments_read` | Workspace member | Get the count of tenant departments |
| GET | `/api/v2/TenantsService/Departments/{tenantDepartmentId}` | `departments_read` | Workspace member | Retrieve a single tenant department by its ID |
| PUT | `/api/v2/TenantsService/Departments/{tenantDepartmentId}` | `departments_update` | Workspace member | Update a tenant department |
| PATCH | `/api/v2/TenantsService/Departments/{tenantDepartmentId}` | `departments_update` | Workspace member | Patch a tenant department |
| DELETE | `/api/v2/TenantsService/Departments/{tenantDepartmentId}` | `departments_delete` | Workspace member | Delete a tenant department |

## EmployeeEnrollments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/EmployeeEnrollments` | `enrollments_read` | Workspace member | Retrieve a list of tenant employee enrollments |
| POST | `/api/v2/TenantsService/EmployeeEnrollments` | `enrollments_create` | Workspace member | Create a new tenant employee enrollment |
| GET | `/api/v2/TenantsService/EmployeeEnrollments/Count` | `enrollments_read` | Workspace member | Get the count of tenant employee enrollments |
| GET | `/api/v2/TenantsService/EmployeeEnrollments/{tenantEmployeeEnrollmentId}` | `enrollments_read` | Workspace member | Retrieve a single tenant employee enrollment by its ID |
| PUT | `/api/v2/TenantsService/EmployeeEnrollments/{tenantEmployeeEnrollmentId}` | `enrollments_update` | Workspace member | Update a tenant employee enrollment |
| PATCH | `/api/v2/TenantsService/EmployeeEnrollments/{tenantEmployeeEnrollmentId}` | `enrollments_update` | Workspace member | Patch a tenant employee enrollment |
| DELETE | `/api/v2/TenantsService/EmployeeEnrollments/{tenantEmployeeEnrollmentId}` | `enrollments_delete` | Workspace member | Delete a tenant employee enrollment |

## Enrollments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/Enrollments` | `enrollments_read` | Workspace member | Retrieve a list of tenant enrollments |
| POST | `/api/v2/TenantsService/Enrollments` | `enrollments_create` | Workspace member | Create a new tenant enrollment |
| GET | `/api/v2/TenantsService/Enrollments/Count` | `enrollments_read` | Workspace member | Get the count of tenant enrollments |
| GET | `/api/v2/TenantsService/Enrollments/Extended` | `enrollments_read` | Workspace member | Retrieve a list of tenant enrollments |
| GET | `/api/v2/TenantsService/Enrollments/Extended/Count` | `enrollments_read` | Workspace member | Get the count of tenant enrollments |
| GET | `/api/v2/TenantsService/Enrollments/{enrollmentId}` | `enrollments_read` | Workspace member | Retrieve a single tenant enrollment by its ID |
| PUT | `/api/v2/TenantsService/Enrollments/{enrollmentId}` | `enrollments_update` | Workspace member | Update a tenant enrollment |
| PATCH | `/api/v2/TenantsService/Enrollments/{enrollmentId}` | `enrollments_update` | Workspace member | Patch a tenant enrollment |
| DELETE | `/api/v2/TenantsService/Enrollments/{enrollmentId}` | `enrollments_delete` | Workspace member | Delete a tenant enrollment |

## Industries

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/Industries` | `tenants_read` | Workspace member | Retrieve a list of tenant industries |
| POST | `/api/v2/TenantsService/Industries` | `tenants_update` | Workspace member | Create a new tenant industry |
| GET | `/api/v2/TenantsService/Industries/Count` | `tenants_read` | Workspace member | Get the count of tenant industries |
| GET | `/api/v2/TenantsService/Industries/{tenantIndustryId}` | `tenants_read` | Workspace member | Retrieve a single tenant industry by its ID |
| PUT | `/api/v2/TenantsService/Industries/{tenantIndustryId}` | `tenants_update` | Workspace member | Update a tenant industry |
| PATCH | `/api/v2/TenantsService/Industries/{tenantIndustryId}` | `tenants_update` | Workspace member | Patch a tenant industry |
| DELETE | `/api/v2/TenantsService/Industries/{tenantIndustryId}` | `tenants_update` | Workspace member | Delete a tenant industry |

## Invitations

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/Invitations` | `tenants_read` | Workspace member | Retrieve a list of tenant invitations |
| POST | `/api/v2/TenantsService/Invitations` | `tenants_manage` | Workspace member | Send an invitation to a user to join a tenant |
| GET | `/api/v2/TenantsService/Invitations/Count` | `tenants_read` | Workspace member | Get the count of tenant invitations |
| GET | `/api/v2/TenantsService/Invitations/{invitationId}` | `tenants_read` | Workspace member | Get a tenant invitation by its ID |
| DELETE | `/api/v2/TenantsService/Invitations/{invitationId}` | `tenants_manage` | Workspace member | Delete a tenant invitation |
| POST | `/api/v2/TenantsService/Invitations/{invitationId}/Accept` |  | Signed-in user | Accept an invitation to join a tenant |
| POST | `/api/v2/TenantsService/Invitations/{invitationId}/Decline` |  | Signed-in user | Decline an invitation to join a tenant |
| POST | `/api/v2/TenantsService/Invitations/{invitationId}/Resend` | `tenants_manage` | Workspace member | Resend a pending tenant invitation |

## Options

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/Options` | `tenants_read` | Workspace member | Retrieve a list of tenant options |
| POST | `/api/v2/TenantsService/Options` | `tenants_update` | Workspace member | Create a new tenant option |
| GET | `/api/v2/TenantsService/Options/Count` | `tenants_read` | Workspace member | Get the count of tenant options |
| GET | `/api/v2/TenantsService/Options/Key/{key}` | `tenants_read` | Workspace member | Retrieve a single tenant option by its key |
| PUT | `/api/v2/TenantsService/Options/Upsert/{key}` | `tenants_update` | Workspace member | Create or update a tenant option by key |
| GET | `/api/v2/TenantsService/Options/{optionId}` | `tenants_read` | Workspace member | Retrieve a single tenant option by its ID |
| PUT | `/api/v2/TenantsService/Options/{optionId}` | `tenants_update` | Workspace member | Update a tenant option |
| PATCH | `/api/v2/TenantsService/Options/{optionId}` | `tenants_update` | Workspace member | Patch a tenant option |
| DELETE | `/api/v2/TenantsService/Options/{optionId}` | `tenants_update` | Workspace member | Delete a tenant option |

## Positions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/Positions` | `positions_read` | Workspace member | Retrieve a list of tenant positions |
| POST | `/api/v2/TenantsService/Positions` | `positions_create` | Workspace member | Create a new tenant position |
| GET | `/api/v2/TenantsService/Positions/Count` | `positions_read` | Workspace member | Get the count of tenant positions |
| GET | `/api/v2/TenantsService/Positions/{tenantPositionId}` | `positions_read` | Workspace member | Retrieve a single tenant position by its ID |
| PUT | `/api/v2/TenantsService/Positions/{tenantPositionId}` | `positions_update` | Workspace member | Update a tenant position |
| PATCH | `/api/v2/TenantsService/Positions/{tenantPositionId}` | `positions_update` | Workspace member | Patch a tenant position |
| DELETE | `/api/v2/TenantsService/Positions/{tenantPositionId}` | `positions_delete` | Workspace member | Delete a tenant position |

## Segments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/Segments` | `tenants_read` | Workspace member | Retrieve a list of tenant segments |
| POST | `/api/v2/TenantsService/Segments` | `tenants_update` | Workspace member | Create a new tenant segment |
| GET | `/api/v2/TenantsService/Segments/Count` | `tenants_read` | Workspace member | Get the count of tenant segments |
| GET | `/api/v2/TenantsService/Segments/{tenantSegmentId}` | `tenants_read` | Workspace member | Retrieve a single tenant segment by its ID |
| PUT | `/api/v2/TenantsService/Segments/{tenantSegmentId}` | `tenants_update` | Workspace member | Update a tenant segment |
| PATCH | `/api/v2/TenantsService/Segments/{tenantSegmentId}` | `tenants_update` | Workspace member | Patch a tenant segment |
| DELETE | `/api/v2/TenantsService/Segments/{tenantSegmentId}` | `tenants_update` | Workspace member | Delete a tenant segment |

## Sizes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/Sizes` | `tenants_read` | Workspace member | Retrieve a list of tenant sizes |
| POST | `/api/v2/TenantsService/Sizes` | `tenants_update` | Workspace member | Create a new tenant size |
| GET | `/api/v2/TenantsService/Sizes/Count` | `tenants_read` | Workspace member | Get the count of tenant sizes |
| GET | `/api/v2/TenantsService/Sizes/{tenantSizeId}` | `tenants_read` | Workspace member | Retrieve a single tenant size by its ID |
| PUT | `/api/v2/TenantsService/Sizes/{tenantSizeId}` | `tenants_update` | Workspace member | Update a tenant size |
| PATCH | `/api/v2/TenantsService/Sizes/{tenantSizeId}` | `tenants_update` | Workspace member | Patch a tenant size |
| DELETE | `/api/v2/TenantsService/Sizes/{tenantSizeId}` | `tenants_update` | Workspace member | Delete a tenant size |

## TeamContactEnrollments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/TeamContactEnrollments` | `enrollments_read` | Workspace member | Retrieve a list of tenant team contact enrollments |
| POST | `/api/v2/TenantsService/TeamContactEnrollments` | `enrollments_create` | Workspace member | Create a new tenant team contact enrollment |
| GET | `/api/v2/TenantsService/TeamContactEnrollments/Count` | `enrollments_read` | Workspace member | Get the count of tenant team contact enrollments |
| GET | `/api/v2/TenantsService/TeamContactEnrollments/{tenantTeamContactEnrollmentId}` | `enrollments_read` | Workspace member | Retrieve a single tenant team contact enrollment by its ID |
| PUT | `/api/v2/TenantsService/TeamContactEnrollments/{tenantTeamContactEnrollmentId}` | `enrollments_update` | Workspace member | Update a tenant team contact enrollment |
| PATCH | `/api/v2/TenantsService/TeamContactEnrollments/{tenantTeamContactEnrollmentId}` | `enrollments_update` | Workspace member | Patch a tenant team contact enrollment |
| DELETE | `/api/v2/TenantsService/TeamContactEnrollments/{tenantTeamContactEnrollmentId}` | `enrollments_delete` | Workspace member | Delete a tenant team contact enrollment |

## TeamProjectEnrollments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/TeamProjectEnrollments` | `enrollments_read` | Workspace member | Retrieve a list of tenant team project enrollments |
| POST | `/api/v2/TenantsService/TeamProjectEnrollments` | `enrollments_create` | Workspace member | Create a new tenant team project enrollment |
| GET | `/api/v2/TenantsService/TeamProjectEnrollments/Count` | `enrollments_read` | Workspace member | Get the count of tenant team project enrollments |
| GET | `/api/v2/TenantsService/TeamProjectEnrollments/{tenantTeamProjectEnrollmentId}` | `enrollments_read` | Workspace member | Retrieve a single tenant team project enrollment by its ID |
| PUT | `/api/v2/TenantsService/TeamProjectEnrollments/{tenantTeamProjectEnrollmentId}` | `enrollments_update` | Workspace member | Update a tenant team project enrollment |
| PATCH | `/api/v2/TenantsService/TeamProjectEnrollments/{tenantTeamProjectEnrollmentId}` | `enrollments_update` | Workspace member | Patch a tenant team project enrollment |
| DELETE | `/api/v2/TenantsService/TeamProjectEnrollments/{tenantTeamProjectEnrollmentId}` | `enrollments_delete` | Workspace member | Delete a tenant team project enrollment |

## TeamRecords

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/TeamRecords` | `teams_read` | Workspace member | Retrieve a list of tenant team records |
| POST | `/api/v2/TenantsService/TeamRecords` | `teams_create` | Workspace member | Create a new tenant team record |
| GET | `/api/v2/TenantsService/TeamRecords/Count` | `teams_read` | Workspace member | Get the count of tenant team records |
| GET | `/api/v2/TenantsService/TeamRecords/{tenantTeamRecordId}` | `teams_read` | Workspace member | Retrieve a single tenant team record by its ID |
| PUT | `/api/v2/TenantsService/TeamRecords/{tenantTeamRecordId}` | `teams_update` | Workspace member | Update a tenant team record |
| PATCH | `/api/v2/TenantsService/TeamRecords/{tenantTeamRecordId}` | `teams_update` | Workspace member | Patch a tenant team record |
| DELETE | `/api/v2/TenantsService/TeamRecords/{tenantTeamRecordId}` | `teams_delete` | Workspace member | Delete a tenant team record |

## Teams

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/Teams` | `teams_read` | Workspace member | Retrieve a list of tenant teams |
| POST | `/api/v2/TenantsService/Teams` | `teams_create` | Workspace member | Create a new tenant team |
| GET | `/api/v2/TenantsService/Teams/Count` | `teams_read` | Workspace member | Get the count of tenant teams |
| GET | `/api/v2/TenantsService/Teams/{tenantTeamId}` | `teams_read` | Workspace member | Retrieve a single tenant team by its ID |
| PUT | `/api/v2/TenantsService/Teams/{tenantTeamId}` | `teams_update` | Workspace member | Update a tenant team |
| PATCH | `/api/v2/TenantsService/Teams/{tenantTeamId}` | `teams_update` | Workspace member | Patch a tenant team |
| DELETE | `/api/v2/TenantsService/Teams/{tenantTeamId}` | `teams_delete` | Workspace member | Delete a tenant team |

## Tenants

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/TenantsService/Tenants` |  | Signed-in user | Create a new business tenant |
| DELETE | `/api/v2/TenantsService/Tenants` | `tenants_delete` | Workspace member | Delete a tenant |
| GET | `/api/v2/TenantsService/Tenants/Current` | `tenants_read` | Workspace member | Get the user's current default tenant |
| POST | `/api/v2/TenantsService/Tenants/Deselect` |  | Signed-in user | Deselect the user's default tenant |
| GET | `/api/v2/TenantsService/Tenants/Root` |  | Public | Get the root tenant of the platform |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}` | `tenants_read` | Workspace member | Get a specific tenant by ID |
| PUT | `/api/v2/TenantsService/Tenants/{tenantId}` | `tenants_update` | Workspace member | Update a tenant's profile |
| PATCH | `/api/v2/TenantsService/Tenants/{tenantId}` | `tenants_update` | Workspace member | Patch a tenant's profile |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Avatar` |  |  | Get a tenant's avatar |
| POST | `/api/v2/TenantsService/Tenants/{tenantId}/Avatar` |  |  | Update a tenant's avatar |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Cart` |  | Public, or workspace member with a workspace | Get a tenant's default cart |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Enrollments` | `enrollments_read` | Workspace member | Get the list of user enrollments for a tenant |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Enrollments/{enrollmentId}` | `enrollments_read` | Workspace member | Get a specific tenant enrollment |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Enrollments/{enrollmentId}/Extended` | `enrollments_read` | Workspace member | Get a specific tenant enrollment |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Enrollments/{enrollmentId}/Features` | `licenses_read` | Workspace member | Get the list of features accessible to a specific enrollment |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Enrollments/{enrollmentId}/HasAccess` |  | Workspace member | Validate the access to a specific feature for a specific enrollment |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Enrollments/{enrollmentId}/Licenses` | `licenses_read` | Workspace member | Get the list of licenses available to a specific enrollment |
| POST | `/api/v2/TenantsService/Tenants/{tenantId}/Enrollments/{enrollmentId}/Licenses/{licenseId}` | `licenses_manage` | Workspace member | Assign a license to a specific enrollment |
| DELETE | `/api/v2/TenantsService/Tenants/{tenantId}/Enrollments/{enrollmentId}/Licenses/{licenseId}` | `licenses_manage` | Workspace member | Revoke a license from a specific enrollment |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Enrollments/{enrollmentId}/Permissions` | `enrollments_read` | Workspace member | Get a specific tenant enrollment's permissions list |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Enrollments/{enrollmentId}/Permissions/Validate` |  | Workspace member | Validate the existence of a list of roles and permissions for a specific enrollment |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Extended` | `tenants_read` | Workspace member | Get an extended tenant's business profile |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Invitations` | `tenants_read` | Workspace member | Get the list of invitations issued by a tenant |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Invitations/Pending` | `tenants_read` | Workspace member | Get the list of invitations issued by a tenant that are pending |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Invitations/Redeemed` | `tenants_read` | Workspace member | Get the list of invitations issued by a tenant that have been redeemed |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Invitations/Revoked` | `tenants_read` | Workspace member | Get the list of invitations issued by a tenant that have been revoked |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Licenses` | `licenses_read` | Workspace member | Get the list of licenses available to a tenant |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Notifications` | `notifications_read` | Workspace member | Get the list of notifications for a tenant |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Notifications/Count` | `notifications_read` | Workspace member | Get the count of notifications for a tenant |
| POST | `/api/v2/TenantsService/Tenants/{tenantId}/Select` |  | Workspace member | Select a business tenant as the user's default tenant |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/SocialProfile` |  | Workspace member | Get a tenant's social profile |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Users` | `tenants_read` | Workspace member | Get the list of users enrolled in a tenant |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/Wallet` | `wallets_read` | Workspace member | Get a tenant's billing profile (A.K.A. Wallet Account) |
| GET | `/api/v2/TenantsService/Tenants/{tenantId}/WebPortals` | `tenants_read` | Workspace member | Get the list of web portals for a tenant |

## Territories

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/Territories` | `territories_read` | Workspace member | Retrieve a list of tenant territories |
| POST | `/api/v2/TenantsService/Territories` | `territories_create` | Workspace member | Create a new tenant territory |
| GET | `/api/v2/TenantsService/Territories/Count` | `territories_read` | Workspace member | Get the count of tenant territories |
| GET | `/api/v2/TenantsService/Territories/{tenantTerritoryId}` | `territories_read` | Workspace member | Retrieve a single tenant territory by its ID |
| PUT | `/api/v2/TenantsService/Territories/{tenantTerritoryId}` | `territories_update` | Workspace member | Update a tenant territory |
| PATCH | `/api/v2/TenantsService/Territories/{tenantTerritoryId}` | `territories_update` | Workspace member | Patch a tenant territory |
| DELETE | `/api/v2/TenantsService/Territories/{tenantTerritoryId}` | `territories_delete` | Workspace member | Delete a tenant territory |

## Types

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/Types` | `tenants_read` | Workspace member | Retrieve a list of tenant types |
| POST | `/api/v2/TenantsService/Types` | `tenants_update` | Workspace member | Create a new tenant type |
| GET | `/api/v2/TenantsService/Types/Count` | `tenants_read` | Workspace member | Get the count of tenant types |
| GET | `/api/v2/TenantsService/Types/{tenantTypeId}` | `tenants_read` | Workspace member | Retrieve a single tenant type by its ID |
| PUT | `/api/v2/TenantsService/Types/{tenantTypeId}` | `tenants_update` | Workspace member | Update a tenant type |
| PATCH | `/api/v2/TenantsService/Types/{tenantTypeId}` | `tenants_update` | Workspace member | Patch a tenant type |
| DELETE | `/api/v2/TenantsService/Types/{tenantTypeId}` | `tenants_update` | Workspace member | Delete a tenant type |

## UnitGroups

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/UnitGroups` | `units_read` | Workspace member | Retrieve a list of unit groups |
| POST | `/api/v2/TenantsService/UnitGroups` | `units_create` | Workspace member | Create a new unit group |
| GET | `/api/v2/TenantsService/UnitGroups/Count` | `units_read` | Workspace member | Get the count of unit groups |
| GET | `/api/v2/TenantsService/UnitGroups/{unitGroupId}` | `units_read` | Workspace member | Retrieve a unit group by ID |
| PUT | `/api/v2/TenantsService/UnitGroups/{unitGroupId}` | `units_update` | Workspace member | Update a unit group |
| PATCH | `/api/v2/TenantsService/UnitGroups/{unitGroupId}` | `units_update` | Workspace member | Patch a unit group |
| DELETE | `/api/v2/TenantsService/UnitGroups/{unitGroupId}` | `units_delete` | Workspace member | Delete a unit group |
| GET | `/api/v2/TenantsService/UnitGroups/{unitGroupId}/Units` | `units_read` | Workspace member | Retrieve units for a unit group |
| POST | `/api/v2/TenantsService/UnitGroups/{unitGroupId}/Units` | `units_create` | Workspace member | Create a unit within a unit group |
| GET | `/api/v2/TenantsService/UnitGroups/{unitGroupId}/Units/Count` | `units_read` | Workspace member | Get the count of units in a unit group |
| GET | `/api/v2/TenantsService/UnitGroups/{unitGroupId}/Units/{unitId}` | `units_read` | Workspace member | Retrieve a unit by ID within a unit group |
| PUT | `/api/v2/TenantsService/UnitGroups/{unitGroupId}/Units/{unitId}` | `units_update` | Workspace member | Update a unit within a unit group |
| PATCH | `/api/v2/TenantsService/UnitGroups/{unitGroupId}/Units/{unitId}` | `units_update` | Workspace member | Patch a unit within a unit group |
| DELETE | `/api/v2/TenantsService/UnitGroups/{unitGroupId}/Units/{unitId}` | `units_delete` | Workspace member | Delete a unit from a unit group |

## Units

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TenantsService/Units` | `units_read` | Workspace member | Retrieve a list of tenant units |
| POST | `/api/v2/TenantsService/Units` | `units_create` | Workspace member | Create a new tenant unit |
| GET | `/api/v2/TenantsService/Units/Count` | `units_read` | Workspace member | Get the count of tenant units |
| GET | `/api/v2/TenantsService/Units/{tenantUnitId}` | `units_read` | Workspace member | Retrieve a single tenant unit by its ID |
| PUT | `/api/v2/TenantsService/Units/{tenantUnitId}` | `units_update` | Workspace member | Update a tenant unit |
| PATCH | `/api/v2/TenantsService/Units/{tenantUnitId}` | `units_update` | Workspace member | Patch a tenant unit |
| DELETE | `/api/v2/TenantsService/Units/{tenantUnitId}` | `units_delete` | Workspace member | Delete a tenant unit |

Generated from the source at commit 642fb3c3ad.
<!-- generated:end -->
