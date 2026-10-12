# Invoicing service

The Invoicing service lets you create, issue, correct and send your workspace's invoices, and read the payments recorded on them.

**Who uses it:** developers who connect billing, order processing or a customer portal to a workspace.

**Base route:** `/api/v2/InvoicingService/...`

## What you can do

- **Create and edit invoices:** create an invoice, add, update or remove its lines, line taxes, references and adjustments, and calculate the totals of the invoice or of a single line. See [Invoices](~/Modules/Accounting/Billing/Billing-Records/Invoices.md).
- **Issue an invoice:** issue a draft so it becomes final and payable. It takes its number when your workspace has a number range. See [Invoice-number ranges](~/Modules/Accounting/Billing/Invoice-Number-Ranges.md).
- **Correct an issued invoice:** read the amount that can still be credited, and issue a credit note or a debit note against the invoice. A note posts to your books only when automatic journal posting is turned on. See [Credit and debit notes](~/Modules/Accounting/Billing/Credit-and-Debit-Notes.md).
- **Send an invoice:** preview the invoice email and send it to its recipients.
- **Report on invoices:** list and count invoices with their extended details, sum your sales and purchase invoices, and aggregate totals, taxes, tax bases, discounts and surcharges.
- **Follow payments:** list and count the payments recorded against an invoice. To collect a payment, see [Payments](~/Modules/Accounting/Billing/Billing-Records/Payments.md).
- **Re-post an invoice to your books:** when the accounting entry of an issued invoice did not complete, fix the cause, then post it again with a reason. Each re-post is audited, and an invoice takes at most three re-posts in 24 hours.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** `invoices_read`, `invoices_create`, `invoices_update` and `invoices_delete`; `email_send` to preview or send the invoice email; `journals_post` to re-post an invoice to your books; `carts_read` to recognise a voucher code for a cart.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `InvoicingService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## Coupons

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/InvoicingService/Coupons/Recognition` | `carts_read` | Workspace member | Recognise a voucher code for your cart. |

