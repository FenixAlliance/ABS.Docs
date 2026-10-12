<!-- generated:start -->
# Catalog service reference

> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `CatalogService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## ItemAttachments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemAttachments` |  | Public | Get all item attachments |
| POST | `/api/v2/CatalogService/ItemAttachments` | `stock_items_update` | Workspace member | Create a new item attachment |
| GET | `/api/v2/CatalogService/ItemAttachments/{itemAttachmentId}` | `stock_items_read` | Workspace member, Public | Get item attachment by ID |
| PUT | `/api/v2/CatalogService/ItemAttachments/{itemAttachmentId}` | `stock_items_update` | Workspace member | Update an item attachment |
| PATCH | `/api/v2/CatalogService/ItemAttachments/{itemAttachmentId}` | `stock_items_update` | Workspace member | Patch an item attachment |
| DELETE | `/api/v2/CatalogService/ItemAttachments/{itemAttachmentId}` | `stock_items_delete` | Workspace member | Delete an item attachment |

## ItemAttributeOptions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemAttributeOptions` |  | Public | Get all item attribute options |
| POST | `/api/v2/CatalogService/ItemAttributeOptions` | `stock_items_create` | Workspace member | Create a new item attribute option |
| GET | `/api/v2/CatalogService/ItemAttributeOptions/Count` |  | Public | Get item attribute options count |
| GET | `/api/v2/CatalogService/ItemAttributeOptions/{itemAttributeOptionId}` | `stock_items_read` | Workspace member, Public | Get item attribute option by ID |
| PUT | `/api/v2/CatalogService/ItemAttributeOptions/{itemAttributeOptionId}` | `stock_items_update` | Workspace member | Update an item attribute option |
| PATCH | `/api/v2/CatalogService/ItemAttributeOptions/{itemAttributeOptionId}` | `stock_items_update` | Workspace member | Patch an item attribute option |
| DELETE | `/api/v2/CatalogService/ItemAttributeOptions/{itemAttributeOptionId}` | `stock_items_delete` | Workspace member | Delete an item attribute option |

## ItemAttributes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemAttributes` |  | Public | Get all item attributes |
| POST | `/api/v2/CatalogService/ItemAttributes` | `stock_items_create` | Workspace member | Create a new item attribute |
| GET | `/api/v2/CatalogService/ItemAttributes/Count` |  | Public | Count item attributes |
| GET | `/api/v2/CatalogService/ItemAttributes/{itemAttributeId}` | `stock_items_read` | Workspace member, Public | Get item attribute by ID |
| PUT | `/api/v2/CatalogService/ItemAttributes/{itemAttributeId}` | `stock_items_update` | Workspace member | Update an item attribute |
| PATCH | `/api/v2/CatalogService/ItemAttributes/{itemAttributeId}` | `stock_items_update` | Workspace member | Patch an item attribute |
| DELETE | `/api/v2/CatalogService/ItemAttributes/{itemAttributeId}` | `stock_items_delete` | Workspace member | Delete an item attribute |

## ItemBrands

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemBrands` |  | Public | Get all item brands |
| POST | `/api/v2/CatalogService/ItemBrands` | `stock_items_create` | Workspace member | Create a new item brand |
| GET | `/api/v2/CatalogService/ItemBrands/{itemBrandId}` | `stock_items_read` | Workspace member, Public | Get item brand by ID |
| PUT | `/api/v2/CatalogService/ItemBrands/{itemBrandId}` | `stock_items_update` | Workspace member | Update an item brand |
| PATCH | `/api/v2/CatalogService/ItemBrands/{itemBrandId}` | `stock_items_update` | Workspace member | Patch an item brand |
| DELETE | `/api/v2/CatalogService/ItemBrands/{itemBrandId}` | `stock_items_delete` | Workspace member | Delete an item brand |

## ItemBundles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemBundles` |  | Public | Get all item bundles |
| POST | `/api/v2/CatalogService/ItemBundles` | `stock_items_create` | Workspace member | Create a new item bundle |
| GET | `/api/v2/CatalogService/ItemBundles/Count` |  | Public | Get item bundles count |
| GET | `/api/v2/CatalogService/ItemBundles/{itemBundleId}` | `stock_items_read` | Workspace member, Public | Get item bundle by ID |
| PUT | `/api/v2/CatalogService/ItemBundles/{itemBundleId}` | `stock_items_update` | Workspace member | Update an item bundle |
| PATCH | `/api/v2/CatalogService/ItemBundles/{itemBundleId}` | `stock_items_update` | Workspace member | Patch an item bundle |
| DELETE | `/api/v2/CatalogService/ItemBundles/{itemBundleId}` | `stock_items_delete` | Workspace member | Delete an item bundle |

