<!-- generated:start -->
# Activities service reference

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
