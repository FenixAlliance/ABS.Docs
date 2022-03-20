# Working with Billing Item Records

Billing Records are designed to allow businesses to better manage their billing process by helping them to easily manage their billing process.

A Billing Item Record represents a line item on a Billing Record, such as a single entry on a quote, order, or invoice. This means it connects one Item to a Billing Record.

## Types of Billing Item Records

- ### Deal Unit Item Record
When you add an item to a Deal Unit, you are creating a Deal Unit Item Record. Each one of these records represents an item that's possible to sell on a given Deal Unit.

- ### Quote Item Record
When you add an item to a Quote, you are creating a Quote Item Record. Each one of these records represents an item that's being quoted to present to a customer.

- ### Order Item Record
When you add an item to an Order, you are creating an Order Item Record. Each one of these records represents an item that's being ordered by a customer.

- ### Invoice Item Record
When you add an item to an Invoice, you are creating an Invoice Item Record. Each one of these records represents an item that's being invoiced to a customer.

- ### [New] Coupon Item Records
Coupon Item Records are a special type of Billing Item Records designed to allow customers to apply global coupons to their cart, scoped coupons to each product on their cart, and then pass those records to an Order on the Checkout process.

## Pricing of Order Item Records

Billing Item Records are also used to calculate critical values of each Billing Record such as the price of goods (Detail Price), taxes, shipping costs, discounts, surcharges, profit margins, and others. 

Calculations can be overridden by providing a custom value using your preferred currency. To do this, you will need to select "Custom" on the Price Calculation Method of each Billing Item Record in order to provide your custom values.

When overriding calculations, you are responsible for the whole price calculation process, meaning you will have full control over the amounts that will produce the final Billing Record's Total Amount.