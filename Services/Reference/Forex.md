# Forex service

The Forex service lets you read currency exchange rates and convert an amount from one currency to another, at the latest rates or at the rates of a past date.

**Who uses it:** developers who show prices or totals in several currencies, or who need past rates for reporting.

**Base route:** `/api/v2/ForexService/...`

## What you can do

- **Read the latest rates:** get the latest rates of every supported currency, or of one currency.
- **Read past rates:** get the rates of a specific date, for every currency or for one currency.
- **Read a rate series:** get one currency's stored daily rates, in units per US dollar, over a date range of at most 400 days. Days without a stored rate are left out.
- **Convert an amount:** exchange an amount from a source currency to a target currency at the latest rates, or at the rates of a date you choose.

## Before you call it

- **Sign-in:** every Forex endpoint is public and needs no sign-in and no workspace.
- **Currencies:** identify a currency by its currency ID, for example `COP.COL`.
- **Versions:** the conversion endpoints are also served under `/api/v3/ForexService/Exchange/...`.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
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
