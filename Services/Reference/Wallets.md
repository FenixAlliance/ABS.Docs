<!-- generated:start -->
# Wallets service reference

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
