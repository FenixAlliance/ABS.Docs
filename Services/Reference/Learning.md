# Learning service

The Learning service lets you build and run courses, manage the people who teach and take them, and show learners their own courses and certificates.

**Who uses it:** developers who connect a learning portal, a course catalog or a student app to a workspace.

**Base route:** `/api/v2/LearningService/...`

## What you can do

- **Build courses:** create and update courses and their sections, units, pages, wikis and articles, libraries, handouts, files and assignments. See [Learning](~/Modules/Learning.md) and [Create and publish a course](~/Modules/Learning/Courses.md).
- **Organize your catalog:** group courses in categories and collections.
- **Manage people:** keep student and instructor profiles, enroll students, organize them in cohorts, and set up each course team. See [Students, instructors and enrollments](~/Modules/Learning/Students-and-instructors.md).
- **Publish a course catalog:** read the public courses without signing in, so a website can list what you teach. To charge for a course, see [Sell courses](~/Modules/Learning/Selling-courses.md).
- **Recognize completion:** design certificate templates and issue completion certificates.
- **Keep learners informed:** post course updates and run course forums.
- **Show learners their own work:** list the signed-in user's courses, enrollments and certificates, check whether they are enrolled in a course, and read the assignments of a course they take.

Grading and quizzes are planned; see the [roadmap](~/get-started/Roadmap.md).

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call. The public course calls need neither a token nor a workspace, and the calls under `Me` need only a signed-in user.
- **Permissions:** `courses_read`, `courses_create`, `courses_update` and `courses_delete`. Where the table shows "Checked by the service", the service decides per record, so a workspace member or a learner enrolled in the course can read it.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `LearningService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## CourseArticles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseArticles` |  | Workspace member | Get all course articles |
| POST | `/api/v2/LearningService/CourseArticles` | `courses_create` | Workspace member | Create a new course article |
| GET | `/api/v2/LearningService/CourseArticles/Count` |  | Workspace member | Get course articles count |
| GET | `/api/v2/LearningService/CourseArticles/{articleId}` |  | Checked by the service | Get course article by ID |
| PUT | `/api/v2/LearningService/CourseArticles/{articleId}` | `courses_update` | Workspace member | Update a course article |
| PATCH | `/api/v2/LearningService/CourseArticles/{articleId}` | `courses_update` | Workspace member | Patch a course article |
| DELETE | `/api/v2/LearningService/CourseArticles/{articleId}` | `courses_delete` | Workspace member | Delete a course article |

## CourseAssignmentComponents

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseAssignmentComponents` |  | Workspace member | Get all course assignment components |
| POST | `/api/v2/LearningService/CourseAssignmentComponents` | `courses_create` | Workspace member | Create a course assignment component |
| GET | `/api/v2/LearningService/CourseAssignmentComponents/Count` |  | Workspace member | Get course assignment components count |
| GET | `/api/v2/LearningService/CourseAssignmentComponents/{componentId}` |  | Checked by the service | Get course assignment component by ID |
| PUT | `/api/v2/LearningService/CourseAssignmentComponents/{componentId}` | `courses_update` | Workspace member | Update a course assignment component |
| PATCH | `/api/v2/LearningService/CourseAssignmentComponents/{componentId}` | `courses_update` | Workspace member | Patch a course assignment component |
| DELETE | `/api/v2/LearningService/CourseAssignmentComponents/{componentId}` | `courses_delete` | Workspace member | Delete a course assignment component |

## CourseAssignmentTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseAssignmentTypes` |  | Workspace member | Get all course assignment types |
| POST | `/api/v2/LearningService/CourseAssignmentTypes` | `courses_create` | Workspace member | Create a course assignment type |
| GET | `/api/v2/LearningService/CourseAssignmentTypes/Count` |  | Workspace member | Get course assignment types count |
| GET | `/api/v2/LearningService/CourseAssignmentTypes/{assignmentTypeId}` |  | Checked by the service | Get course assignment type by ID |
| PUT | `/api/v2/LearningService/CourseAssignmentTypes/{assignmentTypeId}` | `courses_update` | Workspace member | Update a course assignment type |
| PATCH | `/api/v2/LearningService/CourseAssignmentTypes/{assignmentTypeId}` | `courses_update` | Workspace member | Patch a course assignment type |
| DELETE | `/api/v2/LearningService/CourseAssignmentTypes/{assignmentTypeId}` | `courses_delete` | Workspace member | Delete a course assignment type |

