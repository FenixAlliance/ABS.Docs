<!-- generated:start -->
# Content service reference

> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `ContentService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## BlogPostAuthors

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/BlogPostAuthors` | `portal_posts_read` | Workspace member, Public | Get blog authors |
| GET | `/api/v2/ContentService/BlogPostAuthors/{authorId}` |  | Public | Get blog author by ID |
| GET | `/api/v2/ContentService/BlogPostAuthors/{authorId}/BlogPosts` |  | Public | Get blog posts by author |
| GET | `/api/v2/ContentService/BlogPostAuthors/{authorId}/BlogPosts/Count` |  | Public | Count blog posts by author |

## BlogPostCategories

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/BlogPostCategories` | `portal_posts_read` | Workspace member | Get blog post categories |
| POST | `/api/v2/ContentService/BlogPostCategories` | `portal_posts_create` | Workspace member | Create a blog post category |
| GET | `/api/v2/ContentService/BlogPostCategories/Count` | `portal_posts_read` | Workspace member | Count blog post categories |
| GET | `/api/v2/ContentService/BlogPostCategories/{blogPostCategoryId}` | `portal_posts_read` | Workspace member | Get blog post category by ID |
| PUT | `/api/v2/ContentService/BlogPostCategories/{blogPostCategoryId}` | `portal_posts_update` | Workspace member | Update a blog post category |
| PATCH | `/api/v2/ContentService/BlogPostCategories/{blogPostCategoryId}` | `portal_posts_update` | Workspace member | Patch a blog post category |
| DELETE | `/api/v2/ContentService/BlogPostCategories/{blogPostCategoryId}` | `portal_posts_delete` | Workspace member | Delete a blog post category |

## BlogPostTags

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/BlogPostTags` | `portal_posts_read` | Workspace member | Get blog post tags |
| POST | `/api/v2/ContentService/BlogPostTags` | `portal_posts_create` | Workspace member | Create a blog post tag |
| GET | `/api/v2/ContentService/BlogPostTags/Count` | `portal_posts_read` | Workspace member | Count blog post tags |
| GET | `/api/v2/ContentService/BlogPostTags/{blogPostTagId}` | `portal_posts_read` | Workspace member | Get blog post tag by ID |
| PUT | `/api/v2/ContentService/BlogPostTags/{blogPostTagId}` | `portal_posts_update` | Workspace member | Update a blog post tag |
| PATCH | `/api/v2/ContentService/BlogPostTags/{blogPostTagId}` | `portal_posts_update` | Workspace member | Patch a blog post tag |
| DELETE | `/api/v2/ContentService/BlogPostTags/{blogPostTagId}` | `portal_posts_delete` | Workspace member | Delete a blog post tag |

