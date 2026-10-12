# Invoice-number ranges

An invoice-number range is a block of numbers, valid between two dates, that your invoices draw their numbers from when they are issued.

**Who it is for:** billing administrators who set up invoice numbering, for example to match the numbering authorization a tax authority gave your business.

**Availability:** in Studio, open your workspace and go to **Modules** > **Accounting** > **Billing** > **Numerations**. The page is titled **Numeration Ranges**. You need permission to read invoices to see ranges, to create invoices to add one, and to update invoices to edit one.

## How numbering works

- **Numbering is optional.** A workspace without any range issues its invoices without a number.
- **Numbers are taken when an invoice is issued**, not when it is created. A draft has no number yet.
- **Numbers have no gaps.** A refused issue uses no number, and two invoices never get the same number.
- **The number shows with your prefix and suffix.** For example, a range with prefix `FV-` gives invoice numbers such as `FV-1001`.
- **One range at a time.** When exactly one range is valid and has numbers left, invoices use it. When several are, each invoice must name its range in the **Invoice Enumeration Range** field.
- **Invoices and notes use separate series.** A range is for one kind of document: invoices, credit notes or debit notes.

## Create a range

1. Go to **Numerations** and select **Add**.
2. In **Create Numeration Range**, enter:
   - **Identifier**, for example the resolution or authorization number of the range;
   - **Prefix** and **Suffix**, the text placed before and after each number;
   - **Numeration From** and **Numeration To**, the first and last numbers of the range;
   - **Valid From** and **Valid To**, the dates the range can be used;
   - **Fiscal Authority**, if the range was authorized by a tax authority.
3. Select **Create**.

The first invoice issued from a new range takes the **Numeration From** number. The platform keeps track of the last number used; you cannot set it yourself.

Ranges you create in Studio are for invoices. To create a range for credit notes or debit notes, use the API and set the document type of the range. See [Credit and debit notes](Credit-and-Debit-Notes.md).

## Watch range health

The **Health** column of the **Numeration Ranges** grid tells you which ranges need attention:

| Health | Meaning |
|--------|---------|
| **Active** | The range is valid and has numbers left. |
| **Expiring soon** | The range is valid but ends within 30 days. |
| **Nearly exhausted** | The range is valid but has 10% or fewer of its numbers left. |
| **Exhausted** | Every number in the range has been used. |
| **Expired** | The range's **Valid To** date has passed. |
| **Not yet valid** | The range's **Valid From** date has not arrived. |

Select **Refresh** to update the grid.

## Extend a range

1. In the **Numeration Ranges** grid, open the range's actions and select **Edit**.
2. Raise **Numeration To** for more numbers, or move **Valid To** for more time.
3. Select **Save**.

Once a range has issued numbers, its **Numeration From** cannot change, and **Numeration To** cannot go below a number it has already issued.

## Notices to your billing administrators

The platform warns the people who manage invoices in your workspace, and its owners and administrators, through their notifications:

- **When a range is running low.** When an invoice takes a number and leaves its range nearly used up or close to its end date, they receive a notice with the numbers remaining and the days until the range expires. They receive it at most once a day for each range.
- **When a range is used up.** When the platform cannot issue an invoice automatically because no range is usable, they receive a notice asking them to add or extend a range.

Each notice links to the **Numeration Ranges** page.

## When no range is usable

If your workspace has ranges for a kind of document but all of them are expired or used up, issuing that kind of document is refused until you add a new range or extend an existing one. Nothing is numbered or issued in the meantime.

## For developers

Ranges are available under `/api/v2/AccountingService/InvoiceEnumerationRanges`. Each range carries its document type: standard invoice, credit note or debit note.