## CourseAssignments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseAssignments` |  | Workspace member | Get all course assignments |
| POST | `/api/v2/LearningService/CourseAssignments` | `courses_create` | Workspace member | Create a new course assignment |
| GET | `/api/v2/LearningService/CourseAssignments/Count` |  | Workspace member | Get course assignments count |
| GET | `/api/v2/LearningService/CourseAssignments/{assignmentId}` | `courses_read` | Workspace member | Get course assignment by ID |
| PUT | `/api/v2/LearningService/CourseAssignments/{assignmentId}` | `courses_update` | Workspace member | Update a course assignment |
| PATCH | `/api/v2/LearningService/CourseAssignments/{assignmentId}` | `courses_update` | Workspace member | Patch a course assignment |
| DELETE | `/api/v2/LearningService/CourseAssignments/{assignmentId}` | `courses_delete` | Workspace member | Delete a course assignment |

## CourseCategories

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseCategories` |  | Workspace member | Get all course categories |
| POST | `/api/v2/LearningService/CourseCategories` | `courses_create` | Workspace member | Create a new course category |
| GET | `/api/v2/LearningService/CourseCategories/Count` |  | Workspace member | Get course categories count |
| GET | `/api/v2/LearningService/CourseCategories/{categoryId}` |  | Checked by the service | Get course category by ID |
| PUT | `/api/v2/LearningService/CourseCategories/{categoryId}` | `courses_update` | Workspace member | Update a course category |
| PATCH | `/api/v2/LearningService/CourseCategories/{categoryId}` | `courses_update` | Workspace member | Patch a course category |
| DELETE | `/api/v2/LearningService/CourseCategories/{categoryId}` | `courses_delete` | Workspace member | Delete a course category |

## CourseCertificates

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseCertificates` |  | Workspace member | Get all course certificates |
| POST | `/api/v2/LearningService/CourseCertificates` | `courses_create` | Workspace member | Create a course certificate |
| GET | `/api/v2/LearningService/CourseCertificates/Count` |  | Workspace member | Get course certificates count |
| GET | `/api/v2/LearningService/CourseCertificates/Template` |  | Workspace member | Get all certificate templates |
| POST | `/api/v2/LearningService/CourseCertificates/Template` | `courses_create` | Workspace member | Create a certificate template |
| GET | `/api/v2/LearningService/CourseCertificates/Template/{courseCertificateTemplateId}` | `courses_read` | Workspace member | Get certificate template by ID |
| PATCH | `/api/v2/LearningService/CourseCertificates/Template/{courseCertificateTemplateId}` | `courses_update` | Workspace member | Patch a certificate template |
| DELETE | `/api/v2/LearningService/CourseCertificates/Template/{courseCertificateTemplateId}` | `courses_delete` | Workspace member | Delete a certificate template |
| GET | `/api/v2/LearningService/CourseCertificates/{courseCertificateId}` | `courses_read` | Workspace member | Get course certificate by ID |
| PUT | `/api/v2/LearningService/CourseCertificates/{courseCertificateId}` | `courses_update` | Workspace member | Update a course certificate |
| PATCH | `/api/v2/LearningService/CourseCertificates/{courseCertificateId}` | `courses_update` | Workspace member | Patch a course certificate |
| DELETE | `/api/v2/LearningService/CourseCertificates/{courseCertificateId}` | `courses_delete` | Workspace member | Delete a course certificate |

