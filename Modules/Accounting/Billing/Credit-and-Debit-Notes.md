# Credit and debit notes

A credit note reduces what is owed on an issued invoice, and a debit note increases it, so you correct an invoice without changing the invoice itself.

**Who it is for:** billing administrators who handle returns, discounts, annulments, interest or extra charges after an invoice is issued.

**Availability:** in Studio, open your workspace and go to **Modules** > **Accounting** > **Billing**. Notes are listed under **Credit Notes** and **Debit Notes**. Issuing a note needs permission to create invoices.

## Rules for every note

- A note adjusts an **issued** standard invoice. A draft invoice is corrected by editing it instead.
- A note never adjusts another note.
- A closed invoice cannot take a note.
- The note is in the currency of the invoice it adjusts.
- Every note states a reason and a description of 20 to 5000 characters.
- The note is issued as soon as you create it. When your workspace has a number range for that kind of note, the note takes the next number in its own series, separate from your invoice numbers.

## Issue a credit note

1. Open the issued invoice from **Invoices**.
2. In the actions menu, select **Credit note**. The **Create credit note** page opens with the invoice selected.
3. Check the invoice's **Invoice number**, **Currency**, **Invoice total** and **Creditable amount**.
4. Choose a **Reason**: **Return**, **Annulment**, **Discount**, **Price adjustment** or **Other**.
5. Enter the **Amount**. It must be greater than zero and cannot exceed the creditable amount.
6. Enter the **Reason description**.
7. Select **Issue credit note**. The page confirms the note and shows its number when it has one.

An **Annulment** always credits the full creditable amount, so the amount is filled in for you and cannot be changed.

### What "creditable amount" means

The creditable amount is the most that can still be credited on the invoice: the invoice total, plus its issued debit notes, minus its issued credit notes. A credit note never exceeds it. When nothing remains to be credited, the page tells you so and you cannot issue another credit note.

## Issue a debit note

1. Open the issued invoice from **Invoices**.
2. In the actions menu, select **Debit note**. The **Create debit note** page opens with the invoice selected.
3. Choose a **Reason**: **Interest**, **Charges**, **Value change** or **Other**.
4. Enter the **Amount**. It must be greater than zero.
5. Enter the **Reason description**.
6. Select **Issue debit note**.

A debit note has no upper limit. It raises the invoice's creditable amount by the amount of the note.

## What a note changes

- **What the customer owes.** A credit note lowers the amount outstanding on the invoice and a debit note raises it.
- **Your books.** When **Post journal entries automatically** is turned on in your Accounting settings, the platform posts the note's journal entry once the note is issued. When it is off, nothing posts automatically. See [Accounting](~/Modules/Accounting.md).
- **The original invoice.** The invoice itself does not change. The note keeps the reason and a reference to the invoice it adjusts.

## Numbering notes

Credit notes and debit notes each draw from their own number series. Set up a range for each kind of note through the API, choosing the credit note or debit note document type. Without a range for that kind of note, the note is issued without a number. See [Invoice-number ranges](Invoice-Number-Ranges.md).

## For developers

- `GET /api/v2/InvoicingService/Invoices/{invoiceId}/CreditableAmount` returns what can still be credited, in the invoice's currency.
- `POST /api/v2/InvoicingService/Invoices/{invoiceId}/CreditNotes` issues a credit note.
- `POST /api/v2/InvoicingService/Invoices/{invoiceId}/DebitNotes` issues a debit note.

Each request carries the amount, the reason and the reason description. A request that breaks a rule above is refused and nothing is issued.
