# Orders

An order records a confirmed sale: what your customer is buying, where it ships, and how it is invoiced and paid.

**Who it is for:** sellers and order processors who fulfil sales, sales managers who follow them, and customers who track what they bought.

**Availability:** part of Sales Hub in every workspace. Viewing, creating, updating and deleting orders are granted separately by role. In Studio, open your workspace, select **Modules**, open **Sales**, and select **Orders**. Customers see their orders in their **Wallet**.

## How orders are created

An order reaches your **Orders** in one of three ways:

- **Your customer checks out a cart** from your store or the marketplace.
- **Your customer places it from a quote** you sent them. See [Quotes](Quotes.md).
- **You create it yourself** in Sales Hub.

## Order numbers

Every order gets a number in your own series as soon as it is created, for example **ORD-000123**. Your series starts at ORD-000001 and counts up by one for each new order. The number cannot be edited, and an order is never renumbered.

The number appears in the order preview and in your customer's list of orders in their wallet, so you and your customer can refer to the same order by the same number.

## Create an order

1. On the **Orders** page, select **Add**.
2. In **Create Order**, enter a **Title**.
3. Choose the customer's **Individual**, **Organization**, or both.
4. Choose a **Price List** and a **Payment Term**.
5. Optionally link the order to a **Quote** or a **Parent Order**.
6. Choose the **Shipping Method**, the **Billing Location** and the **Shipping Location**.
7. To show the order in your customer's own workspace, choose it in **Receiver Tenant**.
8. Select **Add Line**, choose the **Item** and enter the quantity. Repeat for each item.
9. Select **Create**.

The order receives its number when you create it.

## Track and fulfil an order

Open the order from the **Orders** grid with **View**. On the **Details** tab you can change its details and select **Update Order** to save.

Set **Order Status** to track the order through fulfilment. You choose the status that fits your process:

| Status | Meaning |
|---|---|
| New | The order was created and is waiting to be processed. |
| Processing | The order is being prepared. |
| Accepted | The order was accepted. |
| On Hold | The order is paused. |
| Shipped | The order left your warehouse. |
| Delivered | The customer received the order. |
| Fulfilled | The order is complete. |
| Declined | You declined the order. |
| Cancelled | The order was cancelled. |
| Failed | The order could not be completed. |

The order's tabs show the rest of its life:

- **Products:** the order's lines. Select **Add** to add a line.
- **Shipments:** the shipments that deliver it.
- **Invoices:** the invoices issued for it.
- **Payments:** the payments received for it.
- **Totals:** subtotal, discounts, surcharges, taxes and total, in the order's currency.

Under **Order Locations** you also set the **Freight Terms**, the **Requested Delivery Date** and the shipping details.

## Get paid for an order

You collect payment for an order through an invoice.

1. Open the order and go to the **Invoices** tab.
2. Select **Add** and complete the invoice. It is linked to the order.
3. Issue the invoice, then select **Generate Payment Link** in its actions menu and send the link to your customer. You can also create the link from **Wallet** > **Invoices**.
4. Your customer pays on the invoice's payment checkout, with any payment method your workspace accepts.

See [Invoices](~/Modules/Accounting/Billing/Billing-Records/Invoices.md) for the full steps.

## Send or preview an order

- To see the order as your customer sees it, open the actions menu and select **Preview Order**.
- To email it, select **Send Email**, enter the recipient's **Email**, and select **Submit**.

## Close an order

1. Open the order.
2. In the actions menu, select **Close Order** and confirm with **Close**.

Closing is final: a closed order cannot be changed or reopened.

## Delete an order

In the actions menu, select **Delete Order** and confirm. The order's lines are deleted with it. An order that other records depend on may not be deletable. Deleting cannot be undone.

## Related pages

- [Quotes](Quotes.md)
- [Sales records](../Sales-Records.md)
- [Invoices](~/Modules/Accounting/Billing/Billing-Records/Invoices.md)
- [Sales Hub](~/Modules/Sales-Hub.md)