## BlogPosts

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/BlogPosts` | `portal_posts_read` | Workspace member, Public | Retrieve a list of blog posts |
| POST | `/api/v2/ContentService/BlogPosts` | `portal_posts_create` | Workspace member | Create a new blog post |
| GET | `/api/v2/ContentService/BlogPosts/Count` | `portal_posts_read` | Workspace member, Public | Get the count of blog posts |
| GET | `/api/v2/ContentService/BlogPosts/Public` |  | Public | Gets the publicly-visible blog posts of a portal (anonymous). |
| GET | `/api/v2/ContentService/BlogPosts/Public/Count` |  | Public | Counts the publicly-visible blog posts of a portal (anonymous). |
| GET | `/api/v2/ContentService/BlogPosts/Public/{blogPostId}` |  | Public | Gets a single publicly-visible blog post of a portal by id (anonymous). An unpublished or out-of-portal post is not found. |
| GET | `/api/v2/ContentService/BlogPosts/{blogPostId}` | `portal_posts_read` | Workspace member, Public | Gets a single blog post by its ID |
| PUT | `/api/v2/ContentService/BlogPosts/{blogPostId}` | `portal_posts_update` | Workspace member | Update a blog post |
| PATCH | `/api/v2/ContentService/BlogPosts/{blogPostId}` | `portal_posts_update` | Workspace member | Patch a blog post |
| DELETE | `/api/v2/ContentService/BlogPosts/{blogPostId}` | `portal_posts_delete` | Workspace member | Delete a blog post |
| GET | `/api/v2/ContentService/BlogPosts/{blogPostId}/Categories` |  | Public | Get a list of categories related to a specific blog post |
| POST | `/api/v2/ContentService/BlogPosts/{blogPostId}/Categories` | `portal_posts_create` | Workspace member | Create a new category and relate it to a blog post |
| POST | `/api/v2/ContentService/BlogPosts/{blogPostId}/Categories/{categoryId}` | `portal_posts_update` | Workspace member | Relate an existing category to a blog post |
| DELETE | `/api/v2/ContentService/BlogPosts/{blogPostId}/Categories/{categoryId}` | `portal_posts_delete` | Workspace member | Remove a category relation from a blog post |
| GET | `/api/v2/ContentService/BlogPosts/{blogPostId}/Comments` |  | Public | Get a list of comments for a specific blog post |
| POST | `/api/v2/ContentService/BlogPosts/{blogPostId}/Comments` | `portal_posts_create` | Workspace member | Create a new comment for a blog post |
| DELETE | `/api/v2/ContentService/BlogPosts/{blogPostId}/Comments/{commentId}` | `portal_posts_delete` | Workspace member | Delete a blog post comment |
| GET | `/api/v2/ContentService/BlogPosts/{blogPostId}/Comments/{commentId}/Replies` |  | Public | Get replies for a specific comment |
| POST | `/api/v2/ContentService/BlogPosts/{blogPostId}/Comments/{commentId}/Reply` | `portal_posts_create` | Workspace member | Reply to a comment |
| GET | `/api/v2/ContentService/BlogPosts/{blogPostId}/Tags` |  | Public | Get a list of tags related to a specific blog post |
| POST | `/api/v2/ContentService/BlogPosts/{blogPostId}/Tags` | `portal_posts_create` | Workspace member | Create a new tag and relate it to a blog post |
| POST | `/api/v2/ContentService/BlogPosts/{blogPostId}/Tags/{tagId}` | `portal_posts_update` | Workspace member | Relate an existing tag to a blog post |
| DELETE | `/api/v2/ContentService/BlogPosts/{blogPostId}/Tags/{tagId}` | `portal_posts_delete` | Workspace member | Remove a tag relation from a blog post |

## BusinessDomains

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/BusinessDomains` | `business_domains_read` | Workspace member | Get business domains |
| POST | `/api/v2/ContentService/BusinessDomains` | `business_domains_create` | Workspace member | Register a business domain |
| GET | `/api/v2/ContentService/BusinessDomains/Count` | `business_domains_read` | Workspace member | Get business domains count |
| GET | `/api/v2/ContentService/BusinessDomains/{businessDomainId}` | `business_domains_read` | Workspace member | Get business domain by ID |
| PUT | `/api/v2/ContentService/BusinessDomains/{businessDomainId}` | `business_domains_update` | Workspace member | Update a business domain |
| DELETE | `/api/v2/ContentService/BusinessDomains/{businessDomainId}` | `business_domains_delete` | Workspace member | Delete a business domain |
| POST | `/api/v2/ContentService/BusinessDomains/{businessDomainId}/Verify` | `business_domains_update` | Workspace member | Verify a business domain |

## LocalizationStrings

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/LocalizationStrings` | `portals_read` | Workspace member | Get localization strings |
| POST | `/api/v2/ContentService/LocalizationStrings` | `portals_create` | Workspace member | Create a localization string |
| GET | `/api/v2/ContentService/LocalizationStrings/Count` | `portals_read` | Workspace member | Count localization strings |
| GET | `/api/v2/ContentService/LocalizationStrings/{localizationStringId}` | `portals_read` | Workspace member | Get localization string by ID |
| PUT | `/api/v2/ContentService/LocalizationStrings/{localizationStringId}` | `portals_update` | Workspace member | Update a localization string |
| DELETE | `/api/v2/ContentService/LocalizationStrings/{localizationStringId}` | `portals_delete` | Workspace member | Delete a localization string |

## MenuContexts

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/MenuContexts` | `portals_read` | Workspace member | Get menu contexts |
| POST | `/api/v2/ContentService/MenuContexts` | `portals_create` | Workspace member | Create a menu context |
| GET | `/api/v2/ContentService/MenuContexts/Count` | `portals_read` | Workspace member | Count menu contexts |
| GET | `/api/v2/ContentService/MenuContexts/{menuContextId}` | `portals_read` | Workspace member | Get menu context by ID |
| PUT | `/api/v2/ContentService/MenuContexts/{menuContextId}` | `portals_update` | Workspace member | Update a menu context |
| DELETE | `/api/v2/ContentService/MenuContexts/{menuContextId}` | `portals_delete` | Workspace member | Delete a menu context |