## CourseCohorts

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseCohorts` |  | Workspace member | Get all course cohorts |
| POST | `/api/v2/LearningService/CourseCohorts` | `courses_create` | Workspace member | Create a new course cohort |
| GET | `/api/v2/LearningService/CourseCohorts/Count` |  | Workspace member | Get course cohorts count |
| GET | `/api/v2/LearningService/CourseCohorts/{cohortId}` |  | Checked by the service | Get course cohort by ID |
| PUT | `/api/v2/LearningService/CourseCohorts/{cohortId}` | `courses_update` | Workspace member | Update a course cohort |
| PATCH | `/api/v2/LearningService/CourseCohorts/{cohortId}` | `courses_update` | Workspace member | Patch a course cohort |
| DELETE | `/api/v2/LearningService/CourseCohorts/{cohortId}` | `courses_delete` | Workspace member | Delete a course cohort |

## CourseCollections

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseCollections` | `courses_read` | Workspace member | Get all course collections |
| POST | `/api/v2/LearningService/CourseCollections` | `courses_create` | Workspace member | Create a new course collection |
| GET | `/api/v2/LearningService/CourseCollections/Count` | `courses_read` | Workspace member | Get course collections count |
| GET | `/api/v2/LearningService/CourseCollections/{collectionId}` | `courses_read` | Workspace member | Get course collection by ID |
| PUT | `/api/v2/LearningService/CourseCollections/{collectionId}` | `courses_update` | Workspace member | Update a course collection |
| DELETE | `/api/v2/LearningService/CourseCollections/{collectionId}` | `courses_delete` | Workspace member | Delete a course collection |

## CourseContentGroups

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseContentGroups` |  | Workspace member | Get all course content groups |
| POST | `/api/v2/LearningService/CourseContentGroups` | `courses_create` | Workspace member | Create a new course content group |
| GET | `/api/v2/LearningService/CourseContentGroups/Count` |  | Workspace member | Get course content groups count |
| GET | `/api/v2/LearningService/CourseContentGroups/{groupId}` |  | Checked by the service | Get course content group by ID |
| PUT | `/api/v2/LearningService/CourseContentGroups/{groupId}` | `courses_update` | Workspace member | Update a course content group |
| PATCH | `/api/v2/LearningService/CourseContentGroups/{groupId}` | `courses_update` | Workspace member | Patch a course content group |
| DELETE | `/api/v2/LearningService/CourseContentGroups/{groupId}` | `courses_delete` | Workspace member | Delete a course content group |
| GET | `/api/v2/LearningService/Courses/{courseId}/ContentGroups` |  | Checked by the service | Get course content groups by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/ContentGroups/Count` |  | Checked by the service | Get course content groups count by course |

## CourseEnrollments

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseEnrollments` |  | Workspace member | Get all course enrollments |
| POST | `/api/v2/LearningService/CourseEnrollments` | `courses_create` | Workspace member | Create a new course enrollment |
| GET | `/api/v2/LearningService/CourseEnrollments/Count` |  | Workspace member | Get course enrollments count |
| GET | `/api/v2/LearningService/CourseEnrollments/Student/{studentProfileId}` |  | Checked by the service | Get enrollments by student |
| GET | `/api/v2/LearningService/CourseEnrollments/{courseEnrollmentId}` | `courses_read` | Workspace member | Get course enrollment by ID |
| PUT | `/api/v2/LearningService/CourseEnrollments/{courseEnrollmentId}` | `courses_update` | Workspace member | Update a course enrollment |
| PATCH | `/api/v2/LearningService/CourseEnrollments/{courseEnrollmentId}` | `courses_update` | Workspace member | Patch a course enrollment |
| DELETE | `/api/v2/LearningService/CourseEnrollments/{courseEnrollmentId}` | `courses_delete` | Workspace member | Delete a course enrollment |

## CourseFiles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseFiles` |  | Workspace member | Get all course files |
| POST | `/api/v2/LearningService/CourseFiles` | `courses_create` | Workspace member | Create a new course file |
| GET | `/api/v2/LearningService/CourseFiles/Count` |  | Workspace member | Get course files count |
| GET | `/api/v2/LearningService/CourseFiles/{fileId}` |  | Checked by the service | Get course file by ID |
| PUT | `/api/v2/LearningService/CourseFiles/{fileId}` | `courses_update` | Workspace member | Update a course file |
| PATCH | `/api/v2/LearningService/CourseFiles/{fileId}` | `courses_update` | Workspace member | Patch a course file |
| DELETE | `/api/v2/LearningService/CourseFiles/{fileId}` | `courses_delete` | Workspace member | Delete a course file |

