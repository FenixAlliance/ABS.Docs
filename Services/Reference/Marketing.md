# Marketing service

The Marketing service lets you run your workspace's campaigns, email content, newsletters, leads and site banners.

**Who uses it:** developers who connect a website, a lead form or a marketing tool to a workspace.

**Base route:** `/api/v2/MarketingService/...`

## What you can do

- **Run banners on your site:** create banner sets with their creatives, place a set in a placement slot of your pages and posts, and read the daily counts per creative. A visitor who clicks a banner is taken to its link.
- **Show banners on a site you build:** read the banners for a placement slot and send clicks to the click address. Both work without sign-in.
- **Plan campaigns:** manage marketing campaigns, marketing areas and marketing lists.
- **Capture leads:** create and update marketing leads.
- **Keep email content:** manage email templates, email signatures and email groups.
- **Manage newsletters:** create newsletters and keep their subscriptions.
- **Draft social media posts:** keep social media posts and group them into post buckets.

Campaigns, newsletters and social media posts are records you plan and keep. The Marketing service does not send newsletters or campaign email, and does not publish posts to social networks.

See [Customer experience](~/Capabilities/Customer-Experience.md) for how these fit with contacts and support.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** `marketing_banners_read`, `marketing_banners_create`, `marketing_banners_update` and `marketing_banners_delete`; and the `_read`, `_create`, `_update` and `_delete` permissions of `campaigns`, `marketing_areas`, `marketing_lists`, `marketing_leads`, `email_templates`, `email_signatures`, `email_groups`, `newsletters` and `social_posts`.
- **Email templates and signatures written in code:** content in Razor, C# or CSHtml can be saved only in workspaces an instance administrator enables, and only by their owners and administrators. Everywhere else, set the content type to HTML, Markdown or Markup.
- Unsubscribe links for recipients are not available yet.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `MarketingService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## BannerCreatives

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/BannerCreatives/Public/{bannerCreativeId}/Click` |  | Public | Follow a banner click |

## BannerPlacementAssignments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/BannerPlacementAssignments` | `marketing_banners_read` | Workspace member | Get banner placement assignments |
| POST | `/api/v2/MarketingService/BannerPlacementAssignments` | `marketing_banners_create` | Workspace member | Create a banner placement assignment |
| GET | `/api/v2/MarketingService/BannerPlacementAssignments/Count` | `marketing_banners_read` | Workspace member | Get banner placement assignments count |
| GET | `/api/v2/MarketingService/BannerPlacementAssignments/{bannerPlacementAssignmentId}` | `marketing_banners_read` | Workspace member | Get banner placement assignment by ID |
| PUT | `/api/v2/MarketingService/BannerPlacementAssignments/{bannerPlacementAssignmentId}` | `marketing_banners_update` | Workspace member | Update a banner placement assignment |
| DELETE | `/api/v2/MarketingService/BannerPlacementAssignments/{bannerPlacementAssignmentId}` | `marketing_banners_delete` | Workspace member | Delete a banner placement assignment |

## BannerPlacementKeys

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/BannerPlacementKeys` | `marketing_banners_read` | Workspace member | Get banner placement keys |

## BannerPlacements

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/BannerPlacements/Public/{placementKey}` |  | Public | Get the banners of a placement |

