# Cart service

The Cart service lets a storefront hold what a shopper wants to buy, save for later or compare, and then submit it as an order.

**Who uses it:** developers who build a store or marketplace front end for guests and signed-in shoppers.

**Base route:** `/api/v2/CartService/...`

## What you can do

- **Get the right cart:** the guest cart, the signed-in user's cart, a workspace's business cart, or the cart acting for the current visitor.
- **Keep a shopper's items at sign-in:** when a guest signs in, the items in their guest cart move into their own cart in one step, so nothing is lost or duplicated. A cart keeps one currency, set from the store when its first item is added.
- **Fill the cart:** add or remove items, increase or decrease quantities, update lines, check whether an item is already in the cart, or clear it.
- **Keep wish lists:** create wish lists in a cart and add or remove items in them.
- **Compare items:** add items to the cart's compare table, read them side by side, and remove them.
- **Show recently viewed items,** newest first.
- **Submit the cart** to create an order. See [Orders](~/Modules/Sales-Hub/Sales-Records/Orders.md).

## Before you call it

- **Sign-in:** most cart, wish list and compare calls need no sign-in, so guests can shop. Reading the user's cart needs a signed-in user.
- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** to read a workspace's business cart, or to submit a cart on behalf of a workspace, send the workspace ID in the `X-TenantId` header or as the `tenantId` query value. A signed-in shopper submits their own cart without a workspace.
- **Permissions:** `carts_create` to submit a cart on behalf of a workspace. Submitting your own cart needs only sign-in. The other calls declare no permission.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `CartService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## Carts

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CartService/Carts/ActingCart` |  | Public | Get the acting cart |
| GET | `/api/v2/CartService/Carts/BusinessCart/{tenantId}` |  | Public, or workspace member with a workspace | Get the business cart |
| GET | `/api/v2/CartService/Carts/GuestCart` |  | Public | Get the guest cart |
| GET | `/api/v2/CartService/Carts/UserCart` |  | Signed-in user | Get the current user's cart |
| GET | `/api/v2/CartService/Carts/{cartId}` |  | Public | Get all business owned contacts |
| PUT | `/api/v2/CartService/Carts/{cartId}` |  | Public | Update a cart |
| PATCH | `/api/v2/CartService/Carts/{cartId}` |  | Public | Patch a cart |
| GET | `/api/v2/CartService/Carts/{cartId}/Compare` |  | Public | Get all items in the compare table |
| GET | `/api/v2/CartService/Carts/{cartId}/Compare/Contains/{itemId}` |  | Public | Assesses if an Item is already in the compare table |
| GET | `/api/v2/CartService/Carts/{cartId}/Compare/{itemId}` |  | Public | Get an item from the compare table |
| POST | `/api/v2/CartService/Carts/{cartId}/Compare/{itemId}` |  | Public | Add an item to the compare table |
| DELETE | `/api/v2/CartService/Carts/{cartId}/Compare/{itemId}` |  | Public | Remove an item from the compare table |
| GET | `/api/v2/CartService/Carts/{cartId}/Contains/{itemId}` |  | Public | Assesses if an Item is already in a cart |
| GET | `/api/v2/CartService/Carts/{cartId}/Country` |  | Public | Get the country of a cart |
| PUT | `/api/v2/CartService/Carts/{cartId}/Country` |  | Public | Set the country of a cart |
| GET | `/api/v2/CartService/Carts/{cartId}/Currency` |  | Public | Get the currency of a cart |
| PUT | `/api/v2/CartService/Carts/{cartId}/Currency` |  | Public | Set the currency of a cart |
| GET | `/api/v2/CartService/Carts/{cartId}/Items` |  | Public | Get all cart lines |
| DELETE | `/api/v2/CartService/Carts/{cartId}/Items` |  | Public | Clear all items from a cart |
| POST | `/api/v2/CartService/Carts/{cartId}/Items/{itemId}` |  | Public | Add an Item to a cart |
| PUT | `/api/v2/CartService/Carts/{cartId}/Items/{itemId}` |  | Public | Update an Item in a cart |
| DELETE | `/api/v2/CartService/Carts/{cartId}/Items/{itemId}` |  | Public | Remove an Item from a cart |
| PUT | `/api/v2/CartService/Carts/{cartId}/Items/{itemId}/Decrease` |  | Public | Decrease an Item in a cart |
| PUT | `/api/v2/CartService/Carts/{cartId}/Items/{itemId}/Increase` |  | Public | Increase an Item in a cart |
| GET | `/api/v2/CartService/Carts/{cartId}/Lines` |  | Public | Get all cart lines |
| GET | `/api/v2/CartService/Carts/{cartId}/Lines/{lineId}` |  | Public | Get a cart line by ID |
| PUT | `/api/v2/CartService/Carts/{cartId}/Lines/{lineId}` |  | Public | Update a cart line |
| DELETE | `/api/v2/CartService/Carts/{cartId}/Lines/{lineId}` |  | Public | Remove a cart line |
| PUT | `/api/v2/CartService/Carts/{cartId}/Lines/{lineId}/Decrease` |  | Public | Decrease the quantity of a cart line |
| PUT | `/api/v2/CartService/Carts/{cartId}/Lines/{lineId}/Increase` |  | Public | Increase the quantity of a cart line |
| GET | `/api/v2/CartService/Carts/{cartId}/RecentlyViewed` |  | Public | Get the cart's recently viewed items |
| POST | `/api/v2/CartService/Carts/{cartId}/Submit` | `carts_create` | Signed-in user, or workspace member with a workspace | Submit a cart for processing |
| GET | `/api/v2/CartService/Carts/{cartId}/WishLists` |  | Public | Get all wishlists in a cart |
| POST | `/api/v2/CartService/Carts/{cartId}/WishLists` |  | Public | Create a new wish list |
| GET | `/api/v2/CartService/Carts/{cartId}/WishLists/Contains/{itemId}` |  | Public | Assesses if an Item is already in any of the cart's wishlists |
| GET | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}` |  | Public | Get a wish list by ID |
| PUT | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}` |  | Public | Update a wish list |
| DELETE | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}` |  | Public | Delete a wish list |
| GET | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}/Exists` |  | Public | Assesses if a WishList exists |
| HEAD | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}/Exists` |  | Public | Assesses if a WishList exists |
| GET | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}/Records` |  | Public | Get all records in a wish list |
| POST | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}/Records` |  | Public | Add a record to a wish list |
| GET | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}/Records/{recordId}` |  | Public | Get a record in a wish list |
| DELETE | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}/Records/{recordId}` |  | Public | Remove a record from a wish list |

## Compare

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/CartService/Compare` |  | Public | Add an item to the compare table |
| GET | `/api/v2/CartService/Compare/{cartId}` |  | Public | Get items to compare in a cart |
| DELETE | `/api/v2/CartService/Compare/{recordId}` |  | Public | Remove an item from the compare table |
| GET | `/api/v2/CartService/Compare/{recordId}/Details` |  | Public | Get compare record details |

