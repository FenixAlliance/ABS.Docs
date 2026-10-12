<!-- generated:start -->
# Forex service reference

> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `ForexService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## Exchange

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ForexService/Exchange/History` |  | Public | Exchange an amount of money from one currency to another using historical rates. |
| GET | `/api/v2/ForexService/Exchange/Latest` |  | Public | Exchange an amount of money from one currency to another. |

## ExchangeV3

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v3/ForexService/Exchange/History` |  | Public | Exchange an amount of money from one currency to another using historical rates. |
| GET | `/api/v3/ForexService/Exchange/Latest` |  | Public | Exchange an amount of money from one currency to another. |

## Rates

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/ForexService/Rates/History` |  | Public | Get the currency rates of a specific date. |
| GET | `/api/v2/ForexService/Rates/History/{currencyId}` |  | Public | Get the currency rate of a specific currency for a specific date. |
| GET | `/api/v2/ForexService/Rates/History/{currencyId}/Series` |  | Public | Get a currency's stored daily rates over a date range. |
| GET | `/api/v2/ForexService/Rates/Latest` |  | Public | Get the latest currency rates. |
| GET | `/api/v2/ForexService/Rates/Latest/{currencyId}` |  | Public | Get the latest currency rate for a specific currency. |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