## BannerSets

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/BannerSets` | `marketing_banners_read` | Workspace member | Get banner sets |
| POST | `/api/v2/MarketingService/BannerSets` | `marketing_banners_create` | Workspace member | Create a banner set |
| GET | `/api/v2/MarketingService/BannerSets/Count` | `marketing_banners_read` | Workspace member | Get banner sets count |
| GET | `/api/v2/MarketingService/BannerSets/{bannerSetId}` | `marketing_banners_read` | Workspace member | Get banner set by ID |
| PUT | `/api/v2/MarketingService/BannerSets/{bannerSetId}` | `marketing_banners_update` | Workspace member | Update a banner set |
| DELETE | `/api/v2/MarketingService/BannerSets/{bannerSetId}` | `marketing_banners_delete` | Workspace member | Delete a banner set |
| GET | `/api/v2/MarketingService/BannerSets/{bannerSetId}/Creatives` | `marketing_banners_read` | Workspace member | Get banner creatives |
| POST | `/api/v2/MarketingService/BannerSets/{bannerSetId}/Creatives` | `marketing_banners_create` | Workspace member | Add a banner creative |
| GET | `/api/v2/MarketingService/BannerSets/{bannerSetId}/Creatives/Count` | `marketing_banners_read` | Workspace member | Get banner creatives count |
| GET | `/api/v2/MarketingService/BannerSets/{bannerSetId}/Creatives/{bannerCreativeId}` | `marketing_banners_read` | Workspace member | Get banner creative by ID |
| PUT | `/api/v2/MarketingService/BannerSets/{bannerSetId}/Creatives/{bannerCreativeId}` | `marketing_banners_update` | Workspace member | Update a banner creative |
| DELETE | `/api/v2/MarketingService/BannerSets/{bannerSetId}/Creatives/{bannerCreativeId}` | `marketing_banners_delete` | Workspace member | Remove a banner creative |
| GET | `/api/v2/MarketingService/BannerSets/{bannerSetId}/Performance` | `marketing_banners_read` | Workspace member | Get banner set performance |

## EmailGroups

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/EmailGroups` | `email_groups_read` | Workspace member | Get email groups |
| POST | `/api/v2/MarketingService/EmailGroups` | `email_groups_create` | Workspace member | Create an email group |
| GET | `/api/v2/MarketingService/EmailGroups/Count` | `email_groups_read` | Workspace member | Get email groups count |
| GET | `/api/v2/MarketingService/EmailGroups/{emailgroupId}` | `email_groups_read` | Workspace member | Get email group by ID |
| PUT | `/api/v2/MarketingService/EmailGroups/{emailgroupId}` | `email_groups_update` | Workspace member | Update an email group |
| PATCH | `/api/v2/MarketingService/EmailGroups/{emailgroupId}` | `email_groups_update` | Workspace member | Patch an email group |
| DELETE | `/api/v2/MarketingService/EmailGroups/{emailgroupId}` | `email_groups_delete` | Workspace member | Delete an email group |

## EmailSignatures

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/EmailSignatures` | `email_signatures_read` | Workspace member | Get email signatures |
| POST | `/api/v2/MarketingService/EmailSignatures` | `email_signatures_create` | Workspace member | Create an email signature |
| GET | `/api/v2/MarketingService/EmailSignatures/Count` | `email_signatures_read` | Workspace member | Get email signatures count |
| GET | `/api/v2/MarketingService/EmailSignatures/{emailsignatureId}` | `email_signatures_read` | Workspace member | Get email signature by ID |
| PUT | `/api/v2/MarketingService/EmailSignatures/{emailsignatureId}` | `email_signatures_update` | Workspace member | Update an email signature |
| PATCH | `/api/v2/MarketingService/EmailSignatures/{emailsignatureId}` | `email_signatures_update` | Workspace member | Patch an email signature |
| DELETE | `/api/v2/MarketingService/EmailSignatures/{emailsignatureId}` | `email_signatures_delete` | Workspace member | Delete an email signature |

## EmailTemplates

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/EmailTemplates` |  | Workspace member | Get email templates |
| POST | `/api/v2/MarketingService/EmailTemplates` | `email_templates_create` | Workspace member | Create an email template |
| GET | `/api/v2/MarketingService/EmailTemplates/Count` |  | Workspace member | Get email templates count |
| GET | `/api/v2/MarketingService/EmailTemplates/{emailTemplateId}` | `email_templates_read` | Workspace member | Get email template by ID |
| PUT | `/api/v2/MarketingService/EmailTemplates/{emailTemplateId}` | `email_templates_update` | Workspace member | Update an email template |
| PATCH | `/api/v2/MarketingService/EmailTemplates/{emailTemplateId}` | `email_templates_update` | Workspace member | Patch an email template |
| DELETE | `/api/v2/MarketingService/EmailTemplates/{emailTemplateId}` | `email_templates_delete` | Workspace member | Delete an email template |