## Portals

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/Portals` | `portals_read` | Workspace member | Get all portals for a tenant |
| POST | `/api/v2/ContentService/Portals` | `portals_create` | Workspace member | Create a new web portal |
| GET | `/api/v2/ContentService/Portals/Count` | `portals_read` | Workspace member | Count portals for a tenant |
| GET | `/api/v2/ContentService/Portals/Current` |  | Public | Get the current portal |
| GET | `/api/v2/ContentService/Portals/Current/Options` |  | Public | Get the current portal settings |
| POST | `/api/v2/ContentService/Portals/Initialize` |  | Public | Initialize the current portal for the current user. |
| GET | `/api/v2/ContentService/Portals/Root` |  | Public | Get the root portal |
| GET | `/api/v2/ContentService/Portals/Search` |  | Public | Search for a portal by its domain |
| GET | `/api/v2/ContentService/Portals/{portalId}` | `portals_read` | Workspace member, Public | Retrieve a single portal by its ID |
| PUT | `/api/v2/ContentService/Portals/{portalId}` | `portals_update` | Workspace member | Update an existing web portal |
| PATCH | `/api/v2/ContentService/Portals/{portalId}` | `portals_update` | Workspace member | Partially updates a web portal |
| DELETE | `/api/v2/ContentService/Portals/{portalId}` | `portals_delete` | Workspace member | Deletes a web portal by its ID |
| GET | `/api/v2/ContentService/Portals/{portalId}/DomainBindings` | `portals_read` | Workspace member | Get the BusinessDomains bound to a web portal |
| POST | `/api/v2/ContentService/Portals/{portalId}/DomainBindings/{businessDomainId}` | `portals_update` | Workspace member | Bind a BusinessDomain to a web portal |
| DELETE | `/api/v2/ContentService/Portals/{portalId}/DomainBindings/{businessDomainId}` | `portals_update` | Workspace member | Unbind a BusinessDomain from a web portal |
| GET | `/api/v2/ContentService/Portals/{portalId}/Options` |  | Public | Get a portal's options by its ID |
| GET | `/api/v2/ContentService/Portals/{portalId}/Settings` |  | Public | Get a portal's settings by its ID |
| PUT | `/api/v2/ContentService/Portals/{portalId}/Settings` | `portals_update` | Workspace member | Update a web portal's settings (Options) by its ID |
| GET | `/api/v2/ContentService/Portals/{portalId}/Settings/Full` | `portals_update` | Workspace member | Get a portal's FULL settings (credentials and integration secrets included) for its owning tenant |

## WebComponents

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/WebComponents` | `portals_read` | Workspace member | Get web components |
| POST | `/api/v2/ContentService/WebComponents` | `portals_create` | Workspace member | Create a web component |
| GET | `/api/v2/ContentService/WebComponents/Count` | `portals_read` | Workspace member | Count web components |
| GET | `/api/v2/ContentService/WebComponents/{webComponentId}` | `portals_read` | Workspace member | Get web component by ID |
| PUT | `/api/v2/ContentService/WebComponents/{webComponentId}` | `portals_update` | Workspace member | Update a web component |
| DELETE | `/api/v2/ContentService/WebComponents/{webComponentId}` | `portals_delete` | Workspace member | Delete a web component |

## WebContents

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/WebContents` | `portal_posts_read` | Workspace member | Get web contents |
| POST | `/api/v2/ContentService/WebContents` | `portal_posts_create` | Workspace member | Create a web content |
| GET | `/api/v2/ContentService/WebContents/Count` | `portal_posts_read` | Workspace member | Count web contents |
| GET | `/api/v2/ContentService/WebContents/{webContentId}` | `portal_posts_read` | Workspace member | Get web content by ID |
| PUT | `/api/v2/ContentService/WebContents/{webContentId}` | `portal_posts_update` | Workspace member | Update a web content |
| PATCH | `/api/v2/ContentService/WebContents/{webContentId}` | `portal_posts_update` | Workspace member | Patch a web content |
| DELETE | `/api/v2/ContentService/WebContents/{webContentId}` | `portal_posts_delete` | Workspace member | Delete a web content |

## WebPageCategories

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/WebPageCategories` | `portal_pages_read` | Workspace member | Get web page categories |
| POST | `/api/v2/ContentService/WebPageCategories` | `portal_pages_create` | Workspace member | Create a web page category |
| GET | `/api/v2/ContentService/WebPageCategories/Count` | `portal_pages_read` | Workspace member | Count web page categories |
| GET | `/api/v2/ContentService/WebPageCategories/{webPageCategoryId}` | `portal_pages_read` | Workspace member | Get web page category by ID |
| PUT | `/api/v2/ContentService/WebPageCategories/{webPageCategoryId}` | `portal_pages_update` | Workspace member | Update a web page category |
| PATCH | `/api/v2/ContentService/WebPageCategories/{webPageCategoryId}` | `portal_pages_update` | Workspace member | Patch a web page category |
| DELETE | `/api/v2/ContentService/WebPageCategories/{webPageCategoryId}` | `portal_pages_delete` | Workspace member | Delete a web page category |

