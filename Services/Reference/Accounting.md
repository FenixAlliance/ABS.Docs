# Accounting service

The Accounting service lets you keep your workspace's books over the API: chart of accounts, journals, fiscal periods, taxes, finance records and reports.

**Who uses it:** developers who connect an accounting, banking or reporting system to a workspace, or who automate bookkeeping.

**Base route:** `/api/v2/AccountingService/...`

## What you can do

- **Set up your chart of accounts:** create accounts and account groups, and organize them into ledgers, ledger types and financial books. See [Accounting](~/Modules/Accounting.md).
- **Record journal entries:** keep journals and journal types, bind a journal to a financial book, add draft entries, post a draft entry and reverse a posted entry.
- **Run your fiscal calendar:** keep fiscal authorities, fiscal years and fiscal periods, open or close a period, and keep the number ranges your invoices draw from. See [Invoice-number ranges](~/Modules/Accounting/Billing/Invoice-Number-Ranges.md).
- **Configure taxes:** keep tax classes, tax rates and tax policies, record the items and documents a tax policy applies to, and read the taxes of a billable line.
- **Keep finance records:** bank accounts, bank guarantees and bank transactions; loans and loan applications; budgets, cost centres, expense claims, receipts, grants and commissions; share classes, issuances and transfers; and transactions with their categories.
- **Report on your books:** get the trial balance of a fiscal period, in the currency you choose and optionally for one financial book, and sum your credits, debits, incomes and expenses.
- **Follow automatic postings:** when **Post journal entries automatically** is turned on in your Accounting settings, list the postings the platform made for you and find the ones that did not complete.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** each kind of record has its own read, create, update and delete permissions, for example `accounts_read`, `journals_create`, `ledgers_update`, `fiscal_years_delete`, `taxes_read` and `banks_create`. Posting and reversing an entry need `journals_post` and `journals_reverse`. Opening and closing a fiscal period need `fiscal_periods_open` and `fiscal_periods_close`. The table below names the permission of every endpoint.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `AccountingService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## AccountGroups

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/AccountGroups` | `accounts_read` | Workspace member | Gets the current tenant account groups |
| POST | `/api/v2/AccountingService/AccountGroups` | `accounts_create` | Workspace member | Creates a new account group |
| GET | `/api/v2/AccountingService/AccountGroups/Count` | `accounts_read` | Workspace member | Gets the current tenant accounts count |
| GET | `/api/v2/AccountingService/AccountGroups/{accountGroupId}` | `accounts_read` | Workspace member | Gets the current tenant account group |
| PUT | `/api/v2/AccountingService/AccountGroups/{accountGroupId}` | `accounts_update` | Workspace member | Updates an existing account group |
| PATCH | `/api/v2/AccountingService/AccountGroups/{accountGroupId}` | `accounts_update` | Workspace member | Patch an account group |
| DELETE | `/api/v2/AccountingService/AccountGroups/{accountGroupId}` | `accounts_delete` | Workspace member | Deletes an existing account group |

## AccountingPeriods

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/AccountingPeriods` | `accounts_read` | Workspace member | Get all accounting periods for a tenant |
| POST | `/api/v2/AccountingService/AccountingPeriods` | `accounts_create` | Workspace member | Creates a new accounting period |
| GET | `/api/v2/AccountingService/AccountingPeriods/Count` | `accounts_read` | Workspace member | Gets the current tenant accounting periods count |
| GET | `/api/v2/AccountingService/AccountingPeriods/{accountingPeriodId}` | `accounts_read` | Workspace member | Gets the current tenant accounting period |
| PUT | `/api/v2/AccountingService/AccountingPeriods/{accountingPeriodId}` | `accounts_update` | Workspace member | Updates an existing accounting period |
| PATCH | `/api/v2/AccountingService/AccountingPeriods/{accountingPeriodId}` | `accounts_update` | Workspace member | Patch an accounting period |
| DELETE | `/api/v2/AccountingService/AccountingPeriods/{accountingPeriodId}` | `accounts_delete` | Workspace member | Deletes an existing accounting period |

## AccountingSummary

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/Summary/Credits/Sum` | `accounts_read` | Workspace member | Sum tenant accounting-entry credits |
| GET | `/api/v2/AccountingService/Summary/Debits/Sum` | `accounts_read` | Workspace member | Sum tenant accounting-entry debits |
| GET | `/api/v2/AccountingService/Summary/Expenses/Sum` | `journals_read` | Workspace member | Sum tenant expenses |
| GET | `/api/v2/AccountingService/Summary/Incomes/Sum` | `journals_read` | Workspace member | Sum tenant incomes |

## Accounts

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/Accounts` | `accounts_read` | Workspace member | Creates a new account |
| POST | `/api/v2/AccountingService/Accounts` | `accounts_create` | Workspace member | Get root accounts |
| POST | `/api/v2/AccountingService/Accounts/Aggregate` | `accounts_read` | Workspace member | Get account aggregate |
| GET | `/api/v2/AccountingService/Accounts/Aggregate/Balance` | `accounts_read` | Workspace member | Aggregate accounts balance |
| GET | `/api/v2/AccountingService/Accounts/ChartsOfAccounts` |  | Checked by the service | Get charts of accounts |
| POST | `/api/v2/AccountingService/Accounts/ChartsOfAccounts/Seed` | `accounts_create` | Workspace member | Seed chart of accounts |
| GET | `/api/v2/AccountingService/Accounts/Count` | `accounts_read` | Workspace member | Get the number of accounts |
| GET | `/api/v2/AccountingService/Accounts/Relations` | `accounts_read` | Workspace member | Get account relations |
| POST | `/api/v2/AccountingService/Accounts/Relations` | `accounts_create` | Workspace member | Create account relation |
| GET | `/api/v2/AccountingService/Accounts/Relations/Count` | `accounts_read` | Workspace member | Get account relations count |
| PUT | `/api/v2/AccountingService/Accounts/Relations/{accountRelationId}` | `accounts_update` | Workspace member | Update account relation |
| PATCH | `/api/v2/AccountingService/Accounts/Relations/{accountRelationId}` | `accounts_update` | Workspace member | Patch account relation |
| DELETE | `/api/v2/AccountingService/Accounts/Relations/{accountRelationId}` | `accounts_delete` | Workspace member | Delete account relation |
| GET | `/api/v2/AccountingService/Accounts/Root` | `accounts_read` | Workspace member | Get root accounts |
| POST | `/api/v2/AccountingService/Accounts/Root/Balance` | `accounts_update` | Workspace member | Balance root account |
| GET | `/api/v2/AccountingService/Accounts/Types` | `accounts_read` | Workspace member | Get account types |
| POST | `/api/v2/AccountingService/Accounts/Types` | `accounts_create` | Workspace member | Create account type |
| GET | `/api/v2/AccountingService/Accounts/Types/Count` | `accounts_read` | Workspace member | Get account types count |
| GET | `/api/v2/AccountingService/Accounts/Types/{accountTypeId}` | `accounts_read` | Workspace member | Get account type by ID |
| PUT | `/api/v2/AccountingService/Accounts/Types/{accountTypeId}` | `accounts_update` | Workspace member | Update account type |
| PATCH | `/api/v2/AccountingService/Accounts/Types/{accountTypeId}` | `accounts_update` | Workspace member | Patch account type |
| DELETE | `/api/v2/AccountingService/Accounts/Types/{accountTypeId}` | `accounts_delete` | Workspace member | Delete account type |
| GET | `/api/v2/AccountingService/Accounts/{accountId}` | `accounts_read` | Workspace member | Get account details |
| PUT | `/api/v2/AccountingService/Accounts/{accountId}` | `accounts_update` | Workspace member | Update an account |
| PATCH | `/api/v2/AccountingService/Accounts/{accountId}` | `accounts_update` | Workspace member | Patch an account |
| DELETE | `/api/v2/AccountingService/Accounts/{accountId}` | `accounts_delete` | Workspace member | Delete an account |
| POST | `/api/v2/AccountingService/Accounts/{accountId}/Balance` | `accounts_read` | Workspace member | Balance account |
| GET | `/api/v2/AccountingService/Accounts/{accountId}/Children` | `accounts_read` | Workspace member | Get child accounts |
| GET | `/api/v2/AccountingService/Accounts/{accountId}/Credits` | `accounts_read` | Workspace member | Get account credits |
| POST | `/api/v2/AccountingService/Accounts/{accountId}/Credits` | `accounts_create` | Workspace member | Create account credit |
| GET | `/api/v2/AccountingService/Accounts/{accountId}/Credits/Count` | `accounts_read` | Workspace member | Get account credits count |
| GET | `/api/v2/AccountingService/Accounts/{accountId}/Debits` | `accounts_read` | Workspace member | Get account debits |
| POST | `/api/v2/AccountingService/Accounts/{accountId}/Debits` | `accounts_create` | Workspace member | Create account debit |
| GET | `/api/v2/AccountingService/Accounts/{accountId}/Debits/Count` | `accounts_read` | Workspace member | Get account debits count |
| GET | `/api/v2/AccountingService/Accounts/{accountId}/Entries` | `accounts_read` | Workspace member | Get account entries |
| POST | `/api/v2/AccountingService/Accounts/{accountId}/Entries` | `accounts_create` | Workspace member | Create account entry |
| GET | `/api/v2/AccountingService/Accounts/{accountId}/Entries/Credit` | `accounts_read` | Workspace member | Get credit account entries |
| GET | `/api/v2/AccountingService/Accounts/{accountId}/Entries/Debit` | `accounts_read` | Workspace member | Get debit account entries |
| GET | `/api/v2/AccountingService/Accounts/{accountId}/Entries/{entryId}` | `accounts_read` | Workspace member | Get account entry |
| PUT | `/api/v2/AccountingService/Accounts/{accountId}/Entries/{entryId}` | `accounts_update` | Workspace member | Update account entry |
| PATCH | `/api/v2/AccountingService/Accounts/{accountId}/Entries/{entryId}` | `accounts_update` | Workspace member | Patch account entry |
| DELETE | `/api/v2/AccountingService/Accounts/{accountId}/Entries/{entryId}` | `accounts_delete` | Workspace member | Delete account entry |

## BankProfiles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/BankProfiles` | `banks_read` | Workspace member | Get all bank profiles for a tenant |
| GET | `/api/v2/AccountingService/BankProfiles/Count` | `banks_read` | Workspace member | Get bank profiles count |

