# Billing records

Billing records are the documents your workspace uses to record what it sells, what it is owed and what it has been paid.

**Who it is for:** anyone who works with invoices, notes, orders, payments or receipts and wants to know how these documents relate.

**Availability:** billing records appear in Studio under **Modules** > **Accounting** > **Billing** for your workspace, and through the platform's REST API. Each record type needs its own read or write permission.

## Record types

| Record | What it is | Page |
|--------|-----------|------|
| **Invoice** | A bill to a customer. It starts as a draft and becomes a payable amount when it is issued. | [Invoices](Billing-Records/Invoices.md) |
| **Credit note** | A document that reduces what is owed on an issued invoice. | [Credit and debit notes](Credit-and-Debit-Notes.md) |
| **Debit note** | A document that increases what is owed on an issued invoice. | [Credit and debit notes](Credit-and-Debit-Notes.md) |
| **Order** | A customer's order. Orders are managed in Sales Hub. | [Orders](Billing-Records/Orders.md) |
| **Payment** | Money received against an invoice. | [Payments](Billing-Records/Payments.md) |
| **Receipt** | A record that a payment was received or that goods were received from a supplier. | [Receipts](Billing-Records/Receipts.md) |

## Rules that apply to every billing record

- **Your workspace owns its records.** Members of other workspaces never see them.
- **Each record has its own currency.** A document is totaled in its own currency, never in a default currency.
- **Lines carry the detail.** Invoices, orders, quotes and deal units hold their items as lines. See [Billing item records](Billing-Item-Records.md).
- **Issued documents are final.** Once an invoice or note is issued, its amounts cannot change. You correct an invoice with a credit or debit note.
- **Numbers come from your own series.** Invoices and notes can draw their numbers from your own ranges. See [Invoice-number ranges](Invoice-Number-Ranges.md).
