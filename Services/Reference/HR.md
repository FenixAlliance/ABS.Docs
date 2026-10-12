# Human resources service

The Human resources service lets you keep your workspace's people records, hire for open roles and gigs, and track time, leave, pay and appraisals.

**Who uses it:** developers who connect HR systems, careers sites, time clocks or payroll tools to a workspace.

**Base route:** `/api/v2/HrmsService/...`

## What you can do

- **Keep employee records:** create and update employees, employee types, employers and job titles, and manage the seats of a position: assign people, end an assignment, change its capacity or its department. See [Workforce](~/Capabilities/Workforce.md).
- **Hire for open roles:** create job offers, publish, fill or close them, and keep the job fields and required skills each one asks for. Record applicants and their applications, and move each application through your recruiting stages.
- **Publish a public job board:** read the published job offers without signing in, and publish or unpublish your employer profile.
- **Run gigs:** create a gig, publish it, accept a proposal, award it, and mark it completed or cancelled. Gig applications are kept with the gig they answer.
- **Track time and leave:** keep shifts, schedules and time intervals, record leave applications, and list the leave types you can apply for.
- **Keep pay and performance records:** keep salaries, payroll periods and payroll records, list appraisal workflows and stages, and record appraisal sessions. Payroll is kept as records: the service does not calculate pay or post payroll to your books.
- **Plan training:** list training programs and keep their courses and events.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call. The public job offer calls need neither a token nor a workspace.
- **Permissions:** each resource has its own read, create, update and delete permissions, for example `employees_read` and `employees_update`, or `job_offers_create`. Payroll periods and payroll records share `payrolls_read`, `payrolls_create`, `payrolls_update` and `payrolls_delete`; positions use `positions_read` and `positions_update`. The table below names the permission of every call.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `HrmsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## AppraisalStages

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/AppraisalStages` | `employee_appraisals_read` | Workspace member | Get appraisal stages |
| GET | `/api/v2/HrmsService/AppraisalStages/Count` | `employee_appraisals_read` | Workspace member | Count appraisal stages |

## AppraisalWorkflows

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/AppraisalWorkflows` | `employee_appraisals_read` | Workspace member | Get appraisal workflows |
| GET | `/api/v2/HrmsService/AppraisalWorkflows/Count` | `employee_appraisals_read` | Workspace member | Count appraisal workflows |

## EmployeeAppraisalSessions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/EmployeeAppraisalSessions` | `employee_appraisals_read` | Workspace member | Get employee appraisal sessions |
| POST | `/api/v2/HrmsService/EmployeeAppraisalSessions` | `employee_appraisals_create` | Workspace member | Create an employee appraisal session |
| GET | `/api/v2/HrmsService/EmployeeAppraisalSessions/Count` | `employee_appraisals_read` | Workspace member | Count employee appraisal sessions |
| GET | `/api/v2/HrmsService/EmployeeAppraisalSessions/{sessionId}` | `employee_appraisals_read` | Workspace member | Get employee appraisal session by ID |
| PUT | `/api/v2/HrmsService/EmployeeAppraisalSessions/{sessionId}` | `employee_appraisals_update` | Workspace member | Update an employee appraisal session |
| PATCH | `/api/v2/HrmsService/EmployeeAppraisalSessions/{sessionId}` | `employee_appraisals_update` | Workspace member | Patch an employee appraisal session |
| DELETE | `/api/v2/HrmsService/EmployeeAppraisalSessions/{sessionId}` | `employee_appraisals_delete` | Workspace member | Delete an employee appraisal session |

## EmployeeTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/EmployeeTypes` | `employee_types_read` | Workspace member | Get employee types |
| POST | `/api/v2/HrmsService/EmployeeTypes` | `employee_types_create` | Workspace member | Create an employee type |
| GET | `/api/v2/HrmsService/EmployeeTypes/Count` | `employee_types_read` | Workspace member | Count employee types |
| GET | `/api/v2/HrmsService/EmployeeTypes/{employeeTypeId}` | `employee_types_read` | Workspace member | Get employee type by ID |
| PUT | `/api/v2/HrmsService/EmployeeTypes/{employeeTypeId}` | `employee_types_update` | Workspace member | Update an employee type |
| PATCH | `/api/v2/HrmsService/EmployeeTypes/{employeeTypeId}` | `employee_types_update` | Workspace member | Patch an employee type |
| DELETE | `/api/v2/HrmsService/EmployeeTypes/{employeeTypeId}` | `employee_types_delete` | Workspace member | Delete an employee type |