## Banking

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/Banking` | `banks_read` | Workspace member | Gets the current tenant banks |
| GET | `/api/v2/AccountingService/Banking/Count` | `banks_read` | Workspace member | Gets the current tenant banks count |
| GET | `/api/v2/AccountingService/Banking/{bankId}` | `banks_read` | Workspace member | Gets the current tenant bank |
| GET | `/api/v2/AccountingService/Banking/{bankId}/Accounts` | `banks_read` | Workspace member | Gets the current tenant bank accounts |
| POST | `/api/v2/AccountingService/Banking/{bankId}/Accounts` | `banks_create` | Workspace member | Creates a new bank account |
| GET | `/api/v2/AccountingService/Banking/{bankId}/Accounts/Count` | `banks_read` | Workspace member | Gets the current tenant bank accounts count |
| GET | `/api/v2/AccountingService/Banking/{bankId}/Accounts/{accountId}` | `banks_read` | Workspace member | Gets the current tenant bank account |
| PUT | `/api/v2/AccountingService/Banking/{bankId}/Accounts/{accountId}` | `banks_update` | Workspace member | Updates a bank account |
| PATCH | `/api/v2/AccountingService/Banking/{bankId}/Accounts/{accountId}` | `banks_update` | Workspace member | Patches a bank account |
| DELETE | `/api/v2/AccountingService/Banking/{bankId}/Accounts/{accountId}` | `banks_delete` | Workspace member | Deletes a bank account |
| GET | `/api/v2/AccountingService/Banking/{bankId}/Guarantees` | `banks_read` | Workspace member | Gets the current tenant bank guarantees |
| POST | `/api/v2/AccountingService/Banking/{bankId}/Guarantees` | `banks_create` | Workspace member | Creates a new bank guarantee |
| GET | `/api/v2/AccountingService/Banking/{bankId}/Guarantees/Count` | `banks_read` | Workspace member | Gets the current tenant bank guarantees count |
| GET | `/api/v2/AccountingService/Banking/{bankId}/Guarantees/{guaranteeId}` | `banks_read` | Workspace member | Gets the current tenant bank guarantee |
| PUT | `/api/v2/AccountingService/Banking/{bankId}/Guarantees/{guaranteeId}` | `banks_update` | Workspace member | Updates a bank guarantee |
| PATCH | `/api/v2/AccountingService/Banking/{bankId}/Guarantees/{guaranteeId}` | `banks_update` | Workspace member | Patches a bank guarantee |
| DELETE | `/api/v2/AccountingService/Banking/{bankId}/Guarantees/{guaranteeId}` | `banks_delete` | Workspace member | Deletes a bank guarantee |
| GET | `/api/v2/AccountingService/Banking/{bankId}/Transactions` | `banks_read` | Workspace member | Gets the current tenant bank transactions |
| POST | `/api/v2/AccountingService/Banking/{bankId}/Transactions` | `banks_create` | Workspace member | Creates a new bank transaction |
| GET | `/api/v2/AccountingService/Banking/{bankId}/Transactions/Count` | `banks_read` | Workspace member | Gets the current tenant bank transactions count |
| GET | `/api/v2/AccountingService/Banking/{bankId}/Transactions/{transactionId}` | `banks_read` | Workspace member | Gets the current tenant bank transaction |
| PUT | `/api/v2/AccountingService/Banking/{bankId}/Transactions/{transactionId}` | `banks_update` | Workspace member | Updates a bank transaction |
| PATCH | `/api/v2/AccountingService/Banking/{bankId}/Transactions/{transactionId}` | `banks_update` | Workspace member | Patches a bank transaction |
| DELETE | `/api/v2/AccountingService/Banking/{bankId}/Transactions/{transactionId}` | `banks_delete` | Workspace member | Deletes a bank transaction |

## BillableLineTaxes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/BillableLines/{billableLineId}/Taxes` | `taxes_read` | Workspace member | Get taxes for a billable line. |
| POST | `/api/v2/AccountingService/BillableLines/{billableLineId}/Taxes` | `taxes_update` | Workspace member | Create a new tax for a billable line. |
| GET | `/api/v2/AccountingService/BillableLines/{billableLineId}/Taxes/Count` | `taxes_read` | Workspace member | Get the count of taxes for a billable line. |
| PUT | `/api/v2/AccountingService/BillableLines/{billableLineId}/Taxes/{taxId}` | `taxes_update` | Workspace member | Update a tax for a billable line. |
| PATCH | `/api/v2/AccountingService/BillableLines/{billableLineId}/Taxes/{taxId}` | `taxes_update` | Workspace member | Patch a billable line tax |
| DELETE | `/api/v2/AccountingService/BillableLines/{billableLineId}/Taxes/{taxId}` | `taxes_update` | Workspace member | Delete a tax from a billable line. |

