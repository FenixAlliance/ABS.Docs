# Bill and get paid

Billing lets you invoice your customers in their currency, correct issued invoices with credit and debit notes, number every document from your own series, and collect payment through the payment provider you connect.

**Who it is for:** finance teams, billing administrators and anyone who issues invoices or follows up on payments for a workspace.

**Availability:** Billing is part of the Accounting module. In Studio, open your workspace and go to **Modules** > **Accounting** > **Billing** to reach the **Billing Dashboard**. What you can see and do depends on your permissions in the workspace: reading invoices, creating invoices, updating invoices and managing payments are separate permissions, granted through your role in the workspace.

## What you find in Billing

The **Billing Dashboard** and the Accounting side menu give you these areas:

| Area | What you do there |
|------|-------------------|
| **Invoices** | Create invoices, add lines and taxes, issue them, preview and email them and generate a payment link. See [Invoices](Billing/Billing-Records/Invoices.md). |
| **Credit Notes** and **Debit Notes** | Reduce or increase what is owed on an issued invoice. See [Credit and debit notes](Billing/Credit-and-Debit-Notes.md). |
| **Payments** | Review the payments recorded against your invoices, including those collected through your payment provider. See [Payments](Billing/Billing-Records/Payments.md). |
| **Receipts** | Review receipt records. See [Receipts](Billing/Billing-Records/Receipts.md). |
| **Profiles** | Keep the billing profiles used on your billing documents. |
| **Numerations** | Set up the number ranges your invoices draw from and watch their health. See [Invoice-number ranges](Billing/Invoice-Number-Ranges.md). |

Orders are managed in Sales Hub. See [Orders](~/Modules/Sales-Hub/Sales-Records/Orders.md).

## How billing works from invoice to payment

1. **You create an invoice** in Studio or through the API, or a buyer's checkout creates one for an order. A new invoice starts as a draft that you can still edit.
2. **The invoice is issued.** You select **Issue** on the invoice, or a buyer's checkout issues it. Issuing gives the invoice its number from your active range, if you use ranges, and makes it a payable amount. From then on its amounts cannot change.
3. **You share it.** You can preview the issued invoice, send it by email and generate a payment link for it. You can also create the link from **Wallet** > **Invoices**.
4. **Your customer pays** on your payment provider's own checkout. A live payment marks the invoice as paid.
5. **You correct it if needed.** An issued invoice is never re-priced. You issue a credit note to reduce what is owed or a debit note to increase it.
6. **Your books follow.** When **Post journal entries automatically** is turned on in the Accounting settings, the platform posts the journal entry when an invoice is issued, reduced by a credit note or paid. When it is off, nothing posts automatically. See [Accounting](~/Modules/Accounting.md).

## Every document keeps its own currency

Each invoice, note and line carries its own currency. The platform never falls back to US dollars for a document that has a currency of its own.

- When you create an invoice without choosing a currency, it takes your workspace's currency. If no currency can be determined, the invoice is refused rather than given a default.
- A credit or debit note always uses the currency of the invoice it adjusts.
- A document's details page shows its amounts in the document's own currency. For reporting, the platform also keeps each amount converted at the exchange rates captured when the document was billed.

## Fiscal authorities

Electronic submission of invoices to a tax authority is not available yet.

## Related pages

- [Billing records](Billing/Billing-Records.md)
- [Billing item records](Billing/Billing-Item-Records.md)
- [Payment integrations](~/Modules/Integrations.md)
