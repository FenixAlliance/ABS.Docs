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

## Pricing of Billing Item Records

Billing Item Records are also used to calculate critical values of each Billing Record such as the price of goods (Detail Price), taxes, shipping costs, discounts, surcharges, profit margins, and others. 

Calculations can be overridden by providing a custom value using your preferred currency. To do this, you will need to select "Custom" on the Price Calculation Method of each Billing Item Record in order to provide your custom values.

When overriding calculations, you are responsible for the whole price calculation process, meaning you will have full control over the amounts that will produce the final Billing Record's Total Amount.


As every Item Billing Record (the base record for Invoice Lines, Order Lines, Quote Lines, and more). Calculations are made using a segregated approach where several values come into play.

The equation is the following:
- **Currency**: The Currency in which you are entering custom values.
- **Forex Rate**: The total amount used for conversion between the currency you're entering values and United States Dollars. You can enter a custom value or auto-calculate using the Historical Exchange Feature.
- **Base Amount**: It represents the base price for a single product unit, without profit, discounts, surcharges, or taxes.
- **Total Profit**: The Total Profit Amount for a single product unit.
- **Total Detail** (Auto calculated): Total Amount over which Discounts will be calculated.

- **Total Discounts**: Total Discounts for a single product unit.
- **Total Surcharges**: Total Discounts for a single product unit.

- **Tax Base** (Auto calculated): Represents the Base Amount for Tax Calculations. Tax Base Calculation depends on Total Detail minus Total Discounts + Total Surcharges.

- **Tax Amount** (Auto calculated): Tax Amounts can be automatically calculated by adding Tax Policies to every Line. Tax Policies can be synced from the selected Stock Item, or manually added to a Line.

- **Global Discounts**: Global Discounts are discounts made outside the scope of the Taxable values. Those discounts are suitable for operational discounts such as Tax Discounts (for whatever reason).

- **Global Surcharges**: Global Surcharges are surcharges made outside the scope of the Taxable values. Those surcharges are suitable for operational surcharges such as shipping costs or payment processing fees which need to be covered but outside your fiscal domain.
- **Total Amount** (Auto Calculated): The total Amount for the Line. Is calculated by Adding the Tax Amount to the Tax Base, then applying Global Discounts/Surcharge.

### Adding Tax Policies to Billing Item Records
To add a Tax Policy to a Billing Item Record, the new Policy needs to exist the Accounting Manager. Once it exists, it will be available to be selected when you click on the "Add Tax" button on the Line Outliner Form.

Once you add the tax policy, it will be automatically calculated having as tax base the current Billing Item Records' Tax Base Amount.

### Understanding Tax Calculations
Applied Tax Policies contribute to the Total Amount of each Billing Item Record by their respective percentages. e.g If a Tax Policy named VAT with a 19% value is added to a Billing Item Record, it will increase the Tax Amount by 19& of the Tax Base, therefore increasing the Total Amount for that Billing Item Records. 
