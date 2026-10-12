# Blockchains service

The Blockchains service lets you keep your workspace's blockchain records and non-fungible token (NFT) records. These are records only. The service doesn't connect to a blockchain, send transactions or mint tokens.

**Who uses it:** developers who keep a register of the blockchains and NFTs a workspace works with.

**Base route:** `/api/v2/BlockchainsService/...`

## What you can do

- **Keep blockchain records:** create, list, count, read, update and delete the blockchain records of your workspace.
- **Update block records:** patch a block record that belongs to one of your blockchain records.
- **Keep NFT records:** create, list, count, read, update and delete the NFT records of your workspace.

## Before you call it

- **Authentication:** sign in with your email and password to get an access token, and send it as `Authorization: Bearer <token>`. You can also get a token through the OpenID Connect flows in [Connect protocols](~/Capabilities/Alliance-Passport-Service/Connect-protocols.md). See [REST API development](~/Web-API-Development/REST-API-Development.md) for the request basics.
- **Workspace:** send the workspace ID in the `X-TenantId` header, or as the `tenantId` query value, on every workspace call.
- **Permissions:** `blockchains_read`, `blockchains_create`, `blockchains_update` and `blockchains_delete` for blockchain and block records; `non_fungible_tokens_read`, `non_fungible_tokens_create`, `non_fungible_tokens_update` and `non_fungible_tokens_delete` for NFT records.

The full request and response schemas are in the API reference of your instance at `/api/v2/documentation`.

<!-- generated:start -->
> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.

Route segment: `BlockchainsService`. Paths are relative to the API host. Workspace endpoints read the workspace from the `tenantId` request value (for example the query string) or the `X-TenantId` header.

Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner). A row that ends in "or workspace member with a workspace" also works without a workspace; when you send one, the workspace rule and the listed permission apply.

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

Generated from the source at commit 642fb3c3ad.
<!-- generated:end -->