## BillingProfiles

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/BillingProfiles` | `billing_profiles_read` | Workspace member | Gets all billing profiles |
| POST | `/api/v2/AccountingService/BillingProfiles` | `billing_profiles_create` | Workspace member | Creates a new billing profile |
| GET | `/api/v2/AccountingService/BillingProfiles/Count` | `billing_profiles_read` | Workspace member | Gets the count of billing profiles |
| GET | `/api/v2/AccountingService/BillingProfiles/{billingProfileId}` | `billing_profiles_read` | Workspace member | Gets a billing profile by id |
| PUT | `/api/v2/AccountingService/BillingProfiles/{billingProfileId}` | `billing_profiles_update` | Workspace member | Updates an existing billing profile |
| PATCH | `/api/v2/AccountingService/BillingProfiles/{billingProfileId}` | `billing_profiles_update` | Workspace member | Patch a billing profile |
| DELETE | `/api/v2/AccountingService/BillingProfiles/{billingProfileId}` | `billing_profiles_delete` | Workspace member | Deletes a billing profile |

## Budgets

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/Budgets` | `budgets_read` | Workspace member | Gets all budgets |
| POST | `/api/v2/AccountingService/Budgets` | `budgets_create` | Workspace member | Creates a budget |
| GET | `/api/v2/AccountingService/Budgets/Count` | `budgets_read` | Workspace member | Get the count of budgets |
| GET | `/api/v2/AccountingService/Budgets/{budgetId}` | `budgets_read` | Workspace member | Gets a budget by id |
| PUT | `/api/v2/AccountingService/Budgets/{budgetId}` | `budgets_update` | Workspace member | Updates a budget |
| PATCH | `/api/v2/AccountingService/Budgets/{budgetId}` | `budgets_update` | Workspace member | Patches a budget |
| DELETE | `/api/v2/AccountingService/Budgets/{budgetId}` | `budgets_delete` | Workspace member | Deletes a budget |
| GET | `/api/v2/AccountingService/Budgets/{budgetId}/AccountEntries` | `budgets_read` | Workspace member | Gets all budget account entries |
| POST | `/api/v2/AccountingService/Budgets/{budgetId}/AccountEntries` | `budgets_create` | Workspace member | Creates a budget account entry |
| GET | `/api/v2/AccountingService/Budgets/{budgetId}/AccountEntries/{entryId}` | `budgets_read` | Workspace member | Gets a budget account entry by id |
| PUT | `/api/v2/AccountingService/Budgets/{budgetId}/AccountEntries/{entryId}` | `budgets_update` | Workspace member | Updates a budget account entry |
| PATCH | `/api/v2/AccountingService/Budgets/{budgetId}/AccountEntries/{entryId}` | `budgets_update` | Workspace member | Patches a budget account entry |
| DELETE | `/api/v2/AccountingService/Budgets/{budgetId}/AccountEntries/{entryId}` | `budgets_delete` | Workspace member | Deletes a budget account entry |

## Commissions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/Commissions/Commissions` | `commissions_read` | Workspace member | Get all commissions for a tenant |
| POST | `/api/v2/AccountingService/Commissions/Commissions` | `commissions_create` | Workspace member | Create a commission |
| GET | `/api/v2/AccountingService/Commissions/Commissions/Count` | `commissions_read` | Workspace member | Get the count of commissions for a tenant |
| GET | `/api/v2/AccountingService/Commissions/Commissions/{commissionId}` | `commissions_read` | Workspace member | Get a commission by id |
| PUT | `/api/v2/AccountingService/Commissions/Commissions/{commissionId}` | `commissions_update` | Workspace member | Update a commission |
| PATCH | `/api/v2/AccountingService/Commissions/Commissions/{commissionId}` | `commissions_update` | Workspace member | Patch a commission |
| DELETE | `/api/v2/AccountingService/Commissions/Commissions/{commissionId}` | `commissions_delete` | Workspace member | Delete a commission |
| GET | `/api/v2/AccountingService/Commissions/PaymentCommissions` |  | Workspace member | Get all payment commissions for a tenant |
| POST | `/api/v2/AccountingService/Commissions/PaymentCommissions` | `commissions_create` | Workspace member | Create a payment commission |
| GET | `/api/v2/AccountingService/Commissions/PaymentCommissions/Count` |  | Workspace member | Get the count of payment commissions for a tenant |
| GET | `/api/v2/AccountingService/Commissions/PaymentCommissions/{paymentCommissionId}` |  | Workspace member | Get a payment commission by id |
| PUT | `/api/v2/AccountingService/Commissions/PaymentCommissions/{paymentCommissionId}` | `commissions_update` | Workspace member | Update a payment commission |
| PATCH | `/api/v2/AccountingService/Commissions/PaymentCommissions/{paymentCommissionId}` | `commissions_update` | Workspace member | Patch a payment commission |
| DELETE | `/api/v2/AccountingService/Commissions/PaymentCommissions/{paymentCommissionId}` | `commissions_delete` | Workspace member | Delete a payment commission |

## CostCentres

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/CostCentres` | `cost_centres_read` | Workspace member | Get all cost centres for a tenant |
| POST | `/api/v2/AccountingService/CostCentres` | `cost_centres_create` | Workspace member | Create a cost centre |
| GET | `/api/v2/AccountingService/CostCentres/CostCentreBudgets` | `cost_centres_read` | Workspace member | Get all cost centre budgets for a tenant |
| POST | `/api/v2/AccountingService/CostCentres/CostCentreBudgets` | `cost_centres_create` | Workspace member | Create a cost centre budget |
| GET | `/api/v2/AccountingService/CostCentres/CostCentreBudgets/{budgetId}` | `cost_centres_read` | Workspace member | Get a cost centre budget by id |
| PUT | `/api/v2/AccountingService/CostCentres/CostCentreBudgets/{budgetId}` | `cost_centres_update` | Workspace member | Update a cost centre budget |
| PATCH | `/api/v2/AccountingService/CostCentres/CostCentreBudgets/{budgetId}` | `cost_centres_update` | Workspace member | Patch a cost centre budget |
| DELETE | `/api/v2/AccountingService/CostCentres/CostCentreBudgets/{budgetId}` | `cost_centres_delete` | Workspace member | Delete a cost centre budget |
| GET | `/api/v2/AccountingService/CostCentres/CostCentreGroups` | `cost_centres_read` | Workspace member | Get all cost centre groups for a tenant |
| POST | `/api/v2/AccountingService/CostCentres/CostCentreGroups` | `cost_centres_create` | Workspace member | Create a cost centre group |
| GET | `/api/v2/AccountingService/CostCentres/CostCentreGroups/Count` | `cost_centres_read` | Workspace member | Get the count of cost centre groups for a tenant |
| GET | `/api/v2/AccountingService/CostCentres/CostCentreGroups/{groupId}` | `cost_centres_read` | Workspace member | Get a cost centre group by id |
| PUT | `/api/v2/AccountingService/CostCentres/CostCentreGroups/{groupId}` | `cost_centres_update` | Workspace member | Update a cost centre group |
| PATCH | `/api/v2/AccountingService/CostCentres/CostCentreGroups/{groupId}` | `cost_centres_update` | Workspace member | Patch a cost centre group |
| DELETE | `/api/v2/AccountingService/CostCentres/CostCentreGroups/{groupId}` | `cost_centres_delete` | Workspace member | Delete a cost centre group |
| GET | `/api/v2/AccountingService/CostCentres/Count` | `cost_centres_read` | Workspace member | Get the count of cost centres for a tenant |
| GET | `/api/v2/AccountingService/CostCentres/{costCentreId}` | `cost_centres_read` | Workspace member | Get a cost centre by id |
| PUT | `/api/v2/AccountingService/CostCentres/{costCentreId}` | `cost_centres_update` | Workspace member | Update a cost centre |
| PATCH | `/api/v2/AccountingService/CostCentres/{costCentreId}` | `cost_centres_update` | Workspace member | Patch a cost centre |
| DELETE | `/api/v2/AccountingService/CostCentres/{costCentreId}` | `cost_centres_delete` | Workspace member | Delete a cost centre |

## ExpenseClaims

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/ExpenseClaims` | `expenses_read` | Workspace member | Get all expense claims for a tenant |
| POST | `/api/v2/AccountingService/ExpenseClaims` | `expenses_create` | Workspace member | Create an expense claim |
| GET | `/api/v2/AccountingService/ExpenseClaims/Count` | `expenses_read` | Workspace member | Get the count of expense claims for a tenant |
| GET | `/api/v2/AccountingService/ExpenseClaims/{expenseClaimId}` | `expenses_read` | Workspace member | Get an expense claim by id |
| PUT | `/api/v2/AccountingService/ExpenseClaims/{expenseClaimId}` | `expenses_update` | Workspace member | Update an expense claim |
| PATCH | `/api/v2/AccountingService/ExpenseClaims/{expenseClaimId}` | `expenses_update` | Workspace member | Patch an expense claim |
| DELETE | `/api/v2/AccountingService/ExpenseClaims/{expenseClaimId}` | `expenses_delete` | Workspace member | Delete an expense claim |

## ExpenseTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/ExpenseTypes` | `expenses_read` | Workspace member | Get all expense types for a tenant |
| POST | `/api/v2/AccountingService/ExpenseTypes` | `expenses_create` | Workspace member | Create an expense type |
| GET | `/api/v2/AccountingService/ExpenseTypes/Count` | `expenses_read` | Workspace member | Get the count of expense types for a tenant |
| GET | `/api/v2/AccountingService/ExpenseTypes/{expenseTypeId}` | `expenses_read` | Workspace member | Get an expense type by id |
| PUT | `/api/v2/AccountingService/ExpenseTypes/{expenseTypeId}` | `expenses_update` | Workspace member | Update an expense type |
| PATCH | `/api/v2/AccountingService/ExpenseTypes/{expenseTypeId}` | `expenses_update` | Workspace member | Patch an expense type |
| DELETE | `/api/v2/AccountingService/ExpenseTypes/{expenseTypeId}` | `expenses_delete` | Workspace member | Delete an expense type |

## FinancialBooks

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/FinancialBooks` | `financialbooks_read` | Workspace member | Get all financial books for a tenant |
| POST | `/api/v2/AccountingService/FinancialBooks` | `financialbooks_create` | Workspace member | Creates a new financial book |
| GET | `/api/v2/AccountingService/FinancialBooks/Count` | `financialbooks_read` | Workspace member | Get the count of financial books |
| GET | `/api/v2/AccountingService/FinancialBooks/{financialBookId}` | `financialbooks_read` | Workspace member | Gets the details of a specific financial book |
| PUT | `/api/v2/AccountingService/FinancialBooks/{financialBookId}` | `financialbooks_update` | Workspace member | Updates an existing financial book |
| PATCH | `/api/v2/AccountingService/FinancialBooks/{financialBookId}` | `financialbooks_update` | Workspace member | Patch a financial book |
| DELETE | `/api/v2/AccountingService/FinancialBooks/{financialBookId}` | `financialbooks_delete` | Workspace member | Deletes an existing financial book |

## FiscalAuthorities

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/Fiscals/Authorities` | `fiscal_authorities_read` | Workspace member | Get fiscal authorities |
| POST | `/api/v2/AccountingService/Fiscals/Authorities` | `fiscal_authorities_create` | Workspace member | Create a fiscal authority |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/Count` | `fiscal_authorities_read` | Workspace member | Get fiscal authorities count |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{authorityId}` | `fiscal_authorities_read` | Workspace member | Get fiscal authority by ID |
| PUT | `/api/v2/AccountingService/Fiscals/Authorities/{authorityId}` | `fiscal_authorities_update` | Workspace member | Update a fiscal authority |
| PATCH | `/api/v2/AccountingService/Fiscals/Authorities/{authorityId}` | `fiscal_authorities_update` | Workspace member | Patch a fiscal authority |
| DELETE | `/api/v2/AccountingService/Fiscals/Authorities/{authorityId}` | `fiscal_authorities_delete` | Workspace member | Delete a fiscal authority |

## FiscalAuthorityYears

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/AccountingService/Fiscals/Authorities/FiscalYears` | `fiscal_years_create` | Workspace member | Create a fiscal year |
| PUT | `/api/v2/AccountingService/Fiscals/Authorities/FiscalYears/{fiscalYearId}` | `fiscal_years_update` | Workspace member | Update a fiscal year |
| PATCH | `/api/v2/AccountingService/Fiscals/Authorities/FiscalYears/{fiscalYearId}` | `fiscal_years_update` | Workspace member | Patch a fiscal authority year |
| DELETE | `/api/v2/AccountingService/Fiscals/Authorities/FiscalYears/{fiscalYearId}` | `fiscal_years_delete` | Workspace member | Delete a fiscal year |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{authorityId}/FiscalYears` | `fiscal_years_read` | Workspace member | Get fiscal years for an authority |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{fiscalAuthorityId}/FiscalYears/Count` | `fiscal_years_read` | Workspace member | Get fiscal years count for an authority |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{fiscalAuthorityId}/FiscalYears/{fiscalYearId}` | `fiscal_years_read` | Workspace member | Get fiscal year by ID for an authority |

## FiscalEnumerationRanges

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/AccountingService/Fiscals/Authorities/EnumerationRanges` | `invoices_create` | Workspace member | Create an invoice enumeration range |
| PUT | `/api/v2/AccountingService/Fiscals/Authorities/EnumerationRanges/{enumerationRangeId}` | `invoices_update` | Workspace member | Update an invoice enumeration range |
| PATCH | `/api/v2/AccountingService/Fiscals/Authorities/EnumerationRanges/{enumerationRangeId}` | `invoices_update` | Workspace member | Patch an invoice enumeration range |
| DELETE | `/api/v2/AccountingService/Fiscals/Authorities/EnumerationRanges/{enumerationRangeId}` | `invoices_delete` | Workspace member | Delete an invoice enumeration range |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{authorityId}/EnumerationRanges` | `fiscal_authorities_read` | Workspace member | Get invoice enumeration ranges for an authority |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{fiscalAuthorityId}/EnumerationRanges/Count` | `fiscal_authorities_read` | Workspace member | Get invoice enumeration ranges count |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{fiscalAuthorityId}/EnumerationRanges/{enumerationRangeId}` | `fiscal_authorities_read` | Workspace member | Get invoice enumeration range by ID |

## FiscalIdentificationTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/AccountingService/Fiscals/Authorities/IdentificationTypes` | `fiscal_identification_types_create` | Workspace member | Create a fiscal identification type |
| PUT | `/api/v2/AccountingService/Fiscals/Authorities/IdentificationTypes/{identificationTypeId}` | `fiscal_identification_types_update` | Workspace member | Update a fiscal identification type |
| PATCH | `/api/v2/AccountingService/Fiscals/Authorities/IdentificationTypes/{identificationTypeId}` | `fiscal_identification_types_update` | Workspace member | Patch a fiscal identification type |
| DELETE | `/api/v2/AccountingService/Fiscals/Authorities/IdentificationTypes/{identificationTypeId}` | `fiscal_identification_types_delete` | Workspace member | Delete a fiscal identification type |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{authorityId}/IdentificationTypes` | `fiscal_identification_types_read` | Workspace member | Get fiscal identification types for an authority |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{authorityId}/IdentificationTypes/Count` | `fiscal_identification_types_read` | Workspace member | Get fiscal identification types count |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{fiscalAuthorityId}/IdentificationTypes/{identificationTypeId}` | `fiscal_identification_types_read` | Workspace member | Get fiscal identification type by ID |

## FiscalPeriods

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/AccountingService/Fiscals/Authorities/FiscalPeriods` | `fiscal_years_create` | Workspace member | Create a fiscal period |
| PUT | `/api/v2/AccountingService/Fiscals/Authorities/FiscalPeriods/{fiscalPeriodId}` | `fiscal_years_update` | Workspace member | Update a fiscal period |
| PATCH | `/api/v2/AccountingService/Fiscals/Authorities/FiscalPeriods/{fiscalPeriodId}` | `fiscal_years_update` | Workspace member | Patch a fiscal period |
| DELETE | `/api/v2/AccountingService/Fiscals/Authorities/FiscalPeriods/{fiscalPeriodId}` | `fiscal_years_delete` | Workspace member | Delete a fiscal period |
| POST | `/api/v2/AccountingService/Fiscals/Authorities/FiscalPeriods/{fiscalPeriodId}/Close` | `fiscal_periods_close` | Workspace member | Close a fiscal period |
| POST | `/api/v2/AccountingService/Fiscals/Authorities/FiscalPeriods/{fiscalPeriodId}/Open` | `fiscal_periods_open` | Workspace member | Open a fiscal period |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{authorityId}/FiscalYears/{fiscalYearId}/FiscalPeriods` | `fiscal_years_read` | Workspace member | Get fiscal periods for a fiscal year |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{fiscalAuthorityId}/FiscalYears/{fiscalYearId}/FiscalPeriods/Count` | `fiscal_years_read` | Workspace member | Get fiscal periods count |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{fiscalAuthorityId}/FiscalYears/{fiscalYearId}/FiscalPeriods/{fiscalPeriodId}` | `fiscal_years_read` | Workspace member | Get fiscal period by ID |

## FiscalRegimes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/AccountingService/Fiscals/Authorities/FiscalRegimes` | `fiscal_regimes_create` | Workspace member | Create a fiscal regime |
| PUT | `/api/v2/AccountingService/Fiscals/Authorities/FiscalRegimes/{regimeId}` | `fiscal_regimes_update` | Workspace member | Update a fiscal regime |
| PATCH | `/api/v2/AccountingService/Fiscals/Authorities/FiscalRegimes/{regimeId}` | `fiscal_regimes_update` | Workspace member | Patch a fiscal regime |
| DELETE | `/api/v2/AccountingService/Fiscals/Authorities/FiscalRegimes/{regimeId}` | `fiscal_regimes_delete` | Workspace member | Delete a fiscal regime |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{authorityId}/FiscalRegimes` | `fiscal_regimes_read` | Workspace member | Get fiscal regimes for an authority |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{fiscalAuthorityId}/FiscalRegimes/Count` | `fiscal_regimes_read` | Workspace member | Get fiscal regimes count |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{fiscalAuthorityId}/FiscalRegimes/{regimeId}` | `fiscal_regimes_read` | Workspace member | Get fiscal regime by ID |

## FiscalResponsibilities

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/AccountingService/Fiscals/Authorities/FiscalResponsibilities` | `fiscal_responsibilities_create` | Workspace member | Create a fiscal responsibility |
| PUT | `/api/v2/AccountingService/Fiscals/Authorities/FiscalResponsibilities/{fiscalResponsibilityId}` | `fiscal_responsibilities_update` | Workspace member | Update a fiscal responsibility |
| PATCH | `/api/v2/AccountingService/Fiscals/Authorities/FiscalResponsibilities/{fiscalResponsibilityId}` | `fiscal_responsibilities_update` | Workspace member | Patch a fiscal responsibility |
| DELETE | `/api/v2/AccountingService/Fiscals/Authorities/FiscalResponsibilities/{fiscalResponsibilityId}` | `fiscal_responsibilities_delete` | Workspace member | Delete a fiscal responsibility |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{authorityId}/FiscalResponsibilities` | `fiscal_responsibilities_read` | Workspace member | Get fiscal responsibilities for an authority |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{fiscalAuthorityId}/FiscalResponsibilities/Count` | `fiscal_responsibilities_read` | Workspace member | Get fiscal responsibilities count |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{fiscalAuthorityId}/FiscalResponsibilities/{fiscalResponsibilityId}` | `fiscal_responsibilities_read` | Workspace member | Get fiscal responsibility by ID |

## FiscalResponsibilityRecords

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| POST | `/api/v2/AccountingService/Fiscals/Authorities/FiscalResponsibilityRecords` | `fiscal_responsibilities_create` | Workspace member | Create a fiscal responsibility record |
| PUT | `/api/v2/AccountingService/Fiscals/Authorities/FiscalResponsibilityRecords/{fiscalResponsibilityRecordId}` | `fiscal_responsibilities_update` | Workspace member | Update a fiscal responsibility record |
| PATCH | `/api/v2/AccountingService/Fiscals/Authorities/FiscalResponsibilityRecords/{fiscalResponsibilityRecordId}` | `fiscal_responsibilities_update` | Workspace member | Patch a fiscal responsibility record |
| DELETE | `/api/v2/AccountingService/Fiscals/Authorities/FiscalResponsibilityRecords/{fiscalResponsibilityRecordId}` | `fiscal_responsibilities_delete` | Workspace member | Delete a fiscal responsibility record |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{fiscalAuthorityId}/FiscalResponsibilities/{fiscalResponsibilityId}/FiscalResponsibilityRecords` | `fiscal_responsibilities_read` | Workspace member | Get fiscal responsibility records |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{fiscalAuthorityId}/FiscalResponsibilities/{fiscalResponsibilityId}/FiscalResponsibilityRecords/Count` | `fiscal_responsibilities_read` | Workspace member | Get fiscal responsibility records count |
| GET | `/api/v2/AccountingService/Fiscals/Authorities/{fiscalAuthorityId}/FiscalResponsibilities/{fiscalResponsibilityId}/FiscalResponsibilityRecords/{fiscalResponsibilityRecordId}` | `fiscal_responsibilities_read` | Workspace member | Get fiscal responsibility record by ID |

## FiscalYears

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/FiscalYears` | `fiscal_years_read` | Workspace member | Get all fiscal years |
| POST | `/api/v2/AccountingService/FiscalYears` | `fiscal_years_create` | Workspace member | Create fiscal year |
| GET | `/api/v2/AccountingService/FiscalYears/Count` | `fiscal_years_read` | Workspace member | Count fiscal years |
| GET | `/api/v2/AccountingService/FiscalYears/{fiscalYearId}` | `fiscal_years_read` | Workspace member | Get fiscal year by ID |
| PUT | `/api/v2/AccountingService/FiscalYears/{fiscalYearId}` | `fiscal_years_update` | Workspace member | Update fiscal year |
| PATCH | `/api/v2/AccountingService/FiscalYears/{fiscalYearId}` | `fiscal_years_update` | Workspace member | Patch a fiscal year |
| DELETE | `/api/v2/AccountingService/FiscalYears/{fiscalYearId}` | `fiscal_years_delete` | Workspace member | Delete fiscal year |

