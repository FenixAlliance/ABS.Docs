---
description: >-
  Your account is the identity you sign in with. It is identified by your email address and works across Studio, portals and stores on your instance.
---

# Account holders

Your account is the identity you sign in with, identified by your email address.

**Who it is for:** everyone who signs in to Alliance Business Suite, from workspace administrators to customers of a store or portal.

**Availability:** every instance. The sign-in options you see depend on how your instance administrator has configured it.

## One account per email address

Each email address belongs to exactly one account. You use that email address to sign in, and it cannot be registered a second time, whether through the registration form or through an external sign-in provider.

The same account signs you in to Studio and to the portals and stores that run on your instance. What you can do in a workspace comes from your membership in it, not from the account. See [Business users](Business-Users.md).

## Create an account

1. On the sign-in page, select **Create an account**.
2. Enter your first name, last name, display name, work email and a password, then confirm the password.
3. If someone gave you an invite code, enter it in **Invite code**. It is optional.
4. Select **Create account**.
5. Open the confirmation email and follow its link to confirm your email address.

By default, you confirm your email address before your first sign-in.

## Sign in

1. On the sign-in page, enter your **Email** and **Password**.
2. To stay signed in on this device, select **Keep me signed in on this device**.
3. Select **Log in**.
4. If two-factor authentication is on for your account, enter the code from your authenticator app and select **Verify**.

## Sign-in controls

These controls apply to every way of signing in, including apps that sign you in through the platform.

- **Two-factor authentication.** When you turn on [two-factor authentication](Account-Holders/Multi%252Dfactor-Authentication.md), a correct password is never enough on its own. Every sign-in also needs a code from your authenticator app or one of your single-use recovery codes.
- **Lockout.** Repeated failed sign-in attempts lock the account. The sign-in page then shows **Account temporarily locked**, and you can try again after a few minutes.
- **No account hints.** A wrong email address and a wrong password produce the same message, so the sign-in page never reveals whether an account exists.

## Sign in with a link sent to your email

If your instance administrator turns it on, the sign-in page shows **Email me a sign-in link**. The link signs you in once and expires after a short time. If your account has two-factor authentication on, you still enter your authenticator code after you open the link.

## Sign in with an external provider

Your instance administrator decides which external sign-in providers appear on the sign-in page. Common choices are Google, Microsoft, Apple, GitHub, LinkedIn and Facebook. Each provider appears as a **Continue with** button.

When you sign in with a provider for the first time, you confirm the email address the account will use. An external sign-in never creates a second account for an email address that already has one.

An account created through an external provider has no password. You can add one later from your account settings, so you can still sign in if the provider is unavailable.

## Manage your account

Your account settings let you:

- edit your profile, email address and phone number;
- change or reset your password;
- turn two-factor authentication on or off and generate new recovery codes;
- add or remove external sign-ins;
- sign out.

If you forget your password, see [Password recovery](Account-Holders/Password-Recovery.md).

## Related

- [Alliance Passport Service](../Alliance-Passport-Service.md)
- [Business tenants](Business-Tenants.md)
- [Connect protocols](Connect-protocols.md)
