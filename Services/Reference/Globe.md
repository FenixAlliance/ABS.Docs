# Globe service

The Globe service lets you read reference data about countries, states, cities, currencies, languages and time zones.

**Who uses it:** developers who fill address forms, currency pickers, language lists or time zone selectors in their apps.

**Base route:** `/api/v2/GlobeService/...`

## What you can do

- **Look up countries.** List, count and search countries by name, and read one country by its ID.
- **Drill into a country.** Read a country's states and the cities in each state, and its calling codes, currencies, time zones and top-level domains.
- **List currencies.** List and count currencies, and read one currency by its ID.
- **List languages.** List and count languages, and read one language by its ID.
- **List time zones.** List and count time zones, and read one time zone by its ID.

## Before you call it

- **No sign-in needed.** Every Globe call is public, so you can call it without a token.
- **No workspace header.** The data is the same for every workspace, so these calls do not take an `X-TenantId` header.
- **Query the lists.** List and count calls support filtering and paging. See [Filter, sort, and page](~/Web-API-Development/REST-API-Development.md#filter-sort-and-page).

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `GlobeService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

## Countries

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/GlobeService/Countries` |  | Public | Get all countries |
| GET | `/api/v2/GlobeService/Countries/Count` |  | Public | Count countries |
| GET | `/api/v2/GlobeService/Countries/Search` |  | Public | Search countries by name |
| GET | `/api/v2/GlobeService/Countries/{countryId}` |  | Public | Get country by ID |
| GET | `/api/v2/GlobeService/Countries/{countryId}/CallingCodes` |  | Public | Get calling codes for a country |
| GET | `/api/v2/GlobeService/Countries/{countryId}/CallingCodes/Count` |  | Public | Count calling codes for a country |
| GET | `/api/v2/GlobeService/Countries/{countryId}/Currencies` |  | Public | Get currencies for a country |
| GET | `/api/v2/GlobeService/Countries/{countryId}/States` |  | Public | Get states for a country |
| GET | `/api/v2/GlobeService/Countries/{countryId}/States/Count` |  | Public | Count states for a country |
| GET | `/api/v2/GlobeService/Countries/{countryId}/States/{countryStateId}` |  | Public | Get state by ID |
| GET | `/api/v2/GlobeService/Countries/{countryId}/States/{countryStateId}/Cities` |  | Public | Get cities for a state |
| GET | `/api/v2/GlobeService/Countries/{countryId}/States/{countryStateId}/Cities/Count` |  | Public | Count cities for a state |
| GET | `/api/v2/GlobeService/Countries/{countryId}/Timezones` |  | Public | Get timezones for a country |
| GET | `/api/v2/GlobeService/Countries/{countryId}/Timezones/Count` |  | Public | Count timezones for a country |
| GET | `/api/v2/GlobeService/Countries/{countryId}/TopLevelDomains` |  | Public | Get top-level domains for a country |
| GET | `/api/v2/GlobeService/Countries/{countryId}/TopLevelDomains/Count` |  | Public | Count top-level domains for a country |

## Currencies

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/GlobeService/Currencies` |  | Public | Get all currencies |
| GET | `/api/v2/GlobeService/Currencies/Count` |  | Public | Count currencies |
| GET | `/api/v2/GlobeService/Currencies/{currencyId}` |  | Public | Get currency by ID |

## Languages

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/GlobeService/Languages` |  | Public | Get all languages |
| GET | `/api/v2/GlobeService/Languages/Count` |  | Public | Count languages |
| GET | `/api/v2/GlobeService/Languages/{languageId}` |  | Public | Get language by ID |

## Timezones

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/GlobeService/Timezones` |  | Public | Get all timezones |
| GET | `/api/v2/GlobeService/Timezones/Count` |  | Public | Count timezones |
| GET | `/api/v2/GlobeService/Timezones/{*timeZoneId}` |  | Public | Get timezone by ID |

Generated from the source at commit 642fb3c3ad.
<!-- generated:end -->