## Grants

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/Grants` | `grants_read` | Workspace member | Get all grants |
| POST | `/api/v2/AccountingService/Grants` | `grants_create` | Workspace member | Create grant |
| GET | `/api/v2/AccountingService/Grants/Count` | `grants_read` | Workspace member | Count grants |
| GET | `/api/v2/AccountingService/Grants/{grantId}` | `grants_read` | Workspace member | Get grant by ID |
| PUT | `/api/v2/AccountingService/Grants/{grantId}` | `grants_update` | Workspace member | Update grant |
| PATCH | `/api/v2/AccountingService/Grants/{grantId}` | `grants_update` | Workspace member | Patch a grant |
| DELETE | `/api/v2/AccountingService/Grants/{grantId}` | `grants_delete` | Workspace member | Delete grant |

## InvoiceEnumerationRanges

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/InvoiceEnumerationRanges` | `invoices_read` | Workspace member | Get all invoice enumeration ranges |
| POST | `/api/v2/AccountingService/InvoiceEnumerationRanges` | `invoices_create` | Workspace member | Create a new invoice enumeration range |
| GET | `/api/v2/AccountingService/InvoiceEnumerationRanges/{rangeId}` | `invoices_read` | Workspace member | Get invoice enumeration range by ID |
| PUT | `/api/v2/AccountingService/InvoiceEnumerationRanges/{rangeId}` | `invoices_update` | Workspace member | Update an invoice enumeration range |
| PATCH | `/api/v2/AccountingService/InvoiceEnumerationRanges/{rangeId}` | `invoices_update` | Workspace member | Patch an invoice enumeration range |
| DELETE | `/api/v2/AccountingService/InvoiceEnumerationRanges/{rangeId}` | `invoices_delete` | Workspace member | Delete an invoice enumeration range |

## JournalTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/JournalTypes` | `journals_read` | Workspace member | Retrieves all journal types |
| POST | `/api/v2/AccountingService/JournalTypes` | `journals_create` | Workspace member | Creates a new journal type |
| GET | `/api/v2/AccountingService/JournalTypes/Count` | `journals_read` | Workspace member | Counts journal types |
| GET | `/api/v2/AccountingService/JournalTypes/{journalTypeId}` | `journals_read` | Workspace member | Retrieves a journal type by ID |
| PUT | `/api/v2/AccountingService/JournalTypes/{journalTypeId}` | `journals_update` | Workspace member | Updates an existing journal type |
| PATCH | `/api/v2/AccountingService/JournalTypes/{journalTypeId}` | `journals_update` | Workspace member | Patch a journal type |
| DELETE | `/api/v2/AccountingService/JournalTypes/{journalTypeId}` | `journals_delete` | Workspace member | Deletes a journal type |

## Journals

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/Journals` | `journals_read` | Workspace member | Get all journals |
| POST | `/api/v2/AccountingService/Journals` | `journals_create` | Workspace member | Create journal |
| GET | `/api/v2/AccountingService/Journals/Count` | `journals_read` | Workspace member | Count journals |
| GET | `/api/v2/AccountingService/Journals/{journalId}` | `journals_read` | Workspace member | Get journal by ID |
| PUT | `/api/v2/AccountingService/Journals/{journalId}` | `journals_update` | Workspace member | Update journal |
| PATCH | `/api/v2/AccountingService/Journals/{journalId}` | `journals_update` | Workspace member | Patch a journal |
| DELETE | `/api/v2/AccountingService/Journals/{journalId}` | `journals_delete` | Workspace member | Delete journal |
| POST | `/api/v2/AccountingService/Journals/{journalId}/AssignToBook` | `journals_update` | Workspace member | Bind a journal to a financial book |
| GET | `/api/v2/AccountingService/Journals/{journalId}/Entries` | `journals_read` | Workspace member | Get journal entries |
| POST | `/api/v2/AccountingService/Journals/{journalId}/Entries` | `journals_create` | Workspace member | Create journal entry |
| GET | `/api/v2/AccountingService/Journals/{journalId}/Entries/Aggregate/Credits` | `journals_update` | Workspace member | Aggregate journal entry credits |
| GET | `/api/v2/AccountingService/Journals/{journalId}/Entries/Aggregate/Debits` | `journals_update` | Workspace member | Aggregate journal entry debits |
| GET | `/api/v2/AccountingService/Journals/{journalId}/Entries/Count` | `journals_read` | Workspace member | Count journal entries |
| GET | `/api/v2/AccountingService/Journals/{journalId}/Entries/{entryId}` | `journals_read` | Workspace member | Get journal entry by ID |
| PUT | `/api/v2/AccountingService/Journals/{journalId}/Entries/{entryId}` | `journals_update` | Workspace member | Update journal entry |
| PATCH | `/api/v2/AccountingService/Journals/{journalId}/Entries/{entryId}` | `journals_update` | Workspace member | Patch a journal entry |
| DELETE | `/api/v2/AccountingService/Journals/{journalId}/Entries/{entryId}` | `journals_delete` | Workspace member | Delete journal entry |
| POST | `/api/v2/AccountingService/Journals/{journalId}/Entries/{entryId}/Post` | `journals_post` | Workspace member | Post a draft journal entry |
| POST | `/api/v2/AccountingService/Journals/{journalId}/Entries/{entryId}/Reverse` | `journals_reverse` | Workspace member | Reverse a posted journal entry |

## LedgerTypes

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/LedgerTypes` | `ledgers_read` | Workspace member | Retrieves all ledger types |
| POST | `/api/v2/AccountingService/LedgerTypes` | `ledgers_create` | Workspace member | Creates a new ledger type |
| GET | `/api/v2/AccountingService/LedgerTypes/Count` | `ledgers_read` | Workspace member | Counts ledger types |
| GET | `/api/v2/AccountingService/LedgerTypes/{ledgerTypeId}` | `ledgers_read` | Workspace member | Gets a ledger type by ID |
| PUT | `/api/v2/AccountingService/LedgerTypes/{ledgerTypeId}` | `ledgers_update` | Workspace member | Updates a ledger type |
| PATCH | `/api/v2/AccountingService/LedgerTypes/{ledgerTypeId}` | `ledgers_update` | Workspace member | Patches a ledger type |
| DELETE | `/api/v2/AccountingService/LedgerTypes/{ledgerTypeId}` | `ledgers_delete` | Workspace member | Deletes a ledger type |

