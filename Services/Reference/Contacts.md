# Contacts service

The Contacts service lets you keep your workspace's contact list: the people and organizations you do business with, their email addresses, profiles and relations.

**Who uses it:** developers who connect a CRM, a sign-up form or a customer portal to a workspace.

**Base route:** `/api/v2/CrmService/...`

## What you can do

- **Manage contacts:** create, read, update and delete contacts, list individuals and organizations separately, and read the people and organizations related to each one. See [Contacts](~/Modules/CRM/Contacts.md).
- **Keep several email addresses per contact:** add, update, verify and remove each address.
- **Add a person or a company without duplicates:** add a user or another workspace to your contact list, reusing the existing contact when there is one.
- **Describe your contacts:** maintain contact groups, contact sources, contact profiles, and relations between contacts with your own relation types. See [CRM](~/Modules/CRM.md).
- **Store your own settings on a contact:** read and write key and value options per contact.
- **Read what a contact holds with you:** the contact's avatar, cart, wallet and social profile.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** `contacts_read`, `contacts_create`, `contacts_update`, `contacts_delete` and `contacts_manage`; `organizations_read` for organization contacts; and the `_read`, `_create`, `_update` and `_delete` permissions of `contact_groups`, `contact_sources`, `contact_profiles`, `contact_relations` and `contact_relation_types`.
- A signed-in user can add themselves to a workspace's contact list without a workspace permission.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `CrmService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## ContactGroups

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CrmService/ContactGroups` | `contact_groups_read` | Workspace member | Get all contact groups |
| POST | `/api/v2/CrmService/ContactGroups` | `contact_groups_create` | Workspace member | Create a new contact group |
| GET | `/api/v2/CrmService/ContactGroups/Count` | `contact_groups_read` | Workspace member | Get contact groups count |
| GET | `/api/v2/CrmService/ContactGroups/{id}` | `contact_groups_read` | Workspace member | Get contact group by ID |
| PUT | `/api/v2/CrmService/ContactGroups/{id}` | `contact_groups_update` | Workspace member | Update a contact group |
| PATCH | `/api/v2/CrmService/ContactGroups/{id}` | `contact_groups_update` | Workspace member | Patch a contact group |
| DELETE | `/api/v2/CrmService/ContactGroups/{id}` | `contact_groups_delete` | Workspace member | Delete a contact group |

## ContactProfiles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CrmService/ContactProfiles` | `contact_profiles_read` | Workspace member | Get all contact profiles |
| POST | `/api/v2/CrmService/ContactProfiles` | `contact_profiles_create` | Workspace member | Create a new contact profile |
| GET | `/api/v2/CrmService/ContactProfiles/Count` | `contact_profiles_read` | Workspace member | Get contact profiles count |
| GET | `/api/v2/CrmService/ContactProfiles/Partners/Count` | `contact_profiles_read` | Workspace member | Get partner profiles count |
| GET | `/api/v2/CrmService/ContactProfiles/Patients/Count` | `contact_profiles_read` | Workspace member | Get patient profiles count |
| GET | `/api/v2/CrmService/ContactProfiles/{id}` | `contact_profiles_read` | Workspace member | Get contact profile by ID |
| PUT | `/api/v2/CrmService/ContactProfiles/{id}` | `contact_profiles_update` | Workspace member | Update a contact profile |
| PATCH | `/api/v2/CrmService/ContactProfiles/{id}` | `contact_profiles_update` | Workspace member | Patch a contact profile |
| DELETE | `/api/v2/CrmService/ContactProfiles/{id}` | `contact_profiles_delete` | Workspace member | Delete a contact profile |

## ContactRelationTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CrmService/ContactRelationTypes` | `contact_relation_types_read` | Workspace member | Get all contact relation types |
| POST | `/api/v2/CrmService/ContactRelationTypes` | `contact_relation_types_create` | Workspace member | Create a new contact relation type |
| GET | `/api/v2/CrmService/ContactRelationTypes/Count` | `contact_relation_types_read` | Workspace member | Get contact relation types count |
| GET | `/api/v2/CrmService/ContactRelationTypes/{id}` | `contact_relation_types_read` | Workspace member | Get contact relation type by ID |
| PUT | `/api/v2/CrmService/ContactRelationTypes/{id}` | `contact_relation_types_update` | Workspace member | Update a contact relation type |
| PATCH | `/api/v2/CrmService/ContactRelationTypes/{id}` | `contact_relation_types_update` | Workspace member | Patch a contact relation type |
| DELETE | `/api/v2/CrmService/ContactRelationTypes/{id}` | `contact_relation_types_delete` | Workspace member | Delete a contact relation type |