## Employees

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/Employees` | `employees_read` | Workspace member | Get employees |
| POST | `/api/v2/HrmsService/Employees` | `employees_create` | Workspace member | Create an employee |
| GET | `/api/v2/HrmsService/Employees/Count` | `employees_read` | Workspace member | Count employees |
| GET | `/api/v2/HrmsService/Employees/{employeeId}` | `employees_read` | Workspace member | Get employee by ID |
| PUT | `/api/v2/HrmsService/Employees/{employeeId}` | `employees_update` | Workspace member | Update an employee |
| PATCH | `/api/v2/HrmsService/Employees/{employeeId}` | `employees_update` | Workspace member | Patch an employee |
| DELETE | `/api/v2/HrmsService/Employees/{employeeId}` | `employees_delete` | Workspace member | Delete an employee |

## Employers

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/Employers` | `employers_read` | Workspace member | Get employers |
| POST | `/api/v2/HrmsService/Employers` | `employers_create` | Workspace member | Create an employer |
| GET | `/api/v2/HrmsService/Employers/Count` | `employers_read` | Workspace member | Count employers |
| GET | `/api/v2/HrmsService/Employers/{employerId}` | `employers_read` | Workspace member | Get employer by ID |
| PUT | `/api/v2/HrmsService/Employers/{employerId}` | `employers_update` | Workspace member | Update an employer |
| PATCH | `/api/v2/HrmsService/Employers/{employerId}` | `employers_update` | Workspace member | Patch an employer |
| DELETE | `/api/v2/HrmsService/Employers/{employerId}` | `employers_delete` | Workspace member | Delete an employer |
| POST | `/api/v2/HrmsService/Employers/{employerId}/Publish` | `employers_update` | Workspace member | Publish an employer profile |
| POST | `/api/v2/HrmsService/Employers/{employerId}/Unpublish` | `employers_update` | Workspace member | Unpublish an employer profile |

## GigApplications

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/GigApplications` | `gig_applications_read` | Workspace member | Get gig applications submitted against the tenant's gigs |
| POST | `/api/v2/HrmsService/GigApplications` | `gig_applications_create` | Workspace member | Create a gig application |
| GET | `/api/v2/HrmsService/GigApplications/Count` | `gig_applications_read` | Workspace member | Count gig applications submitted against the tenant's gigs |
| GET | `/api/v2/HrmsService/GigApplications/{gigApplicationId}` | `gig_applications_read` | Workspace member | Get a gig application by ID |
| PUT | `/api/v2/HrmsService/GigApplications/{gigApplicationId}` | `gig_applications_update` | Workspace member | Update a gig application |
| PATCH | `/api/v2/HrmsService/GigApplications/{gigApplicationId}` | `gig_applications_update` | Workspace member | Patch a gig application |
| DELETE | `/api/v2/HrmsService/GigApplications/{gigApplicationId}` | `gig_applications_delete` | Workspace member | Delete a gig application |
| POST | `/api/v2/HrmsService/GigApplications/{gigApplicationId}/Accept` | `gig_applications_update` | Workspace member | Accept a gig proposal |

## Gigs

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/Gigs` | `gigs_read` | Workspace member | Get gigs |
| POST | `/api/v2/HrmsService/Gigs` | `gigs_create` | Workspace member | Create a gig |
| GET | `/api/v2/HrmsService/Gigs/Count` | `gigs_read` | Workspace member | Count gigs |
| GET | `/api/v2/HrmsService/Gigs/{gigId}` | `gigs_read` | Workspace member | Get gig by ID |
| PUT | `/api/v2/HrmsService/Gigs/{gigId}` | `gigs_update` | Workspace member | Update a gig |
| PATCH | `/api/v2/HrmsService/Gigs/{gigId}` | `gigs_update` | Workspace member | Patch a gig |
| DELETE | `/api/v2/HrmsService/Gigs/{gigId}` | `gigs_delete` | Workspace member | Delete a gig |
| POST | `/api/v2/HrmsService/Gigs/{gigId}/Award` | `gigs_update` | Workspace member | Award a gig |
| POST | `/api/v2/HrmsService/Gigs/{gigId}/Cancel` | `gigs_update` | Workspace member | Cancel a gig |
| POST | `/api/v2/HrmsService/Gigs/{gigId}/Complete` | `gigs_update` | Workspace member | Complete a gig |
| POST | `/api/v2/HrmsService/Gigs/{gigId}/Publish` | `gigs_update` | Workspace member | Publish a gig |

