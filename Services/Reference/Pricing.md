# Pricing service

The Pricing service lets you set the prices and discounts of your items, control how amounts are rounded, and calculate an item's price.

**Who uses it:** developers who sync price lists with a workspace, or who show prices in a store front end.

**Base route:** `/api/v2/PricingService/...`

## What you can do

- **Keep price lists:** create price lists and the price of each item in them. See [Price lists](~/Modules/Sales-Hub.md#price-lists).
- **Keep discount lists:** create discount lists and the discount entries in them.
- **Keep pricing rules:** create, update and delete the rules that adjust your prices.
- **Set rounding policies:** create, update and delete the policies that round your amounts.
- **Calculate an item's price:** get an item's calculated price for a price list, a discount list, a quantity and a currency, and read its final price, total taxes and total savings. Send the currency to get the price in that currency. When you leave it out, the price is in the item's own currency, and an item that has no currency set is refused.

## Before you call it

- **Sign-in:** the four item price reads need no sign-in.
- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** `pricelists_read`, `pricelists_create`, `pricelists_update` and `pricelists_delete` for price lists and pricing rules; `discounts_read`, `discounts_create`, `discounts_update` and `discounts_delete` for discount lists; `pricing_rules_read`, `pricing_rules_create`, `pricing_rules_update` and `pricing_rules_delete` for rounding policies.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `PricingService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## DiscountLists

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/PricingService/DiscountLists` | `discounts_read` | Workspace member | Retrieves all discount lists |
| POST | `/api/v2/PricingService/DiscountLists` | `discounts_create` | Workspace member | Creates a new discount list |
| GET | `/api/v2/PricingService/DiscountLists/Count` | `discounts_read` | Workspace member | Counts discount lists |
| GET | `/api/v2/PricingService/DiscountLists/{discountListId}` | `discounts_read` | Workspace member | Gets a discount list by ID |
| PUT | `/api/v2/PricingService/DiscountLists/{discountListId}` | `discounts_update` | Workspace member | Updates a discount list |
| PATCH | `/api/v2/PricingService/DiscountLists/{discountListId}` | `discounts_update` | Workspace member | Patches a discount list |
| DELETE | `/api/v2/PricingService/DiscountLists/{discountListId}` | `discounts_delete` | Workspace member | Deletes a discount list |
| GET | `/api/v2/PricingService/DiscountLists/{discountListId}/Discounts` | `discounts_read` | Workspace member | Retrieves discounts in a discount list |
| POST | `/api/v2/PricingService/DiscountLists/{discountListId}/Discounts` | `discounts_create` | Workspace member | Creates a discount list entry |
| GET | `/api/v2/PricingService/DiscountLists/{discountListId}/Discounts/Count` | `discounts_read` | Workspace member | Counts discounts in a discount list |
| GET | `/api/v2/PricingService/DiscountLists/{discountListId}/Discounts/{discountListEntryId}` | `discounts_read` | Workspace member | Gets a discount list entry by ID |
| PUT | `/api/v2/PricingService/DiscountLists/{discountListId}/Discounts/{discountListEntryId}` | `discounts_update` | Workspace member | Updates a discount list entry |
| PATCH | `/api/v2/PricingService/DiscountLists/{discountListId}/Discounts/{discountListEntryId}` | `discounts_update` | Workspace member | Patches a discount list entry |
| DELETE | `/api/v2/PricingService/DiscountLists/{discountListId}/Discounts/{discountListEntryId}` | `discounts_delete` | Workspace member | Deletes a discount list entry |

## PriceLists

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/PricingService/PriceLists` | `pricelists_read` | Workspace member | Retrieves all price lists |
| POST | `/api/v2/PricingService/PriceLists` | `pricelists_create` | Workspace member | Creates a new price list |
| GET | `/api/v2/PricingService/PriceLists/Count` | `pricelists_read` | Workspace member | Counts price lists |
| GET | `/api/v2/PricingService/PriceLists/{priceListId}` | `pricelists_read` | Workspace member | Gets a price list by ID |
| PUT | `/api/v2/PricingService/PriceLists/{priceListId}` | `pricelists_update` | Workspace member | Updates a price list |
| PATCH | `/api/v2/PricingService/PriceLists/{priceListId}` | `pricelists_update` | Workspace member | Patches a price list |
| DELETE | `/api/v2/PricingService/PriceLists/{priceListId}` | `pricelists_delete` | Workspace member | Deletes a price list |
| GET | `/api/v2/PricingService/PriceLists/{priceListId}/Prices` | `pricelists_read` | Workspace member | Retrieves prices in a price list |
| POST | `/api/v2/PricingService/PriceLists/{priceListId}/Prices` | `pricelists_create` | Workspace member | Creates a price list entry |
| GET | `/api/v2/PricingService/PriceLists/{priceListId}/Prices/Count` | `pricelists_read` | Workspace member | Counts prices in a price list |
| GET | `/api/v2/PricingService/PriceLists/{priceListId}/Prices/{priceId}` | `pricelists_read` | Workspace member | Gets a price list entry by ID |
| PUT | `/api/v2/PricingService/PriceLists/{priceListId}/Prices/{priceId}` | `pricelists_update` | Workspace member | Updates a price list entry |
| PATCH | `/api/v2/PricingService/PriceLists/{priceListId}/Prices/{priceId}` | `pricelists_update` | Workspace member | Patches a price list entry |
| DELETE | `/api/v2/PricingService/PriceLists/{priceListId}/Prices/{priceId}` | `pricelists_delete` | Workspace member | Deletes a price list entry |

## Prices

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/PricingService/Prices/{itemId}/FinalPrice` |  | Public | Gets the final price for an item |
| GET | `/api/v2/PricingService/Prices/{itemId}/Price` |  | Public | Gets the calculated price for an item |
| GET | `/api/v2/PricingService/Prices/{itemId}/TotalSavings` |  | Public | Gets total savings for an item |
| GET | `/api/v2/PricingService/Prices/{itemId}/TotalTaxes` |  | Public | Gets total taxes for an item |

## PricingRules

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/PricingService/PricingRules` | `pricelists_read` | Workspace member | Get all pricing rules |
| POST | `/api/v2/PricingService/PricingRules` | `pricelists_create` | Workspace member | Create a new pricing rule |
| GET | `/api/v2/PricingService/PricingRules/Count` | `pricelists_read` | Workspace member | Counts pricing rules |
| PUT | `/api/v2/PricingService/PricingRules/Update` | `pricelists_update` | Workspace member | Update a pricing rule |
| GET | `/api/v2/PricingService/PricingRules/{pricingRuleId}` | `pricelists_read` | Workspace member | Get pricing rule by ID |
| PATCH | `/api/v2/PricingService/PricingRules/{pricingRuleId}` | `pricelists_update` | Workspace member | Patch a pricing rule |
| DELETE | `/api/v2/PricingService/PricingRules/{pricingRuleId}` | `pricelists_delete` | Workspace member | Delete a pricing rule |

## RoundingPolicies

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/PricingService/RoundingPolicies` | `pricing_rules_read` | Workspace member | Gets all rounding policies |
| POST | `/api/v2/PricingService/RoundingPolicies` | `pricing_rules_create` | Workspace member | Creates a rounding policy |
| GET | `/api/v2/PricingService/RoundingPolicies/Count` | `pricing_rules_read` | Workspace member | Counts rounding policies |
| GET | `/api/v2/PricingService/RoundingPolicies/{roundingPolicyId}` | `pricing_rules_read` | Workspace member | Gets a rounding policy by ID |
| PUT | `/api/v2/PricingService/RoundingPolicies/{roundingPolicyId}` | `pricing_rules_update` | Workspace member | Updates a rounding policy |
| PATCH | `/api/v2/PricingService/RoundingPolicies/{roundingPolicyId}` | `pricing_rules_update` | Workspace member | Patches a rounding policy |
| DELETE | `/api/v2/PricingService/RoundingPolicies/{roundingPolicyId}` | `pricing_rules_delete` | Workspace member | Deletes a rounding policy |

Generated from the source at commit 642fb3c3ad.
<!-- generated:end -->