## Ledgers

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/Ledgers` | `ledgers_read` | Workspace member | Retrieves all ledgers |
| POST | `/api/v2/AccountingService/Ledgers` | `ledgers_create` | Workspace member | Creates a new ledger |
| GET | `/api/v2/AccountingService/Ledgers/Count` | `ledgers_read` | Workspace member | Counts ledgers |
| GET | `/api/v2/AccountingService/Ledgers/{ledgerId}` | `ledgers_read` | Workspace member | Gets a ledger by ID |
| PUT | `/api/v2/AccountingService/Ledgers/{ledgerId}` | `ledgers_update` | Workspace member | Updates a ledger |
| PATCH | `/api/v2/AccountingService/Ledgers/{ledgerId}` | `ledgers_update` | Workspace member | Patches a ledger |
| DELETE | `/api/v2/AccountingService/Ledgers/{ledgerId}` | `ledgers_delete` | Workspace member | Deletes a ledger |

## Loans

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/Loans` | `loans_read` | Workspace member | Gets all loans |
| POST | `/api/v2/AccountingService/Loans` | `loans_create` | Workspace member | Creates a new loan |
| GET | `/api/v2/AccountingService/Loans/Applications` | `loans_read` | Workspace member | Gets all loan applications |
| POST | `/api/v2/AccountingService/Loans/Applications` | `loans_create` | Workspace member | Creates a loan application |
| GET | `/api/v2/AccountingService/Loans/Applications/Count` | `loans_read` | Workspace member | Counts loan applications |
| GET | `/api/v2/AccountingService/Loans/Applications/{applicationId}` | `loans_read` | Workspace member | Gets a loan application by ID |
| PUT | `/api/v2/AccountingService/Loans/Applications/{applicationId}` | `loans_update` | Workspace member | Updates a loan application |
| PATCH | `/api/v2/AccountingService/Loans/Applications/{applicationId}` | `loans_update` | Workspace member | Patches a loan application |
| DELETE | `/api/v2/AccountingService/Loans/Applications/{applicationId}` | `loans_delete` | Workspace member | Deletes a loan application |
| GET | `/api/v2/AccountingService/Loans/Count` | `loans_read` | Workspace member | Counts loans |
| GET | `/api/v2/AccountingService/Loans/Types` | `loans_read` | Workspace member | Gets all loan types |
| POST | `/api/v2/AccountingService/Loans/Types` | `loans_create` | Workspace member | Creates a loan type |
| GET | `/api/v2/AccountingService/Loans/Types/Count` | `loans_read` | Workspace member | Counts loan types |
| GET | `/api/v2/AccountingService/Loans/Types/{loanTypeId}` | `loans_read` | Workspace member | Gets a loan type by ID |
| PUT | `/api/v2/AccountingService/Loans/Types/{loanTypeId}` | `loans_update` | Workspace member | Updates a loan type |
| PATCH | `/api/v2/AccountingService/Loans/Types/{loanTypeId}` | `loans_update` | Workspace member | Patches a loan type |
| DELETE | `/api/v2/AccountingService/Loans/Types/{loanTypeId}` | `loans_delete` | Workspace member | Deletes a loan type |
| GET | `/api/v2/AccountingService/Loans/{loanId}` | `loans_read` | Workspace member | Gets a loan by ID |
| PUT | `/api/v2/AccountingService/Loans/{loanId}` | `loans_update` | Workspace member | Updates a loan |
| PATCH | `/api/v2/AccountingService/Loans/{loanId}` | `loans_update` | Workspace member | Patches a loan |
| DELETE | `/api/v2/AccountingService/Loans/{loanId}` | `loans_delete` | Workspace member | Deletes a loan |

## PostingExecutions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/PostingExecutions` | `journals_read` | Workspace member | List posting executions |
| GET | `/api/v2/AccountingService/PostingExecutions/Count` | `journals_read` | Workspace member | Count posting executions |

## Receipts

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/Receipts` | `receipts_read` | Workspace member | Retrieves tenant receipts |
| POST | `/api/v2/AccountingService/Receipts` | `receipts_create` | Workspace member | Creates a new receipt |
| GET | `/api/v2/AccountingService/Receipts/Count` | `receipts_read` | Workspace member | Gets count of tenant receipts |
| GET | `/api/v2/AccountingService/Receipts/{receiptId}` | `receipts_read` | Workspace member | Gets details of a receipt |
| PUT | `/api/v2/AccountingService/Receipts/{receiptId}` | `receipts_update` | Workspace member | Updates a receipt |
| PATCH | `/api/v2/AccountingService/Receipts/{receiptId}` | `receipts_update` | Workspace member | Patches a receipt |
| DELETE | `/api/v2/AccountingService/Receipts/{receiptId}` | `receipts_delete` | Workspace member | Deletes a receipt |

## Reports

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/Reports/TrialBalance` | `accounts_read` | Workspace member | Trial balance for a fiscal period |

## Shares

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/Shares/Classes` | `shares_read` | Workspace member | Gets the current tenant share classes |
| POST | `/api/v2/AccountingService/Shares/Classes` | `shares_create` | Workspace member | Creates a new share class |
| GET | `/api/v2/AccountingService/Shares/Classes/Count` | `shares_read` | Workspace member | Gets the current tenant share classes count |
| GET | `/api/v2/AccountingService/Shares/Classes/{shareClassId}` | `shares_read` | Workspace member | Gets a share class by id |
| PUT | `/api/v2/AccountingService/Shares/Classes/{shareClassId}` | `shares_update` | Workspace member | Updates an existing share class |
| PATCH | `/api/v2/AccountingService/Shares/Classes/{shareClassId}` | `shares_update` | Workspace member | Patches a share class |
| DELETE | `/api/v2/AccountingService/Shares/Classes/{shareClassId}` | `shares_delete` | Workspace member | Deletes an existing share class |
| GET | `/api/v2/AccountingService/Shares/Issuances` | `shares_read` | Workspace member | Gets the current tenant share issuances |
| POST | `/api/v2/AccountingService/Shares/Issuances` | `shares_create` | Workspace member | Creates a new share issuance |
| GET | `/api/v2/AccountingService/Shares/Issuances/Count` | `shares_read` | Workspace member | Gets the current tenant share issuances count |
| GET | `/api/v2/AccountingService/Shares/Issuances/Sum` | `shares_read` | Workspace member | Sum tenant share issuance quantities |
| GET | `/api/v2/AccountingService/Shares/Issuances/{issuanceId}` | `shares_read` | Workspace member | Gets a share issuance by id |
| PUT | `/api/v2/AccountingService/Shares/Issuances/{issuanceId}` | `shares_update` | Workspace member | Updates an existing share issuance |
| PATCH | `/api/v2/AccountingService/Shares/Issuances/{issuanceId}` | `shares_update` | Workspace member | Patches a share issuance |
| DELETE | `/api/v2/AccountingService/Shares/Issuances/{issuanceId}` | `shares_delete` | Workspace member | Deletes an existing share issuance |
| GET | `/api/v2/AccountingService/Shares/TransferReasons` | `shares_read` | Workspace member | Gets the current tenant share transfer reasons |
| POST | `/api/v2/AccountingService/Shares/TransferReasons` | `shares_create` | Workspace member | Creates a new share transfer reason |
| GET | `/api/v2/AccountingService/Shares/TransferReasons/Count` | `shares_read` | Workspace member | Gets the current tenant share transfer reasons count |
| GET | `/api/v2/AccountingService/Shares/TransferReasons/{reasonId}` | `shares_read` | Workspace member | Gets a share transfer reason by id |
| PUT | `/api/v2/AccountingService/Shares/TransferReasons/{reasonId}` | `shares_update` | Workspace member | Updates an existing share transfer reason |
| PATCH | `/api/v2/AccountingService/Shares/TransferReasons/{reasonId}` | `shares_update` | Workspace member | Patches a share transfer reason |
| DELETE | `/api/v2/AccountingService/Shares/TransferReasons/{reasonId}` | `shares_delete` | Workspace member | Deletes an existing share transfer reason |
| GET | `/api/v2/AccountingService/Shares/Transfers` | `shares_read` | Workspace member | Gets the current tenant share transfers |
| POST | `/api/v2/AccountingService/Shares/Transfers` | `shares_create` | Workspace member | Creates a new share transfer |
| GET | `/api/v2/AccountingService/Shares/Transfers/Count` | `shares_read` | Workspace member | Gets the current tenant share transfers count |
| GET | `/api/v2/AccountingService/Shares/Transfers/{transferId}` | `shares_read` | Workspace member | Gets a share transfer by id |
| PUT | `/api/v2/AccountingService/Shares/Transfers/{transferId}` | `shares_update` | Workspace member | Updates an existing share transfer |
| PATCH | `/api/v2/AccountingService/Shares/Transfers/{transferId}` | `shares_update` | Workspace member | Patches a share transfer |
| DELETE | `/api/v2/AccountingService/Shares/Transfers/{transferId}` | `shares_delete` | Workspace member | Deletes an existing share transfer |

## TaxClasses

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/TaxClasses` | `taxes_read` | Workspace member | Get all tax classes for a tenant |
| POST | `/api/v2/AccountingService/TaxClasses` | `taxes_create` | Workspace member | Create a tax class |
| GET | `/api/v2/AccountingService/TaxClasses/Count` | `taxes_read` | Workspace member | Get tax classes count |
| GET | `/api/v2/AccountingService/TaxClasses/{id}` | `taxes_read` | Workspace member | Get tax class by ID |
| PUT | `/api/v2/AccountingService/TaxClasses/{id}` | `taxes_update` | Workspace member | Update a tax class |
| PATCH | `/api/v2/AccountingService/TaxClasses/{id}` | `taxes_update` | Workspace member | Patch a tax class |
| DELETE | `/api/v2/AccountingService/TaxClasses/{id}` | `taxes_delete` | Workspace member | Delete a tax class |