## CourseForums

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseForums` |  | Workspace member | Get all course forums |
| POST | `/api/v2/LearningService/CourseForums` | `courses_create` | Workspace member | Create a course forum |
| GET | `/api/v2/LearningService/CourseForums/Count` |  | Workspace member | Get course forums count |
| GET | `/api/v2/LearningService/CourseForums/{forumId}` |  | Checked by the service | Get course forum by ID |
| PUT | `/api/v2/LearningService/CourseForums/{forumId}` | `courses_update` | Workspace member | Update a course forum |
| PATCH | `/api/v2/LearningService/CourseForums/{forumId}` | `courses_update` | Workspace member | Patch a course forum |
| DELETE | `/api/v2/LearningService/CourseForums/{forumId}` | `courses_delete` | Workspace member | Delete a course forum |

## CourseGradingRubrics

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseGradingRubrics` |  | Workspace member | Get all course grading rubrics |
| POST | `/api/v2/LearningService/CourseGradingRubrics` | `courses_create` | Workspace member | Create a course grading rubric |
| GET | `/api/v2/LearningService/CourseGradingRubrics/Count` |  | Workspace member | Get course grading rubrics count |
| GET | `/api/v2/LearningService/CourseGradingRubrics/{rubricId}` | `courses_read` | Workspace member | Get course grading rubric by ID |
| PUT | `/api/v2/LearningService/CourseGradingRubrics/{rubricId}` | `courses_update` | Workspace member | Update a course grading rubric |
| PATCH | `/api/v2/LearningService/CourseGradingRubrics/{rubricId}` | `courses_update` | Workspace member | Patch a course grading rubric |
| DELETE | `/api/v2/LearningService/CourseGradingRubrics/{rubricId}` | `courses_delete` | Workspace member | Delete a course grading rubric |

## CourseHandouts

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseHandouts` |  | Workspace member | Get all course handouts |
| POST | `/api/v2/LearningService/CourseHandouts` | `courses_create` | Workspace member | Create a course handout |
| GET | `/api/v2/LearningService/CourseHandouts/Count` |  | Workspace member | Get course handouts count |
| GET | `/api/v2/LearningService/CourseHandouts/{handoutId}` |  | Checked by the service | Get course handout by ID |
| PUT | `/api/v2/LearningService/CourseHandouts/{handoutId}` | `courses_update` | Workspace member | Update a course handout |
| PATCH | `/api/v2/LearningService/CourseHandouts/{handoutId}` | `courses_update` | Workspace member | Patch a course handout |
| DELETE | `/api/v2/LearningService/CourseHandouts/{handoutId}` | `courses_delete` | Workspace member | Delete a course handout |

## CourseLibraries

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseLibraries` |  | Workspace member | Get all course libraries |
| POST | `/api/v2/LearningService/CourseLibraries` | `courses_create` | Workspace member | Create a course library |
| GET | `/api/v2/LearningService/CourseLibraries/Count` |  | Workspace member | Get course libraries count |
| GET | `/api/v2/LearningService/CourseLibraries/{libraryId}` |  | Checked by the service | Get course library by ID |
| PUT | `/api/v2/LearningService/CourseLibraries/{libraryId}` | `courses_update` | Workspace member | Update a course library |
| PATCH | `/api/v2/LearningService/CourseLibraries/{libraryId}` | `courses_update` | Workspace member | Patch a course library |
| DELETE | `/api/v2/LearningService/CourseLibraries/{libraryId}` | `courses_delete` | Workspace member | Delete a course library |

