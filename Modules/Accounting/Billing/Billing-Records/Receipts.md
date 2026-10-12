# Receipts

A receipt records that a payment was received from a customer or that goods were received from a supplier, and links that event to its order, invoice or payment.

**Who it is for:** finance teams that keep receipt records alongside their invoices and payments, and developers who create those records from another system.

**Availability:** in Studio, open your workspace and go to **Modules** > **Accounting** > **Billing** > **Receipts**. Studio lists receipts and shows their details. You create and update receipts through the REST API.

## Receipt types

| Type | Use it for |
|------|-----------|
| **Payment receipt** | A payment you received from a customer, usually against a sales order. |
| **Purchase receipt** | Goods you accepted from a supplier, usually against a purchase order. |

## View a receipt

1. Go to **Receipts**.
2. Select **View** on a receipt.

The **Receipt Details** page shows the receipt's identifier, its type, and the order and invoice it relates to.

## How receipts relate to payments

The platform does not create a receipt automatically when a payment arrives. A payment collected through your payment provider is recorded under [Payments](Payments.md) and marks its invoice as paid. Create a receipt when your process needs a separate receipt record.

## For developers

Receipts are available under `/api/v2/AccountingService/Receipts`, where you can list, count, read, create, update, patch and delete them. A receipt can reference an order, an invoice and a payment of your workspace.