## JobApplicants

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/JobApplicants` | `job_applicants_read` | Workspace member | Get job applicants (candidates) for a tenant |
| POST | `/api/v2/HrmsService/JobApplicants` | `job_applicants_create` | Workspace member | Create a job applicant (candidate) profile |
| GET | `/api/v2/HrmsService/JobApplicants/Count` | `job_applicants_read` | Workspace member | Count job applicants for a tenant |
| GET | `/api/v2/HrmsService/JobApplicants/{jobApplicantId}` | `job_applicants_read` | Workspace member | Get a job applicant by ID |
| PUT | `/api/v2/HrmsService/JobApplicants/{jobApplicantId}` | `job_applicants_update` | Workspace member | Update a job applicant profile |
| PATCH | `/api/v2/HrmsService/JobApplicants/{jobApplicantId}` | `job_applicants_update` | Workspace member | Patch a job applicant profile |
| DELETE | `/api/v2/HrmsService/JobApplicants/{jobApplicantId}` | `job_applicants_delete` | Workspace member | Delete a job applicant profile |

## JobApplications

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/JobApplications` | `job_applications_read` | Workspace member | Get job-offer applications submitted against the tenant's postings |
| POST | `/api/v2/HrmsService/JobApplications` | `job_applications_create` | Workspace member | Create a job-offer application |
| GET | `/api/v2/HrmsService/JobApplications/Count` | `job_applications_read` | Workspace member | Count job-offer applications submitted against the tenant's postings |
| GET | `/api/v2/HrmsService/JobApplications/{jobApplicationId}` | `job_applications_read` | Workspace member | Get a job-offer application by ID |
| PUT | `/api/v2/HrmsService/JobApplications/{jobApplicationId}` | `job_applications_update` | Workspace member | Update a job-offer application |
| PATCH | `/api/v2/HrmsService/JobApplications/{jobApplicationId}` | `job_applications_update` | Workspace member | Patch a job-offer application |
| DELETE | `/api/v2/HrmsService/JobApplications/{jobApplicationId}` | `job_applications_delete` | Workspace member | Delete a job-offer application |
| POST | `/api/v2/HrmsService/JobApplications/{jobApplicationId}/Status` | `job_applications_update` | Workspace member | Move a job application through the recruiting funnel |

## JobFields

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/JobFields` | `job_fields_read` | Workspace member | Get job fields (role domains) for a tenant |
| POST | `/api/v2/HrmsService/JobFields` | `job_fields_create` | Workspace member | Create a job field |
| GET | `/api/v2/HrmsService/JobFields/Count` | `job_fields_read` | Workspace member | Count job fields for a tenant |
| GET | `/api/v2/HrmsService/JobFields/{jobFieldId}` | `job_fields_read` | Workspace member | Get a job field by ID |
| PUT | `/api/v2/HrmsService/JobFields/{jobFieldId}` | `job_fields_update` | Workspace member | Update a job field |
| PATCH | `/api/v2/HrmsService/JobFields/{jobFieldId}` | `job_fields_update` | Workspace member | Patch a job field |
| DELETE | `/api/v2/HrmsService/JobFields/{jobFieldId}` | `job_fields_delete` | Workspace member | Delete a job field |

## JobOfferFields

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/JobOfferFields` | `job_offer_fields_read` | Workspace member | Get job-offerfield link records for a tenant |
| POST | `/api/v2/HrmsService/JobOfferFields` | `job_offer_fields_create` | Workspace member | Create a job-offer field link record |
| GET | `/api/v2/HrmsService/JobOfferFields/Count` | `job_offer_fields_read` | Workspace member | Count job-offer field link records for a tenant |
| GET | `/api/v2/HrmsService/JobOfferFields/{jobOfferFieldId}` | `job_offer_fields_read` | Workspace member | Get a job-offer field link record by ID |
| PUT | `/api/v2/HrmsService/JobOfferFields/{jobOfferFieldId}` | `job_offer_fields_update` | Workspace member | Update a job-offer field link record |
| PATCH | `/api/v2/HrmsService/JobOfferFields/{jobOfferFieldId}` | `job_offer_fields_update` | Workspace member | Patch a job-offer field link record |
| DELETE | `/api/v2/HrmsService/JobOfferFields/{jobOfferFieldId}` | `job_offer_fields_delete` | Workspace member | Delete a job-offer field link record |

