# Social service

The Social service lets people follow each other, post, comment and react, talk in conversations, read their notifications, and keep a curriculum.

**Who uses it:** developers who build a community, a member portal or an inbox on top of a workspace.

**Base route:** `/api/v2/SocialService/...`

## What you can do

- **Read notifications:** list and count the notifications of a social profile, mark one read, and archive or unarchive it. See [Notifications](~/Capabilities/Notifications.md). Without a workspace, the calls read and change your own personal inbox. With a workspace (`X-TenantId` or `tenantId`), they read and change that workspace's notifications for your profile. Add `archived=true` to the list and count calls to read the Archived view instead of the inbox.
- **Read workspace bulletins:** a workspace's shared notices are listed in the [Tenants service](Tenants.md) (`/Tenants/{tenantId}/Notifications`, also with `archived=`). Each member reads and archives a bulletin for themselves only.
- **Follow profiles:** read social profiles, their followers and the profiles they follow, and follow or unfollow a profile.
- **Post and react:** create posts with attachments and images, comment on them, and react to posts and comments. Read and post in social feeds.
- **Talk in conversations:** start a conversation or a direct conversation, send, edit and delete messages, and mark a conversation read.
- **Run groups:** create and manage social groups.
- **Keep a curriculum:** keep a curriculum with work experience, and maintain the workspace's skill catalog.

Who receives a notification is decided by the rules in the [Reach service](Reach.md).

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Signed-in calls:** posts, feeds, comments, reactions, conversations, follows and your own curriculum need a signed-in user and no workspace permission.
- **Permissions:** in a workspace, `notifications_create` to create a notification, `notifications_update` to mark one read, and `notifications_read` to archive or unarchive one. Calls on your own personal inbox need only a signed-in user. The other permissions are `social_groups_create`, `social_groups_update` and `social_groups_delete`; `curriculums_create`, `curriculums_update` and `curriculums_delete` for work experience; `skills_read`, `skills_create`, `skills_update` and `skills_delete`.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `SocialService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## CurriculumExperiences

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SocialService/Curriculums/{curriculumId}/Experiences` |  | Signed-in user, or workspace member with a workspace | Get curriculum experiences |
| POST | `/api/v2/SocialService/Curriculums/{curriculumId}/Experiences` | `curriculums_create` | Signed-in user, or workspace member with a workspace | Create a curriculum experience |
| GET | `/api/v2/SocialService/Curriculums/{curriculumId}/Experiences/Count` |  | Signed-in user, or workspace member with a workspace | Count curriculum experiences |
| GET | `/api/v2/SocialService/Curriculums/{curriculumId}/Experiences/{experienceId}` |  | Signed-in user, or workspace member with a workspace | Get curriculum experience by ID |
| PUT | `/api/v2/SocialService/Curriculums/{curriculumId}/Experiences/{experienceId}` | `curriculums_update` | Signed-in user, or workspace member with a workspace | Update a curriculum experience |
| PATCH | `/api/v2/SocialService/Curriculums/{curriculumId}/Experiences/{experienceId}` | `curriculums_update` | Signed-in user, or workspace member with a workspace | Patch a curriculum experience |
| DELETE | `/api/v2/SocialService/Curriculums/{curriculumId}/Experiences/{experienceId}` | `curriculums_delete` | Signed-in user, or workspace member with a workspace | Delete a curriculum experience |

