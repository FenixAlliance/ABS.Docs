# Projects service

The Projects service lets you plan projects, break them into tasks, and record and approve the hours your team works on them.

**Who uses it:** developers who connect project tools, timesheets or client portals to a workspace.

**Base route:** `/api/v2/ProjectsService/...`

## What you can do

- **Plan projects:** create and update projects and split each one into periods. See [Operations](~/Capabilities/Operations.md).
- **Manage tasks:** create, update and delete tasks, inside a project or across all your projects. Project tasks are separate from your workspace tasks. The tasks in your Tasks inbox, including the ones workflows create, are managed through the tasks calls of the [System service](System.md).
- **Classify tasks:** keep task categories, and the task types within each category.
- **Log time:** record time logs, and list them for a project, for the contact responsible for them, or for the contact who created them.
- **Approve hours:** request approval for logged project hours, change who approves them, and update the approval status.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every call.
- **Permissions:** `projects_read`, `projects_create`, `projects_update` and `projects_delete` for projects, periods, tasks and task categories and types; `time_logs_read`, `time_logs_create`, `time_logs_update` and `time_logs_delete` for time logs and hours approval. Listing the time logs inside one project (`Projects/{projectId}/TimeLogs`) needs `projects_read`, not `time_logs_read`.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `ProjectsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## ProjectTasks

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ProjectsService/ProjectTasks` | `projects_read` | Workspace member | Get all project tasks |
| POST | `/api/v2/ProjectsService/ProjectTasks` | `projects_create` | Workspace member | Create a project task |
| GET | `/api/v2/ProjectsService/ProjectTasks/Count` | `projects_read` | Workspace member | Get project tasks count |
| GET | `/api/v2/ProjectsService/ProjectTasks/{projectTaskId}` | `projects_read` | Workspace member | Get project task by ID |
| PUT | `/api/v2/ProjectsService/ProjectTasks/{projectTaskId}` | `projects_update` | Workspace member | Update a project task |
| PATCH | `/api/v2/ProjectsService/ProjectTasks/{projectTaskId}` | `projects_update` | Workspace member | Patch a project task |
| DELETE | `/api/v2/ProjectsService/ProjectTasks/{projectTaskId}` | `projects_delete` | Workspace member | Delete a project task |

## Projects

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ProjectsService/Projects` | `projects_read` | Workspace member | Retrieves all projects |
| POST | `/api/v2/ProjectsService/Projects` | `projects_create` | Workspace member | Creates a new project |
| GET | `/api/v2/ProjectsService/Projects/Count` | `projects_read` | Workspace member | Counts projects |
| GET | `/api/v2/ProjectsService/Projects/{projectId}` | `projects_read` | Workspace member | Gets a project by ID |
| PUT | `/api/v2/ProjectsService/Projects/{projectId}` | `projects_update` | Workspace member | Updates a project |
| PATCH | `/api/v2/ProjectsService/Projects/{projectId}` | `projects_update` | Workspace member | Patches a project |
| DELETE | `/api/v2/ProjectsService/Projects/{projectId}` | `projects_delete` | Workspace member | Deletes a project |
| GET | `/api/v2/ProjectsService/Projects/{projectId}/Periods` | `projects_read` | Workspace member | Retrieves project periods |
| POST | `/api/v2/ProjectsService/Projects/{projectId}/Periods` | `projects_create` | Workspace member | Creates a project period |
| PUT | `/api/v2/ProjectsService/Projects/{projectId}/Periods/{projectPeriodId}` | `projects_update` | Workspace member | Updates a project period |
| PATCH | `/api/v2/ProjectsService/Projects/{projectId}/Periods/{projectPeriodId}` | `projects_update` | Workspace member | Patches a project period |
| DELETE | `/api/v2/ProjectsService/Projects/{projectId}/Periods/{projectPeriodId}` | `projects_delete` | Workspace member | Deletes a project period |
| GET | `/api/v2/ProjectsService/Projects/{projectId}/TaskCategories` | `projects_read` | Workspace member | Retrieves project task categories |
| GET | `/api/v2/ProjectsService/Projects/{projectId}/TaskCategories/Count` | `projects_read` | Workspace member | Counts project task categories |
| GET | `/api/v2/ProjectsService/Projects/{projectId}/Tasks` | `projects_read` | Workspace member | Retrieves project tasks |
| POST | `/api/v2/ProjectsService/Projects/{projectId}/Tasks` | `projects_create` | Workspace member | Creates a project task |
| GET | `/api/v2/ProjectsService/Projects/{projectId}/Tasks/Count` | `projects_read` | Workspace member | Counts project tasks |
| PUT | `/api/v2/ProjectsService/Projects/{projectId}/Tasks/{projectTaskId}` | `projects_update` | Workspace member | Updates a project task |
| PATCH | `/api/v2/ProjectsService/Projects/{projectId}/Tasks/{projectTaskId}` | `projects_update` | Workspace member | Patches a project task |
| DELETE | `/api/v2/ProjectsService/Projects/{projectId}/Tasks/{projectTaskId}` | `projects_delete` | Workspace member | Deletes a project task |
| GET | `/api/v2/ProjectsService/Projects/{projectId}/TimeLogs` | `projects_read` | Workspace member | Retrieves project time logs |
| GET | `/api/v2/ProjectsService/Projects/{projectId}/TimeLogs/Count` | `projects_read` | Workspace member | Counts project time logs |

## TaskCategories

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ProjectsService/TaskCategories` | `projects_read` | Workspace member | Retrieves all task categories |
| POST | `/api/v2/ProjectsService/TaskCategories` | `projects_create` | Workspace member | Creates a new task category |
| GET | `/api/v2/ProjectsService/TaskCategories/Count` | `projects_read` | Workspace member | Counts task categories |
| GET | `/api/v2/ProjectsService/TaskCategories/{taskCategoryId}` | `projects_read` | Workspace member | Gets a task category by ID |
| PUT | `/api/v2/ProjectsService/TaskCategories/{taskCategoryId}` | `projects_update` | Workspace member | Updates a task category |
| PATCH | `/api/v2/ProjectsService/TaskCategories/{taskCategoryId}` | `projects_update` | Workspace member | Patches a task category |
| DELETE | `/api/v2/ProjectsService/TaskCategories/{taskCategoryId}` | `projects_delete` | Workspace member | Deletes a task category |
| GET | `/api/v2/ProjectsService/TaskCategories/{taskCategoryId}/Types` | `projects_read` | Workspace member | Retrieves task types for a category |

## TaskTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/ProjectsService/TaskTypes` | `projects_create` | Workspace member | Creates a new task type |
| GET | `/api/v2/ProjectsService/TaskTypes/{taskTypeId}` | `projects_read` | Workspace member | Gets a task type by ID |
| PUT | `/api/v2/ProjectsService/TaskTypes/{taskTypeId}` | `projects_update` | Workspace member | Updates a task type |
| PATCH | `/api/v2/ProjectsService/TaskTypes/{taskTypeId}` | `projects_update` | Workspace member | Patches a task type |
| DELETE | `/api/v2/ProjectsService/TaskTypes/{taskTypeId}` | `projects_delete` | Workspace member | Deletes a task type |

## TimeLogApprovals

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/ProjectsService/TimeLogApprovals` | `time_logs_create` | Workspace member | Request project hours approval |
| PUT | `/api/v2/ProjectsService/TimeLogApprovals/{approvalId}/Approver` | `time_logs_update` | Workspace member | Update approval approver |
| PUT | `/api/v2/ProjectsService/TimeLogApprovals/{approvalId}/Status` | `time_logs_update` | Workspace member | Update approval status |

## TimeLogs

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ProjectsService/TimeLogs` | `time_logs_read` | Workspace member | Retrieve project period time logs |
| POST | `/api/v2/ProjectsService/TimeLogs` | `time_logs_create` | Workspace member | Create a new project time log |
| GET | `/api/v2/ProjectsService/TimeLogs/ByResponsibleContact` | `time_logs_read` | Workspace member | Retrieve time logs by responsible contact |
| GET | `/api/v2/ProjectsService/TimeLogs/Count` | `time_logs_read` | Workspace member | Get the count of project period time logs |
| GET | `/api/v2/ProjectsService/TimeLogs/CreatedByContact` | `time_logs_read` | Workspace member | Retrieve time logs created by a contact |
| GET | `/api/v2/ProjectsService/TimeLogs/ForProject/{projectId}` | `time_logs_read` | Workspace member | Retrieve time logs for a project |
| GET | `/api/v2/ProjectsService/TimeLogs/{timeLogId}` | `time_logs_read` | Workspace member | Retrieve a project time log by ID |
| PUT | `/api/v2/ProjectsService/TimeLogs/{timeLogId}` | `time_logs_update` | Workspace member | Update a project time log |
| PATCH | `/api/v2/ProjectsService/TimeLogs/{timeLogId}` | `time_logs_update` | Workspace member | Patch a project time log |
| DELETE | `/api/v2/ProjectsService/TimeLogs/{timeLogId}` | `time_logs_delete` | Workspace member | Delete a project time log |

Generated from the source at commit 642fb3c3ad.
<!-- generated:end -->