## ContactRelations

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CrmService/ContactRelations` | `contact_relations_read` | Workspace member | Get all contact relations |
| POST | `/api/v2/CrmService/ContactRelations` | `contact_relations_create` | Workspace member | Create a new contact relation |
| GET | `/api/v2/CrmService/ContactRelations/Count` | `contact_relations_read` | Workspace member | Get contact relations count |
| GET | `/api/v2/CrmService/ContactRelations/{id}` | `contact_relations_read` | Workspace member | Get contact relation by ID |
| PUT | `/api/v2/CrmService/ContactRelations/{id}` | `contact_relations_update` | Workspace member | Update a contact relation |
| PATCH | `/api/v2/CrmService/ContactRelations/{id}` | `contact_relations_update` | Workspace member | Patch a contact relation |
| DELETE | `/api/v2/CrmService/ContactRelations/{id}` | `contact_relations_delete` | Workspace member | Delete a contact relation |

## ContactSources

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CrmService/ContactSources` | `contact_sources_read` | Workspace member | Get all contact sources |
| POST | `/api/v2/CrmService/ContactSources` | `contact_sources_create` | Workspace member | Create a new contact source |
| GET | `/api/v2/CrmService/ContactSources/Count` | `contact_sources_read` | Workspace member | Get contact sources count |
| GET | `/api/v2/CrmService/ContactSources/{id}` | `contact_sources_read` | Workspace member | Get contact source by ID |
| PUT | `/api/v2/CrmService/ContactSources/{id}` | `contact_sources_update` | Workspace member | Update a contact source |
| PATCH | `/api/v2/CrmService/ContactSources/{id}` | `contact_sources_update` | Workspace member | Patch a contact source |
| DELETE | `/api/v2/CrmService/ContactSources/{id}` | `contact_sources_delete` | Workspace member | Delete a contact source |

