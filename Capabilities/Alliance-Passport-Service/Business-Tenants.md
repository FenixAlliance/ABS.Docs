---
description: >-
  Create a workspace for your organization. You become its owner, and its currency, country, language and time zone apply to its records.
---

# Business tenants

A workspace holds one organization's records, members and settings. Studio calls a workspace a tenant.

**Who it is for:** anyone who wants to run an organization on Alliance Business Suite.

**Availability:** any signed-in account can create a workspace, in Studio under **Me** > **Tenants**. What each workspace can use depends on your plan.

## Create a workspace

1. In Studio, open **Me** > **Tenants** and select **Create Business Tenant**.
2. Under **Basic Information**, enter the **Business Name** and **Legal Name**. You can also enter a **Handler**, the workspace's short unique name, plus an **Email**, **Tax ID**, **DUNS** number and **Website**.
3. Under **Location**, choose the country and address, then the time zone, language and currency.
4. Select **Save Changes**. Studio opens your new workspace.

You become the workspace's owner. Your membership holds the Business Owner role, which carries the broadest set of permissions in the workspace.

## The workspace currency

Every workspace has a currency, and its carts and documents use it. The workspace takes its currency in this order:

1. the currency you choose when you create it;
2. otherwise, the currency of the country you choose, when that country has exactly one currency;
3. otherwise, the currency of your instance's main workspace.

If none of these gives a currency, the workspace is not created and you are asked to choose one.

## Rules that apply when you create a workspace

- A handler is unique on the instance. If another workspace already uses the handler you enter, creation is refused and you choose another.
- Creating a workspace does not wait for a review. It is ready to use as soon as it is saved.

## Work in more than one workspace

Your account can own or belong to several workspaces. **Me** > **Tenants** lists the workspaces you belong to. Each membership has its own roles and permissions, so you can be an administrator in one workspace and a viewer in another.

To join someone else's workspace, accept their invitation under **Me** > **Invitations**. See [Business users](Business-Users.md).

## Related

- [Alliance Passport Service](../Alliance-Passport-Service.md)
- [Security roles](Security-Roles.md)
