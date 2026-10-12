# Activities service

The Activities service lets you read and write the activity feeds of your workspace and classify each activity by type.

**Who uses it:** developers who record or display activity from other systems in a workspace.

**Base route:** `/api/v2/ActivitiesService/...`

## What you can do

- **Read activity feeds:** list the activity feeds of your workspace and count the activities they hold.
- **Record activities:** add, update and delete the activities in a feed.
- **Classify activities:** keep the activity types you use to label activities.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every call.
- **Permissions:** `activities_read`, `activities_create`, `activities_update` and `activities_delete`.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `ActivitiesService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## ActivityFeeds

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ActivitiesService/Activities/Count` | `activities_read` | Workspace member | Count activity records |
| GET | `/api/v2/ActivitiesService/ActivityFeeds` | `activities_read` | Workspace member | Get activity feeds |
| GET | `/api/v2/ActivitiesService/ActivityFeeds/Count` | `activities_read` | Workspace member | Count activity feeds |
| GET | `/api/v2/ActivitiesService/ActivityFeeds/{activityFeedId}` | `activities_read` | Workspace member | Get activity feed by ID |
| GET | `/api/v2/ActivitiesService/ActivityFeeds/{activityFeedId}/Activities` | `activities_read` | Workspace member | Get activities |
| POST | `/api/v2/ActivitiesService/ActivityFeeds/{activityFeedId}/Activities` | `activities_create` | Workspace member | Create an activity |
| GET | `/api/v2/ActivitiesService/ActivityFeeds/{activityFeedId}/Activities/Count` | `activities_read` | Workspace member | Count activities |
| GET | `/api/v2/ActivitiesService/ActivityFeeds/{activityFeedId}/Activities/{activityId}` | `activities_read` | Workspace member | Get activity by ID |
| PUT | `/api/v2/ActivitiesService/ActivityFeeds/{activityFeedId}/Activities/{activityId}` | `activities_update` | Workspace member | Update an activity |
| PATCH | `/api/v2/ActivitiesService/ActivityFeeds/{activityFeedId}/Activities/{activityId}` | `activities_update` | Workspace member | Patch an activity |
| DELETE | `/api/v2/ActivitiesService/ActivityFeeds/{activityFeedId}/Activities/{activityId}` | `activities_delete` | Workspace member | Delete an activity |
| GET | `/api/v2/ActivitiesService/ActivityTypes` | `activities_read` | Workspace member | Get Activity Types |
| POST | `/api/v2/ActivitiesService/ActivityTypes` | `activities_create` | Workspace member | Create Activity Type |
| GET | `/api/v2/ActivitiesService/ActivityTypes/Count` | `activities_read` | Workspace member | Count Activity Types |
| GET | `/api/v2/ActivitiesService/ActivityTypes/{activityTypeId}` | `activities_read` | Workspace member | Get Activity Type |
| PUT | `/api/v2/ActivitiesService/ActivityTypes/{activityTypeId}` | `activities_update` | Workspace member | Update Activity Type |
| PATCH | `/api/v2/ActivitiesService/ActivityTypes/{activityTypeId}` | `activities_update` | Workspace member | Patch an activity type |
| DELETE | `/api/v2/ActivitiesService/ActivityTypes/{activityTypeId}` | `activities_delete` | Workspace member | Delete Activity Type |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
