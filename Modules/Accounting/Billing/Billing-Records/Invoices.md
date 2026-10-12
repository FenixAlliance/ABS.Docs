# Invoices

An invoice bills a customer for goods or services in the invoice's own currency, and becomes a payable amount when it is issued.

**Who it is for:** billing administrators and anyone who bills customers from a workspace.

**Availability:** in Studio, open your workspace and go to **Modules** > **Accounting** > **Billing** > **Invoices**. You need permission to read invoices to see them, to create invoices to add one, and to update invoices to change or issue one. Generating a payment link also needs permission to manage payments.

## The life of an invoice

| Stage | What it means | What you can do |
|-------|---------------|-----------------|
| **Draft** | The invoice is being prepared. | Edit everything, add and remove lines, recalculate, delete. |
| **Issued** | The invoice is final and payable. It has its number, if your workspace uses number ranges. | Edit the description and the dates. Issue credit and debit notes against it. Its amounts no longer change. |
| **Paid** | A live payment covered what is owed. | Review the payment on the invoice. |

An issued invoice is never re-priced. If you try to change an amount on it, the change is refused with the message that the invoice has been issued and must be corrected with a credit or debit note.

## Create an invoice

1. Go to **Invoices** and select **Add**.
2. In **Create Invoice**, enter a **Title** and choose the customer: an **Individual**, an **Organization** or both. You can link the invoice to an **Order**.
3. Choose the **Currency**. If you leave it empty, the invoice takes your workspace's currency.
4. Optionally choose a **Price List**, a **Payment Mode**, a **Payment Due** date, the **Emisor Billing Profile** and **Receiver Billing Profile**, and an **Invoice Enumeration Range**.
5. Under **Lines**, select **Add Line**, choose the **Item** and enter the **Quantity**. Repeat for each line.
6. Select **Create**. The invoice is created as a draft.

You can also open the **Create Invoice** page directly from an invoice's details page.

To learn how line amounts and taxes are calculated, see [Billing item records](../Billing-Item-Records.md).

## Work on a draft invoice

Open the invoice from **Invoices** with **View**. The details page shows the invoice summary, its details, its lines, its adjustments and its references.

- Change the details and select **Save Changes**.
- Add, edit or delete lines in the lines section.
- From the actions menu, select **Recalculate** to refresh the totals.
- From the actions menu, select **Delete** to remove a draft you no longer need.

## Issue an invoice

Issuing makes the invoice final and payable. When your workspace uses number ranges, issuing also gives the invoice the next number from its range.

- **Invoices from checkout** are issued automatically when a buyer checks out an order.
- **Invoices you create** are issued through the REST API with `POST /api/v2/InvoicingService/Invoices/{invoiceId}/Issue`, or created already issued by sending the status `Signed` when you create them through the API. Issuing an invoice that is already issued succeeds and changes nothing.

Issuing is refused when:

- your workspace has number ranges for invoices but every one of them is expired or used up. Add or extend a range, then issue again;
- several ranges are active at the same time and the invoice does not name one. Choose the range on the invoice;
- the invoice has no currency.

A refused issue uses no number, so your numbering has no gaps. See [Invoice-number ranges](../Invoice-Number-Ranges.md).

## Share an invoice and get paid

To get paid, open the invoice from **Wallet** > **Invoices** and select **Payment link**. The button shows on any unpaid invoice. It creates a link your customer uses to pay on your payment provider's checkout.

Your customer can pay through the link while the invoice has a balance due and is not paid, closed or on hold. See [Payments](Payments.md) for how the payment link and checkout work.

In **Accounting** > **Billing** > **Invoices**, the actions menu offers **Preview** (to see the invoice as your customer sees it) and **Send Email** (to send it to an address you enter) on closed invoices only.

A closed invoice allows no further changes, cannot be deleted, cannot be paid through a payment link and cannot take a credit or debit note.

## Correct an issued invoice

You never edit the amounts of an issued invoice. Instead, open the invoice and choose from the actions menu:

- **Credit note**, to reduce what is owed, for example for a return, a discount or an annulment.
- **Debit note**, to increase what is owed, for example for interest or extra charges.

See [Credit and debit notes](../Credit-and-Debit-Notes.md).

## Currency

- Every invoice has its own currency. The invoice is totaled in it, and its details page shows its amounts in it. The platform never falls back to US dollars.
- An invoice created without a currency takes your workspace's currency. If none can be determined, the invoice is refused.
- The exchange rates in effect when the invoice is billed are captured with it, so its reporting amounts do not change later.

## Accounting

When **Post journal entries automatically** is turned on in your Accounting settings, the platform posts a journal entry when an invoice is issued and again when it is paid. When the setting is off, nothing posts automatically. See [Accounting](~/Modules/Accounting.md).

## Fiscal authorities

Electronic submission of invoices to a tax authority is not available yet.

## For developers

Invoices are available under `/api/v2/InvoicingService/Invoices`. The API covers listing, reading, creating, updating and deleting invoices, their lines, line taxes, adjustments and references, as well as issuing, credit and debit notes, the creditable amount and the invoice's payments.
