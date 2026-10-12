# Social service

The Social service lets people follow each other, post, comment and react, talk in conversations, read their notifications, and keep a curriculum.

**Who uses it:** developers who build a community, a member portal or an inbox on top of a workspace.

**Base route:** `/api/v2/SocialService/...`

## What you can do

- **Read notifications:** list and count the notifications of a social profile, mark one read, and archive or unarchive it. See [Notifications](~/Capabilities/Notifications.md).
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
- **Permissions:** `notifications_create` and `notifications_update` to create a notification or mark it read, and `notifications_read` to archive or unarchive one; `social_groups_create`, `social_groups_update` and `social_groups_delete`; `curriculums_create`, `curriculums_update` and `curriculums_delete` for work experience; `skills_read`, `skills_create`, `skills_update` and `skills_delete`.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `SocialService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## CurriculumExperiences

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SocialService/Curriculums/{curriculumId}/Experiences` |  | Workspace member | Get work-experience records for a curriculum |
| POST | `/api/v2/SocialService/Curriculums/{curriculumId}/Experiences` | `curriculums_create` | Workspace member | Create a work-experience record |
| GET | `/api/v2/SocialService/Curriculums/{curriculumId}/Experiences/Count` |  | Workspace member | Count work-experience records for a curriculum |
| GET | `/api/v2/SocialService/Curriculums/{curriculumId}/Experiences/{experienceId}` |  | Workspace member | Get a work-experience record by ID |
| PUT | `/api/v2/SocialService/Curriculums/{curriculumId}/Experiences/{experienceId}` | `curriculums_update` | Workspace member | Update a work-experience record |
| PATCH | `/api/v2/SocialService/Curriculums/{curriculumId}/Experiences/{experienceId}` | `curriculums_update` | Workspace member | Patch a work-experience record |
| DELETE | `/api/v2/SocialService/Curriculums/{curriculumId}/Experiences/{experienceId}` | `curriculums_delete` | Workspace member | Delete a work-experience record |

## Curriculums

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SocialService/Curriculums` |  | Workspace member | Get curricula authored on a social profile |
| POST | `/api/v2/SocialService/Curriculums` |  | Signed-in user | Create a curriculum |
| GET | `/api/v2/SocialService/Curriculums/Count` |  | Workspace member | Count curricula authored on a social profile |
| GET | `/api/v2/SocialService/Curriculums/{curriculumId}` |  | Workspace member | Get a curriculum by ID |
| PUT | `/api/v2/SocialService/Curriculums/{curriculumId}` |  | Signed-in user | Update a curriculum |
| PATCH | `/api/v2/SocialService/Curriculums/{curriculumId}` |  | Signed-in user | Patch a curriculum |
| DELETE | `/api/v2/SocialService/Curriculums/{curriculumId}` |  | Signed-in user | Delete a curriculum |

## Skills

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/SocialService/Skills` | `skills_read` | Workspace member | Get skills (skill catalog) for a tenant |
| POST | `/api/v2/SocialService/Skills` | `skills_create` | Workspace member | Create a skill |
| GET | `/api/v2/SocialService/Skills/Count` | `skills_read` | Workspace member | Count skills for a tenant |
| GET | `/api/v2/SocialService/Skills/{skillId}` | `skills_read` | Workspace member | Get a skill by ID |
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
| GET | `/api/v2/SocialService/SocialGroups` |  | Workspace member | Get social groups |
| POST | `/api/v2/SocialService/SocialGroups` | `social_groups_create` | Workspace member | Create a social group |
| GET | `/api/v2/SocialService/SocialGroups/Count` |  | Workspace member | Count social groups |
| GET | `/api/v2/SocialService/SocialGroups/{socialGroupId}` |  | Workspace member | Get social group by ID |
| PUT | `/api/v2/SocialService/SocialGroups/{socialGroupId}` | `social_groups_update` | Workspace member | Update a social group |
| PATCH | `/api/v2/SocialService/SocialGroups/{socialGroupId}` | `social_groups_update` | Workspace member | Patch a social group |
| DELETE | `/api/v2/SocialService/SocialGroups/{socialGroupId}` | `social_groups_delete` | Workspace member | Delete a social group |

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
| GET | `/api/v2/SocialService/SocialProfiles` |  | Workspace member | Get Social Profiles |
| GET | `/api/v2/SocialService/SocialProfiles/Count` |  | Workspace member | Count Social Profiles |
| GET | `/api/v2/SocialService/SocialProfiles/{conversationId}/Messages` |  | Signed-in user | Get Messages |
| POST | `/api/v2/SocialService/SocialProfiles/{conversationId}/Messages` |  | Signed-in user | Create Message |
| GET | `/api/v2/SocialService/SocialProfiles/{conversationId}/Messages/Count` |  | Signed-in user | Count Messages |
| POST | `/api/v2/SocialService/SocialProfiles/{conversationId}/Messages/Read` |  | Signed-in user | Mark Conversation Read |
| PUT | `/api/v2/SocialService/SocialProfiles/{conversationId}/Messages/{messageId}` |  | Signed-in user | Update Message |
| DELETE | `/api/v2/SocialService/SocialProfiles/{conversationId}/Messages/{messageId}` |  | Signed-in user | Delete Message |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}` |  | Workspace member | Get Social Profile |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Conversations` |  | Signed-in user | Get Conversations |
| POST | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Conversations` |  | Signed-in user | Create Conversation |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Conversations/Count` |  | Signed-in user | Count Conversations |
| POST | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Conversations/Direct` |  | Signed-in user | Get or Create Direct Conversation |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Followers` |  | Workspace member | Get Followers |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Followers/Count` |  | Workspace member | Count Followers |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Followers/Profiles` |  | Workspace member | Get Follower Profiles |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Followers/Profiles/Count` |  | Workspace member | Count Follower Profiles |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Follows` |  | Workspace member | Get Follows |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Follows/Count` |  | Workspace member | Count Follows |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Follows/Profiles` |  | Workspace member | Get Followed Profiles |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Follows/Profiles/Count` |  | Workspace member | Count Followed Profiles |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Follows/{followedSocialProfileId}` |  | Workspace member | Check if Follow Exists |
| POST | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Follows/{followedSocialProfileId}` |  | Signed-in user | Follow |
| DELETE | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Follows/{followedSocialProfileId}` |  | Signed-in user | Unfollow |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/GroupEnrollments/Count` |  | Signed-in user | Count Group Enrollments |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Notifications` |  | Workspace member | Get Notifications |
| POST | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Notifications` | `notifications_create` | Workspace member | Create Notification |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Notifications/Count` |  | Workspace member | Count Notifications |
| GET | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Notifications/{notificationId}` |  | Workspace member | Get Notification |
| PUT | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Notifications/{notificationId}` | `notifications_update` | Workspace member | Mark Notification Read |
| POST | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Notifications/{notificationId}/Archive` | `notifications_read` | Workspace member | Archive Notification |
| POST | `/api/v2/SocialService/SocialProfiles/{socialProfileId}/Notifications/{notificationId}/Unarchive` | `notifications_read` | Workspace member | Unarchive Notification |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