## JobOffers

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/JobOffers` | `job_offers_read` | Workspace member | Get job offers |
| POST | `/api/v2/HrmsService/JobOffers` | `job_offers_create` | Workspace member | Create a job offer |
| GET | `/api/v2/HrmsService/JobOffers/Count` | `job_offers_read` | Workspace member | Count job offers |
| GET | `/api/v2/HrmsService/JobOffers/Public` |  | Public | Get public job offers |
| GET | `/api/v2/HrmsService/JobOffers/Public/Count` |  | Public | Count public job offers |
| GET | `/api/v2/HrmsService/JobOffers/Public/{jobOfferId}` |  | Public | Get public job offer by ID |
| GET | `/api/v2/HrmsService/JobOffers/{jobOfferId}` | `job_offers_read` | Workspace member | Get job offer by ID |
| PUT | `/api/v2/HrmsService/JobOffers/{jobOfferId}` | `job_offers_update` | Workspace member | Update a job offer |
| PATCH | `/api/v2/HrmsService/JobOffers/{jobOfferId}` | `job_offers_update` | Workspace member | Patch a job offer |
| DELETE | `/api/v2/HrmsService/JobOffers/{jobOfferId}` | `job_offers_delete` | Workspace member | Delete a job offer |
| POST | `/api/v2/HrmsService/JobOffers/{jobOfferId}/Close` | `job_offers_update` | Workspace member | Close a job offer |
| POST | `/api/v2/HrmsService/JobOffers/{jobOfferId}/Fill` | `job_offers_update` | Workspace member | Mark a job offer filled |
| POST | `/api/v2/HrmsService/JobOffers/{jobOfferId}/Publish` | `job_offers_update` | Workspace member | Publish a job offer |

## JobTitles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/JobTitles` | `job_titles_read` | Workspace member | Get job titles |
| POST | `/api/v2/HrmsService/JobTitles` | `job_titles_create` | Workspace member | Create a job title |
| GET | `/api/v2/HrmsService/JobTitles/Count` | `job_titles_read` | Workspace member | Count job titles |
| GET | `/api/v2/HrmsService/JobTitles/{jobTitleId}` | `job_titles_read` | Workspace member | Get job title by ID |
| PUT | `/api/v2/HrmsService/JobTitles/{jobTitleId}` | `job_titles_update` | Workspace member | Update a job title |
| PATCH | `/api/v2/HrmsService/JobTitles/{jobTitleId}` | `job_titles_update` | Workspace member | Patch a job title |
| DELETE | `/api/v2/HrmsService/JobTitles/{jobTitleId}` | `job_titles_delete` | Workspace member | Delete a job title |

## LeaveApplications

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/LeaveApplications` | `leave_applications_read` | Workspace member | Get leave applications |
| POST | `/api/v2/HrmsService/LeaveApplications` | `leave_applications_create` | Workspace member | Create a leave application |
| GET | `/api/v2/HrmsService/LeaveApplications/Count` | `leave_applications_read` | Workspace member | Count leave applications |
| GET | `/api/v2/HrmsService/LeaveApplications/{leaveApplicationId}` | `leave_applications_read` | Workspace member | Get leave application by ID |
| PUT | `/api/v2/HrmsService/LeaveApplications/{leaveApplicationId}` | `leave_applications_update` | Workspace member | Update a leave application |
| PATCH | `/api/v2/HrmsService/LeaveApplications/{leaveApplicationId}` | `leave_applications_update` | Workspace member | Patch a leave application |
| DELETE | `/api/v2/HrmsService/LeaveApplications/{leaveApplicationId}` | `leave_applications_delete` | Workspace member | Delete a leave application |

## LeaveTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/LeaveTypes` | `leave_applications_read` | Workspace member | Get leave types |
| GET | `/api/v2/HrmsService/LeaveTypes/Count` | `leave_applications_read` | Workspace member | Count leave types |