## CoursePages

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CoursePages` |  | Workspace member | Get all course pages |
| POST | `/api/v2/LearningService/CoursePages` | `courses_create` | Workspace member | Create a new course page |
| GET | `/api/v2/LearningService/CoursePages/Count` |  | Workspace member | Get course pages count |
| GET | `/api/v2/LearningService/CoursePages/{pageId}` |  | Checked by the service | Get course page by ID |
| PUT | `/api/v2/LearningService/CoursePages/{pageId}` | `courses_update` | Workspace member | Update a course page |
| PATCH | `/api/v2/LearningService/CoursePages/{pageId}` | `courses_update` | Workspace member | Patch a course page |
| DELETE | `/api/v2/LearningService/CoursePages/{pageId}` | `courses_delete` | Workspace member | Delete a course page |

## CourseProblemSets

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseProblemSets` |  | Workspace member | Get all course problem sets |
| POST | `/api/v2/LearningService/CourseProblemSets` | `courses_create` | Workspace member | Create a new course problem set |
| GET | `/api/v2/LearningService/CourseProblemSets/Count` |  | Workspace member | Get course problem sets count |
| GET | `/api/v2/LearningService/CourseProblemSets/{problemSetId}` | `courses_read` | Workspace member | Get course problem set by ID |
| PUT | `/api/v2/LearningService/CourseProblemSets/{problemSetId}` | `courses_update` | Workspace member | Update a course problem set |
| PATCH | `/api/v2/LearningService/CourseProblemSets/{problemSetId}` | `courses_update` | Workspace member | Patch a course problem set |
| DELETE | `/api/v2/LearningService/CourseProblemSets/{problemSetId}` | `courses_delete` | Workspace member | Delete a course problem set |

## CourseSections

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseSections` |  | Workspace member | Get all course sections |
| POST | `/api/v2/LearningService/CourseSections` | `courses_create` | Workspace member | Create a new course section |
| GET | `/api/v2/LearningService/CourseSections/Count` |  | Workspace member | Get course sections count |
| GET | `/api/v2/LearningService/CourseSections/{sectionId}` |  | Checked by the service | Get course section by ID |
| PUT | `/api/v2/LearningService/CourseSections/{sectionId}` | `courses_update` | Workspace member | Update a course section |
| PATCH | `/api/v2/LearningService/CourseSections/{sectionId}` | `courses_update` | Workspace member | Patch a course section |
| DELETE | `/api/v2/LearningService/CourseSections/{sectionId}` | `courses_delete` | Workspace member | Delete a course section |

## CourseTeamMemberships

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseTeamMemberships` |  | Workspace member | Get all course team memberships |
| POST | `/api/v2/LearningService/CourseTeamMemberships` | `courses_create` | Workspace member | Create a course team membership |
| GET | `/api/v2/LearningService/CourseTeamMemberships/Count` |  | Workspace member | Get course team memberships count |
| GET | `/api/v2/LearningService/CourseTeamMemberships/{membershipId}` | `courses_read` | Workspace member | Get course team membership by ID |
| PUT | `/api/v2/LearningService/CourseTeamMemberships/{membershipId}` | `courses_update` | Workspace member | Update a course team membership |
| PATCH | `/api/v2/LearningService/CourseTeamMemberships/{membershipId}` | `courses_update` | Workspace member | Patch a course team membership |
| DELETE | `/api/v2/LearningService/CourseTeamMemberships/{membershipId}` | `courses_delete` | Workspace member | Delete a course team membership |

