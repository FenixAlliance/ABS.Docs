# Support service

The Support service lets you run customer support for your workspace: tickets and requests, a knowledge base, and returns, refunds, warranties and maintenance visits.

**Who uses it:** developers who connect a help center, a customer portal or a field service tool to a workspace.

**Base route:** `/api/v2/SupportService/...`

## What you can do

- **Handle support tickets:** create tickets and support requests, attach files to a request, and keep the conversations of a ticket and read their messages. See [Customer experience](~/Capabilities/Customer-Experience.md).
- **Classify tickets:** maintain your own ticket types and priorities.
- **Publish a knowledge base:** create, update and delete knowledge articles.
- **Take inquiries:** record inquiry requests from customers.
- **Handle returns, refunds and warranties:** keep your return, refund and warranty policies, and the return, refund and warranty requests made under them.
- **Track entitlements and visits:** record the support each customer is entitled to and the maintenance visits you schedule.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** `tickets_read`, `tickets_create`, `tickets_update` and `tickets_delete` for tickets, requests, attachments, types and priorities. Each other resource has its own permissions, such as `knowledge_articles_create`, `inquiry_requests_create`, `return_policies_create`, `refund_requests_read`, `warranty_requests_read`, `entitlements_read` and `maintenance_visits_read`, with the matching `_create`, `_update` and `_delete` forms.
- **Knowledge articles written in code:** content in Razor, C# or CSHtml can be saved only in workspaces an instance administrator enables, and only by their owners and administrators. Everywhere else, set the content type to HTML, Markdown or Markup.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `SupportService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## InquiryRequests

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/InquiryRequests` |  | Workspace member | Retrieve inquiry requests |
| POST | `/api/v2/SupportService/InquiryRequests` | `inquiry_requests_create` | Workspace member | Create an inquiry request |
| GET | `/api/v2/SupportService/InquiryRequests/Count` |  | Workspace member | Get inquiry requests count |
| GET | `/api/v2/SupportService/InquiryRequests/{inquiryRequestId}` |  | Workspace member | Retrieve an inquiry request by ID |
| PUT | `/api/v2/SupportService/InquiryRequests/{inquiryRequestId}` | `inquiry_requests_update` | Workspace member | Update an inquiry request |
| PATCH | `/api/v2/SupportService/InquiryRequests/{inquiryRequestId}` | `inquiry_requests_update` | Workspace member | Patch an inquiry request |
| DELETE | `/api/v2/SupportService/InquiryRequests/{inquiryRequestId}` | `inquiry_requests_delete` | Workspace member | Delete an inquiry request |

## KnowledgeArticles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/KnowledgeArticles` |  | Workspace member | Retrieve knowledge articles |
| POST | `/api/v2/SupportService/KnowledgeArticles` | `knowledge_articles_create` | Workspace member | Create a knowledge article |
| GET | `/api/v2/SupportService/KnowledgeArticles/Count` |  | Workspace member | Get knowledge articles count |
| GET | `/api/v2/SupportService/KnowledgeArticles/{knowledgeArticleId}` |  | Workspace member | Retrieve a knowledge article by ID |
| PUT | `/api/v2/SupportService/KnowledgeArticles/{knowledgeArticleId}` | `knowledge_articles_update` | Workspace member | Update a knowledge article |
| PATCH | `/api/v2/SupportService/KnowledgeArticles/{knowledgeArticleId}` | `knowledge_articles_update` | Workspace member | Patch a knowledge article |
| DELETE | `/api/v2/SupportService/KnowledgeArticles/{knowledgeArticleId}` | `knowledge_articles_delete` | Workspace member | Delete a knowledge article |