## PayrollPeriods

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/PayrollPeriods` | `payrolls_read` | Workspace member | Get payroll periods |
| POST | `/api/v2/HrmsService/PayrollPeriods` | `payrolls_create` | Workspace member | Create a payroll period |
| GET | `/api/v2/HrmsService/PayrollPeriods/Count` | `payrolls_read` | Workspace member | Count payroll periods |
| GET | `/api/v2/HrmsService/PayrollPeriods/{periodId}` | `payrolls_read` | Workspace member | Get payroll period by ID |
| PUT | `/api/v2/HrmsService/PayrollPeriods/{periodId}` | `payrolls_update` | Workspace member | Update a payroll period |
| DELETE | `/api/v2/HrmsService/PayrollPeriods/{periodId}` | `payrolls_delete` | Workspace member | Delete a payroll period |

## Payrolls

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/Payrolls` | `payrolls_read` | Workspace member | Get payrolls |
| POST | `/api/v2/HrmsService/Payrolls` | `payrolls_create` | Workspace member | Create a payroll |
| GET | `/api/v2/HrmsService/Payrolls/Count` | `payrolls_read` | Workspace member | Count payrolls |
| GET | `/api/v2/HrmsService/Payrolls/{payrollId}` | `payrolls_read` | Workspace member | Get payroll by ID |
| PUT | `/api/v2/HrmsService/Payrolls/{payrollId}` | `payrolls_update` | Workspace member | Update a payroll |
| PATCH | `/api/v2/HrmsService/Payrolls/{payrollId}` | `payrolls_update` | Workspace member | Patch a payroll |
| DELETE | `/api/v2/HrmsService/Payrolls/{payrollId}` | `payrolls_delete` | Workspace member | Delete a payroll |

## PositionSeats

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/Positions/{positionId}/Assignments` | `positions_read` | Workspace member | Get position assignments |
| POST | `/api/v2/HrmsService/Positions/{positionId}/Assignments` | `positions_update` | Workspace member | Assign a position |
| GET | `/api/v2/HrmsService/Positions/{positionId}/Assignments/Count` | `positions_read` | Workspace member | Count position assignments |
| POST | `/api/v2/HrmsService/Positions/{positionId}/Assignments/{assignmentId}/End` | `positions_update` | Workspace member | End a position assignment |
| PUT | `/api/v2/HrmsService/Positions/{positionId}/Capacity` | `positions_update` | Workspace member | Change a position's capacity |
| PUT | `/api/v2/HrmsService/Positions/{positionId}/Department` | `positions_update` | Workspace member | Change a position's department |

## RequiredSkills

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/RequiredSkills` | `required_skills_read` | Workspace member | Get required-skill records (the structured matching substrate) for a tenant |
| POST | `/api/v2/HrmsService/RequiredSkills` | `required_skills_create` | Workspace member | Create a required-skill record |
| GET | `/api/v2/HrmsService/RequiredSkills/Count` | `required_skills_read` | Workspace member | Count required-skill records for a tenant |
| GET | `/api/v2/HrmsService/RequiredSkills/{requiredSkillId}` | `required_skills_read` | Workspace member | Get a required-skill record by ID |
| PUT | `/api/v2/HrmsService/RequiredSkills/{requiredSkillId}` | `required_skills_update` | Workspace member | Update a required-skill record |
| PATCH | `/api/v2/HrmsService/RequiredSkills/{requiredSkillId}` | `required_skills_update` | Workspace member | Patch a required-skill record |
| DELETE | `/api/v2/HrmsService/RequiredSkills/{requiredSkillId}` | `required_skills_delete` | Workspace member | Delete a required-skill record |

## Salaries

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/Salaries` | `salaries_read` | Workspace member | Get salaries |
| POST | `/api/v2/HrmsService/Salaries` | `salaries_create` | Workspace member | Create a salary |
| GET | `/api/v2/HrmsService/Salaries/Count` | `salaries_read` | Workspace member | Count salaries |
| GET | `/api/v2/HrmsService/Salaries/{salaryId}` | `salaries_read` | Workspace member | Get salary by ID |
| PUT | `/api/v2/HrmsService/Salaries/{salaryId}` | `salaries_update` | Workspace member | Update a salary |
| PATCH | `/api/v2/HrmsService/Salaries/{salaryId}` | `salaries_update` | Workspace member | Patch a salary |
| DELETE | `/api/v2/HrmsService/Salaries/{salaryId}` | `salaries_delete` | Workspace member | Delete a salary |

## Schedules

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/Schedules` | `schedules_read` | Workspace member | Get schedules |
| POST | `/api/v2/HrmsService/Schedules` | `schedules_create` | Workspace member | Create a schedule |
| GET | `/api/v2/HrmsService/Schedules/Count` | `schedules_read` | Workspace member | Count schedules |
| GET | `/api/v2/HrmsService/Schedules/{scheduleId}` | `schedules_read` | Workspace member | Get schedule by ID |
| PUT | `/api/v2/HrmsService/Schedules/{scheduleId}` | `schedules_update` | Workspace member | Update a schedule |
| PATCH | `/api/v2/HrmsService/Schedules/{scheduleId}` | `schedules_update` | Workspace member | Patch a schedule |
| DELETE | `/api/v2/HrmsService/Schedules/{scheduleId}` | `schedules_delete` | Workspace member | Delete a schedule |