## ItemCategories

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemCategories` |  | Public | Get all item categories |
| POST | `/api/v2/CatalogService/ItemCategories` | `stock_items_create` | Workspace member | Create a new item category |
| GET | `/api/v2/CatalogService/ItemCategories/Count` |  | Public | Count item categories |
| GET | `/api/v2/CatalogService/ItemCategories/{itemCategoryId}` | `stock_items_read` | Workspace member, Public | Get item category by ID |
| PUT | `/api/v2/CatalogService/ItemCategories/{itemCategoryId}` | `stock_items_update` | Workspace member | Update an item category |
| PATCH | `/api/v2/CatalogService/ItemCategories/{itemCategoryId}` | `stock_items_update` | Workspace member | Patch an item category |
| DELETE | `/api/v2/CatalogService/ItemCategories/{itemCategoryId}` | `stock_items_delete` | Workspace member | Delete an item category |

## ItemFamilies

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemFamilies` |  | Public | Get all item families |
| POST | `/api/v2/CatalogService/ItemFamilies` | `stock_items_create` | Workspace member | Create a new item family |
| GET | `/api/v2/CatalogService/ItemFamilies/Count` |  | Public | Get item families count |
| GET | `/api/v2/CatalogService/ItemFamilies/{itemFamilyId}` | `stock_items_read` | Workspace member, Public | Get item family by ID |
| PUT | `/api/v2/CatalogService/ItemFamilies/{itemFamilyId}` | `stock_items_update` | Workspace member | Update an item family |
| PATCH | `/api/v2/CatalogService/ItemFamilies/{itemFamilyId}` | `stock_items_update` | Workspace member | Patch an item family |
| DELETE | `/api/v2/CatalogService/ItemFamilies/{itemFamilyId}` | `stock_items_delete` | Workspace member | Delete an item family |

## ItemGoogleCategories

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemGoogleCategories` |  | Public | Get all Google item categories |
| GET | `/api/v2/CatalogService/ItemGoogleCategories/All` |  | Public | Get all Google item categories (all) |
| GET | `/api/v2/CatalogService/ItemGoogleCategories/Count` |  | Public | Get Google item categories count |
| GET | `/api/v2/CatalogService/ItemGoogleCategories/Primary` |  | Public | Get root Google item categories |
| GET | `/api/v2/CatalogService/ItemGoogleCategories/tree` |  | Public | Get Google item categories tree |
| POST | `/api/v2/CatalogService/ItemGoogleCategories/tree` | `stock_items_update` | Workspace member | Map Google item categories tree |
| GET | `/api/v2/CatalogService/ItemGoogleCategories/{itemCategoryId}` |  | Public | Get Google item category by ID |
| GET | `/api/v2/CatalogService/ItemGoogleCategories/{itemCategoryId}/Children` |  | Public | Get children Google item categories by ID |

## ItemImages

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemImages` |  | Public | Get all item images |
| POST | `/api/v2/CatalogService/ItemImages` | `stock_items_update` | Workspace member | Create a new item image |
| GET | `/api/v2/CatalogService/ItemImages/{itemImageId}` | `stock_items_read` | Workspace member, Public | Get item image by ID |
| PUT | `/api/v2/CatalogService/ItemImages/{itemImageId}` | `stock_items_update` | Workspace member | Update an item image |
| PATCH | `/api/v2/CatalogService/ItemImages/{itemImageId}` | `stock_items_update` | Workspace member | Patch an item image |
| DELETE | `/api/v2/CatalogService/ItemImages/{itemImageId}` | `stock_items_delete` | Workspace member | Delete an item image |

