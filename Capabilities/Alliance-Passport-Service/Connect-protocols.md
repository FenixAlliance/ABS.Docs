---
description: >-
  Reference for the OAuth 2.0 and OpenID Connect flows, endpoints, scopes and token lifetimes that apps use to sign people in to Alliance Business Suite.
---

# Connect protocols

Alliance Passport Service is an OAuth 2.0 and OpenID Connect authorization server. Your apps use it to sign people in and to call the platform's APIs on their behalf.

**Who it is for:** developers who build web, mobile, desktop, command-line or AI apps that connect to Alliance Business Suite.

**Availability:** every instance. A workspace administrator registers each app in Studio, which requires the Create OAuth applications permission.

## Supported flows

| Flow | Use it for |
|---|---|
| Authorization code with PKCE | Web, mobile, desktop and single-page apps where the person signs in through a browser. This is the recommended flow. |
| Device authorization | Apps on devices without a convenient browser, such as command-line tools. The person approves the sign-in on another device. |
| Refresh token | Getting a new access token without asking the person to sign in again. Request the `offline_access` scope to receive one. |

The implicit flow is not offered. The authorization endpoint also accepts the hybrid flow for apps that already depend on it.

### Rules every client follows

- **Always use PKCE, with S256.** The `plain` method is refused. Your administrator can require PKCE for every app or for your app's registration.
- **Sign-in controls always apply.** The person signs in on the platform's own sign-in page, so two-factor authentication, lockout and external providers work as they do in Studio.
- **Two-factor accounts need a browser flow.** The password grant has no second-factor step, so it refuses every account with two-factor authentication on, with the same error a wrong password gives. Use the authorization code flow instead.
- **Prefer the authorization code flow for new apps.** The password grant also exists for accounts without two-factor authentication, but use the authorization code flow for any new app.

### Machine-to-machine sign-in

From 2.4, machine-to-machine sign-in is turned off. The client-credentials endpoint `POST /api/v2/OAuth/Token` is off by default, and the platform has no other way yet for a service to sign in without a user. If your integration signs in as a service, contact us before you upgrade. See the [changelog](../../reference/Changelog.md).

## Endpoints

Replace `https://<your-instance>` with the address of your Alliance Business Suite instance.

| Endpoint | Address |
|---|---|
| Discovery document | `https://<your-instance>/.well-known/openid-configuration` |
| Authorization | `https://<your-instance>/connect/authorize` |
| Token | `https://<your-instance>/connect/token` |
| User information | `https://<your-instance>/connect/userinfo` |
| Sign-out | `https://<your-instance>/connect/logout` |
| Device authorization | `https://<your-instance>/connect/device` |
| Device verification | `https://<your-instance>/connect/verify` |
| Token revocation | `https://<your-instance>/connect/revoke` |

Read the discovery document at start-up instead of hard-coding addresses. It lists the endpoints, flows, scopes and signing keys your instance uses.

AI assistants that connect through the Model Context Protocol find the authorization server from `https://<your-instance>/.well-known/oauth-protected-resource/mcp`.

## Scopes

| Scope | What it gives your app |
|---|---|
| `openid` | Signs the person in and returns an ID token. |
| `profile` | The person's basic profile, such as their name. |
| `email` | The person's email address. |
| `roles` | The person's roles. |
| `offline_access` | A refresh token. |
| `abs_api` | Access to the platform's APIs. |

An access token is always limited to what the person's membership grants in the workspace you call. A token can narrow that access but never widen it. See [Business permissions](Business-Permissions.md).

## Token lifetimes

These are the defaults. Your instance administrator can change them.

| Token | Default lifetime |
|---|---|
| Access token | 60 minutes |
| ID token | 60 minutes |
| Refresh token | 14 days |
| Authorization code | 5 minutes |
| Device code and user code | 15 minutes |

To end access early, revoke the refresh token at the revocation endpoint. A revoked refresh token is refused when it is presented again.

## Register an app

A workspace administrator registers your app in Studio, under the workspace's **Security** > **OAuth Apps**. Registration records:

- the **Client ID** that identifies your app, and a **Client Secret** for apps that can keep one confidential;
- the **Redirect Uris** the authorization server may send the person back to;
- the **Permissions**, which control the endpoints and flows the app may use;
- the **Requirements**, such as PKCE;
- the **Consent Type**, which decides whether the person sees a consent screen.

| Consent type | What the person sees |
|---|---|
| Explicit | A consent screen the first time, and again when the app asks for it. |
| Systematic | A consent screen every time. |
| Implicit | No consent screen. Use it only for your organization's own apps. |
| External | No consent screen. An administrator approves the app in advance, and sign-in is refused until they do. |

The workspace's Security module also lists the authorizations people have given to each app.

## Keep tokens safe

Access and refresh tokens are bearer tokens: whoever holds one can use it. Send them only over HTTPS, keep them out of URLs and logs, and store them in the device's secure storage. Treat access tokens as opaque values and do not parse them in your app.

## Related

- [REST API development](../../Web-API-Development/REST-API-Development.md)
- [Account holders](Account-Holders.md)
- [OAuth 2.0 specification](https://datatracker.ietf.org/doc/html/rfc6749)
- [OpenID Connect Core specification](https://openid.net/specs/openid-connect-core-1_0.html)