## MarketingAreas

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/MarketingAreas` | `marketing_areas_read` | Workspace member | Get marketing areas |
| POST | `/api/v2/MarketingService/MarketingAreas` | `marketing_areas_create` | Workspace member | Create a marketing area |
| GET | `/api/v2/MarketingService/MarketingAreas/Count` | `marketing_areas_read` | Workspace member | Count marketing areas |
| GET | `/api/v2/MarketingService/MarketingAreas/{marketingAreaId}` | `marketing_areas_read` | Workspace member | Get marketing area by ID |
| PUT | `/api/v2/MarketingService/MarketingAreas/{marketingAreaId}` | `marketing_areas_update` | Workspace member | Update a marketing area |
| PATCH | `/api/v2/MarketingService/MarketingAreas/{marketingAreaId}` | `marketing_areas_update` | Workspace member | Patch a marketing area |
| DELETE | `/api/v2/MarketingService/MarketingAreas/{marketingAreaId}` | `marketing_areas_delete` | Workspace member | Delete a marketing area |

## MarketingCampaigns

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/MarketingCampaigns` | `campaigns_read` | Workspace member | Get marketing campaigns |
| POST | `/api/v2/MarketingService/MarketingCampaigns` | `campaigns_create` | Workspace member | Create a marketing campaign |
| GET | `/api/v2/MarketingService/MarketingCampaigns/Count` | `campaigns_read` | Workspace member | Get marketing campaigns count |
| GET | `/api/v2/MarketingService/MarketingCampaigns/{marketingcampaignId}` | `campaigns_read` | Workspace member | Get marketing campaign by ID |
| PUT | `/api/v2/MarketingService/MarketingCampaigns/{marketingcampaignId}` | `campaigns_update` | Workspace member | Update a marketing campaign |
| PATCH | `/api/v2/MarketingService/MarketingCampaigns/{marketingcampaignId}` | `campaigns_update` | Workspace member | Patch a marketing campaign |
| DELETE | `/api/v2/MarketingService/MarketingCampaigns/{marketingcampaignId}` | `campaigns_delete` | Workspace member | Delete a marketing campaign |

## MarketingLeads

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/MarketingLeads` | `marketing_leads_read` | Workspace member | Get marketing leads |
| POST | `/api/v2/MarketingService/MarketingLeads` | `marketing_leads_create` | Workspace member | Create a marketing lead |
| GET | `/api/v2/MarketingService/MarketingLeads/Count` | `marketing_leads_read` | Workspace member | Get marketing leads count |
| GET | `/api/v2/MarketingService/MarketingLeads/{marketingLeadId}` | `marketing_leads_read` | Workspace member | Get marketing lead by ID |
| PUT | `/api/v2/MarketingService/MarketingLeads/{marketingLeadId}` | `marketing_leads_update` | Workspace member | Update a marketing lead |
| PATCH | `/api/v2/MarketingService/MarketingLeads/{marketingLeadId}` | `marketing_leads_update` | Workspace member | Patch a marketing lead |
| DELETE | `/api/v2/MarketingService/MarketingLeads/{marketingLeadId}` | `marketing_leads_delete` | Workspace member | Delete a marketing lead |

## MarketingLists

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/MarketingLists` | `marketing_lists_read` | Workspace member | Get marketing lists |
| POST | `/api/v2/MarketingService/MarketingLists` | `marketing_lists_create` | Workspace member | Create a marketing list |
| GET | `/api/v2/MarketingService/MarketingLists/Count` | `marketing_lists_read` | Workspace member | Get marketing lists count |
| GET | `/api/v2/MarketingService/MarketingLists/{marketinglistId}` | `marketing_lists_read` | Workspace member | Get marketing list by ID |
| PUT | `/api/v2/MarketingService/MarketingLists/{marketinglistId}` | `marketing_lists_update` | Workspace member | Update a marketing list |
| PATCH | `/api/v2/MarketingService/MarketingLists/{marketinglistId}` | `marketing_lists_update` | Workspace member | Patch a marketing list |
| DELETE | `/api/v2/MarketingService/MarketingLists/{marketinglistId}` | `marketing_lists_delete` | Workspace member | Delete a marketing list |