## MaintenanceVisits

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/MaintenanceVisits` | `maintenance_visits_read` | Workspace member | Retrieve maintenance visits |
| POST | `/api/v2/SupportService/MaintenanceVisits` | `maintenance_visits_create` | Workspace member | Create a maintenance visit |
| GET | `/api/v2/SupportService/MaintenanceVisits/Count` | `maintenance_visits_read` | Workspace member | Get maintenance visits count |
| GET | `/api/v2/SupportService/MaintenanceVisits/{maintenanceVisitId}` | `maintenance_visits_read` | Workspace member | Retrieve a maintenance visit by ID |
| PUT | `/api/v2/SupportService/MaintenanceVisits/{maintenanceVisitId}` | `maintenance_visits_update` | Workspace member | Update a maintenance visit |
| PATCH | `/api/v2/SupportService/MaintenanceVisits/{maintenanceVisitId}` | `maintenance_visits_update` | Workspace member | Patch a maintenance visit |
| DELETE | `/api/v2/SupportService/MaintenanceVisits/{maintenanceVisitId}` | `maintenance_visits_delete` | Workspace member | Delete a maintenance visit |

## RefundPolicies

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/RefundPolicies` |  | Workspace member | Retrieve a list of refund policies |
| POST | `/api/v2/SupportService/RefundPolicies` | `refund_policies_create` | Workspace member | Create a new refund policy |
| GET | `/api/v2/SupportService/RefundPolicies/Count` |  | Workspace member | Get the count of refund policies |
| GET | `/api/v2/SupportService/RefundPolicies/{refundPolicyId}` |  | Workspace member | Retrieve a refund policy by ID |
| PUT | `/api/v2/SupportService/RefundPolicies/{refundPolicyId}` | `refund_policies_update` | Workspace member | Update a refund policy |
| PATCH | `/api/v2/SupportService/RefundPolicies/{refundPolicyId}` | `refund_policies_update` | Workspace member | Patch a refund policy |
| DELETE | `/api/v2/SupportService/RefundPolicies/{refundPolicyId}` | `refund_policies_delete` | Workspace member | Delete a refund policy |

## RefundRequests

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/RefundRequests` | `refund_requests_read` | Workspace member | Retrieve refund requests |
| POST | `/api/v2/SupportService/RefundRequests` | `refund_requests_create` | Workspace member | Create a refund request |
| GET | `/api/v2/SupportService/RefundRequests/Count` | `refund_requests_read` | Workspace member | Get refund requests count |
| GET | `/api/v2/SupportService/RefundRequests/{refundRequestId}` | `refund_requests_read` | Workspace member | Retrieve a refund request by ID |
| PUT | `/api/v2/SupportService/RefundRequests/{refundRequestId}` | `refund_requests_update` | Workspace member | Update a refund request |
| PATCH | `/api/v2/SupportService/RefundRequests/{refundRequestId}` | `refund_requests_update` | Workspace member | Patch a refund request |
| DELETE | `/api/v2/SupportService/RefundRequests/{refundRequestId}` | `refund_requests_delete` | Workspace member | Delete a refund request |

## ReturnPolicies

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/ReturnPolicies` |  | Workspace member | Retrieve a list of return policies |
| POST | `/api/v2/SupportService/ReturnPolicies` | `return_policies_create` | Workspace member | Create a new return policy |
| GET | `/api/v2/SupportService/ReturnPolicies/Count` |  | Workspace member | Get the count of return policies |
| GET | `/api/v2/SupportService/ReturnPolicies/{returnPolicyId}` |  | Workspace member | Retrieve a return policy by ID |
| PUT | `/api/v2/SupportService/ReturnPolicies/{returnPolicyId}` | `return_policies_update` | Workspace member | Update a return policy |
| PATCH | `/api/v2/SupportService/ReturnPolicies/{returnPolicyId}` | `return_policies_update` | Workspace member | Patch a return policy |
| DELETE | `/api/v2/SupportService/ReturnPolicies/{returnPolicyId}` | `return_policies_delete` | Workspace member | Delete a return policy |

## ReturnRequests

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/ReturnRequests` | `return_requests_read` | Workspace member | Retrieve return requests |
| POST | `/api/v2/SupportService/ReturnRequests` | `return_requests_create` | Workspace member | Create a return request |
| GET | `/api/v2/SupportService/ReturnRequests/Count` | `return_requests_read` | Workspace member | Get return requests count |
| GET | `/api/v2/SupportService/ReturnRequests/{returnRequestId}` | `return_requests_read` | Workspace member | Retrieve a return request by ID |
| PUT | `/api/v2/SupportService/ReturnRequests/{returnRequestId}` | `return_requests_update` | Workspace member | Update a return request |
| PATCH | `/api/v2/SupportService/ReturnRequests/{returnRequestId}` | `return_requests_update` | Workspace member | Patch a return request |
| DELETE | `/api/v2/SupportService/ReturnRequests/{returnRequestId}` | `return_requests_delete` | Workspace member | Delete a return request |

## SupportEntitlements

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/SupportEntitlements` | `entitlements_read` | Workspace member | Retrieve a list of support entitlements |
| POST | `/api/v2/SupportService/SupportEntitlements` | `entitlements_create` | Workspace member | Create a new support entitlement |
| GET | `/api/v2/SupportService/SupportEntitlements/Count` | `entitlements_read` | Workspace member | Get the count of support entitlements |
| GET | `/api/v2/SupportService/SupportEntitlements/{supportEntitlementId}` | `entitlements_read` | Workspace member | Retrieve a support entitlement by ID |
| PUT | `/api/v2/SupportService/SupportEntitlements/{supportEntitlementId}` | `entitlements_update` | Workspace member | Update a support entitlement |
| PATCH | `/api/v2/SupportService/SupportEntitlements/{supportEntitlementId}` | `entitlements_update` | Workspace member | Patch a support entitlement |
| DELETE | `/api/v2/SupportService/SupportEntitlements/{supportEntitlementId}` | `entitlements_delete` | Workspace member | Delete a support entitlement |