## Curriculums

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SocialService/Curriculums` |  | Signed-in user, or workspace member with a workspace | Get curricula |
| POST | `/api/v2/SocialService/Curriculums` |  | Signed-in user | Create a curriculum |
| GET | `/api/v2/SocialService/Curriculums/Count` |  | Signed-in user, or workspace member with a workspace | Count curricula |
| GET | `/api/v2/SocialService/Curriculums/{curriculumId}` |  | Signed-in user, or workspace member with a workspace | Get curriculum by ID |
| PUT | `/api/v2/SocialService/Curriculums/{curriculumId}` |  | Signed-in user | Update a curriculum |
| PATCH | `/api/v2/SocialService/Curriculums/{curriculumId}` |  | Signed-in user | Patch a curriculum |
| DELETE | `/api/v2/SocialService/Curriculums/{curriculumId}` |  | Signed-in user | Delete a curriculum |

## Skills

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SocialService/Skills` | `skills_read` | Workspace member | Get skills |
| POST | `/api/v2/SocialService/Skills` | `skills_create` | Workspace member | Create a skill |
| GET | `/api/v2/SocialService/Skills/Count` | `skills_read` | Workspace member | Count skills |
| GET | `/api/v2/SocialService/Skills/{skillId}` | `skills_read` | Workspace member | Get skill by ID |
| PUT | `/api/v2/SocialService/Skills/{skillId}` | `skills_update` | Workspace member | Update a skill |
| PATCH | `/api/v2/SocialService/Skills/{skillId}` | `skills_update` | Workspace member | Patch a skill |
| DELETE | `/api/v2/SocialService/Skills/{skillId}` | `skills_delete` | Workspace member | Delete a skill |

## SocialFeeds

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SocialService/SocialFeeds` |  | Signed-in user | Get social feeds |
| GET | `/api/v2/SocialService/SocialFeeds/Count` |  | Signed-in user | Count social feeds |
| GET | `/api/v2/SocialService/SocialFeeds/{socialFeedId}` |  | Signed-in user | Get social feed by ID |
| GET | `/api/v2/SocialService/SocialFeeds/{socialFeedId}/Posts` |  | Signed-in user | Get social feed posts |
| POST | `/api/v2/SocialService/SocialFeeds/{socialFeedId}/Posts` |  | Signed-in user | Create a social feed post |
| GET | `/api/v2/SocialService/SocialFeeds/{socialFeedId}/Posts/Count` |  | Signed-in user | Count social feed posts |
| GET | `/api/v2/SocialService/SocialFeeds/{socialFeedId}/Posts/{feedPostId}` |  | Signed-in user | Get social feed post by ID |
| PUT | `/api/v2/SocialService/SocialFeeds/{socialFeedId}/Posts/{feedPostId}` |  | Signed-in user | Update a social feed post |
| PATCH | `/api/v2/SocialService/SocialFeeds/{socialFeedId}/Posts/{feedPostId}` |  | Signed-in user | Patch a social feed post |
| DELETE | `/api/v2/SocialService/SocialFeeds/{socialFeedId}/Posts/{feedPostId}` |  | Signed-in user | Delete a social feed post |

## SocialGroups

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SocialService/SocialGroups` |  | Signed-in user, or workspace member with a workspace | Get social groups |
| POST | `/api/v2/SocialService/SocialGroups` | `social_groups_create` | Signed-in user, or workspace member with a workspace | Create a social group |
| GET | `/api/v2/SocialService/SocialGroups/Count` |  | Signed-in user, or workspace member with a workspace | Count social groups |
| GET | `/api/v2/SocialService/SocialGroups/{socialGroupId}` |  | Signed-in user, or workspace member with a workspace | Get social group by ID |
| PUT | `/api/v2/SocialService/SocialGroups/{socialGroupId}` | `social_groups_update` | Signed-in user, or workspace member with a workspace | Update a social group |
| PATCH | `/api/v2/SocialService/SocialGroups/{socialGroupId}` | `social_groups_update` | Signed-in user, or workspace member with a workspace | Patch a social group |
| DELETE | `/api/v2/SocialService/SocialGroups/{socialGroupId}` | `social_groups_delete` | Signed-in user, or workspace member with a workspace | Delete a social group |

