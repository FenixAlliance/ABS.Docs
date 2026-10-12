# Trust service

The Trust service lets you sign documents, collect signatures from other people, and verify signed documents later.

**Who uses it:** workspace members who sign or send documents for signature, and developers who add signing to their own apps.

**Base route:** `/api/v2/TrustService/...`

## What you can do

- **Sign a document yourself.** Freeze a document's content and quick-sign it, or prepare, freeze and quick-sign it in one call. See [Signator](~/Modules/Signator.md).
- **Collect signatures.** Open a signing request from a frozen document, or prepare the document and open the request in one call. Add participants, send the request, record a participant's outcome, and expire or void a request you no longer need. Finalize a completed request into a signed artifact.
- **Verify what was signed.** Verify a signed document's signature, which checks that the signed file is intact and was signed with its embedded certificate. You can also check a stored file against the hash recorded for it. Verification needs a workspace sign-in. People outside your workspace can't verify a document yet.
- **Manage signing certificates.** Import a PFX or P12 certificate, or generate a signing key that the platform holds for your workspace.
- **Set up signing profiles.** Create signing profiles and reusable signature marks, and choose which signing provider and which of your certificates each profile signs with.
- **Check readiness and providers.** Preview whether a document is ready to sign, and list the signing providers your workspace can use.
- **Review the evidence.** Read signatures, signing participants and signing logs. See [Trust and compliance](~/Capabilities/Trust-and-Compliance.md).

## Before you call it

