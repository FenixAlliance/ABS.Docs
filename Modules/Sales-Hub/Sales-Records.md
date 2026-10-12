# Sales records

Sales records are the deal units, quotes and orders that carry a sale from opportunity to invoice.

**Who it is for:** sales managers and sellers who need to know which record to use at each step, and how the records connect.

**Availability:** part of Sales Hub in every workspace. Each record type has its own permissions to view, create, update and delete. In Studio, open your workspace, select **Modules**, and open **Sales**.

## The three sales records

| Record | Use it to | Main actions |
|---|---|---|
| [Deal unit](Sales-Records/Deal-Units.md) | Track an opportunity and its expected value | Add lines, recalculate, place on a flow stage, close as won or lost |
| [Quote](Sales-Records/Quotes.md) | Offer prices to a customer for a limited time | Add lines, email, share, close and reopen; the customer places the order |
| [Order](Sales-Records/Orders.md) | Record a confirmed sale and fulfil it | Number, track status, ship, invoice, collect payment |

## How the records connect

A sale usually moves through these steps. You can start at any of them.

1. **Deal unit.** You record the opportunity, the customer and the items you expect to sell.
2. **Quote.** You create a quote and link it to the deal unit with its **Deal Unit** field. The deal unit's **Quotes** tab lists every quote linked to it.
3. **Order.** Your customer places the order from the quote they received, or you create the order yourself and link it to the quote with its **Quote** field. The quote's **Orders** tab lists its orders.
4. **Invoice.** You create an invoice from the order's **Invoices** tab. Your customer pays the invoice through its payment checkout. Payments recorded against the order appear on its **Payments** tab.

When your customer places an order from a quote, the order takes the quote's lines, totals and currency. When you link records yourself, each record keeps its own lines and totals.

## Customers on sales records

Every sales record names its customer through an **Individual**, an **Organization**, or both, chosen from your [contacts](~/Modules/CRM/Contacts.md).

A quote or an order can also name a **Receiver Tenant**: the customer's own workspace on the platform. A record with a receiver appears in that workspace's wallet, where the customer can review it. For quotes, this is how your customer places the order on their side. See [Quotes](Sales-Records/Quotes.md).

## Lines and totals

Each sales record has lines. A line names an item from your catalog, a quantity and an optional description. Prices come from the record's **Price List**, and the record's totals (subtotal, discounts, surcharges, taxes and total) are calculated from its lines. On deal units and quotes, use the recalculate action after you change the price list or the lines.

## Currency

Every sales record keeps its own currency. A record's lines take the record's currency, its totals are calculated in it, and the record's detail page shows its amounts in it. An order placed from a quote keeps the quote's currency.

## Related pages

- [Sales Hub](~/Modules/Sales-Hub.md)
- [Deal unit flows](Sales-Flows.md)
- [Invoices](~/Modules/Accounting/Billing/Billing-Records/Invoices.md)
