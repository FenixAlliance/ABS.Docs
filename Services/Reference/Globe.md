<!-- generated:start -->
# Globe service reference

> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `GlobeService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

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

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
