# Application filters

*What the platform handles before your code runs, and what stays yours.*

Your module never sees a raw, anonymous request. By the time your code runs, the platform knows who's calling, which tenant they're in, and what they're allowed to do.

## What happens first

For any request into a module screen or endpoint:

1. **Authentication.** The caller is identified, and anonymous Studio requests get sent to sign in
2. **Tenant resolution.** The tenant they're acting in is resolved and handed to your module
3. **Entitlement.** The modules that tenant is entitled to are resolved, which decides what's reachable
4. **Authorization.** Their permissions in that tenant are attached to the request

Your code then runs with all four already in place. Don't re-authenticate, don't resolve the tenant, and don't look up permissions from scratch.

## Entitlement and permissions do different jobs

> **Important:** Entitlement is not authorization. It controls the Studio catalogue and which screens are routable. It does not gate HTTP endpoints, and your module's endpoints are served whether or not the calling tenant is entitled to your module.

Protect any endpoint that needs restricting with a permission check inside the endpoint. Never reason that only entitled tenants have your module, so only they can call it. That inference is false, and it's the most common security mistake people make with this model.

Entitlement answers which product a customer bought. Permissions answer what this person can do.

## Declare permissions, and let the platform enforce them

Your module declares what permission each operation needs. The platform enforces it as the operation runs, on every call, from every surface it's reachable through.

Two properties follow:

- **Checks are live, not cached.** A permission revoked while a long process is suspended takes effect when that process resumes
- **A denied operation fails closed.** It stops visibly instead of being skipped quietly, partially applied, or escalated to make it succeed

Fail-closed matters most in automation, where nobody's watching. A workflow step the runner can't perform stops the workflow, which is the outcome you want.

## Let the platform scope your data

Your module sees one tenant's data, enforced by the platform's data access rather than by your queries.

Reach for the platform's scoped access path instead of writing a tenant condition yourself. The platform's version stays correct as the model evolves. Yours becomes a bug the day something underneath it changes.

> **Note:** Fetching a record directly by its identifier is the classic way tenant scoping gets bypassed by accident, because the identifier looks like enough on its own. Fetch through the scoped path even when you already hold an ID you're confident belongs to your tenant.

## Use a real identity for unattended work

Scheduled jobs, background processing, and reactions to outside messages all run with no user present. The platform gives you a dedicated non-human identity for these.

- **Use it rather than borrowing a user's.** Reusing whoever happened to trigger something attributes actions to a person who didn't perform them, and hands your background work whatever that person could do
- **Ask for the narrowest permissions that work.** Non-human identities start with no authority at all
- **Resolve identity fresh on each run.** Re-resolving is what makes a revoked permission actually take effect

Everything a non-human identity does is audited under that identity, so "which process did this, and under whose authority?" always has an answer.

## Design external effects for safe retry

An operation that changes something in another company's system sits under a higher standard, because a bad retry can't be rolled back. Charging a card. Dispatching a shipment. Sending a legally significant document.

> **Important:** Such an operation needs a way to guarantee that repeating a call can't repeat its effect. Without that guarantee it won't run automatically, and approval doesn't bridge the gap. A human saying yes doesn't make a duplicate charge acceptable.

Build this in from the start. It decides whether your operation can take part in automation at all.

## Handle incoming messages idempotently

When your module accepts notifications from a third party, the platform covers the parts that are easy to get wrong:

- **Authenticity is verified** before the message does anything, where the provider signs its notifications
- **Duplicates are rejected** by a de-duplication guarantee in the database
- **Messages are stored on arrival**, before processing starts, so nothing is lost to a failure or a restart
- **Failures are classified.** Transient ones retry on their own. Permanent ones stop and get recorded

Deciding what the message means stays yours. Make your handler safe to run more than once, because delivery to your handler is at-least-once even though duplicates get filtered upstream.

## Who does what

| Concern | Platform | Your module |
|---|---|---|
| Authentication | Yes | |
| Tenant resolution and scoping | Yes | Use the scoped access path |
| Entitlement of screens | Yes | |
| Endpoint authorization | | Declare and check permissions |
| Permission enforcement | Enforces | Declares what's required |
| Audit | Yes | |
| Non-human identity | Provides | Use it rather than a user's |
| Safe retry of external effects | Requires and gates | Provide the guarantee |
| Meaning of an incoming message | | Yes |

## Related

- [Application parts](~/Module-Development/Application-Parts.md) covers what you can contribute
- [Application areas](~/Module-Development/Application-Areas.md) covers claiming names, paths, and assets