## CourseUnitComponents

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseUnitComponents` |  | Workspace member | Get all course unit components |
| POST | `/api/v2/LearningService/CourseUnitComponents` | `courses_create` | Workspace member | Create a new course unit component |
| GET | `/api/v2/LearningService/CourseUnitComponents/Count` |  | Workspace member | Get course unit components count |
| GET | `/api/v2/LearningService/CourseUnitComponents/{componentId}` |  | Checked by the service | Get course unit component by ID |
| PUT | `/api/v2/LearningService/CourseUnitComponents/{componentId}` | `courses_update` | Workspace member | Update a course unit component |
| PATCH | `/api/v2/LearningService/CourseUnitComponents/{componentId}` | `courses_update` | Workspace member | Patch a course unit component |
| DELETE | `/api/v2/LearningService/CourseUnitComponents/{componentId}` | `courses_delete` | Workspace member | Delete a course unit component |

## CourseUnits

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseUnits` |  | Workspace member | Get all course units |
| POST | `/api/v2/LearningService/CourseUnits` | `courses_create` | Workspace member | Create a new course unit |
| GET | `/api/v2/LearningService/CourseUnits/Count` |  | Workspace member | Get course units count |
| GET | `/api/v2/LearningService/CourseUnits/{unitId}` |  | Checked by the service | Get course unit by ID |
| PUT | `/api/v2/LearningService/CourseUnits/{unitId}` | `courses_update` | Workspace member | Update a course unit |
| PATCH | `/api/v2/LearningService/CourseUnits/{unitId}` | `courses_update` | Workspace member | Patch a course unit |
| DELETE | `/api/v2/LearningService/CourseUnits/{unitId}` | `courses_delete` | Workspace member | Delete a course unit |

## CourseUpdates

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseUpdates` |  | Workspace member | Get all course updates |
| POST | `/api/v2/LearningService/CourseUpdates` | `courses_create` | Workspace member | Create a new course update |
| GET | `/api/v2/LearningService/CourseUpdates/Count` |  | Workspace member | Get course updates count |
| GET | `/api/v2/LearningService/CourseUpdates/{updateId}` |  | Checked by the service | Get course update by ID |
| PUT | `/api/v2/LearningService/CourseUpdates/{updateId}` | `courses_update` | Workspace member | Update a course update |
| PATCH | `/api/v2/LearningService/CourseUpdates/{updateId}` | `courses_update` | Workspace member | Patch a course update |
| DELETE | `/api/v2/LearningService/CourseUpdates/{updateId}` | `courses_delete` | Workspace member | Delete a course update |

## CourseWikis

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/CourseWikis` |  | Workspace member | Get all course wikis |
| POST | `/api/v2/LearningService/CourseWikis` | `courses_create` | Workspace member | Create a new course wiki |
| GET | `/api/v2/LearningService/CourseWikis/Count` |  | Workspace member | Get course wikis count |
| GET | `/api/v2/LearningService/CourseWikis/{wikiId}` |  | Checked by the service | Get course wiki by ID |
| PUT | `/api/v2/LearningService/CourseWikis/{wikiId}` | `courses_update` | Workspace member | Update a course wiki |
| PATCH | `/api/v2/LearningService/CourseWikis/{wikiId}` | `courses_update` | Workspace member | Patch a course wiki |
| DELETE | `/api/v2/LearningService/CourseWikis/{wikiId}` | `courses_delete` | Workspace member | Delete a course wiki |

