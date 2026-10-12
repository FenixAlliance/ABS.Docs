# Security service

The Security service lets you control what members, apps and application identities can do in a workspace, and review what happened.

**Who uses it:** workspace owners, administrators and security administrators, and developers who automate access management.

**Base route:** `/api/v2/SecurityService/...`

## What you can do

- **Manage roles.** Create, update and delete roles, add permissions to a role, and grant or revoke a role for a member or an application. See [Security roles](~/Capabilities/Alliance-Passport-Service/Security-Roles.md).
- **Manage permissions.** List the permission catalog, create custom permissions, and grant or revoke a permission directly for a member or an application. See [Business permissions](~/Capabilities/Alliance-Passport-Service/Business-Permissions.md).
- **Run application identities.** Provision an identity for automated work, grant it only the permissions it needs, and suspend, reinstate or disable it. A disabled identity stops the unattended work that depends on it. See [Application identities](~/Capabilities/Alliance-Passport-Service.md#application-identities).
- **Register apps.** Register the OAuth apps that sign people in, update or remove them, and list the authorizations people have given each app. See [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md).
- **Manage business applications.** Create, update and delete the workspace's business applications, and read the roles and permissions attached to each.
- **Review activity.** Read the workspace's logs and security logs, and your own activity log. Role and permission changes appear in the security logs. These lists are read-only.
- **Review webhooks and certificates.** Read the webhook requests the workspace received and its security certificates.

## Before you call it

- **Sign in.** Sign in with your email address to get a token, or use the OpenID Connect flows. See [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md) and [REST API development](~/Web-API-Development/REST-API-Development.md).
- **Name the workspace.** Workspace calls take the workspace from the `X-TenantId` header or the `tenantId` request value. See [Tell us which tenant](~/Web-API-Development/REST-API-Development.md#tell-us-which-tenant). Reading your own activity log needs only a signed-in account.
- **Hold the permission.** Roles need `security_roles_read`, `security_roles_create`, `security_roles_update`, `security_roles_delete` or `security_roles_manage`, and permissions need the matching `security_permissions_*` permission. OAuth apps need `oauth_applications_*`, business applications need `applications_*`, and the logs need `tenant_logs_read` or `security_logs_read`. Application identities need `applications_read` to read, `applications_manage` to provision and change state, and `security_permissions_manage` to grant or revoke permissions.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `SecurityService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## ApplicationPrincipals

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SecurityService/ApplicationPrincipals` | `applications_read` | Workspace member | Get all application principals |
| GET | `/api/v2/SecurityService/ApplicationPrincipals/Count` | `applications_read` | Workspace member | Get application principals count |
| POST | `/api/v2/SecurityService/ApplicationPrincipals/Provision` | `applications_manage` | Workspace member | Provision an application principal |
| GET | `/api/v2/SecurityService/ApplicationPrincipals/{principalId}` | `applications_read` | Workspace member | Get application principal by ID |
| POST | `/api/v2/SecurityService/ApplicationPrincipals/{principalId}/Disable` | `applications_manage` | Workspace member | Disable an application principal |
| POST | `/api/v2/SecurityService/ApplicationPrincipals/{principalId}/Enable` | `applications_manage` | Workspace member | Enable an application principal |
| POST | `/api/v2/SecurityService/ApplicationPrincipals/{principalId}/Permissions` | `security_permissions_manage` | Workspace member | Grant a permission to an application principal |
| DELETE | `/api/v2/SecurityService/ApplicationPrincipals/{principalId}/Permissions/{permission}` | `security_permissions_manage` | Workspace member | Revoke a permission from an application principal |
| POST | `/api/v2/SecurityService/ApplicationPrincipals/{principalId}/Suspend` | `applications_manage` | Workspace member | Suspend an application principal |

## Applications

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SecurityService/Applications` | `applications_read` | Workspace member | Get all business applications |
| POST | `/api/v2/SecurityService/Applications` | `applications_create` | Workspace member | Create a new business application |
| GET | `/api/v2/SecurityService/Applications/Count` | `applications_read` | Workspace member | Get business applications count |
| GET | `/api/v2/SecurityService/Applications/{applicationId}` | `applications_read` | Workspace member | Get business application by ID |
| PUT | `/api/v2/SecurityService/Applications/{applicationId}` | `applications_update` | Workspace member | Update an existing business application |
| PATCH | `/api/v2/SecurityService/Applications/{applicationId}` | `applications_update` | Workspace member | Patch an existing business application |
| DELETE | `/api/v2/SecurityService/Applications/{applicationId}` | `applications_delete` | Workspace member | Delete a business application |
| GET | `/api/v2/SecurityService/Applications/{applicationId}/Permissions` | `applications_read` | Workspace member | Get permissions by application |
| GET | `/api/v2/SecurityService/Applications/{applicationId}/Roles` | `applications_read` | Workspace member | Get roles by application |

## Logs

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SecurityService/Logs` | `tenant_logs_read` | Workspace member | Get tenant logs |
| GET | `/api/v2/SecurityService/Logs/Count` | `tenant_logs_read` | Workspace member | Get tenant logs count |
| GET | `/api/v2/SecurityService/Logs/Me` |  | Signed-in user | Get my logs |
| GET | `/api/v2/SecurityService/Logs/Me/Count` |  | Signed-in user | Get my logs count |

## OAuthApplications

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SecurityService/OAuthApplications` | `oauth_applications_read` | Workspace member | Get all OAuth applications |
| POST | `/api/v2/SecurityService/OAuthApplications` | `oauth_applications_create` | Workspace member | Create a new OAuth application |
| GET | `/api/v2/SecurityService/OAuthApplications/Authorizations` | `oauth_applications_read` | Workspace member | Get all OAuth authorizations |
| GET | `/api/v2/SecurityService/OAuthApplications/Authorizations/Count` | `oauth_applications_read` | Workspace member | Get OAuth authorizations count |
| GET | `/api/v2/SecurityService/OAuthApplications/Authorizations/{authorizationId}` | `oauth_applications_read` | Workspace member | Get OAuth authorization by ID |
| GET | `/api/v2/SecurityService/OAuthApplications/Count` | `oauth_applications_read` | Workspace member | Get OAuth applications count |
| GET | `/api/v2/SecurityService/OAuthApplications/{applicationId}` | `oauth_applications_read` | Workspace member | Get OAuth application by ID |
| PUT | `/api/v2/SecurityService/OAuthApplications/{applicationId}` | `oauth_applications_update` | Workspace member | Update an existing OAuth application |
| PATCH | `/api/v2/SecurityService/OAuthApplications/{applicationId}` | `oauth_applications_update` | Workspace member | Patch an existing OAuth application |
| DELETE | `/api/v2/SecurityService/OAuthApplications/{applicationId}` | `oauth_applications_delete` | Workspace member | Delete an OAuth application |

## Permissions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SecurityService/Permissions` | `security_permissions_read` | Workspace member | Get all permissions |
| POST | `/api/v2/SecurityService/Permissions` | `security_permissions_create` | Workspace member | Create a new permission |
| GET | `/api/v2/SecurityService/Permissions/ByEnrollment/{enrollmentId}` | `security_permissions_read` | Workspace member | Get permissions by enrollment |
| GET | `/api/v2/SecurityService/Permissions/Count` | `security_permissions_read` | Workspace member | Get permissions count |
| GET | `/api/v2/SecurityService/Permissions/{securityPermissionId}` | `security_permissions_read` | Workspace member | Get permission by ID |
| PUT | `/api/v2/SecurityService/Permissions/{securityPermissionId}` | `security_permissions_update` | Workspace member | Update an existing permission |
| PATCH | `/api/v2/SecurityService/Permissions/{securityPermissionId}` | `security_permissions_update` | Workspace member | Patch an existing permission |
| DELETE | `/api/v2/SecurityService/Permissions/{securityPermissionId}` | `security_permissions_delete` | Workspace member | Delete an existing permission |
| GET | `/api/v2/SecurityService/Permissions/{securityPermissionId}/Applications` | `security_permissions_read` | Workspace member | Get applications by permission |
| POST | `/api/v2/SecurityService/Permissions/{securityPermissionId}/Applications/{applicationId}` | `security_permissions_manage` | Workspace member | Assign a permission to a business application |
| DELETE | `/api/v2/SecurityService/Permissions/{securityPermissionId}/Applications/{applicationId}` | `security_permissions_manage` | Workspace member | Revoke a permission from a business application |
| GET | `/api/v2/SecurityService/Permissions/{securityPermissionId}/Enrollments` | `security_permissions_read` | Workspace member | Get enrollments by permission |
| POST | `/api/v2/SecurityService/Permissions/{securityPermissionId}/Enrollments/{enrollmentId}` | `security_permissions_manage` | Workspace member | Assign a permission to an enrollment |
| DELETE | `/api/v2/SecurityService/Permissions/{securityPermissionId}/Enrollments/{enrollmentId}` | `security_permissions_manage` | Workspace member | Revoke a permission from an enrollment |
| GET | `/api/v2/SecurityService/Permissions/{securityPermissionId}/Roles` | `security_permissions_read` | Workspace member | Get roles by permission |
| POST | `/api/v2/SecurityService/Permissions/{securityPermissionId}/Roles/{securityRoleId}` | `security_permissions_manage` | Workspace member | Assign a role to a permission |
| DELETE | `/api/v2/SecurityService/Permissions/{securityPermissionId}/Roles/{securityRoleId}` | `security_permissions_manage` | Workspace member | Revoke a role from a permission |

## Roles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SecurityService/Roles` | `security_roles_read` | Workspace member | Get all roles |
| POST | `/api/v2/SecurityService/Roles` | `security_roles_create` | Workspace member | Create a new role |
| GET | `/api/v2/SecurityService/Roles/ByEnrollment/{enrollmentId}` | `security_roles_read` | Workspace member | Get roles by enrollment |
| GET | `/api/v2/SecurityService/Roles/Count` | `security_roles_read` | Workspace member | Get roles count |
| GET | `/api/v2/SecurityService/Roles/{securityRoleId}` | `security_roles_read` | Workspace member | Get role by ID |
| PUT | `/api/v2/SecurityService/Roles/{securityRoleId}` | `security_roles_update` | Workspace member | Update an existing role |
| PATCH | `/api/v2/SecurityService/Roles/{securityRoleId}` | `security_roles_update` | Workspace member | Patch an existing role |
| DELETE | `/api/v2/SecurityService/Roles/{securityRoleId}` | `security_roles_delete` | Workspace member | Delete an existing role |
| GET | `/api/v2/SecurityService/Roles/{securityRoleId}/Applications` | `security_roles_read` | Workspace member | Get applications by role |
| POST | `/api/v2/SecurityService/Roles/{securityRoleId}/Applications/{applicationId}` | `security_roles_manage` | Workspace member | Assign a role to a business application |
| DELETE | `/api/v2/SecurityService/Roles/{securityRoleId}/Applications/{applicationId}` | `security_roles_manage` | Workspace member | Revoke a role from a business application |
| GET | `/api/v2/SecurityService/Roles/{securityRoleId}/Enrollments` | `security_roles_read` | Workspace member | Get enrollments by role |
| POST | `/api/v2/SecurityService/Roles/{securityRoleId}/Enrollments/{enrollmentId}` | `security_roles_manage` | Workspace member | Assign a role to an enrollment |
| DELETE | `/api/v2/SecurityService/Roles/{securityRoleId}/Enrollments/{enrollmentId}` | `security_roles_manage` | Workspace member | Revoke a role from an enrollment |
| GET | `/api/v2/SecurityService/Roles/{securityRoleId}/Permissions` | `security_roles_read` | Workspace member | Get permissions by role |
| POST | `/api/v2/SecurityService/Roles/{securityRoleId}/Permissions/{securityPermissionId}` | `security_roles_manage` | Workspace member | Assign a permission to a role |
| DELETE | `/api/v2/SecurityService/Roles/{securityRoleId}/Permissions/{securityPermissionId}` | `security_roles_manage` | Workspace member | Revoke a permission from a role |

## SecurityCertificates

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SecurityService/SecurityCertificates` | `security_certificates_read` | Workspace member | Get security certificates |
| GET | `/api/v2/SecurityService/SecurityCertificates/Count` | `security_certificates_read` | Workspace member | Get security certificates count |

## SecurityLogs

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SecurityService/SecurityLogs` | `security_logs_read` | Workspace member | Get business security logs |
| GET | `/api/v2/SecurityService/SecurityLogs/Count` | `security_logs_read` | Workspace member | Get business security logs count |

## Webhooks

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SecurityService/Webhooks` | `webhook_requests_read` | Workspace member | Get all webhook requests |
| GET | `/api/v2/SecurityService/Webhooks/Count` | `webhook_requests_read` | Workspace member | Get webhook requests count |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
