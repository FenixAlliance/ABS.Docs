# Billing item records

A billing item record is one line on a billing document: one item, its quantity and the amounts calculated for it.

**Who it is for:** anyone who adds lines to deal units, quotes, orders or invoices and wants to understand how a line's total is built.

**Availability:** you add and edit invoice lines on an invoice's details page in Studio, under **Modules** > **Accounting** > **Billing** > **Invoices**. Quote, order and deal unit lines are edited in Sales Hub. Editing lines needs permission to update the document.

## Where lines appear

| Line type | Belongs to |
|-----------|-----------|
| Deal unit line | A deal unit in Sales Hub |
| Quote line | A quote |
| Order line | An order |
| Invoice line | An invoice |

## Add a line to an invoice

1. Open the invoice from **Invoices**.
2. In the invoice lines section, select **Add**.
3. Choose the **Item** and enter the **Quantity**. You can add a **Description**.
4. Select **Add**. The platform calculates the line's amounts from the item's pricing.

To add taxes, open the line with **Edit**. The **Update Invoice Line** form includes a **Taxes** section where you apply the tax policies defined for your workspace under **Accounting** > **Taxes** > **Tax Policies**.

You can add, edit and delete lines only while the invoice is a draft.

## How a line's total is built

Each line shows its amounts in the document's currency, grouped as follows.

| Group | Amounts |
|-------|---------|
| **Subtotals** | **Detail Amount** (the price of the goods), **Profit** |
| **Pre-Tax Adjustments** | **Discounts** and **Surcharges** that change the amount taxes are calculated on |
| **Tax** | **Tax Base** (the amount taxes are calculated on), **Taxes**, **Withheld Taxes** |
| **Shipping** | **Shipping Cost** and **Shipping Taxes** |
| **Post-Tax Adjustments** | **Global Discounts** and **Global Surcharges**, applied after taxes, for amounts outside the taxable value such as a processing fee |
| **Total** | **Grand Total** of the line |

Each tax policy you apply adds its percentage of the tax base to the line. For example, a 19% VAT policy on a tax base of 100 adds 19 to the line's taxes.

## Currency and exchange rates

- Every line carries a currency. There is no default currency.
- A line's amounts are shown in the currency of its document.
- For reporting, the **Reporting** section shows the amounts converted using the exchange rates captured when the document was billed. Those rates are kept with the document, so later rate changes do not alter an issued invoice.

## For developers

Lines are available through the REST API on each document, for example `/api/v2/InvoicingService/Invoices/{invoiceId}/Lines` for invoice lines. A line can be priced automatically or with custom amounts that you supply.