## SocialPosts

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SocialService/SocialPosts` |  | Signed-in user | Get social posts |
| POST | `/api/v2/SocialService/SocialPosts` |  | Signed-in user | Create a social post |
| GET | `/api/v2/SocialService/SocialPosts/Count` |  | Signed-in user | Count social posts |
| GET | `/api/v2/SocialService/SocialPosts/{socialPostId}` |  | Signed-in user | Get social post by ID |
| PUT | `/api/v2/SocialService/SocialPosts/{socialPostId}` |  | Signed-in user | Update a social post |
| PATCH | `/api/v2/SocialService/SocialPosts/{socialPostId}` |  | Signed-in user | Patch a social post |
| DELETE | `/api/v2/SocialService/SocialPosts/{socialPostId}` |  | Signed-in user | Delete a social post |
| GET | `/api/v2/SocialService/SocialPosts/{socialPostId}/Attachments` |  | Signed-in user | Get social post attachments |
| POST | `/api/v2/SocialService/SocialPosts/{socialPostId}/Attachments` |  | Signed-in user | Create a social post attachment |
| GET | `/api/v2/SocialService/SocialPosts/{socialPostId}/Attachments/Count` |  | Signed-in user | Count social post attachments |
| POST | `/api/v2/SocialService/SocialPosts/{socialPostId}/Attachments/Image` |  | Signed-in user | Upload a social post image attachment |
| GET | `/api/v2/SocialService/SocialPosts/{socialPostId}/Attachments/{attachmentId}` |  | Signed-in user | Get social post attachment by ID |
| PUT | `/api/v2/SocialService/SocialPosts/{socialPostId}/Attachments/{attachmentId}` |  | Signed-in user | Update a social post attachment |
| DELETE | `/api/v2/SocialService/SocialPosts/{socialPostId}/Attachments/{attachmentId}` |  | Signed-in user | Delete a social post attachment |
| GET | `/api/v2/SocialService/SocialPosts/{socialPostId}/Comments` |  | Signed-in user | Get social post comments |
| POST | `/api/v2/SocialService/SocialPosts/{socialPostId}/Comments` |  | Signed-in user | Create a social post comment |
| GET | `/api/v2/SocialService/SocialPosts/{socialPostId}/Comments/Count` |  | Signed-in user | Count social post comments |
| GET | `/api/v2/SocialService/SocialPosts/{socialPostId}/Comments/{commentId}` |  | Signed-in user | Get social post comment by ID |
| PUT | `/api/v2/SocialService/SocialPosts/{socialPostId}/Comments/{commentId}` |  | Signed-in user | Update a social post comment |
| DELETE | `/api/v2/SocialService/SocialPosts/{socialPostId}/Comments/{commentId}` |  | Signed-in user | Delete a social post comment |
| GET | `/api/v2/SocialService/SocialPosts/{socialPostId}/Comments/{commentId}/Reactions` |  | Signed-in user | Get social comment reactions |
| POST | `/api/v2/SocialService/SocialPosts/{socialPostId}/Comments/{commentId}/Reactions` |  | Signed-in user | Create a social comment reaction |
| GET | `/api/v2/SocialService/SocialPosts/{socialPostId}/Comments/{commentId}/Reactions/Count` |  | Signed-in user | Count social comment reactions |
| GET | `/api/v2/SocialService/SocialPosts/{socialPostId}/Comments/{commentId}/Reactions/{reactionId}` |  | Signed-in user | Get social comment reaction by ID |
| PUT | `/api/v2/SocialService/SocialPosts/{socialPostId}/Comments/{commentId}/Reactions/{reactionId}` |  | Signed-in user | Update a social comment reaction |
| DELETE | `/api/v2/SocialService/SocialPosts/{socialPostId}/Comments/{commentId}/Reactions/{reactionId}` |  | Signed-in user | Delete a social comment reaction |
| GET | `/api/v2/SocialService/SocialPosts/{socialPostId}/Reactions` |  | Signed-in user | Get social post reactions |
| POST | `/api/v2/SocialService/SocialPosts/{socialPostId}/Reactions` |  | Signed-in user | Create a social post reaction |
| GET | `/api/v2/SocialService/SocialPosts/{socialPostId}/Reactions/Count` |  | Signed-in user | Count social post reactions |
| GET | `/api/v2/SocialService/SocialPosts/{socialPostId}/Reactions/{reactionId}` |  | Signed-in user | Get social post reaction by ID |
| PUT | `/api/v2/SocialService/SocialPosts/{socialPostId}/Reactions/{reactionId}` |  | Signed-in user | Update a social post reaction |
| DELETE | `/api/v2/SocialService/SocialPosts/{socialPostId}/Reactions/{reactionId}` |  | Signed-in user | Delete a social post reaction |

## SocialProfiles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SocialService/SocialProfiles` |  | Signed-in user, or workspace member with a workspace | Get Social Profiles |
| GET | `/api/v2/SocialService/SocialProfiles/Count` |  | Signed-in user, or workspace member with a workspace | Count Social Profiles |
| GET | `/api/v2/SocialService/SocialProfiles/{conversationId}/Messages` |  | Signed-in user | Get Messages |
| POST | `/api/v2/SocialService/SocialProfiles/{conversationId}/Messages` |  | Signed-in user | Create Message |
| GET | `/api/v2/SocialService/SocialProfiles/{conversationId}/Messages/Count` |  | Signed-in user | Count Messages |
| POST | `/api/v2/SocialService/SocialProfiles/{conversationId}/Messages/Read` |  | Signed-in user | Mark Conversation Read |
| PUT | `/api/v2/SocialService/SocialProfiles/{conversationId}/Messages/{messageId}` |  | Signed-in user | Update Message |
| DELETE | `/api/v2/SocialService/SocialProfiles/{conversationId}/Messages/{messageId}` |  | Signed-in user | Delete Message |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}` |  | Signed-in user, or workspace member with a workspace | Get Social Profile |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Conversations` |  | Signed-in user | Get Conversations |
| POST | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Conversations` |  | Signed-in user | Create Conversation |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Conversations/Count` |  | Signed-in user | Count Conversations |
| POST | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Conversations/Direct` |  | Signed-in user | Get or Create Direct Conversation |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Followers` |  | Signed-in user, or workspace member with a workspace | Get Followers |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Followers/Count` |  | Signed-in user, or workspace member with a workspace | Count Followers |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Followers/Profiles` |  | Signed-in user, or workspace member with a workspace | Get Follower Profiles |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Followers/Profiles/Count` |  | Signed-in user, or workspace member with a workspace | Count Follower Profiles |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Follows` |  | Signed-in user, or workspace member with a workspace | Get Follows |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Follows/Count` |  | Signed-in user, or workspace member with a workspace | Count Follows |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Follows/Profiles` |  | Signed-in user, or workspace member with a workspace | Get Followed Profiles |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Follows/Profiles/Count` |  | Signed-in user, or workspace member with a workspace | Count Followed Profiles |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Follows/{followedSocialProfileId}` |  | Signed-in user, or workspace member with a workspace | Check if Follow Exists |
| POST | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Follows/{followedSocialProfileId}` |  | Signed-in user | Follow |
| DELETE | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Follows/{followedSocialProfileId}` |  | Signed-in user | Unfollow |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/GroupEnrollments/Count` |  | Signed-in user | Count Group Enrollments |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Notifications` |  | Signed-in user, or workspace member with a workspace | Get Notifications |
| POST | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Notifications` | `notifications_create` | Workspace member | Create Notification |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Notifications/Count` |  | Signed-in user, or workspace member with a workspace | Count Notifications |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Notifications/{notificationId}` |  | Signed-in user, or workspace member with a workspace | Get Notification |
| PUT | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Notifications/{notificationId}` | `notifications_update` | Signed-in user, or workspace member with a workspace | Mark Notification Read |
| POST | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Notifications/{notificationId}/Archive` | `notifications_read` | Signed-in user, or workspace member with a workspace | Archive Notification |
| POST | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Notifications/{notificationId}/Unarchive` | `notifications_read` | Signed-in user, or workspace member with a workspace | Unarchive Notification |

Generated from the source at commit 05da3e4078.
<!-- generated:end -->
