<!-- generated:start -->
# Blockchains service reference

> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `BlockchainsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).

## Blockchains

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/BlockchainsService/Blockchains` | `blockchains_read` | Workspace member | Get all blockchains |
| POST | `/api/v2/BlockchainsService/Blockchains` | `blockchains_create` | Workspace member | Create a new blockchain |
| GET | `/api/v2/BlockchainsService/Blockchains/Count` | `blockchains_read` | Workspace member | Get blockchains count |
| PATCH | `/api/v2/BlockchainsService/Blockchains/{blockchainId}/Blocks/{blockId}` | `blockchains_update` | Workspace member | Patch a blockchain block |
| GET | `/api/v2/BlockchainsService/Blockchains/{id}` | `blockchains_read` | Workspace member | Get blockchain by ID |
| PUT | `/api/v2/BlockchainsService/Blockchains/{id}` | `blockchains_update` | Workspace member | Update a blockchain |
| PATCH | `/api/v2/BlockchainsService/Blockchains/{id}` | `blockchains_update` | Workspace member | Patch a blockchain |
| DELETE | `/api/v2/BlockchainsService/Blockchains/{id}` | `blockchains_delete` | Workspace member | Delete a blockchain |

## NonFungibleTokens

| Verb | Path | Permission | Who can call | Summary |
| --- | --- | --- | --- | --- |
| GET | `/api/v2/BlockchainsService/NonFungibleTokens` | `non_fungible_tokens_read` | Workspace member | Get all non-fungible tokens |
| POST | `/api/v2/BlockchainsService/NonFungibleTokens` | `non_fungible_tokens_create` | Workspace member | Create a new NFT |
| GET | `/api/v2/BlockchainsService/NonFungibleTokens/Count` | `non_fungible_tokens_read` | Workspace member | Get NFTs count |
| GET | `/api/v2/BlockchainsService/NonFungibleTokens/{id}` | `non_fungible_tokens_read` | Workspace member | Get NFT by ID |
| PUT | `/api/v2/BlockchainsService/NonFungibleTokens/{id}` | `non_fungible_tokens_update` | Workspace member | Update an NFT |
| PATCH | `/api/v2/BlockchainsService/NonFungibleTokens/{id}` | `non_fungible_tokens_update` | Workspace member | Patch a non-fungible token |
| DELETE | `/api/v2/BlockchainsService/NonFungibleTokens/{id}` | `non_fungible_tokens_delete` | Workspace member | Delete an NFT |

Generated from the source at commit 3d7372eed2.
<!-- generated:end -->