## NewsletterSubscriptions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/NewsletterSubscriptions` | `newsletters_read` | Workspace member | Get newsletter subscriptions |
| POST | `/api/v2/MarketingService/NewsletterSubscriptions` | `newsletters_create` | Workspace member | Create a newsletter subscription |
| GET | `/api/v2/MarketingService/NewsletterSubscriptions/Count` | `newsletters_read` | Workspace member | Get newsletter subscriptions count |
| GET | `/api/v2/MarketingService/NewsletterSubscriptions/{newsletterSubscriptionId}` | `newsletters_read` | Workspace member | Get newsletter subscription by ID |
| PUT | `/api/v2/MarketingService/NewsletterSubscriptions/{newsletterSubscriptionId}` | `newsletters_update` | Workspace member | Update a newsletter subscription |
| DELETE | `/api/v2/MarketingService/NewsletterSubscriptions/{newsletterSubscriptionId}` | `newsletters_delete` | Workspace member | Delete a newsletter subscription |

## Newsletters

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/Newsletters` | `newsletters_read` | Workspace member | Get newsletters |
| POST | `/api/v2/MarketingService/Newsletters` | `newsletters_create` | Workspace member | Create a newsletter |
| GET | `/api/v2/MarketingService/Newsletters/Count` | `newsletters_read` | Workspace member | Get newsletters count |
| GET | `/api/v2/MarketingService/Newsletters/{newsletterId}` | `newsletters_read` | Workspace member | Get newsletter by ID |
| PUT | `/api/v2/MarketingService/Newsletters/{newsletterId}` | `newsletters_update` | Workspace member | Update a newsletter |
| PATCH | `/api/v2/MarketingService/Newsletters/{newsletterId}` | `newsletters_update` | Workspace member | Patch a newsletter |
| DELETE | `/api/v2/MarketingService/Newsletters/{newsletterId}` | `newsletters_delete` | Workspace member | Delete a newsletter |

## SocialMediaPosts

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/SocialMediaPosts` | `social_posts_read` | Workspace member | Get social media posts |
| POST | `/api/v2/MarketingService/SocialMediaPosts` | `social_posts_create` | Workspace member | Create a social media post |
| GET | `/api/v2/MarketingService/SocialMediaPosts/Count` | `social_posts_read` | Workspace member | Get social media posts count |
| GET | `/api/v2/MarketingService/SocialMediaPosts/{socialmediapostId}` | `social_posts_read` | Workspace member | Get social media post by ID |
| PUT | `/api/v2/MarketingService/SocialMediaPosts/{socialmediapostId}` | `social_posts_update` | Workspace member | Update a social media post |
| PATCH | `/api/v2/MarketingService/SocialMediaPosts/{socialmediapostId}` | `social_posts_update` | Workspace member | Patch a social media post |
| DELETE | `/api/v2/MarketingService/SocialMediaPosts/{socialmediapostId}` | `social_posts_delete` | Workspace member | Delete a social media post |

## SocialPostBuckets

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/MarketingService/SocialPostBuckets` | `social_posts_read` | Workspace member | Get social post buckets |
| POST | `/api/v2/MarketingService/SocialPostBuckets` | `social_posts_create` | Workspace member | Create a social post bucket |
| GET | `/api/v2/MarketingService/SocialPostBuckets/Count` | `social_posts_read` | Workspace member | Get social post buckets count |
| GET | `/api/v2/MarketingService/SocialPostBuckets/{socialpostbucketId}` | `social_posts_read` | Workspace member | Get social post bucket by ID |
| PUT | `/api/v2/MarketingService/SocialPostBuckets/{socialpostbucketId}` | `social_posts_update` | Workspace member | Update a social post bucket |
| PATCH | `/api/v2/MarketingService/SocialPostBuckets/{socialpostbucketId}` | `social_posts_update` | Workspace member | Patch a social post bucket |
| DELETE | `/api/v2/MarketingService/SocialPostBuckets/{socialpostbucketId}` | `social_posts_delete` | Workspace member | Delete a social post bucket |

Generated from the source at commit 642fb3c3ad.
<!-- generated:end -->
