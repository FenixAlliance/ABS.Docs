# Notifications

*Deciding who to tell, on which channel, under whose preferences.*

Most systems treat a notification as a send. Something happens, an email goes out, and nobody can explain afterwards why one person got three copies and another got none. ABS separates the two questions that actually matter: **who should hear about this**, and **how does it reach them**. Everything else follows from keeping those apart.

## Why it exists

A business event rarely concerns one person. An invoice is raised and the finance team, the record owner and the person who asked for it all have a claim on knowing. Answer that carelessly and you get the two failure modes everyone recognises: the same human notified four times because they matched four rules, or silence because nobody was quite sure who to tell.

The harder problem is that a notification is a **disclosure**. Telling somebody that "Invoice 443 was rejected" tells them the invoice exists, who it was for, and that it was rejected. Getting the audience wrong is not a nuisance, it is a data leak with a friendly subject line.

## What it is

A decision layer that sits above delivery. When something notable happens, ABS works out the audience, checks what each person is allowed to see, applies their preferences, removes duplicates, and only then delivers.

Today it reaches people two ways:

- **In the app.** A notification lands in the recipient's inbox in Studio.
- **By email.** A message is sent through your configured mail service.

Additional channels are a deliberate future step rather than a hidden switch. What is here works end to end.

## How it works

**Someone qualifies once, not once per reason.** If the same person is the record owner, holds the permission, and follows the record, they are one recipient with three reasons, not three recipients. The reasons are kept, because they explain the message; they never multiply it.

**Visibility is checked, not assumed.** A person only hears about something they are allowed to see. The audience is intersected with who may actually read the underlying record, so a notification cannot become a side channel around a permission.

**Preferences are honoured, in a defined order.** Platform, workspace policy, workspace default, your membership of that workspace, and your personal settings each get a say, in that order. Categories declared mandatory, such as security and legal notices, cannot be switched off, and the interface says so rather than silently ignoring the setting.

**People who ask to stop, stop.** An unsubscribe or a permanently failing address suppresses future delivery to that address, independently of who the person is.

**The person who caused it is not told about it.** Acting on a record does not generate a notification to yourself about your own action, unless a rule deliberately asks for a receipt.

## Knowing why somebody was not told

Every recipient and channel produces a recorded decision, whether the answer was yes or no. That makes the awkward question answerable: *why did this person not get it?*

The answer distinguishes cases that look identical from outside. Somebody may have been evaluated and denied, on policy or preference. Or nobody was ever evaluated, which is not a preference problem at all and needs an administrator rather than a settings change. The distinction is deliberate, because "no reason found" and "never asked" are very different situations and only one of them is a conversation about preferences.

## Setting your preferences

Two surfaces in Studio, and which one you want depends on whose settings they are:

- **Your own preferences**, per category and channel. Categories that belong to a workspace are shown in the workspace context rather than mixed into personal settings.
- **Workspace policy**, for administrators, setting what members receive by default and which categories a workspace permits at all.

A setting you cannot change is shown as locked with the reason, rather than appearing editable and then being overruled somewhere you cannot see.

## What it does not do yet

Stated plainly, because an accurate boundary is more useful than an optimistic one:

- **Mobile push, web push and SMS** are not available. Only in-app and email deliver today.
- **Delivery feedback from your mail provider**, such as bounce and complaint handling, is modelled but not yet connected to a live provider. Suppression works from unsubscribes and from failures ABS observes itself.
- **Email is sent under the platform's sending identity.** Per-workspace sending domains are a later step.

## How it integrates

Notifications react to business activity through the same canonical [business model](~/Capabilities/Alliance-Business-Model.md) everything else uses, so a rule is written against a business event rather than against a module's internals. Delivery reaches your configured mail service, and the platform records what was sent so it can be reconciled afterwards.