## WebPageTags

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/WebPageTags` | `portal_pages_read` | Workspace member | Get web page tags |
| POST | `/api/v2/ContentService/WebPageTags` | `portal_pages_create` | Workspace member | Create a web page tag |
| GET | `/api/v2/ContentService/WebPageTags/Count` | `portal_pages_read` | Workspace member | Count web page tags |
| GET | `/api/v2/ContentService/WebPageTags/{webPageTagId}` | `portal_pages_read` | Workspace member | Get web page tag by ID |
| PUT | `/api/v2/ContentService/WebPageTags/{webPageTagId}` | `portal_pages_update` | Workspace member | Update a web page tag |
| PATCH | `/api/v2/ContentService/WebPageTags/{webPageTagId}` | `portal_pages_update` | Workspace member | Patch a web page tag |
| DELETE | `/api/v2/ContentService/WebPageTags/{webPageTagId}` | `portal_pages_delete` | Workspace member | Delete a web page tag |

## WebPages

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/WebPages` | `portal_pages_read` | Workspace member | Get web pages |
| POST | `/api/v2/ContentService/WebPages` | `portal_pages_create` | Workspace member | Create a web page |
| GET | `/api/v2/ContentService/WebPages/Count` | `portal_pages_read` | Workspace member | Count web pages |
| GET | `/api/v2/ContentService/WebPages/{webPageId}` | `portal_pages_read` | Workspace member | Get web page by ID |
| PUT | `/api/v2/ContentService/WebPages/{webPageId}` | `portal_pages_update` | Workspace member | Update a web page |
| PATCH | `/api/v2/ContentService/WebPages/{webPageId}` | `portal_pages_update` | Workspace member | Patch a web page |
| DELETE | `/api/v2/ContentService/WebPages/{webPageId}` | `portal_pages_delete` | Workspace member | Delete a web page |
| GET | `/api/v2/ContentService/WebPages/{webPageId}/Categories` |  | Public | Get categories by web page |
| POST | `/api/v2/ContentService/WebPages/{webPageId}/Categories` | `portal_pages_create` | Workspace member | Create a web page category relation |
| POST | `/api/v2/ContentService/WebPages/{webPageId}/Categories/{categoryId}` | `portal_pages_update` | Workspace member | Relate web page to category |
| DELETE | `/api/v2/ContentService/WebPages/{webPageId}/Categories/{categoryId}` | `portal_pages_delete` | Workspace member | Unrelate web page from category |
| GET | `/api/v2/ContentService/WebPages/{webPageId}/Tags` |  | Public | Get tags by web page |
| POST | `/api/v2/ContentService/WebPages/{webPageId}/Tags` | `portal_pages_create` | Workspace member | Create a web page tag relation |
| POST | `/api/v2/ContentService/WebPages/{webPageId}/Tags/{tagId}` | `portal_pages_update` | Workspace member | Relate web page to tag |
| DELETE | `/api/v2/ContentService/WebPages/{webPageId}/Tags/{tagId}` | `portal_pages_delete` | Workspace member | Unrelate web page from tag |

## WebTemplates

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/WebTemplates` | `portals_read` | Workspace member | Get web templates |
| POST | `/api/v2/ContentService/WebTemplates` | `portals_create` | Workspace member | Create a web template |
| GET | `/api/v2/ContentService/WebTemplates/Count` | `portals_read` | Workspace member | Count web templates |
| GET | `/api/v2/ContentService/WebTemplates/{webTemplateId}` | `portals_read` | Workspace member | Get web template by ID |
| PUT | `/api/v2/ContentService/WebTemplates/{webTemplateId}` | `portals_update` | Workspace member | Update a web template |
| PATCH | `/api/v2/ContentService/WebTemplates/{webTemplateId}` | `portals_update` | Workspace member | Patch a web template |
| DELETE | `/api/v2/ContentService/WebTemplates/{webTemplateId}` | `portals_delete` | Workspace member | Delete a web template |

## WebsiteThemes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ContentService/WebsiteThemes` | `portals_read` | Workspace member | Get all website themes |
| POST | `/api/v2/ContentService/WebsiteThemes` | `portals_create` | Workspace member | Create a new website theme |
| GET | `/api/v2/ContentService/WebsiteThemes/Count` | `portals_read` | Workspace member | Get website themes count |
| GET | `/api/v2/ContentService/WebsiteThemes/{id}` | `portals_read` | Workspace member | Get website theme by ID |
| PUT | `/api/v2/ContentService/WebsiteThemes/{id}` | `portals_update` | Workspace member | Update a website theme |
| PATCH | `/api/v2/ContentService/WebsiteThemes/{id}` | `portals_update` | Workspace member | Patch a website theme |
| DELETE | `/api/v2/ContentService/WebsiteThemes/{id}` | `portals_delete` | Workspace member | Delete a website theme |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