## ItemQuestions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemQuestions` |  | Public | Get all item questions |
| POST | `/api/v2/CatalogService/ItemQuestions` | `stock_items_create` | Workspace member | Create a new item question |
| GET | `/api/v2/CatalogService/ItemQuestions/{itemQuestionId}` | `stock_items_read` | Workspace member, Public | Get item question by ID |
| PUT | `/api/v2/CatalogService/ItemQuestions/{itemQuestionId}` | `stock_items_update` | Workspace member | Update an item question |
| PATCH | `/api/v2/CatalogService/ItemQuestions/{itemQuestionId}` | `stock_items_update` | Workspace member | Patch an item question |
| DELETE | `/api/v2/CatalogService/ItemQuestions/{itemQuestionId}` | `stock_items_delete` | Workspace member | Delete an item question |

## ItemRefundPolicies

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemRefundPolicies` |  | Public | Get item refund policies |
| POST | `/api/v2/CatalogService/ItemRefundPolicies` | `stock_items_update` | Workspace member | Relate item to refund policy |
| GET | `/api/v2/CatalogService/ItemRefundPolicies/Count` |  | Public | Count item refund policies |
| GET | `/api/v2/CatalogService/ItemRefundPolicies/{itemRefundPolicyId}` |  | Public | Get item refund policy by ID |
| DELETE | `/api/v2/CatalogService/ItemRefundPolicies/{itemRefundPolicyId}` | `stock_items_delete` | Workspace member | Remove refund policy from item |

## ItemReturnPolicies

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemReturnPolicies` |  | Public | Get item return policies |
| POST | `/api/v2/CatalogService/ItemReturnPolicies` | `stock_items_update` | Workspace member | Relate item to return policy |
| GET | `/api/v2/CatalogService/ItemReturnPolicies/Count` |  | Public | Count item return policies |
| GET | `/api/v2/CatalogService/ItemReturnPolicies/{itemReturnPolicyId}` |  | Public | Get item return policy by ID |
| DELETE | `/api/v2/CatalogService/ItemReturnPolicies/{itemReturnPolicyId}` | `stock_items_delete` | Workspace member | Remove return policy from item |

## ItemReviews

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemReviews` |  | Public | Get all item reviews |
| POST | `/api/v2/CatalogService/ItemReviews` | `stock_items_create` | Workspace member | Create a new item review |
| GET | `/api/v2/CatalogService/ItemReviews/{itemReviewId}` |  | Public | Get item review by ID |
| PUT | `/api/v2/CatalogService/ItemReviews/{itemReviewId}` | `stock_items_update` | Workspace member | Update an item review |
| PATCH | `/api/v2/CatalogService/ItemReviews/{itemReviewId}` | `stock_items_update` | Workspace member | Patch an item review |
| DELETE | `/api/v2/CatalogService/ItemReviews/{itemReviewId}` | `stock_items_delete` | Workspace member | Delete an item review |

## ItemShippingPolicies

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemShippingPolicies` |  | Public | Get item shipping policies |
| POST | `/api/v2/CatalogService/ItemShippingPolicies` | `stock_items_update` | Workspace member | Relate item to shipping policy |
| GET | `/api/v2/CatalogService/ItemShippingPolicies/Count` |  | Public | Count item shipping policies |
| GET | `/api/v2/CatalogService/ItemShippingPolicies/{itemShippingPolicyId}` |  | Public | Get item shipping policy by ID |
| DELETE | `/api/v2/CatalogService/ItemShippingPolicies/{itemShippingPolicyId}` | `stock_items_delete` | Workspace member | Remove shipping policy from item |