## Courses

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/Courses` |  | Checked by the service | Get courses |
| POST | `/api/v2/LearningService/Courses` | `courses_create` | Workspace member | Create a new course |
| GET | `/api/v2/LearningService/Courses/Count` |  | Checked by the service | Get courses count |
| GET | `/api/v2/LearningService/Courses/Public` |  | Public | Get public courses |
| GET | `/api/v2/LearningService/Courses/Public/Count` |  | Public | Count public courses |
| GET | `/api/v2/LearningService/Courses/Public/{courseId}` |  | Public | Get public course by ID |
| GET | `/api/v2/LearningService/Courses/{courseId}` |  | Checked by the service | Get course by ID |
| PUT | `/api/v2/LearningService/Courses/{courseId}` | `courses_update` | Workspace member | Update a course |
| PATCH | `/api/v2/LearningService/Courses/{courseId}` | `courses_update` | Workspace member | Patch a course |
| DELETE | `/api/v2/LearningService/Courses/{courseId}` | `courses_delete` | Workspace member | Delete a course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Articles/{wikiId}` |  | Checked by the service | Get course articles by course wiki |
| GET | `/api/v2/LearningService/Courses/{courseId}/Articles/{wikiId}/Count` |  | Checked by the service | Get course articles by course wiki count |
| GET | `/api/v2/LearningService/Courses/{courseId}/Assignments` |  | Checked by the service | Get course assignments by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Assignments/Count` |  | Checked by the service | Get course assignments by course count |
| GET | `/api/v2/LearningService/Courses/{courseId}/Categories` |  | Checked by the service | Get course categories by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Categories/Count` |  | Checked by the service | Get course categories by course count |
| GET | `/api/v2/LearningService/Courses/{courseId}/Cohorts` |  | Checked by the service | Get course cohorts by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Cohorts/Count` |  | Checked by the service | Get course cohorts by course count |
| GET | `/api/v2/LearningService/Courses/{courseId}/Enrollments` |  | Checked by the service | Get enrollments by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Files` |  | Checked by the service | Get course files by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Files/Count` |  | Checked by the service | Get course files by course count |
| GET | `/api/v2/LearningService/Courses/{courseId}/Forums` |  | Checked by the service | Get course forums by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Forums/Count` |  | Checked by the service | Get course forums by course count |
| GET | `/api/v2/LearningService/Courses/{courseId}/Handouts` |  | Checked by the service | Get course handouts by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Handouts/Count` |  | Checked by the service | Get course handouts by course count |
| GET | `/api/v2/LearningService/Courses/{courseId}/Instructors` |  | Checked by the service | Get instructor profiles by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Instructors/Count` |  | Checked by the service | Get instructor profiles by course count |
| GET | `/api/v2/LearningService/Courses/{courseId}/Libraries` |  | Checked by the service | Get course libraries by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Libraries/Count` |  | Checked by the service | Get course libraries by course count |
| GET | `/api/v2/LearningService/Courses/{courseId}/Pages` |  | Checked by the service | Get course pages by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Pages/Count` |  | Checked by the service | Get course pages by course count |
| GET | `/api/v2/LearningService/Courses/{courseId}/ProblemSets` |  | Checked by the service | Get course problem sets by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/ProblemSets/Count` |  | Checked by the service | Get course problem sets by course count |
| GET | `/api/v2/LearningService/Courses/{courseId}/Sections` |  | Checked by the service | Get course sections by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Sections/Count` |  | Checked by the service | Get course sections by course count |
| GET | `/api/v2/LearningService/Courses/{courseId}/Students` |  | Checked by the service | Get student profiles by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Students/Count` |  | Checked by the service | Get student profiles by course count |
| GET | `/api/v2/LearningService/Courses/{courseId}/UnitComponents` |  | Checked by the service | Get course unit components by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/UnitComponents/Count` |  | Checked by the service | Get course unit components by course count |
| GET | `/api/v2/LearningService/Courses/{courseId}/Units/{sectionId}` |  | Checked by the service | Get course units by section |
| GET | `/api/v2/LearningService/Courses/{courseId}/Units/{sectionId}/Count` |  | Checked by the service | Get course units by section count |
| GET | `/api/v2/LearningService/Courses/{courseId}/Updates` |  | Checked by the service | Get course updates by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Updates/Count` |  | Checked by the service | Get course updates by course count |
| GET | `/api/v2/LearningService/Courses/{courseId}/Wikis` |  | Checked by the service | Get course wikis by course |
| GET | `/api/v2/LearningService/Courses/{courseId}/Wikis/Count` |  | Checked by the service | Get course wikis by course count |

## InstructorProfiles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/InstructorProfiles` | `courses_read` | Workspace member |  |
| POST | `/api/v2/LearningService/InstructorProfiles` | `courses_create` | Workspace member |  |
| GET | `/api/v2/LearningService/InstructorProfiles/Count` | `courses_read` | Workspace member |  |
| GET | `/api/v2/LearningService/InstructorProfiles/{instructorProfileId}` | `courses_read` | Workspace member |  |
| PUT | `/api/v2/LearningService/InstructorProfiles/{instructorProfileId}` | `courses_update` | Workspace member |  |
| PATCH | `/api/v2/LearningService/InstructorProfiles/{instructorProfileId}` | `courses_update` | Workspace member |  |
| DELETE | `/api/v2/LearningService/InstructorProfiles/{instructorProfileId}` | `courses_delete` | Workspace member |  |