## InvoiceEstablishmentRepost

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/InvoicingService/Invoices/{invoiceId}/EstablishmentRepost` | `journals_post` | Workspace member | Re-post an issued invoice's establishment. |

## Invoices

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/InvoicingService/Invoices` | `invoices_read` | Workspace member | Get a list of invoices. |
| POST | `/api/v2/InvoicingService/Invoices` | `invoices_create` | Workspace member | Create a new invoice. |
| GET | `/api/v2/InvoicingService/Invoices/Count` | `invoices_read` | Workspace member | Get the count of invoices. |
| POST | `/api/v2/InvoicingService/Invoices/DiscountsAggregate` | `invoices_read` | Workspace member | Aggregate invoice discounts. |
| GET | `/api/v2/InvoicingService/Invoices/Extended` | `invoices_read` | Workspace member | Get a list of extended invoices. |
| GET | `/api/v2/InvoicingService/Invoices/Extended/Count` | `invoices_read` | Workspace member | Get the count of extended invoices. |
| POST | `/api/v2/InvoicingService/Invoices/GlobalSurchargesAggregate` | `invoices_read` | Workspace member | Aggregate invoice global surcharges. |
| GET | `/api/v2/InvoicingService/Invoices/PurchaseInvoices/Sum` | `invoices_read` | Workspace member | Sum tenant purchase-invoice totals. |
| GET | `/api/v2/InvoicingService/Invoices/SalesInvoices/Sum` | `invoices_read` | Workspace member | Sum tenant sales-invoice totals. |
| POST | `/api/v2/InvoicingService/Invoices/TaxBasesAggregate` | `invoices_read` | Workspace member | Aggregate invoice tax bases. |
| POST | `/api/v2/InvoicingService/Invoices/TaxesAggregate` | `invoices_read` | Workspace member | Aggregate invoice taxes. |
| POST | `/api/v2/InvoicingService/Invoices/TotalsAggregate` | `invoices_read` | Workspace member | Aggregate invoice totals. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}` | `invoices_read` | Workspace member | Get an invoice by ID. |
| PUT | `/api/v2/InvoicingService/Invoices/{invoiceId}` | `invoices_update` | Workspace member | Update an invoice. |
| PATCH | `/api/v2/InvoicingService/Invoices/{invoiceId}` | `invoices_update` | Workspace member | Patch an invoice. |
| DELETE | `/api/v2/InvoicingService/Invoices/{invoiceId}` | `invoices_delete` | Workspace member | Delete an invoice. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/Adjustments` | `invoices_read` | Workspace member | Get invoice adjustments. |
| POST | `/api/v2/InvoicingService/Invoices/{invoiceId}/Adjustments` | `invoices_update` | Workspace member | Create a new invoice adjustment. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/Adjustments/Count` | `invoices_read` | Workspace member | Get the count of invoice adjustments. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/Adjustments/{invoiceAdjustmentId}` | `invoices_read` | Workspace member | Get an invoice adjustment by ID. |
| PUT | `/api/v2/InvoicingService/Invoices/{invoiceId}/Adjustments/{invoiceAdjustmentId}` | `invoices_update` | Workspace member | Update an invoice adjustment. |
| PATCH | `/api/v2/InvoicingService/Invoices/{invoiceId}/Adjustments/{invoiceAdjustmentId}` | `invoices_update` | Workspace member | Patch an invoice adjustment. |
| DELETE | `/api/v2/InvoicingService/Invoices/{invoiceId}/Adjustments/{invoiceAdjustmentId}` | `invoices_update` | Workspace member | Delete an invoice adjustment. |
| PUT | `/api/v2/InvoicingService/Invoices/{invoiceId}/Calculate` | `invoices_update` | Workspace member | Calculate an invoice. |
| POST | `/api/v2/InvoicingService/Invoices/{invoiceId}/CreditNotes` | `invoices_create` | Workspace member | Issue a credit note against an issued invoice. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/CreditableAmount` | `invoices_read` | Workspace member | Get what can still be credited on an invoice. |
| POST | `/api/v2/InvoicingService/Invoices/{invoiceId}/DebitNotes` | `invoices_create` | Workspace member | Issue a debit note against an issued invoice. |
| POST | `/api/v2/InvoicingService/Invoices/{invoiceId}/Emails/Preview` | `email_send` | Workspace member | Preview the rendered email for an invoice. |
| POST | `/api/v2/InvoicingService/Invoices/{invoiceId}/Emails/Send` | `email_send` | Workspace member | Send an invoice transactional email to recipients. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/Extended` | `invoices_read` | Workspace member | Get an extended invoice by ID. |
| POST | `/api/v2/InvoicingService/Invoices/{invoiceId}/Issue` | `invoices_update` | Workspace member | Issue an invoice. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines` | `invoices_read` | Workspace member | Get invoice lines. |
| POST | `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines` | `invoices_update` | Workspace member | Create a new invoice line. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines/Count` | `invoices_read` | Workspace member | Get the count of invoice lines. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines/{invoiceLineId}` | `invoices_read` | Workspace member | Get an invoice line by ID. |
| PUT | `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines/{invoiceLineId}` | `invoices_update` | Workspace member | Update an invoice line. |
| PATCH | `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines/{invoiceLineId}` | `invoices_update` | Workspace member | Patch an invoice line. |
| DELETE | `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines/{invoiceLineId}` | `invoices_update` | Workspace member | Delete an invoice line. |
| PUT | `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines/{invoiceLineId}/Calculate` | `invoices_update` | Workspace member | Calculate an invoice line. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines/{invoiceLineId}/Taxes` | `invoices_read` | Workspace member | Get taxes for an invoice line. |
| POST | `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines/{invoiceLineId}/Taxes` | `invoices_update` | Workspace member | Create a new tax for an invoice line. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines/{invoiceLineId}/Taxes/Count` | `invoices_read` | Workspace member | Get the count of taxes for an invoice line. |
| PUT | `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines/{invoiceLineId}/Taxes/{invoiceLineTaxId}` | `invoices_update` | Workspace member | Update a tax for an invoice line. |
| PATCH | `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines/{invoiceLineId}/Taxes/{invoiceLineTaxId}` | `invoices_update` | Workspace member | Patch a tax for an invoice line. |
| DELETE | `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines/{invoiceLineId}/Taxes/{invoiceLineTaxId}` | `invoices_update` | Workspace member | Delete a tax from an invoice line. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/Payments` | `invoices_read` | Workspace member | Get payments for an invoice. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/Payments/Count` | `invoices_read` | Workspace member | Get the count of payments for an invoice. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/References` | `invoices_read` | Workspace member | Get invoice references. |
| POST | `/api/v2/InvoicingService/Invoices/{invoiceId}/References` | `invoices_update` | Workspace member | Create a new invoice reference. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/References/Count` | `invoices_read` | Workspace member | Get the count of invoice references. |
| GET | `/api/v2/InvoicingService/Invoices/{invoiceId}/References/{invoiceReferenceId}` | `invoices_read` | Workspace member | Get an invoice reference by ID. |
| PUT | `/api/v2/InvoicingService/Invoices/{invoiceId}/References/{invoiceReferenceId}` | `invoices_update` | Workspace member | Update an invoice reference. |
| PATCH | `/api/v2/InvoicingService/Invoices/{invoiceId}/References/{invoiceReferenceId}` | `invoices_update` | Workspace member | Patch an invoice reference. |
| DELETE | `/api/v2/InvoicingService/Invoices/{invoiceId}/References/{invoiceReferenceId}` | `invoices_update` | Workspace member | Delete an invoice reference. |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