## ItemTags

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemTags` |  | Public | Get all item tags |
| POST | `/api/v2/CatalogService/ItemTags` | `stock_items_create` | Workspace member | Create a new item tag |
| GET | `/api/v2/CatalogService/ItemTags/{itemTagId}` | `stock_items_read` | Workspace member, Public | Get item tag by ID |
| PUT | `/api/v2/CatalogService/ItemTags/{itemTagId}` | `stock_items_update` | Workspace member | Update an item tag |
| PATCH | `/api/v2/CatalogService/ItemTags/{itemTagId}` | `stock_items_update` | Workspace member | Patch an item tag |
| DELETE | `/api/v2/CatalogService/ItemTags/{itemTagId}` | `stock_items_delete` | Workspace member | Delete an item tag |

## ItemTaxPolicies

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemTaxPolicies` |  | Public | Get item tax policies |
| POST | `/api/v2/CatalogService/ItemTaxPolicies` | `stock_items_update` | Workspace member | Relate item to tax policy |
| GET | `/api/v2/CatalogService/ItemTaxPolicies/Count` |  | Public | Count item tax policies |
| GET | `/api/v2/CatalogService/ItemTaxPolicies/{itemTaxPolicyId}` |  | Public | Get item tax policy by ID |
| DELETE | `/api/v2/CatalogService/ItemTaxPolicies/{itemTaxPolicyId}` | `stock_items_delete` | Workspace member | Remove tax policy from item |

## ItemTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemTypes` |  | Public | Get all item types |
| POST | `/api/v2/CatalogService/ItemTypes` | `stock_items_create` | Workspace member | Create a new item type |
| GET | `/api/v2/CatalogService/ItemTypes/Count` |  | Public | Count item types |
| GET | `/api/v2/CatalogService/ItemTypes/{itemTypeID}` | `stock_items_read` | Workspace member, Public | Get item type by ID |
| PUT | `/api/v2/CatalogService/ItemTypes/{itemTypeID}` | `stock_items_update` | Workspace member | Update an item type |
| PATCH | `/api/v2/CatalogService/ItemTypes/{itemTypeID}` | `stock_items_update` | Workspace member | Patch an item type |
| DELETE | `/api/v2/CatalogService/ItemTypes/{itemTypeID}` | `stock_items_delete` | Workspace member | Delete an item type |

