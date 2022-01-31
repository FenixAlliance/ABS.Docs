# Understanding the Alliance Business Suite Pricing Service

Pricing is an important part of every business. Commonly, pricing presents challenges such as keeping up to date with provider price updates, calculating discounts, surcharges, taxes, shipping costs, profit margins, and more. This turns pricing into a complex process when a business trades with several commodities, goods, and services.

The Pricing Service is a middleware service designed to calculate prices based on several criteria that can be automated and applied to every Item. It takes a snapshot of the appropriate Forex Exchange Data (Live or Stored, depending on preferences) and it converts values to United States Dollars. This snapshot is linked with each record to ensure proper recalculation of exchanged values for the purpose of accounting balances and reports.

## How is calculated the price of an Item?

When you create or update an Item using the Logistics Module, you will be asked to provide the Regular Price of an Item, as well as the currency you are providing this value in. The Regular Price refers to the price it takes for your business to acquire or manufacture a product or a service. This value is commonly known as the Cost of Goods (COG).

This value will be used as the base amount for the calculations ahead.

## Understanding Policy-Based Calculations

The Alliance Business Model provides a convenient structure to help businesses to overcome the complexity of the Pricing Process. It contains Policies that can be applied to each Item to automatically calculate the final pricing amounts of each item.

## Pricing Amounts

- ### Total Detail Amount (TD)
Calculated Item Price without Discounts, Surcharges nor Policies. Identical to Regular Price.

- ### Total Discounts Amount (
Calculated Total Discounts Amount. It's calculated depending on the `On Discount` Flag; if checked, logic will cascade to assert if the discount is either a Fixed Discount or not, (in which case it will be a percentual discount, which is the default behavior)

If the Fixed Discount flag is marked, you will need to enter the discounted amount in the same currency you've selected for the Regular Price, so be subtracted from the Regular Price, otherwise, you will need to input a percentage to be subtracted off the Regular Price.

Once the discounts have been applied, the Price After Discounts value is generated and passed to the following calculation step as the base for the Surcharges Calculation.


- ### Total Surcharges Amount
It refers to the Calculated Total Surcharges Amount. 

It is calculated by receiving the Price After Discounts value from the previous step and applying first every default Pricing Rule Policy registered to the Passing Item's Owner and then every Pricing Rule Policy registered to the passing Item.


- ### Total Profit Amount
Calculated Total Profit Amount
It is calculated by receiving the Price After Surcharges value from the previous step and applying first every default Selling Margin Policy registered to the Passing Item's Owner, and then Selling Margin Policy registered to the Passing Item.

- ### Total Return Cost Amount
Calculated Total Return Cost Amount

It is calculated by receiving the Price After Profit value from the previous step and applying first every default Return Policy registered to the Passing Item's Owner, and then every Return Policy registered to the Passing Item.

- ### Total Refund Cost Amount

Calculated Total Refund Cost Amount

It is calculated by receiving the Price After Return Policies value from the previous step and applying first every default Refund Policy registered to the Passing Item's Owner, and then every Return Policy registered to the Passing Item.

- ### Total Warranty Cost Amount
Calculated Total Warranty Cost Amount

It is calculated by receiving the Price After Refund Policies value from the previous step and applying first every default Warranty Policy registered to the Passing Item's Owner, and then every Warranty Policy registered to the Passing Item.


- ### Total Taxes Amount
Calculated Total Taxes Amount

It is calculated by receiving the Price After Warranty Policies value from the previous step and applying first every default Tax Policy registered to the Passing Item's Owner, and then every Tax Policy registered to the Passing Item.


- ### Total Withholding Taxes Amount
Calculated Total Withholding Taxes Amount
It is calculated at the Order & Invoice Level.

- ### Total Shipping Cost Amount
Calculated Total Shipping Cost Amount

It is calculated at the Order & Invoice Level.


- ### Total Shipping Taxes Amount
Calculated Total Shipping Taxes Amount

It is calculated at the Order & Invoice Level.

- ### Total Amount
Calculated Total Price Amount (Revenue)

It is calculated by the following Formula:


**Detail Amount **: Da

**Discounts Amount**: D

**Surcharges Amount**: S

**Total Taxes Amount**: TT

**Total Withholding Taxes Amount**: TWT

**Total Warranty Cost Amount**: TWC

**Total Refund Cost Amount**: TRfC

**Total Return Cost Amount**: TRtC

**Total Shipping Cost Amount**: SC

**Total Shipping Tax Amount**: ST

**Total Amount**: (Da - D) + S + (TT - TWT) + (SC + ST) + TRfC + TRtC