## Contacts

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CrmService/Contacts` | `contacts_read` | Workspace member | Get all business owned contacts |
| POST | `/api/v2/CrmService/Contacts` | `contacts_create` | Workspace member | Create a new contact |
| GET | `/api/v2/CrmService/Contacts/Count` | `contacts_read` | Workspace member | Get all business owned contacts count |
| GET | `/api/v2/CrmService/Contacts/Extended` | `contacts_read` | Workspace member | Get all business owned contacts |
| GET | `/api/v2/CrmService/Contacts/Individuals` | `contacts_read` | Workspace member | Get all contacts of type individual |
| GET | `/api/v2/CrmService/Contacts/Individuals/Count` | `contacts_read` | Workspace member | Get all contacts of type individual count |
| GET | `/api/v2/CrmService/Contacts/Individuals/Extended` | `contacts_read` | Workspace member | Get all contacts of type individual |
| POST | `/api/v2/CrmService/Contacts/Individuals/Upsert` | `contacts_manage` | Workspace member | Upsert a user onto a tenant's contact list |
| GET | `/api/v2/CrmService/Contacts/Individuals/{contactId}` | `contacts_read` | Workspace member | Get a Contact of type Individual by ID. |
| GET | `/api/v2/CrmService/Contacts/Individuals/{contactId}/Individuals` | `contacts_read` | Workspace member | Get individual related individuals |
| GET | `/api/v2/CrmService/Contacts/Individuals/{contactId}/Organizations` | `contacts_read` | Workspace member | Get individual related organizations |
| GET | `/api/v2/CrmService/Contacts/Organizations` | `organizations_read` | Workspace member | Get all contacts of type organization |
| GET | `/api/v2/CrmService/Contacts/Organizations/Count` | `organizations_read` | Workspace member | Get all contacts of type organization count |
| GET | `/api/v2/CrmService/Contacts/Organizations/Extended` | `organizations_read` | Workspace member | Get all contacts of type organization |
| POST | `/api/v2/CrmService/Contacts/Organizations/Upsert` | `contacts_manage` | Workspace member | Upsert a tenant onto another tenant's contact list |
| GET | `/api/v2/CrmService/Contacts/Organizations/{contactId}` | `organizations_read` | Workspace member | Get a Contact of type Organization by ID. |
| GET | `/api/v2/CrmService/Contacts/Organizations/{contactId}/Individuals` | `organizations_read` | Workspace member | Get organization related individuals |
| GET | `/api/v2/CrmService/Contacts/Organizations/{contactId}/Organizations` | `organizations_read` | Workspace member | Get organization related organizations |
| POST | `/api/v2/CrmService/Contacts/Related` |  | Signed-in user | Create or reuse the current user's contact in a tenant's contact list |
| GET | `/api/v2/CrmService/Contacts/{contactId}` | `contacts_read` | Workspace member | Get a contact by ID |
| PUT | `/api/v2/CrmService/Contacts/{contactId}` | `contacts_update` | Workspace member | Update a contact |
| PATCH | `/api/v2/CrmService/Contacts/{contactId}` | `contacts_update` | Workspace member | Patch a contact |
| DELETE | `/api/v2/CrmService/Contacts/{contactId}` | `contacts_delete` | Workspace member | Delete a contact |
| GET | `/api/v2/CrmService/Contacts/{contactId}/Avatar` | `contacts_read` | Workspace member | Get a contact's avatar |
| POST | `/api/v2/CrmService/Contacts/{contactId}/Avatar` | `contacts_update` | Workspace member | Update a contact's avatar |
| GET | `/api/v2/CrmService/Contacts/{contactId}/Cart` | `contacts_read` | Workspace member | Get a contact's cart |
| GET | `/api/v2/CrmService/Contacts/{contactId}/Emails` | `contacts_read` | Workspace member | Get a contact's email addresses |
| POST | `/api/v2/CrmService/Contacts/{contactId}/Emails/Addresses` | `contacts_create` | Workspace member | Add an email address to a contact |
| GET | `/api/v2/CrmService/Contacts/{contactId}/Emails/Count` | `contacts_read` | Workspace member | Get contact email addresses count |
| PUT | `/api/v2/CrmService/Contacts/{contactId}/Emails/{emailId}` | `contacts_update` | Workspace member | Update a contact email address |
| PATCH | `/api/v2/CrmService/Contacts/{contactId}/Emails/{emailId}` | `contacts_update` | Workspace member | Patch a contact email address |
| DELETE | `/api/v2/CrmService/Contacts/{contactId}/Emails/{emailId}` | `contacts_delete` | Workspace member | Delete a contact email address |
| POST | `/api/v2/CrmService/Contacts/{contactId}/Emails/{emailId}/Verify` | `contacts_update` | Workspace member | Verify a contact email address |
| GET | `/api/v2/CrmService/Contacts/{contactId}/Extended` | `contacts_read` | Workspace member | Get a contact by ID |
| GET | `/api/v2/CrmService/Contacts/{contactId}/Profiles` | `contact_profiles_read` | Workspace member | Get a contact's social profile |
| POST | `/api/v2/CrmService/Contacts/{contactId}/Profiles` | `contact_profiles_create` | Workspace member | Create a contact profile |
| GET | `/api/v2/CrmService/Contacts/{contactId}/Profiles/Count` | `contact_profiles_read` | Workspace member | Get contact profiles count |
| PUT | `/api/v2/CrmService/Contacts/{contactId}/Profiles/{profileId}` | `contact_profiles_update` | Workspace member | Update a contact profile |
| DELETE | `/api/v2/CrmService/Contacts/{contactId}/Profiles/{profileId}` | `contact_profiles_delete` | Workspace member | Delete a contact profile |
| GET | `/api/v2/CrmService/Contacts/{contactId}/SocialProfile` | `contacts_read` | Workspace member | Get a contact's social profile |
| GET | `/api/v2/CrmService/Contacts/{contactId}/Wallet` | `contacts_read` | Workspace member | Get a contact's wallet |

## Options

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CrmService/Contacts/{contactId}/Options` | `contacts_read` | Workspace member | Retrieve a list of contact options |
| POST | `/api/v2/CrmService/Contacts/{contactId}/Options` | `contacts_update` | Workspace member | Create a new contact option |
| GET | `/api/v2/CrmService/Contacts/{contactId}/Options/Count` | `contacts_read` | Workspace member | Get the count of contact options |
| GET | `/api/v2/CrmService/Contacts/{contactId}/Options/Key/{key}` | `contacts_read` | Workspace member | Retrieve a single contact option by its key |
| PATCH | `/api/v2/CrmService/Contacts/{contactId}/Options/Key/{key}` | `contacts_update` | Workspace member | Patch a contact option by key |
| PUT | `/api/v2/CrmService/Contacts/{contactId}/Options/Upsert/{key}` | `contacts_update` | Workspace member | Create or update a contact option by key |
| GET | `/api/v2/CrmService/Contacts/{contactId}/Options/{optionId}` | `contacts_read` | Workspace member | Retrieve a single contact option by its ID |
| PUT | `/api/v2/CrmService/Contacts/{contactId}/Options/{optionId}` | `contacts_update` | Workspace member | Update a contact option |
| PATCH | `/api/v2/CrmService/Contacts/{contactId}/Options/{optionId}` | `contacts_update` | Workspace member | Patch a contact option |
| DELETE | `/api/v2/CrmService/Contacts/{contactId}/Options/{optionId}` | `contacts_update` | Workspace member | Delete a contact option |

## Sync

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/CrmService/Sync` | `contacts_manage` | Workspace member | Sync the current user into a tenant's contact list. |
| POST | `/api/v2/CrmService/Sync/Me` | `contacts_manage` | Workspace member | Sync the user into a tenant's contact list. |
| POST | `/api/v2/CrmService/Sync/Tenant` | `contacts_manage` | Workspace member | Sync a tenant into another tenant's contact list. |
| POST | `/api/v2/CrmService/Sync/User` | `contacts_manage` | Workspace member | Sync a user into a tenant's contact list. |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