## ItemWarrantyPolicies

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/ItemWarrantyPolicies` |  | Public | Get item warranty policies |
| POST | `/api/v2/CatalogService/ItemWarrantyPolicies` | `stock_items_update` | Workspace member | Relate item to warranty policy |
| GET | `/api/v2/CatalogService/ItemWarrantyPolicies/{itemWarrantyPolicyId}` |  | Public | Get item warranty policy by ID |
| DELETE | `/api/v2/CatalogService/ItemWarrantyPolicies/{itemWarrantyPolicyId}` | `stock_items_delete` | Workspace member | Remove warranty policy from item |

## Items

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/Items` | `stock_items_read` | Workspace member, Public | Get all stock items |
| POST | `/api/v2/CatalogService/Items` | `stock_items_create` | Workspace member | Create a new stock item |
| POST | `/api/v2/CatalogService/Items/Batch` | `stock_items_update` | Workspace member | Bulk-update stock items |
| POST | `/api/v2/CatalogService/Items/BulkUpsert` | `stock_items_update` | Workspace member | Bulk upsert stock items from rows |
| GET | `/api/v2/CatalogService/Items/Count` | `stock_items_read` | Workspace member, Public | Count stock items by business |
| GET | `/api/v2/CatalogService/Items/MaxPrice` | `stock_items_read` | Workspace member, Public | Get max price of stock items |
| GET | `/api/v2/CatalogService/Items/MinPrice` | `stock_items_read` | Workspace member, Public | Get min price of stock items |
| GET | `/api/v2/CatalogService/Items/Public` |  | Public | Get public stock items |
| GET | `/api/v2/CatalogService/Items/Public/Count` |  | Public | Count public stock items |
| GET | `/api/v2/CatalogService/Items/Public/{itemId}` |  | Public | Get public stock item by ID |
| POST | `/api/v2/CatalogService/Items/RecalculatePrices` | `stock_items_update` | Workspace member | Recalculate stock item prices |
| GET | `/api/v2/CatalogService/Items/{itemId}` | `stock_items_read` | Workspace member, Public | Get stock item by ID |
| PUT | `/api/v2/CatalogService/Items/{itemId}` | `stock_items_update` | Workspace member | Update a stock item |
| PATCH | `/api/v2/CatalogService/Items/{itemId}` | `stock_items_update` | Workspace member | Patch a stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}` | `stock_items_delete` | Workspace member | Delete a stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Attachments` | `stock_items_read` | Workspace member, Public | Get attachments for a stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Attachments/{itemAttachmentId}` | `stock_items_read` | Workspace member, Public | Get attachment by ID for a stock item |
| POST | `/api/v2/CatalogService/Items/{itemId}/Attachments/{itemAttachmentId}` | `stock_items_update` | Workspace member | Relate attachment to stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}/Attachments/{itemAttachmentId}` | `stock_items_update` | Workspace member | Remove attachment from stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Brands` | `stock_items_read` | Workspace member, Public | Get brands for a stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Brands/{itemBrandId}` | `stock_items_read` | Workspace member, Public | Get brand by ID for a stock item |
| POST | `/api/v2/CatalogService/Items/{itemId}/Brands/{itemBrandId}` | `stock_items_update` | Workspace member | Relate brand to stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}/Brands/{itemBrandId}` | `stock_items_delete` | Workspace member | Remove brand from stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Categories` |  | Public | Get categories for a stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Categories/{itemCategoryId}` | `stock_items_read` | Workspace member, Public | Get category by ID for a stock item |
| POST | `/api/v2/CatalogService/Items/{itemId}/Categories/{itemCategoryId}` | `stock_items_update` | Workspace member | Relate category to stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}/Categories/{itemCategoryId}` | `stock_items_delete` | Workspace member | Remove category from stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Extended` | `stock_items_read` | Workspace member, Public | Get extended stock item by ID |
| GET | `/api/v2/CatalogService/Items/{itemId}/GoogleCategories` |  | Public | Get Google categories for a stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/GoogleCategories/{itemGoogleCategoryId}` |  | Public | Get Google category by ID for a stock item |
| POST | `/api/v2/CatalogService/Items/{itemId}/GoogleCategories/{itemGoogleCategoryId}` | `stock_items_update` | Workspace member | Relate Google category to stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}/GoogleCategories/{itemGoogleCategoryId}` | `stock_items_delete` | Workspace member | Remove Google category from stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Images` | `stock_items_read` | Workspace member, Public | Get all images related to a specific stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Images/Primary` | `stock_items_read` | Workspace member, Public | Get the catalog item's primary image |
| POST | `/api/v2/CatalogService/Items/{itemId}/Images/Primary` | `stock_items_update` | Workspace member | Update the catalog item's primary image |
| GET | `/api/v2/CatalogService/Items/{itemId}/Images/{itemImageId}` | `stock_items_read` | Workspace member, Public | Get image by ID for a stock item |
| POST | `/api/v2/CatalogService/Items/{itemId}/Images/{itemImageId}` | `stock_items_update` | Workspace member | Relate image to stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}/Images/{itemImageId}` | `stock_items_update` | Workspace member | Remove image from stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Questions` | `stock_items_read` | Workspace member, Public | Get questions for a stock item |
| POST | `/api/v2/CatalogService/Items/{itemId}/Questions` | `stock_items_update` | Workspace member | Create question for stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Questions/{itemQuestionId}` | `stock_items_read` | Workspace member, Public | Get question by ID for a stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}/Questions/{itemQuestionId}` | `stock_items_delete` | Workspace member | Remove question from stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/RefundPolicies` |  | Public | Get refund policies for a stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/RefundPolicies/{itemRefundPolicyId}` |  | Public | Get refund policy by ID for a stock item |
| POST | `/api/v2/CatalogService/Items/{itemId}/RefundPolicies/{itemRefundPolicyId}` | `stock_items_update` | Workspace member | Relate refund policy to stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}/RefundPolicies/{itemRefundPolicyId}` | `stock_items_delete` | Workspace member | Remove refund policy from stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/ReturnPolicies` |  | Public | Get return policies for a stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/ReturnPolicies/{itemReturnPolicyId}` |  | Public | Get return policy by ID for a stock item |
| POST | `/api/v2/CatalogService/Items/{itemId}/ReturnPolicies/{itemReturnPolicyId}` | `stock_items_update` | Workspace member | Relate return policy to stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}/ReturnPolicies/{itemReturnPolicyId}` | `stock_items_delete` | Workspace member | Remove return policy from stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Reviews` |  | Public | Get reviews for a stock item |
| POST | `/api/v2/CatalogService/Items/{itemId}/Reviews` | `stock_items_update` | Workspace member | Create review for stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Reviews/{itemReviewId}` |  | Public | Get review by ID for a stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}/Reviews/{itemReviewId}` | `stock_items_delete` | Workspace member | Remove review from stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/ShippingPolicies` |  | Public | Get shipping policies for a stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/ShippingPolicies/{itemShippingPolicyId}` |  | Public | Get shipping policy by ID for a stock item |
| POST | `/api/v2/CatalogService/Items/{itemId}/ShippingPolicies/{itemShippingPolicyId}` | `stock_items_update` | Workspace member | Relate shipping policy to stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}/ShippingPolicies/{itemShippingPolicyId}` | `stock_items_delete` | Workspace member | Remove shipping policy from stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Tags` | `stock_items_read` | Workspace member, Public | Get tags for a stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Tags/Count` | `stock_items_read` | Workspace member, Public | Count tags for a stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Tags/{itemTagId}` | `stock_items_read` | Workspace member, Public | Get tag by ID for a stock item |
| POST | `/api/v2/CatalogService/Items/{itemId}/Tags/{itemTagId}` | `stock_items_update` | Workspace member | Relate tag to stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}/Tags/{itemTagId}` | `stock_items_delete` | Workspace member | Remove tag from stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/TaxPolicies` |  | Public | Get tax policies for a stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/TaxPolicies/{itemTaxPolicyId}` |  | Public | Get tax policy by ID for a stock item |
| POST | `/api/v2/CatalogService/Items/{itemId}/TaxPolicies/{itemTaxPolicyId}` | `stock_items_update` | Workspace member | Relate tax policy to stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}/TaxPolicies/{itemTaxPolicyId}` | `stock_items_delete` | Workspace member | Remove tax policy from stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Types` | `stock_items_read` | Workspace member, Public | Get types for a stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/Types/{itemTypeId}` | `stock_items_read` | Workspace member, Public | Get type by ID for a stock item |
| POST | `/api/v2/CatalogService/Items/{itemId}/Types/{itemTypeId}` | `stock_items_update` | Workspace member | Relate type to stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}/Types/{itemTypeId}` | `stock_items_delete` | Workspace member | Remove type from stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/WarrantyPolicies` |  | Public | Get warranty policies for a stock item |
| GET | `/api/v2/CatalogService/Items/{itemId}/WarrantyPolicies/{itemWarrantyPolicyId}` |  | Public | Get warranty policy by ID for a stock item |
| POST | `/api/v2/CatalogService/Items/{itemId}/WarrantyPolicies/{itemWarrantyPolicyId}` | `stock_items_update` | Workspace member | Relate warranty policy to stock item |
| DELETE | `/api/v2/CatalogService/Items/{itemId}/WarrantyPolicies/{itemWarrantyPolicyId}` | `stock_items_delete` | Workspace member | Remove warranty policy from stock item |

## Merchants

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/CatalogService/Merchants` |  | Public | Retrieve a list of blog posts for a specific tenant |
| GET | `/api/v2/CatalogService/Merchants/Count` |  | Public | Count merchants |
| GET | `/api/v2/CatalogService/Merchants/{merchantId}` |  | Public | Get merchant by ID |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