- **Sign in.** Sign in with your email address to get a token, or use the OpenID Connect flows. See [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md) and [REST API development](~/Web-API-Development/REST-API-Development.md).
- **Name the workspace.** Every call takes the workspace from the `X-TenantId` header or the `tenantId` request value. See [Tell us which tenant](~/Web-API-Development/REST-API-Development.md#tell-us-which-tenant).
- **Hold the permission.** Signed documents need `signed_documents_read`, `signed_documents_create`, `signed_documents_update`, `signed_documents_delete` or `signed_documents_manage` (finalizing a request or running a signing provider needs `signed_documents_manage`). Signatures need `signatures_read`, and attachments need `signed_document_attachments_*`. Certificates need `signing_certificates_*`, generating a signing key needs `signing_certificates_manage`, profiles need `signing_profiles_*`, signature marks need `signature_representations_*`, and the logs need `signing_logs_read`.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `TrustService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## Signatures

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TrustService/Signatures` | `signatures_read` | Workspace member | Get all signatures |
| GET | `/api/v2/TrustService/Signatures/Count` | `signatures_read` | Workspace member | Get signatures count |
| GET | `/api/v2/TrustService/Signatures/{id}` | `signatures_read` | Workspace member | Get signature by ID |

## SignedDocumentArtifacts

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TrustService/SignedDocumentArtifacts/reference/{fileUploadId}` | `signed_documents_read` | Workspace member | Get an artifact reference |
| GET | `/api/v2/TrustService/SignedDocumentArtifacts/reference/{fileUploadId}/verify` | `signed_documents_read` | Workspace member | Verify an artifact hash |
| POST | `/api/v2/TrustService/SignedDocumentArtifacts/{signedDocumentId}/freeze` | `signed_documents_update` | Workspace member | Freeze the source for signature |
| PUT | `/api/v2/TrustService/SignedDocumentArtifacts/{signedDocumentId}/primary-file/{fileUploadId}` | `signed_documents_update` | Workspace member | Set the primary authoring file |

## SignedDocumentAttachments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TrustService/SignedDocumentAttachments` | `signed_document_attachments_read` | Workspace member | Get all signed document attachments |
| POST | `/api/v2/TrustService/SignedDocumentAttachments` | `signed_document_attachments_create` | Workspace member | Create a new signed document attachment |
| GET | `/api/v2/TrustService/SignedDocumentAttachments/Count` | `signed_document_attachments_read` | Workspace member | Get signed document attachments count |
| GET | `/api/v2/TrustService/SignedDocumentAttachments/{id}` | `signed_document_attachments_read` | Workspace member | Get signed document attachment by ID |
| PUT | `/api/v2/TrustService/SignedDocumentAttachments/{id}` | `signed_document_attachments_update` | Workspace member | Update a signed document attachment |
| PATCH | `/api/v2/TrustService/SignedDocumentAttachments/{id}` | `signed_document_attachments_update` | Workspace member | Patch a signed document attachment |
| DELETE | `/api/v2/TrustService/SignedDocumentAttachments/{id}` | `signed_document_attachments_delete` | Workspace member | Delete a signed document attachment |

## SignedDocuments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TrustService/SignedDocuments` | `signed_documents_read` | Workspace member | Get all signed documents |
| POST | `/api/v2/TrustService/SignedDocuments` | `signed_documents_create` | Workspace member | Create a new signed document |
| GET | `/api/v2/TrustService/SignedDocuments/Count` | `signed_documents_read` | Workspace member | Get signed documents count |
| POST | `/api/v2/TrustService/SignedDocuments/prepare-and-quick-sign` | `signed_documents_update` | Workspace member | Create, freeze, and quick-sign a document in one call |
| GET | `/api/v2/TrustService/SignedDocuments/{id}` | `signed_documents_read` | Workspace member | Get signed document by ID |
| PUT | `/api/v2/TrustService/SignedDocuments/{id}` | `signed_documents_update` | Workspace member | Update a signed document |
| PATCH | `/api/v2/TrustService/SignedDocuments/{id}` | `signed_documents_update` | Workspace member | Patch a signed document |
| DELETE | `/api/v2/TrustService/SignedDocuments/{id}` | `signed_documents_delete` | Workspace member | Delete a signed document |
| POST | `/api/v2/TrustService/SignedDocuments/{id}/quick-sign` | `signed_documents_update` | Workspace member | Quick-sign a frozen document |
| GET | `/api/v2/TrustService/SignedDocuments/{id}/verify-signature` | `signed_documents_read` | Workspace member | Verify a signed document's signature |

## SigningCertificates

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TrustService/SigningCertificates` | `signing_certificates_read` | Workspace member | Get all signing certificates |
| POST | `/api/v2/TrustService/SigningCertificates` | `signing_certificates_create` | Workspace member | Create a new signing certificate |
| GET | `/api/v2/TrustService/SigningCertificates/Count` | `signing_certificates_read` | Workspace member | Get signing certificates count |
| POST | `/api/v2/TrustService/SigningCertificates/Import` | `signing_certificates_create` | Workspace member | Import a PFX/P12 signing certificate into custody |
| GET | `/api/v2/TrustService/SigningCertificates/{id}` | `signing_certificates_read` | Workspace member | Get signing certificate by ID |
| PUT | `/api/v2/TrustService/SigningCertificates/{id}` | `signing_certificates_update` | Workspace member | Update a signing certificate |
| PATCH | `/api/v2/TrustService/SigningCertificates/{id}` | `signing_certificates_update` | Workspace member | Patch a signing certificate |
| DELETE | `/api/v2/TrustService/SigningCertificates/{id}` | `signing_certificates_delete` | Workspace member | Delete a signing certificate |

## SigningEngine

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/TrustService/SigningEngine/Preview` | `signed_documents_read` | Workspace member | Preview signing readiness |
| GET | `/api/v2/TrustService/SigningEngine/Providers` | `signed_documents_read` | Workspace member | List signing providers |
| GET | `/api/v2/TrustService/SigningEngine/Providers/Count` | `signed_documents_read` | Workspace member | Count signing providers |

## SigningKeys

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/TrustService/SigningKeys` | `signing_certificates_manage` | Workspace member | Generate a tenant signing key in custody |

## SigningLogs

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TrustService/SigningLogs` | `signing_logs_read` | Workspace member | Get all signing logs |
| GET | `/api/v2/TrustService/SigningLogs/Count` | `signing_logs_read` | Workspace member | Get signing logs count |
| GET | `/api/v2/TrustService/SigningLogs/{id}` | `signing_logs_read` | Workspace member | Get signing log by ID |

## SigningParticipants

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TrustService/SigningParticipants` | `signed_documents_read` | Workspace member | Get all signing participants |
| GET | `/api/v2/TrustService/SigningParticipants/Count` | `signed_documents_read` | Workspace member | Get signing participants count |
| GET | `/api/v2/TrustService/SigningParticipants/{id}` | `signed_documents_read` | Workspace member | Get signing participant by ID |
| POST | `/api/v2/TrustService/SigningParticipants/{id}/outcome` | `signed_documents_update` | Workspace member | Record a manual/external participant outcome |
| POST | `/api/v2/TrustService/SigningParticipants/{id}/viewed` | `signed_documents_update` | Workspace member | Mark a participant as having viewed the request |

## SigningProfileGraphicalRepresentations

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TrustService/SigningProfileGraphicalRepresentations` | `signature_representations_read` | Workspace member | Get all signature representations |
| POST | `/api/v2/TrustService/SigningProfileGraphicalRepresentations` | `signature_representations_create` | Workspace member | Create a new signature representation |
| GET | `/api/v2/TrustService/SigningProfileGraphicalRepresentations/Count` | `signature_representations_read` | Workspace member | Get signature representations count |
| GET | `/api/v2/TrustService/SigningProfileGraphicalRepresentations/{id}` | `signature_representations_read` | Workspace member | Get signature representation by ID |
| PUT | `/api/v2/TrustService/SigningProfileGraphicalRepresentations/{id}` | `signature_representations_update` | Workspace member | Update a signature representation |
| PATCH | `/api/v2/TrustService/SigningProfileGraphicalRepresentations/{id}` | `signature_representations_update` | Workspace member | Patch a signature representation |
| DELETE | `/api/v2/TrustService/SigningProfileGraphicalRepresentations/{id}` | `signature_representations_delete` | Workspace member | Delete a signature representation |

## SigningProfiles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TrustService/SigningProfiles` | `signing_profiles_read` | Workspace member | Get all signing profiles |
| POST | `/api/v2/TrustService/SigningProfiles` | `signing_profiles_create` | Workspace member | Create a new signing profile |
| GET | `/api/v2/TrustService/SigningProfiles/Count` | `signing_profiles_read` | Workspace member | Get signing profiles count |
| GET | `/api/v2/TrustService/SigningProfiles/{id}` | `signing_profiles_read` | Workspace member | Get signing profile by ID |
| PUT | `/api/v2/TrustService/SigningProfiles/{id}` | `signing_profiles_update` | Workspace member | Update a signing profile |
| PATCH | `/api/v2/TrustService/SigningProfiles/{id}` | `signing_profiles_update` | Workspace member | Patch a signing profile |
| DELETE | `/api/v2/TrustService/SigningProfiles/{id}` | `signing_profiles_delete` | Workspace member | Delete a signing profile |
| GET | `/api/v2/TrustService/SigningProfiles/{id}/execution-binding` | `signing_profiles_read` | Workspace member | Get a signing profile's execution binding |
| POST | `/api/v2/TrustService/SigningProfiles/{id}/execution-binding` | `signing_profiles_manage` | Workspace member | Set a signing profile's execution binding |

## SigningRequests

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/TrustService/SigningRequests` | `signed_documents_read` | Workspace member | Get all signing requests |
| GET | `/api/v2/TrustService/SigningRequests/Count` | `signed_documents_read` | Workspace member | Get signing requests count |
| POST | `/api/v2/TrustService/SigningRequests/from-document/{signedDocumentId}` | `signed_documents_update` | Workspace member | Create a signing request from a frozen document |
| POST | `/api/v2/TrustService/SigningRequests/prepare-and-create` | `signed_documents_update` | Workspace member | Create, store, freeze a document and open a signing request in one call |
| GET | `/api/v2/TrustService/SigningRequests/{id}` | `signed_documents_read` | Workspace member | Get signing request by ID |
| GET | `/api/v2/TrustService/SigningRequests/{id}/Participants` | `signed_documents_read` | Workspace member | Get participants of a signing request |
| POST | `/api/v2/TrustService/SigningRequests/{id}/Participants` | `signed_documents_update` | Workspace member | Add a participant to a signing request |
| POST | `/api/v2/TrustService/SigningRequests/{id}/execute-provider` | `signed_documents_manage` | Workspace member | Run a signing provider to produce + finalize the signed artifact |
| POST | `/api/v2/TrustService/SigningRequests/{id}/expire` | `signed_documents_update` | Workspace member | Expire a signing request |
| POST | `/api/v2/TrustService/SigningRequests/{id}/finalize` | `signed_documents_manage` | Workspace member | Finalize a completed request into a signed artifact |
| POST | `/api/v2/TrustService/SigningRequests/{id}/send` | `signed_documents_update` | Workspace member | Send a signing request |
| POST | `/api/v2/TrustService/SigningRequests/{id}/void` | `signed_documents_update` | Workspace member | Void a signing request |

Generated from the source at commit 642fb3c3ad.
<!-- generated:end -->