## Me

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/Me/Assignments/{courseAssignmentId}` |  | Signed-in user | Get one assignment of a course the current user is enrolled in |
| GET | `/api/v2/LearningService/Me/AverageScore` |  | Signed-in user | Get current user's average score |
| GET | `/api/v2/LearningService/Me/Certificates` |  | Signed-in user | Get current user's completion certificates |
| GET | `/api/v2/LearningService/Me/Certificates/Count` |  | Signed-in user | Get current user's certificates count |
| GET | `/api/v2/LearningService/Me/Certificates/{courseCertificateId}` |  | Signed-in user | Get one of the current user's completion certificates by ID |
| GET | `/api/v2/LearningService/Me/Courses` |  | Signed-in user | Get current user's enrolled courses |
| GET | `/api/v2/LearningService/Me/Courses/Count` |  | Signed-in user | Get current user's enrolled courses count |
| GET | `/api/v2/LearningService/Me/Courses/{courseId}/Enrollment` |  | Signed-in user | Get whether the current user is enrolled in a course |
| GET | `/api/v2/LearningService/Me/Enrollments` |  | Signed-in user | Get current user's course enrollments |
| GET | `/api/v2/LearningService/Me/Enrollments/Count` |  | Signed-in user | Get current user's enrollment count |
| GET | `/api/v2/LearningService/Me/HoursCompleted` |  | Signed-in user | Get current user's completed hours |
| GET | `/api/v2/LearningService/Me/InstructorCourses` |  | Signed-in user | Get current user's instructor courses |
| GET | `/api/v2/LearningService/Me/InstructorCourses/Count` |  | Signed-in user | Get current user's instructor courses count |
| GET | `/api/v2/LearningService/Me/InstructorProfiles` |  | Signed-in user | Get current user's instructor profiles |
| GET | `/api/v2/LearningService/Me/InstructorProfiles/Count` |  | Signed-in user | Get current user's instructor profiles count |
| GET | `/api/v2/LearningService/Me/PendingTasks` |  | Signed-in user | Get current user's pending task count |
| GET | `/api/v2/LearningService/Me/ProblemSets/{courseProblemSetId}` |  | Signed-in user | Get one problem set of a course the current user is enrolled in |
| GET | `/api/v2/LearningService/Me/StudentProfiles` |  | Signed-in user | Get current user's student profiles |
| GET | `/api/v2/LearningService/Me/StudentProfiles/Count` |  | Signed-in user | Get current user's student profiles count |

## StudentProfiles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/LearningService/StudentProfiles` | `courses_read` | Workspace member |  |
| POST | `/api/v2/LearningService/StudentProfiles` | `courses_create` | Workspace member |  |
| GET | `/api/v2/LearningService/StudentProfiles/Count` | `courses_read` | Workspace member |  |
| GET | `/api/v2/LearningService/StudentProfiles/{studentProfileId}` | `courses_read` | Workspace member |  |
| PUT | `/api/v2/LearningService/StudentProfiles/{studentProfileId}` | `courses_update` | Workspace member |  |
| PATCH | `/api/v2/LearningService/StudentProfiles/{studentProfileId}` | `courses_update` | Workspace member |  |
| DELETE | `/api/v2/LearningService/StudentProfiles/{studentProfileId}` | `courses_delete` | Workspace member |  |
| GET | `/api/v2/LearningService/StudentProfiles/{studentProfileId}/Average` | `courses_read` | Workspace member |  |
| GET | `/api/v2/LearningService/StudentProfiles/{studentProfileId}/HoursCompleted` |  | Signed-in user |  |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