## Shifts

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/Shifts` | `shifts_read` | Workspace member | Get shifts |
| POST | `/api/v2/HrmsService/Shifts` | `shifts_create` | Workspace member | Create a shift |
| GET | `/api/v2/HrmsService/Shifts/Count` | `shifts_read` | Workspace member | Count shifts |
| GET | `/api/v2/HrmsService/Shifts/{shiftId}` | `shifts_read` | Workspace member | Get shift by ID |
| PUT | `/api/v2/HrmsService/Shifts/{shiftId}` | `shifts_update` | Workspace member | Update a shift |
| PATCH | `/api/v2/HrmsService/Shifts/{shiftId}` | `shifts_update` | Workspace member | Patch a shift |
| DELETE | `/api/v2/HrmsService/Shifts/{shiftId}` | `shifts_delete` | Workspace member | Delete a shift |

## TimeIntervals

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/TimeIntervals` | `time_intervals_read` | Workspace member | Get time intervals |
| POST | `/api/v2/HrmsService/TimeIntervals` | `time_intervals_create` | Workspace member | Create a time interval |
| GET | `/api/v2/HrmsService/TimeIntervals/Count` | `time_intervals_read` | Workspace member | Count time intervals |
| GET | `/api/v2/HrmsService/TimeIntervals/{timeIntervalId}` | `time_intervals_read` | Workspace member | Get time interval by ID |
| PUT | `/api/v2/HrmsService/TimeIntervals/{timeIntervalId}` | `time_intervals_update` | Workspace member | Update a time interval |
| PATCH | `/api/v2/HrmsService/TimeIntervals/{timeIntervalId}` | `time_intervals_update` | Workspace member | Patch a time interval |
| DELETE | `/api/v2/HrmsService/TimeIntervals/{timeIntervalId}` | `time_intervals_delete` | Workspace member | Delete a time interval |

## TrainingProgramCourses

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/TrainingProgramCourses` |  | Workspace member | Get training program courses |
| POST | `/api/v2/HrmsService/TrainingProgramCourses` | `training_programs_create` | Workspace member | Create a training program course |
| GET | `/api/v2/HrmsService/TrainingProgramCourses/Count` |  | Workspace member | Count training program courses |
| GET | `/api/v2/HrmsService/TrainingProgramCourses/{courseId}` |  | Workspace member | Get training program course by ID |
| PUT | `/api/v2/HrmsService/TrainingProgramCourses/{courseId}` | `training_programs_update` | Workspace member | Update a training program course |
| PATCH | `/api/v2/HrmsService/TrainingProgramCourses/{courseId}` | `training_programs_update` | Workspace member | Patch a training program course |
| DELETE | `/api/v2/HrmsService/TrainingProgramCourses/{courseId}` | `training_programs_delete` | Workspace member | Delete a training program course |

## TrainingProgramEvents

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/TrainingProgramEvents` |  | Workspace member | Get training program events |
| POST | `/api/v2/HrmsService/TrainingProgramEvents` | `training_programs_create` | Workspace member | Create a training program event |
| GET | `/api/v2/HrmsService/TrainingProgramEvents/Count` |  | Workspace member | Count training program events |
| GET | `/api/v2/HrmsService/TrainingProgramEvents/{eventId}` |  | Workspace member | Get training program event by ID |
| PUT | `/api/v2/HrmsService/TrainingProgramEvents/{eventId}` | `training_programs_update` | Workspace member | Update a training program event |
| PATCH | `/api/v2/HrmsService/TrainingProgramEvents/{eventId}` | `training_programs_update` | Workspace member | Patch a training program event |
| DELETE | `/api/v2/HrmsService/TrainingProgramEvents/{eventId}` | `training_programs_delete` | Workspace member | Delete a training program event |

## TrainingPrograms

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/HrmsService/TrainingPrograms` | `training_programs_read` | Workspace member | Get training programs |
| GET | `/api/v2/HrmsService/TrainingPrograms/Count` | `training_programs_read` | Workspace member | Count training programs |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