## SupportRequestAttachments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/SupportRequestAttachments` |  | Workspace member | Retrieve a list of support request attachments |
| POST | `/api/v2/SupportService/SupportRequestAttachments` | `tickets_create` | Workspace member | Create a new support request attachment |
| GET | `/api/v2/SupportService/SupportRequestAttachments/Count` |  | Workspace member | Get the count of support request attachments |
| GET | `/api/v2/SupportService/SupportRequestAttachments/{supportRequestAttachmentId}` |  | Workspace member | Retrieve a support request attachment by ID |
| PUT | `/api/v2/SupportService/SupportRequestAttachments/{supportRequestAttachmentId}` | `tickets_update` | Workspace member | Update a support request attachment |
| PATCH | `/api/v2/SupportService/SupportRequestAttachments/{supportRequestAttachmentId}` | `tickets_update` | Workspace member | Patch a support request attachment |
| DELETE | `/api/v2/SupportService/SupportRequestAttachments/{supportRequestAttachmentId}` | `tickets_delete` | Workspace member | Delete a support request attachment |

## SupportRequests

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/SupportRequests` | `tickets_read` | Workspace member | Retrieve a list of support requests |
| POST | `/api/v2/SupportService/SupportRequests` | `tickets_create` | Workspace member | Create a new support request |
| GET | `/api/v2/SupportService/SupportRequests/Count` | `tickets_read` | Workspace member | Get the count of support requests |
| GET | `/api/v2/SupportService/SupportRequests/{supportRequestId}` | `tickets_read` | Workspace member | Retrieve a support request by ID |
| PUT | `/api/v2/SupportService/SupportRequests/{supportRequestId}` | `tickets_update` | Workspace member | Update a support request |
| PATCH | `/api/v2/SupportService/SupportRequests/{supportRequestId}` | `tickets_update` | Workspace member | Patch a support request |
| DELETE | `/api/v2/SupportService/SupportRequests/{supportRequestId}` | `tickets_delete` | Workspace member | Delete a support request |
| GET | `/api/v2/SupportService/SupportRequests/{supportRequestId}/Attachments` |  | Workspace member | Retrieve attachments for a support request |
| POST | `/api/v2/SupportService/SupportRequests/{supportRequestId}/Attachments` | `tickets_create` | Workspace member | Add an attachment to a support request |
| GET | `/api/v2/SupportService/SupportRequests/{supportRequestId}/Attachments/Count` |  | Workspace member | Get the count of attachments for a support request |
| GET | `/api/v2/SupportService/SupportRequests/{supportRequestId}/Attachments/{attachmentId}` |  | Workspace member | Retrieve a specific attachment for a support request |
| GET | `/api/v2/SupportService/SupportRequests/{supportRequestId}/Tickets` |  | Workspace member | Retrieve tickets for a support request |

## SupportTicketPriorities

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/SupportTicketPriorities` |  | Workspace member | Retrieve a list of support ticket priorities |
| POST | `/api/v2/SupportService/SupportTicketPriorities` | `tickets_create` | Workspace member | Create a new support ticket priority |
| GET | `/api/v2/SupportService/SupportTicketPriorities/Count` |  | Workspace member | Get the count of support ticket priorities |
| GET | `/api/v2/SupportService/SupportTicketPriorities/{supportTicketPriorityId}` |  | Workspace member | Retrieve a support ticket priority by ID |
| PUT | `/api/v2/SupportService/SupportTicketPriorities/{supportTicketPriorityId}` | `tickets_update` | Workspace member | Update a support ticket priority |
| PATCH | `/api/v2/SupportService/SupportTicketPriorities/{supportTicketPriorityId}` | `tickets_update` | Workspace member | Patch a support ticket priority |
| DELETE | `/api/v2/SupportService/SupportTicketPriorities/{supportTicketPriorityId}` | `tickets_delete` | Workspace member | Delete a support ticket priority |

## SupportTicketTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/SupportTicketTypes` |  | Workspace member | Retrieve a list of support ticket types |
| POST | `/api/v2/SupportService/SupportTicketTypes` | `tickets_create` | Workspace member | Create a new support ticket type |
| GET | `/api/v2/SupportService/SupportTicketTypes/Count` |  | Workspace member | Get the count of support ticket types |
| GET | `/api/v2/SupportService/SupportTicketTypes/{supportTicketTypeId}` |  | Workspace member | Retrieve a support ticket type by ID |
| PUT | `/api/v2/SupportService/SupportTicketTypes/{supportTicketTypeId}` | `tickets_update` | Workspace member | Update a support ticket type |
| PATCH | `/api/v2/SupportService/SupportTicketTypes/{supportTicketTypeId}` | `tickets_update` | Workspace member | Patch a support ticket type |
| DELETE | `/api/v2/SupportService/SupportTicketTypes/{supportTicketTypeId}` | `tickets_delete` | Workspace member | Delete a support ticket type |

## SupportTickets

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/SupportTickets` | `tickets_read` | Workspace member | Retrieve a list of support tickets |
| POST | `/api/v2/SupportService/SupportTickets` | `tickets_create` | Workspace member | Create a new support ticket |
| GET | `/api/v2/SupportService/SupportTickets/Count` | `tickets_read` | Workspace member | Get the count of support tickets |
| GET | `/api/v2/SupportService/SupportTickets/{supportTicketId}` | `tickets_read` | Workspace member | Retrieve a support ticket by ID |
| PUT | `/api/v2/SupportService/SupportTickets/{supportTicketId}` | `tickets_update` | Workspace member | Update a support ticket |
| PATCH | `/api/v2/SupportService/SupportTickets/{supportTicketId}` | `tickets_update` | Workspace member | Patch a support ticket |
| DELETE | `/api/v2/SupportService/SupportTickets/{supportTicketId}` | `tickets_delete` | Workspace member | Delete a support ticket |
| GET | `/api/v2/SupportService/SupportTickets/{supportTicketId}/Conversations` |  | Workspace member | Retrieve conversations for a support ticket |
| POST | `/api/v2/SupportService/SupportTickets/{supportTicketId}/Conversations` | `tickets_create` | Workspace member | Create a conversation for a support ticket |
| GET | `/api/v2/SupportService/SupportTickets/{supportTicketId}/Conversations/{supportTicketConversationId}` |  | Workspace member | Retrieve a specific conversation for a support ticket |
| DELETE | `/api/v2/SupportService/SupportTickets/{supportTicketId}/Conversations/{supportTicketConversationId}` | `tickets_delete` | Workspace member | Delete a conversation from a support ticket |
| GET | `/api/v2/SupportService/SupportTickets/{supportTicketId}/Conversations/{supportTicketConversationId}/Messages` |  | Workspace member | Retrieve messages for a support ticket conversation |

## WarrantyPolicies

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/WarrantyPolicies` |  | Workspace member | Retrieve a list of warranty policies |
| POST | `/api/v2/SupportService/WarrantyPolicies` | `warranty_policies_create` | Workspace member | Create a new warranty policy |
| GET | `/api/v2/SupportService/WarrantyPolicies/Count` |  | Workspace member | Get the count of warranty policies |
| GET | `/api/v2/SupportService/WarrantyPolicies/{warrantyPolicyId}` |  | Workspace member | Retrieve a warranty policy by ID |
| PUT | `/api/v2/SupportService/WarrantyPolicies/{warrantyPolicyId}` | `warranty_policies_update` | Workspace member | Update a warranty policy |
| PATCH | `/api/v2/SupportService/WarrantyPolicies/{warrantyPolicyId}` | `warranty_policies_update` | Workspace member | Patch a warranty policy |
| DELETE | `/api/v2/SupportService/WarrantyPolicies/{warrantyPolicyId}` | `warranty_policies_delete` | Workspace member | Delete a warranty policy |

## WarrantyRequests

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SupportService/WarrantyRequests` | `warranty_requests_read` | Workspace member | Retrieve warranty requests |
| POST | `/api/v2/SupportService/WarrantyRequests` | `warranty_requests_create` | Workspace member | Create a warranty request |
| GET | `/api/v2/SupportService/WarrantyRequests/Count` | `warranty_requests_read` | Workspace member | Get warranty requests count |
| GET | `/api/v2/SupportService/WarrantyRequests/{warrantyRequestId}` | `warranty_requests_read` | Workspace member | Retrieve a warranty request by ID |
| PUT | `/api/v2/SupportService/WarrantyRequests/{warrantyRequestId}` | `warranty_requests_update` | Workspace member | Update a warranty request |
| PATCH | `/api/v2/SupportService/WarrantyRequests/{warrantyRequestId}` | `warranty_requests_update` | Workspace member | Patch a warranty request |
| DELETE | `/api/v2/SupportService/WarrantyRequests/{warrantyRequestId}` | `warranty_requests_delete` | Workspace member | Delete a warranty request |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