## TaxPolicies

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/TaxPolicies` | `taxes_read` | Workspace member | Get all tax policies for a tenant |
| POST | `/api/v2/AccountingService/TaxPolicies` | `taxes_create` | Workspace member | Create a tax policy |
| GET | `/api/v2/AccountingService/TaxPolicies/Count` | `taxes_read` | Workspace member | Get tax policies count |
| GET | `/api/v2/AccountingService/TaxPolicies/{id}` | `taxes_read` | Workspace member | Get tax policy by ID |
| PUT | `/api/v2/AccountingService/TaxPolicies/{id}` | `taxes_update` | Workspace member | Update a tax policy |
| PATCH | `/api/v2/AccountingService/TaxPolicies/{id}` | `taxes_update` | Workspace member | Patch a tax policy |
| DELETE | `/api/v2/AccountingService/TaxPolicies/{id}` | `taxes_delete` | Workspace member | Delete a tax policy |
| GET | `/api/v2/AccountingService/TaxPolicies/{taxPolicyId}/AppliedTaxPolicyRecords` | `taxes_read` | Workspace member | Get applied tax policy records |
| POST | `/api/v2/AccountingService/TaxPolicies/{taxPolicyId}/AppliedTaxPolicyRecords` | `taxes_create` | Workspace member | Create an applied tax policy record |
| GET | `/api/v2/AccountingService/TaxPolicies/{taxPolicyId}/AppliedTaxPolicyRecords/Count` | `taxes_read` | Workspace member | Get applied tax policy records count |
| GET | `/api/v2/AccountingService/TaxPolicies/{taxPolicyId}/AppliedTaxPolicyRecords/{appliedTaxPolicyRecordId}` | `taxes_read` | Workspace member | Get applied tax policy record by ID |
| PUT | `/api/v2/AccountingService/TaxPolicies/{taxPolicyId}/AppliedTaxPolicyRecords/{appliedTaxPolicyRecordId}` | `taxes_update` | Workspace member | Update an applied tax policy record |
| PATCH | `/api/v2/AccountingService/TaxPolicies/{taxPolicyId}/AppliedTaxPolicyRecords/{appliedTaxPolicyRecordId}` | `taxes_update` | Workspace member | Patch an applied tax policy record |
| DELETE | `/api/v2/AccountingService/TaxPolicies/{taxPolicyId}/AppliedTaxPolicyRecords/{appliedTaxPolicyRecordId}` | `taxes_delete` | Workspace member | Delete an applied tax policy record |
| GET | `/api/v2/AccountingService/TaxPolicies/{taxPolicyId}/ItemTaxPolicyRecords` | `taxes_read` | Workspace member | Get item tax policy records |
| POST | `/api/v2/AccountingService/TaxPolicies/{taxPolicyId}/ItemTaxPolicyRecords` | `taxes_create` | Workspace member | Create an item tax policy record |
| GET | `/api/v2/AccountingService/TaxPolicies/{taxPolicyId}/ItemTaxPolicyRecords/{itemTaxPolicyRecordId}` | `taxes_read` | Workspace member | Get item tax policy record by ID |
| PUT | `/api/v2/AccountingService/TaxPolicies/{taxPolicyId}/ItemTaxPolicyRecords/{itemTaxPolicyRecordId}` | `taxes_update` | Workspace member | Update an item tax policy record |
| PATCH | `/api/v2/AccountingService/TaxPolicies/{taxPolicyId}/ItemTaxPolicyRecords/{itemTaxPolicyRecordId}` | `taxes_update` | Workspace member | Patch an item tax policy record |
| DELETE | `/api/v2/AccountingService/TaxPolicies/{taxPolicyId}/ItemTaxPolicyRecords/{itemTaxPolicyRecordId}` | `taxes_delete` | Workspace member | Delete an item tax policy record |

## TaxRates

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/TaxRates` | `taxes_read` | Workspace member | Get all tax rates for a tenant |
| POST | `/api/v2/AccountingService/TaxRates` | `taxes_create` | Workspace member | Create a tax rate |
| GET | `/api/v2/AccountingService/TaxRates/Count` | `taxes_read` | Workspace member | Get tax rates count |
| GET | `/api/v2/AccountingService/TaxRates/{id}` | `taxes_read` | Workspace member | Get tax rate by ID |
| PUT | `/api/v2/AccountingService/TaxRates/{id}` | `taxes_update` | Workspace member | Update a tax rate |
| PATCH | `/api/v2/AccountingService/TaxRates/{id}` | `taxes_update` | Workspace member | Patch a tax rate |
| DELETE | `/api/v2/AccountingService/TaxRates/{id}` | `taxes_delete` | Workspace member | Delete a tax rate |

## Transactions

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/AccountingService/Transactions` | `transactions_read` | Workspace member | Get all transactions for a tenant |
| POST | `/api/v2/AccountingService/Transactions` | `transactions_create` | Workspace member | Create a transaction |
| GET | `/api/v2/AccountingService/Transactions/Categories` | `transaction_categories_read` | Workspace member | Get all transaction categories |
| POST | `/api/v2/AccountingService/Transactions/Categories` | `transaction_categories_create` | Workspace member | Create a transaction category |
| GET | `/api/v2/AccountingService/Transactions/Categories/Count` | `transaction_categories_read` | Workspace member | Get transaction categories count |
| GET | `/api/v2/AccountingService/Transactions/Categories/{categoryId}` | `transaction_categories_read` | Workspace member | Get transaction category by ID |
| PUT | `/api/v2/AccountingService/Transactions/Categories/{categoryId}` | `transaction_categories_update` | Workspace member | Update a transaction category |
| PATCH | `/api/v2/AccountingService/Transactions/Categories/{categoryId}` | `transaction_categories_update` | Workspace member | Patch a transaction category |
| DELETE | `/api/v2/AccountingService/Transactions/Categories/{categoryId}` | `transaction_categories_delete` | Workspace member | Delete a transaction category |
| GET | `/api/v2/AccountingService/Transactions/Count` | `transactions_read` | Workspace member | Get transactions count |
| GET | `/api/v2/AccountingService/Transactions/{transactionId}` | `transactions_read` | Workspace member | Get transaction by ID |
| PUT | `/api/v2/AccountingService/Transactions/{transactionId}` | `transactions_update` | Workspace member | Update a transaction |
| PATCH | `/api/v2/AccountingService/Transactions/{transactionId}` | `transactions_update` | Workspace member | Patch a transaction |
| DELETE | `/api/v2/AccountingService/Transactions/{transactionId}` | `transactions_delete` | Workspace member | Delete a transaction |

Generated from the source at commit 642fb3c3ad.
<!-- generated:end -->