## Records

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/CartService/Records` |  | Public | Add a product to a cart with tracking |
| DELETE | `/api/v2/CartService/Records` |  | Public | Remove a product from a cart |
| POST | `/api/v2/CartService/Records/AddItem` |  | Public | Add an item to a cart |
| POST | `/api/v2/CartService/Records/ClearCart` |  | Public | Clear all items from a cart |
| GET | `/api/v2/CartService/Records/IsInCart` |  | Public | Check if an item is in a cart |
| GET | `/api/v2/CartService/Records/{cartId}` |  | Public | Get all items in a cart |
| PUT | `/api/v2/CartService/Records/{recordId}` |  | Public | Update a cart record |
| PATCH | `/api/v2/CartService/Records/{recordId}` |  | Public | Patch a cart record |
| DELETE | `/api/v2/CartService/Records/{recordId}` |  | Public | Remove a product from a cart by record ID |
| PUT | `/api/v2/CartService/Records/{recordId}/Decrease` |  | Public | Decrease cart record quantity |
| GET | `/api/v2/CartService/Records/{recordId}/Details` |  | Public | Get a cart record by ID |
| PUT | `/api/v2/CartService/Records/{recordId}/Increase` |  | Public | Increase cart record quantity |

## WishLists

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/CartService/WishLists` |  | Public | Create a wish list |
| GET | `/api/v2/CartService/WishLists/Contains` |  | Public | Check if a product is in any wish list |
| GET | `/api/v2/CartService/WishLists/Exists` |  | Public | Check if a wish list exists |
| HEAD | `/api/v2/CartService/WishLists/Exists` |  | Public | Check if a wish list exists (HEAD) |
| POST | `/api/v2/CartService/WishLists/Records` |  | Public | Add a product to a wish list |
| DELETE | `/api/v2/CartService/WishLists/Records/{recordId}` |  | Public | Delete a wish list record |
| GET | `/api/v2/CartService/WishLists/{cartId}` |  | Public | Get wish lists for a cart |
| PUT | `/api/v2/CartService/WishLists/{wishListId}` |  | Public | Update a wish list |
| PATCH | `/api/v2/CartService/WishLists/{wishListId}` |  | Public | Patch a wish list |
| DELETE | `/api/v2/CartService/WishLists/{wishListId}` |  | Public | Delete a wish list |
| GET | `/api/v2/CartService/WishLists/{wishListId}/Details` |  | Public | Get wish list details |
| GET | `/api/v2/CartService/WishLists/{wishListId}/Records` |  | Public | Get wish list item records |

Generated from the source at commit 642fb3c3ad.
<!-- generated:end -->
