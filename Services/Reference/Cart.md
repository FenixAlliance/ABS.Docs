<!-- generated:start -->
# Cart service reference

> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `CartService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## Carts

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CartService/Carts/ActingCart` |  | Public | Gets the acting cart |
| GET | `/api/v2/CartService/Carts/BusinessCart/{tenantId}` |  | Workspace member, Public | Gets the business cart |
| GET | `/api/v2/CartService/Carts/GuestCart` |  | Public | Gets the guest cart |
| GET | `/api/v2/CartService/Carts/UserCart` |  | Signed-in user | Gets the current user's cart |
| GET | `/api/v2/CartService/Carts/{cartId}` |  | Public | Gets a cart by ID |
| PUT | `/api/v2/CartService/Carts/{cartId}` |  | Public | Updates a cart |
| PATCH | `/api/v2/CartService/Carts/{cartId}` |  | Public | Partially updates a cart |
| GET | `/api/v2/CartService/Carts/{cartId}/Compare` |  | Public | Gets all items in the compare table |
| GET | `/api/v2/CartService/Carts/{cartId}/Compare/Contains/{itemId}` |  | Public | Assesses if an Item is already in the compare table |
| GET | `/api/v2/CartService/Carts/{cartId}/Compare/{itemId}` |  | Public | Get an item from the compare table |
| POST | `/api/v2/CartService/Carts/{cartId}/Compare/{itemId}` |  | Public | Adds an item to the compare table |
| DELETE | `/api/v2/CartService/Carts/{cartId}/Compare/{itemId}` |  | Public | Removes an item from the compare table |
| GET | `/api/v2/CartService/Carts/{cartId}/Contains/{itemId}` |  | Public | Assesses if an Item is already in a cart |
| GET | `/api/v2/CartService/Carts/{cartId}/Country` |  | Public | Gets the country of a cart |
| PUT | `/api/v2/CartService/Carts/{cartId}/Country` |  | Public | Sets the country of a cart |
| GET | `/api/v2/CartService/Carts/{cartId}/Currency` |  | Public | Gets the currency of a cart |
| PUT | `/api/v2/CartService/Carts/{cartId}/Currency` |  | Public | Sets the currency of a cart |
| GET | `/api/v2/CartService/Carts/{cartId}/Items` |  | Public | Gets all cart lines |
| DELETE | `/api/v2/CartService/Carts/{cartId}/Items` |  | Public | Deletes all items from a cart |
| POST | `/api/v2/CartService/Carts/{cartId}/Items/{itemId}` |  | Public | Adds an Item to a cart |
| PUT | `/api/v2/CartService/Carts/{cartId}/Items/{itemId}` |  | Public | Removes an Item from a cart |
| DELETE | `/api/v2/CartService/Carts/{cartId}/Items/{itemId}` |  | Public | Removes an Item from a cart |
| PUT | `/api/v2/CartService/Carts/{cartId}/Items/{itemId}/Decrease` |  | Public | Removes an Item from a cart |
| PUT | `/api/v2/CartService/Carts/{cartId}/Items/{itemId}/Increase` |  | Public | Removes an Item from a cart |
| GET | `/api/v2/CartService/Carts/{cartId}/Lines` |  | Public | Gets all cart lines |
| GET | `/api/v2/CartService/Carts/{cartId}/Lines/{lineId}` |  | Public | Get a cart line by ID |
| PUT | `/api/v2/CartService/Carts/{cartId}/Lines/{lineId}` |  | Public | Update a cart line |
| DELETE | `/api/v2/CartService/Carts/{cartId}/Lines/{lineId}` |  | Public | Removes a cart line |
| PUT | `/api/v2/CartService/Carts/{cartId}/Lines/{lineId}/Decrease` |  | Public | Decreases the quantity of a cart line |
| PUT | `/api/v2/CartService/Carts/{cartId}/Lines/{lineId}/Increase` |  | Public | Increases the quantity of a cart line |
| GET | `/api/v2/CartService/Carts/{cartId}/RecentlyViewed` |  | Public | Gets the cart's recently viewed items, newest first (one page of 50) |
| POST | `/api/v2/CartService/Carts/{cartId}/Submit` | `carts_create` | Workspace member | Submits a cart for processing |
| GET | `/api/v2/CartService/Carts/{cartId}/WishLists` |  | Public | Gets all wishlists in a cart |
| POST | `/api/v2/CartService/Carts/{cartId}/WishLists` |  | Public | Creates a new wish list |
| GET | `/api/v2/CartService/Carts/{cartId}/WishLists/Contains/{itemId}` |  | Public | Assesses if an Item is already in a cart |
| GET | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}` |  | Public | Gets a wish list by ID |
| PUT | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}` |  | Public | Updates a wish list |
| DELETE | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}` |  | Public | Deletes a wish list |
| GET | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}/Exists` |  | Public | Assesses if a WishList exists |
| HEAD | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}/Exists` |  | Public | Assesses if a WishList exists |
| GET | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}/Records` |  | Public | Gets all records in a wish list |
| POST | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}/Records` |  | Public | Adds a record to a wish list |
| GET | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}/Records/{recordId}` |  | Public | Gets a record in a wish list |
| DELETE | `/api/v2/CartService/Carts/{cartId}/WishLists/{wishListId}/Records/{recordId}` |  | Public | Removes a record from a wish list |

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
| GET | `/api/v2/CartService/WishLists/Contains` |  | Public | Check if Product exists in any WishLists of the Cart |
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

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
