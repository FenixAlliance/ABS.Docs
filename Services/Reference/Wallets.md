# Wallets service

The Wallets service lets you read a wallet and the business records that flow through it: orders, quotes, invoices, payments, refunds and withdrawals.

**Who uses it:** developers who build account or customer portals that show a wallet's activity.

**Base route:** `/api/v2/WalletsService/...`

## What you can do

- **Read a wallet:** get a wallet's details, including its balance.
- **Follow commercial activity:** list and count a wallet's orders, quotes and invoices, with incoming and outgoing invoices listed separately. Orders, invoices, payments and quotes read through a wallet are shown only to the wallet's owner.
- **Follow money movements:** list and count a wallet's payments, incoming and outgoing, its refunds and its chargebacks, and record a payment on the wallet.
- **Request a withdrawal:** create a withdrawal request, and list and count a wallet's withdrawal requests and withdrawals.
- **Keep wallet details:** manage a wallet's bank accounts, locations and payment tokens.
- **Read your Ether balance:** as a signed-in user, read the Ether balance of your own wallet.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, when you work with a workspace's wallet.
- **Permissions:** `wallets_read` and `wallets_create` for the wallet, its chargebacks and its withdrawals; `orders_read`, `quotes_read` and `invoices_read` for its commercial records; `payments_read` and `payments_create` for its payments and refunds; the read, create, update and delete permissions of `bank_accounts`, `locations` and `payment_tokens` for its details, for example `bank_accounts_read`.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `WalletsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## Me

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/WalletsService/Me/Ethereum/Balance` |  | Signed-in user | Get the current user's Ether balance |

## Wallets

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/WalletsService/Wallets/{walletId}` | `wallets_read` | Workspace member | Get Wallet Details |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/BankAccounts` | `bank_accounts_read` | Workspace member | Get Wallet Bank Accounts |
| POST | `/api/v2/WalletsService/Wallets/{walletId}/BankAccounts` | `bank_accounts_create` | Workspace member | Create Wallet Bank Account |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/BankAccounts/Count` | `bank_accounts_read` | Workspace member | Get Wallet Bank Accounts Count |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/BankAccounts/{bankAccountId}` | `bank_accounts_read` | Workspace member | Get Wallet Bank Account |
| PUT | `/api/v2/WalletsService/Wallets/{walletId}/BankAccounts/{bankAccountId}` | `bank_accounts_update` | Workspace member | Update Wallet Bank Account |
| PATCH | `/api/v2/WalletsService/Wallets/{walletId}/BankAccounts/{bankAccountId}` | `bank_accounts_update` | Workspace member | Patch Wallet Bank Account |
| DELETE | `/api/v2/WalletsService/Wallets/{walletId}/BankAccounts/{bankAccountId}` | `bank_accounts_delete` | Workspace member | Delete Wallet Bank Account |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Chargebacks` | `wallets_read` | Workspace member | Get Wallet Chargebacks |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Chargebacks/Count` | `wallets_read` | Workspace member | Get Wallet Chargebacks Count |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Invoices` | `invoices_read` | Workspace member | Get Wallet Invoices |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Invoices/Count` | `invoices_read` | Workspace member | Get Wallet Invoices Count |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Invoices/Incoming` | `invoices_read` | Workspace member | Get Incoming Wallet Invoices |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Invoices/Incoming/Count` | `invoices_read` | Workspace member | Get Incoming Wallet Invoices Count |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Invoices/Outgoing` | `invoices_read` | Workspace member | Get Outgoing Wallet Invoices |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Invoices/Outgoing/Count` | `invoices_read` | Workspace member | Get Outgoing Wallet Invoices Count |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Locations` | `locations_read` | Workspace member | Get Wallet Locations |
| POST | `/api/v2/WalletsService/Wallets/{walletId}/Locations` | `locations_create` | Workspace member | Create Wallet Location |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Locations/Count` | `locations_read` | Workspace member | Get Wallet Locations Count |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Locations/{locationId}` | `locations_read` | Workspace member | Get Wallet Location |
| PUT | `/api/v2/WalletsService/Wallets/{walletId}/Locations/{locationId}` | `locations_update` | Workspace member | Update Wallet Location |
| DELETE | `/api/v2/WalletsService/Wallets/{walletId}/Locations/{locationId}` | `locations_delete` | Workspace member | Delete Wallet Location |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Orders` | `orders_read` | Workspace member | Get Wallet Orders |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Orders/Count` | `orders_read` | Workspace member | Get Wallet Orders Count |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Orders/Extended` | `orders_read` | Workspace member | Get Wallet Extended Orders |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Payments` | `payments_read` | Workspace member | Get Wallet Payments |
| POST | `/api/v2/WalletsService/Wallets/{walletId}/Payments` | `payments_create` | Workspace member | Create Wallet Payment |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Payments/Count` | `payments_read` | Workspace member | Get Wallet Payments Count |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Payments/Incoming` | `payments_read` | Workspace member | Get Incoming Payments |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Payments/Incoming/Count` | `payments_read` | Workspace member | Get Incoming Payments Count |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Payments/Outgoing` | `payments_read` | Workspace member | Get Outgoing Payments |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Payments/Outgoing/Count` | `payments_read` | Workspace member | Get Outgoing Payments Count |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Quotes` | `quotes_read` | Workspace member | Get Wallet Quotes |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Quotes/Count` | `quotes_read` | Workspace member | Get Wallet Quotes Count |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Refunds` | `payments_read` | Workspace member | Get Wallet Refunds |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Refunds/Count` | `payments_read` | Workspace member | Get Wallet Refunds Count |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Tokens` | `payment_tokens_read` | Workspace member | Get Wallet Tokens |
| POST | `/api/v2/WalletsService/Wallets/{walletId}/Tokens` | `payment_tokens_create` | Workspace member | Create Wallet Token |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Tokens/Count` | `payment_tokens_read` | Workspace member | Get Wallet Tokens Count |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Tokens/{tokenId}` | `payment_tokens_read` | Workspace member | Get Wallet Token |
| PUT | `/api/v2/WalletsService/Wallets/{walletId}/Tokens/{tokenId}` | `payment_tokens_update` | Workspace member | Update Wallet Token |
| PATCH | `/api/v2/WalletsService/Wallets/{walletId}/Tokens/{tokenId}` | `payment_tokens_update` | Workspace member | Patch Wallet Token |
| DELETE | `/api/v2/WalletsService/Wallets/{walletId}/Tokens/{tokenId}` | `payment_tokens_delete` | Workspace member | Delete Wallet Token |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/WithdrawRequests` | `wallets_read` | Workspace member | Get Wallet Withdraw Requests |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/WithdrawRequests/Count` | `wallets_read` | Workspace member | Get Wallet Withdraw Requests Count |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Withdraws` | `wallets_read` | Workspace member | Get Wallet Withdraws |
| POST | `/api/v2/WalletsService/Wallets/{walletId}/Withdraws` | `wallets_create` | Workspace member | Create Wallet Withdraw Request |
| GET | `/api/v2/WalletsService/Wallets/{walletId}/Withdraws/Count` | `wallets_read` | Workspace member | Get Wallet Withdraws Count |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
