# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

> Releases through **`2.0.0` LTS** were recorded contemporaneously. Subsequent releases were compiled from the project's development history and follow the same conventions.
>
> **About the release numbers.** From 2.1.2 (2026-10-02), release numbers are semantic versions, and each release is tagged when it is published. The sections marked *Product release* (2.1.0 to 2.8.0, from 2023 to 2026) used the earlier product release numbers. They are kept as they were, and their numbers do not match the package versions.


### Eras at a glance

- **[The foundation, 1.0.0 to 1.9.0](#100x---2020-12-31)**: a multi-tenant, modular platform takes shape, with portals, web content authoring, workflows and commerce.
- **[2.0.0 LTS](#200-lts---2022-08-11)**: the first long-term-support release, with Studio management engines and licensing.
- **[The re-architecture, 2.1.0 to 2.8.0](#product-release-210---2023-12-20--platform-re-architecture)**: Clean Architecture and CQRS, REST and OData service clients, new business services, and .NET 8 through .NET 10.
- **[The composable platform, 2.1.2 onwards](#212---2026-10-02-the-composable-platform)**: governed AI, workflows, trust and commerce, documented as each capability ships, under semantic version numbers.

## [2.8.0] - 2026-11-06

This is the semantic version 2.8.0. It is not the earlier *Product release 2.8.0* further down this page.

### Added

- **Connect Claude or ChatGPT to Alliance Business Suite.** An AI assistant can now connect to your account over the Model Context Protocol (MCP) at `https://absuite.net/mcp`. You sign in yourself and approve the connection; the assistant never sees your password. The assistant acts within your own permissions and the access you approved, in the workspace each request names, and only within what that workspace allows AI to do. Connecting is switched on shortly after this release goes live, and we will announce it. See [Connect an AI assistant over MCP](../Online-Services/Agents/Connect-AI-Assistants-over-MCP.md).
- **Choose what AI may do in each workspace.** Every AI action now belongs to an effect class, such as reading or creating records. A new workspace starts with AI allowed to read and create, and every other effect class off. A workspace that existed before 2.8.0 keeps working as before: AI may read, create and change records until a workspace administrator turns changing off. Exporting and publishing are off in every workspace until an administrator turns them on. A workspace administrator can turn the others on.
- **Choose which MCP tools each agent may use.** A workspace administrator now grants an agent the tools of an MCP connection one by one. An agent is offered only the tools it was granted.
- **The `absuite` command line.** The command line is now called `absuite`, and it reaches every service: `absuite <service> <resource> <verb>`. It can read, create, update and delete records, with a dry run and a typed confirmation before a delete. Scripts get stable output (`-o json`, `jsonc`, `table`, `tsv`, `yaml` or `none`, and `--query` with JMESPath), stable exit codes, and `--no-input` for unattended runs. `--verbose` and `--debug` never print a secret.
- **Shipping costs from your shipping zones.** A shipment is now priced from the shipping zone that matches its destination (postcode, then country or region, then an Everywhere zone, then the Default zone), the zone's method, the item's shipping class and its shipping policies, in the order's currency. Workspace administrators can set a zone's methods and regions, a region's countries and a method's class costs.
- **Saved Analytics reports.** You can save an Analytics Explorer view as a workspace report, and open, rename and delete it later.
- **Reply on a support ticket.** You can reply on a support ticket's conversation as yourself. The View action on the Helpdesk lists now opens a read-only details page.
- **Social notifications.** You are told when someone comments on, replies to, reacts to or mentions your content, as long as you can read it.
- **Connect Facebook, Instagram and LinkedIn.** Social accounts connect through the same sign-in flow as the other integrations, and a connected account can be added to a draft post.
- **Course completion.** An enrollment can be completed, and issuing a completion certificate completes it.
- **Your own licenses.** A signed-in member can list the licenses they hold in a workspace.
- **A live payments kill switch.** An administrator can pause live payment collection at once. The platform checks the switch every few seconds, and if it cannot read it, it does not collect.
- **Electronic invoicing (DIAN).** A signed electronic document is sent to the tax authority through one queue. The platform asks the authority for the document's status before every send, retries a limited number of times, and raises an alert when it stops retrying.
- **Edit Office documents in the browser with Collabora.** You can open Word, Excel and PowerPoint files stored in your workspace and edit them in the browser with Collabora Online, either the platform's editor or a Collabora server your workspace connects. Each save keeps the previous version. Editing is available once an editor is enabled for your environment. OnlyOffice and Microsoft editors come in 2.9.
- **Japanese and Chinese.** Studio and the customer portals are now available in Japanese and Chinese (Simplified), alongside English, Spanish, French, German, Italian and Portuguese. Any text not yet translated falls back to English instead of showing an internal key. Emails are sent in Japanese and Chinese too.
- **For self-hosted operators: a license is bound to its installation.** Each self-hosted installation now has its own Installation ID. The installer creates it and shows it during setup. Use it when you buy a license, and you can enter the license in the installer's last step. A license issued for one installation works only on that installation, and earlier versions refuse it, so upgrade to 2.8.0 before applying a new license. Restoring or cloning a database carries its Installation ID with it, and the copy counts as the same installation. The binding stops copying a license between installations; it is not a substitute for the license terms. If you use the hosted service, nothing changes.
- **Use your own OAuth application for an integration or an MCP server.** Workspace administrators can use their own OAuth application for an integration provider or an MCP server, so the sign-in screen and limits are your workspace's. The client secret is stored encrypted and never shown again. Changing or removing the application asks everyone connected to that provider to connect again.
- **Refund a payment from its details page.** A payment's details page now lists its provider operations (collections, refunds and voids) with their status and amount. A person with the refund permission can refund a succeeded collection in full from there, after a confirmation that shows the amount. Studio says a refund is done only once the provider confirms it; until then it shows that the refund was sent and is awaiting the provider. If a refund can't be made (for example, one is already in progress, or the collection was cancelled), it explains why in plain words. Refunds are always for the full amount of one collection; partial refunds are not available. A refund is made by a person in Studio, not by an integration or an agent. Find it in Accounting > Billing > Payments, or Wallet > Payments, then open a payment.

### Changed (please read)

- **A refund or chargeback withdraws a course.** When a course payment is fully refunded or charged back, the enrollment and its completion certificate are revoked, and the reason is recorded.
- **Invoice adjustments are typed as percents.** The adjustment columns and fields read "Discount %" and "Surcharge %", and you type 15 for 15%. A value outside 0% to 100% is refused.
- **A deleted workspace is closed at once.** When a workspace is deleted, its members, applications and agents are refused, the tokens of its connected applications are revoked, its subscriptions stop and its open invoices are voided.
- **Changing someone's sign-in signs them out.** When an administrator edits a person's sign-in details, that person is signed out everywhere, and the change is recorded.
- **Some lists now need their read permission.** Course content and enrollments, knowledge articles, warranty, return and refund policies and ticket priorities each need their own read permission. Members and viewers keep reading them. Creating, editing and deleting ticket priorities still needs the ticket permissions. For custom roles, see Known issues.
- **Approvals.** Nobody approves their own agent export, agent publish, payment, invoice request or project hours, and a deadline that passes never approves anything.
- **A cart refuses mixed currencies.** A cart refuses an item priced in another currency, and checkout refuses an item that is no longer available.
- **For self-hosted operators: open the gate before you re-drive expired mail.** If you re-drive a dead-lettered mail message that expired while its gate is still held, it goes back to the dead-letter queue. Open the gate first, then re-drive.
- **Archiving a workflow version doesn't stop runs already in flight.** Runs that started on that version keep going. If they must stop, cancel them.
- **Marketplace sellers pay no commission.** Marketplace sellers pay no platform commission in 2.8.0: the rate is 0%. The commission is now a dated platform setting that the platform operator controls, never a workspace; self-hosted operators set it in the ABP Commerce settings (`ABP:Commerce:MarketplaceCommissionRates`). Any rate above 0% applies only to orders placed at least 60 days after sellers are notified, and it never re-prices an earlier order. Seller payouts are not automated yet; they come in 2.9.
- **Every Marketplace seller invoices under its own DIAN identity.** To sell, a seller needs its own electronic-invoicing identity with the tax authority (DIAN). An order line from a seller without one is refused at checkout, and again if an invoice is issued, and the platform never invoices it under its own identity.
- **Prices show the IVA before you pay.** Plan, add-on and AI credit pack prices now show the 19% IVA and the total you will pay before you confirm, and that total is exactly what the invoice charges. IVA applies to workspaces in Colombia and to workspaces with no confirmed country; a workspace whose confirmed country is outside Colombia is billed as an export, with no IVA.
- **Electronic-invoicing records are kept.** A workspace that holds issued invoices, claimed invoice numbers, documents sent to the tax authority (DIAN), posted ledger entries or payments cannot be permanently deleted while they must be kept: the platform administrator who tries is told why, and nothing is deleted. The documents exchanged with DIAN, including the signed invoice and DIAN's response, are also kept for at least 10 years from 1 January of the year after they were stored. Removing a person's data works as before.
- **Paid plans now include the business modules.** Every paid plan (Starter and up) includes the horizontal modules, such as Accounting, Marketing, Projects and Helpdesk, and plans still differ by seats, usage and AI. If you already pay for a plan, its modules turn on at once. Free workspaces keep the modules they have today.

### Improved

- Deleting a shipping method, courier, warehouse or packing slip that other records still use is refused with a clear message, instead of a database error.
- Database search ranks results by relevance (BM25).
- Portal pages render with fewer database reads, and a portal address with or without `www` reaches the same portal.
- Studio: percent fields show the percent you typed, the business switcher and the account home grid work as expected, grids stack on a phone in dark mode, and a list that fails to load shows a plain sentence instead of error text. The storefront cart shows a message instead of failing when a cart call fails.
- A deleted CRM contact's activities leave search.
- **Workflows keep their run settings after a wait.** A durable workflow that resumes after a delay, a user task or an approval now keeps its run settings, so the steps after the wait behave as they did before it. A governed step after a Delay step now runs when the Delay's timer resumes the workflow, and every pass records its step history.

### Security

- Links the platform sends, such as signing invitations, always use the platform's configured address, never one taken from the incoming request.
- An MCP request acts only in the workspace it names and never falls back to another one, and an MCP token is refused by the REST and GraphQL APIs.
- A platform-managed application can be changed or removed only by a platform administrator.
- Records that point at other records (HR approvals, appraisals, leave, payroll, invoice price lists and shipping locations, communication session rosters) accept only records from your own workspace.
- Follow lists show only profiles you are allowed to see.
- **License lists no longer return the signed license file.** In 2.7.0 to 2.7.4, the licenses API returned each legacy license's signed license file, which includes the license holder's name and email address. Only members of the same workspace with permission to read licenses could see it, plus the AI agents and MCP clients of a workspace that had turned on the license-listing AI capability (off by default). It was never visible outside the workspace, no Studio screen showed it, and the file can't be used to activate anything. No action is needed.
- **Delivery tracking no longer stores plain email addresses.** Email addresses kept for delivery tracking and suppression are now stored as keyed digests, using a key only the operator holds, instead of a plain hash. A delivery log on its own can no longer be matched back to an address. Nothing changes in how email is sent or received. Self-hosted operators turn it on by setting `ABSUITE_ADDRESS_DIGEST_HMAC1` to 32 random bytes in base64 (a Key Vault reference in Azure), then running the one-time back-fill with `ABSUITE_ADDRESS_DIGEST_BACKFILL_ENABLED=true`. Until a key is set, the platform keeps using the previous digest, so nothing breaks.
- Alert text in system emails is always HTML-encoded, so markup in an alert shows as text.
- **Portal pages and templates never see the portal's secrets.** Portal pages, layouts and custom templates now receive a public-only copy of the portal and its settings. The portal app's keys, access tokens and integration secrets are never available to a page or template. A site address that no portal claims now shows the basic site shell instead of an error, and the account recovery and sign-out pages work on any address. If a custom template read a portal key or token from the settings, it now gets an empty value; move that logic server-side.
- **For self-hosted operators: only the root workspace authors code templates.** Code templates (Razor and C#) can now be written and compiled only by the human owners and administrators of the root workspace. Every save and first compile is audited. A `CodeAuthoringTenantIds` entry for any other workspace is ignored, with a warning at startup. Code templates already saved in other workspaces are no longer compiled; they render as static, sanitized content.

### Known issues

- **Connecting an AI assistant is not on at launch.** MCP connections open shortly after 2.8.0 goes live. Until then, `https://absuite.net/mcp` does not answer.
- **Self-registration for other MCP clients is off at launch.** Other MCP clients (Cursor, VS Code and others) can register themselves once dynamic registration is switched on; we will announce it.
- **Custom roles and the Support lists.** A custom role that read knowledge articles, warranty, return or refund policies or ticket priorities before 2.8.0 may see "not authorized" on those lists and their Helpdesk details pages until we restore its access. To fix it now, a workspace administrator grants the role the matching read permission: KnowledgeArticles.Read, WarrantyPolicies.Read, ReturnPolicies.Read, RefundPolicies.Read or SupportTicketPriorities.Read.
- **Grok** cannot connect yet.
- **Connecting outside MCP servers to your agents** from Studio is not open yet. Tool grants work for connections that already exist.
- **Renewals with a saved card** still need the buyer to pay. Charging a saved card automatically is prepared but no payment provider supports it yet.

## [2.7.4] - DATE-WHEN-LIVE

### Added

- **See a payment's provider operations.** Staff who can view payments now see each payment's operations with the provider (collection, refund and cancellation), with their status, amounts, provider reference and times. Internal identifiers and raw provider data are not shown.

### Security

- **Payment provider keys are stored encrypted.** From this release, keys you save in Studio for any payment provider are always stored encrypted. This covers Mercado Pago, Wompi, Stripe, PayPal, PayU, ePayco, Amazon Pay, Amazon, American Express, Mercado Libre, Airwallex, Authorize.Net, Braintree, Mastercard, Visa, OpenPay, Nequi and Skrill. If encryption is not available, the save is refused and Studio shows an error. Keys saved before this release stay as they were stored; saving them again applies the new rule.
- **One set of keys per payment provider.** From this release, each payment provider keeps exactly one saved set of keys per workspace. If a workspace has two, payments through that provider are paused and nothing is charged, and the provider's settings page in Studio asks an administrator to remove the extra set. Payments resume as soon as it is removed. The platform no longer picks one of the two at random.

## [2.7.2] - DATE-WHEN-LIVE

### Added

- **Erase your account.** You can now erase your own account from Me > Settings > Erase your account. You confirm it, you are signed out at once, and you have 14 days to change your mind with the cancel link we email you. A platform administrator can also erase a user's account. Erasing removes or anonymises the person's data across the platform: profile and sign-in, contacts and inquiries, social posts and messages, wish lists, AI chats, files, emails and newsletters, task assignments, licence seats and saved payment details. Open tasks pass to a workspace manager or are marked for reassignment, approvals waiting on the person wait for a new approver, and a plan seat they held moves to another active owner. What the law requires is kept: issued invoices and receipts, electronic documents already sent to the tax authority, and posted accounting entries. Where kept content is still shown, such as a blog post, a review or a message, the author appears as "Deleted user".
- **A "Free" badge for free courses.** Courses with a price of 0 show a Free badge in Studio, and Studio asks you to confirm before you save a course as free.

### Changed (please read)

- **Removed workspaces leave your list.** Workspaces you have been removed from no longer appear in your workspace list or switcher, and the pickers no longer show an "Enabled" column.
- **Deleting an application keeps its history.** Deleting an application that has acted as a member of your workspace now disables it and keeps its history, instead of removing it.
- **Files opened by their link.** Inside a workspace, a file opened by its link is shown only when it is a kind of file that can be shared that way and you have permission to read that kind of record. Other files are reached through the record they belong to.
- Subscriptions are not renewed or charged while the paying person's account is suspended or waiting to be erased.
- A few unfinished API endpoints (margin details, tracking pixels and a hosting webhook) now answer "not implemented" instead of an empty success.

### Improved

- Public portal and store pages load faster: working out which site a visitor is on takes far fewer database reads, and visitor location lookups are remembered for a few minutes and skipped for crawlers.
- The Workforce pages in Studio (employees, appraisals, leave, payroll and more) use the same page layout and title bar as the rest of Studio.
- Removing a banner creative keeps its views and clicks in the banner set's performance totals.
- The API documentation states the page-size limit, at most 120 rows per page, so generated SDKs can check it before they call.

### Fixed

- The Google Merchant product feed sends correct product links, uses Google's stock values and leaves out products without an image, so Google stops rejecting items.
- Editing an order in Studio no longer breaks its link to the original cart.
- On invoices in another currency, the remaining balance in US dollars is correct after payments are applied.
- The public course catalog no longer shows courses from workspaces that have been closed.
- The first time an installed application runs a workflow in your workspace, it completes instead of failing.
- If an AI assistant can't load the earlier messages of a conversation, it says so and asks you to try again, instead of answering without context. No usage is counted for that run.
- Time intervals, shifts and training events can no longer be made their own parent or placed in a loop.
- A purchase that can't be paid online is refused before anything is created.

### Security

- Signing in to a closed, suspended or pending-erasure account gives the same answer as a wrong password, and erasure pages are never cached by the browser.
- Sign-in, sign-up and password recovery reject a CAPTCHA answer taken from another page or site.
- A person who was removed from a workspace and rejoins comes back as a regular member, without their old rights.
- Disabling an application stops its scheduled runs and agents at once.
- Records can only reference your own workspace's data: accounting records (commissions, journals, cost centres, account groups, bank accounts), invoice line taxes (your own or the platform's standard tax policies), item categories, item images and attachments, contacts, web pages, blog posts, menus, course certificate templates, social post attachments, and industries and territories. Parent records can no longer form a loop.
- When a payment is recorded, the paying and receiving wallets and the location data are filled in by the platform, never taken from the request.
- Editing an invoice can no longer redirect it to another payer's wallet, and a bank account can be linked to a wallet only by the wallet's owner.
- An order's buyer and exchange rate can no longer be changed through an order edit, and an order's receiver can be changed only by the issuer while the order is new and not yet invoiced.
- Sellers can start a subscription only on a plan that is published and still available.
- Payment details no longer show a fraud score, which the platform never calculated.
- Redeeming a licence needs the licence-management permission, and licences signed with an old development key are no longer accepted.
- A custom AI tool server address can't contain a query string, so keys can't hide in it, and other managers see the address without it.
- The public document-signing page shows only clear, expected messages when something goes wrong.
- New charts of accounts are seeded from a fixed, verified catalog file.
- Analytics CSV downloads neutralise spreadsheet formulas even behind leading spaces.
- Smaller hardening: payment provider settings can't point at protected platform credential storage, social post images carry an extra browser safety header, and after uploading an item's main image you are only sent back to a page on this site.

### Coming next

- **Paying by card for a plan or an AI credit pack in the app.** Card payment opens in a later update.
- **Your own AI tool servers (MCP)**, connected by their web address, for workspace managers.
- **Pausing an agent schedule and seeing its run history**, and scheduled agents that keep one conversation across their runs.
- **Approvals for agents acting on your personal connected accounts**, seen and decided only by you.
- **DIAN checks before an electronic invoice is signed**: missing party details and numbering ranges are checked first.

## [2.7.1] - 2026-10-22

### Added

- **A monthly AI budget on every plan.** Each plan now includes a monthly budget for the AI that Alliance Business Suite pays for: Free USD 1, Starter USD 8, Growth USD 25, Professional USD 40 and Business USD 80. It is one shared pool for the whole workspace, and anyone without a personal limit can use the whole pool. Annual plans get the same monthly figure for every month. AI does not stop at the budget yet (see Coming).
- **Your own AI limits, on the usage page.** Each person sees what is left of their AI for the session, the week and the month, and of the workspace pool.
- **Demo and internal plans.** Fenix Alliance can give a workspace a Demo plan or an Internal plan without a sale, and remove it. A workspace on such a plan cannot buy AI credit packs.
- **Module access for a set time.** When Fenix Alliance gives your workspace access to a module, the grant has a term: a Demo lasts the days set on it (30 by default, up to 90), and an Internal grant lasts until it is removed.
- **Courses in a collection, from Studio.** The course collections list has a Courses action to see, add and remove a collection's courses.
- **A daily limit for agent web reading you can change.** Reading web pages is now counted per workspace per day, and you can set the daily limit within the platform's ceiling. If the count can't be read, the reading stops instead of running unchecked.
- **Daily limits per agent capability.** In Nucleus Web, a workspace manager can set how many calls per day an agent capability may make, wherever the platform counts them.
- **Accounting home at a glance.** The Accounting home shows the current fiscal period and how many postings are waiting for attention, with a link to each.
- **Download CSV in the Analytics explorer.** After a query runs, you can download the same rows the chart shows as a CSV file.
- **Sequential e-signature that moves on by itself.** When a signer finishes their step, the next signers are invited automatically, and a cancelled request or a signer who already finished never gets a new invitation.
- **Modules granted by Fenix Alliance are marked.** Your modules list marks a module that Fenix Alliance granted with "Granted by Fenix Alliance" and shows when the grant ends, and Fenix Alliance can now also hide a single module.
- **Approvals in Pocket.** The Pocket mobile app has an approvals inbox where you can open and decide approvals, like Nucleus Desktop.
- **Paging, filtering and sorting in the API reference.** The API documentation now describes the paging, filtering and sorting options of every list, so generated SDKs can use them.

### Changed (please read)

- **Workflow webhook triggers need a signature.** A webhook trigger without a signature no longer runs. If your workspace uses webhook triggers, set up signing on each one so they keep running.
- **Connecting Mercado Libre is paused in Studio.** You can't connect a Mercado Libre account until its new connect flow is set up (see Coming). Your saved settings are kept.
- On the portals, course authoring on the Academy and the Talent candidate and employer dashboards are closed until they are rebuilt behind sign-in, and so are the license validation pages.
- The course slider is off the Boomlabs Academy home, ClassPass and SRA pages until it shows only that academy's courses.
- Document editing in the browser and the old support-bot addresses are no longer served on any portal.

### Improved

- A plan change you confirm right at the end of its price quote now asks you to see the price again, instead of showing an error.
- A renewal invoice that is voided now says why: replaced by your new plan, cancelled at the end of the period, or the subscription ended.
- Nucleus Web opens faster: the signed-in app downloads about 21% less JavaScript and half the render-blocking styles, and the dashboard appears as soon as your workspace is known.
- The AI usage panel in Nucleus Web shows the dollar figures for each window, and an annual plan's period reads "This plan year".
- The public pricing page shows only what you can buy today; annual billing, the Free model and add-ons are marked as coming.
- Quotes, orders and invoices keep the record of which price, price list and discount priced each line, from quote to order to invoice.
- Nucleus Desktop shows your own AI limits, and a failed agent run explains itself in our own words.
- A payment made against an invoice keeps the invoice's exchange rate, so the accounting entry for the payment records it.
- An action that is already waiting for an approval cannot open a second approval request for the same thing.
- A signer's reason for declining is limited to 1,000 characters.

### Fixed

- A renewal invoice issued just as a subscription ended, through a refund or a plan change, is now voided automatically.
- Accounting: a posting never picks a fiscal period when more than one could apply, and a fiscal period is only ever written into your own fiscal year.
- Fiscal period pages work for a workspace whose tax authority is set by its code, such as DIAN.
- Saving Wompi settings keeps your webhook tolerance instead of resetting it.
- Two credits, two payments, or a payment and a cancellation landing on one invoice at the same moment now give one outcome, so credits never exceed the invoice and an invoice can never end up both paid and voided.
- Agents see their conversation history again, and their tools for recalling earlier conversations work again.
- Invoices, orders, quotes and deals show every line, even past the page limit, with a notice when a list is long, and other long Studio lists load instead of failing.
- Invoice and payment views show the exchange rate as "1 USD = N" in your currency, never as an amount or 0.00.
- An ePayco charge records its exchange rate only on its own payment and never changes the rates everyone else sees.
- A person is shown as locked or disabled only while a lockout is actually running.
- A workspace's first workflow trigger saves completely in one step.
- Deleting an account or a workspace removes its conversation data too, so the deletion is no longer blocked.
- A course can be added to a collection only once, even when two people add it at the same moment.
- Colombian electronic documents carry the party's fiscal responsibilities in the right field, and the payment exchange-rate date is kept correctly.
- The Google Merchant feed prices products in the currency asked for and never mislabels it, and the Facebook catalog feed follows Meta's catalog format.
- The AI options page always manages the workspace shown in the header.

### Security

- The guest cart cookie is signed, so a cart can only be reached by the visitor it belongs to.
- Sign-in, workspace switching and image saves only send you back to pages on this site.
- Public product pages return only what is meant to be public: reviews, questions, images and attachments of publicly visible items.
- A file whose malware scan never arrives is held back after 60 minutes and never served until the scan clears it.
- Payment provider evidence and payer identity checks no longer appear in general payment reads.
- An agent's checkout needs an approval unless a person is buying directly.
- A payment's fraud score is set only by the platform, never by the app that creates or updates the payment.
- Changes our team makes to your workspace from the platform administration console need an administrator acting as themselves, never an agent or an automation, and every change is recorded.
- A suspended or disabled account cannot run anything in the background.
- Live updates check that you still belong to what you are watching, and stop for anyone who no longer does.
- Our deployment and administration scripts take their secrets from the environment and check the certificate of every server they connect to.
- The connector for editing Office documents in the browser is switched off while we rework how it protects access.
- A document sent for e-signature can only take a plain workspace file or its own signed files, never a file from a private conversation.
- Invoice lines, prices and the parties on invoices and fiscal documents only ever come from your own workspace or from publicly listed items.
- Reading another workspace's listed products, images and attachments shows only their public details, and public price pages ignore private price lists.
- The GraphQL API refuses very deep or very costly queries and batched requests, and its schema browser is available only in development.
- A shopping cart holds at most 50 lines, and reading a guest cart no longer looks up the visitor's location.
- Ownership checks never treat a missing owner as a match, across records such as contacts, quotes, wallets and invoices.
- An old support-bot page is retired and its embedded key removed.
- Draft blog posts can no longer be read from the public portal.
- Product feeds for Google and Facebook share only a workspace's own published products.
- More public pages now require sign-in where they should.
- Workflow webhook triggers accept only signed, timestamped requests, and a repeated request runs once.
- Only the owner and the finance manager can change payment provider settings and payout destinations; a cashier no longer can.
- Signing in with an outside account uses only an email that provider has verified, links the login only after you confirm your mailbox, and never skips your two-step verification.
- Post images are served only to people allowed to see the post, and new uploads are stored privately.
- A web page that is in the trash or scheduled for later is no longer public.
- Course, enrollment and certificate lists are limited to your own workspace, and the certificates grid needs course management permission.
- A support ticket's attachments can be opened only through the ticket, with ticket permission.
- Compare lists and recently viewed items show a product only while it is public or your own.
- Tax rules and tax policies from another workspace never apply to your items or prices.
- Visitors and non-members see only public details of portals and their owners.
- Setting up a chart of accounts fetches only from our verified catalog, and the Empty option fetches nothing.
- Very costly API list queries are refused with a clear message instead of reaching the database.
- More kinds of connector credentials, such as certificate passwords and technical keys, are masked like every other secret.
- PayU checkout limits repeated requests from one address.
- A disabled membership no longer shows its email or receives live updates in the workspace switcher, and an approver who is reassigned stops getting that approval's live updates.
- Images in the content editor are cached only by your own browser, for a few minutes.
- Old AI model-training endpoints are no longer reachable.
- The old Mercado Libre connection flow is retired, and your saved settings are kept.

### Coming next

- **AI usage limits.** AI stops at your plan's monthly budget, with raises you approve.
- **Prepaid AI credit packs**, for plans with a monthly AI budget.
- **Several accounts per integration**, including your personal ones, with an account picker and a default.
- **Connecting Google and Microsoft accounts** to your integrations. Disconnecting a Google account also withdraws its access at Google.
- **Agents that use your connected accounts safely**, only with your consent for each agent and account, with approvals for anything consequential, revocable at any time and always recorded.
- **Team conversations** with agents.
- **DIAN electronic invoicing for your workspace**, including Colombian credit and debit notes with their own DIAN code (CUDE), and the CUFE or CUDE and the QR code on the invoice PDF. It is off by default and sending to DIAN is not connected yet; until it is on, your invoices keep their plain PDF.
- **Connecting Mercado Libre again**, through the same secure sign-in as Google and Microsoft.
- **Our secure credential store for your keys.** Workspace administrators will be able to keep the keys for payment, communications, AI and search providers in the platform's credential store, and rotate or remove them there.
- **Background agent runs in Nucleus Web and Nucleus Desktop.** An agent will keep working after you close the page or the window, and you will be able to stop it or come back to it later.

## [2.7.0] - 2026-10-20

**Your team of people and agents, running on governed AI.**
Agents work with their own identity, under approvals you can trust. This release also includes the changes from 2.5.0 and 2.6.0.

### Added

- **Agents with their own identity.** An agent can hold a role you allow, narrowed to what it actually needs each time it acts. Workspace managers see and change each agent's capabilities one at a time.
- **Approvals you can trust.** Actions with money or legal weight, such as issuing an invoice, adding a note to it or deleting it, and an agent's checkout, wait for a person to approve the exact thing that will happen. The approval card shows what you are approving, frozen when the request opens, and a decision only counts while the approver still holds the permission.
- **Long conversations that keep their context.** Agents keep the thread of a long conversation: older turns are folded into a summary, large results are stored and read back in pages, and an agent can recall earlier parts of the conversation.
- **Invoices you received.** A Received tab on your Wallet invoices in Studio lists the invoices other organizations sent you.
- **AI usage you can see.** AI usage is now measured per workspace and per person, so you can see in Nucleus Web what your team uses.
- **Workspace AI options.** Decide in Studio whether agents may use computer use and voice recording, and how long AI vendors may keep your data.
- **Search, set up from Studio.** Set up search for your workspace in Studio, see its state in plain words, and choose which automation it runs. **Not available yet:** this ships when the search service is included in a release.
- **Organization.** Archive and restore departments, positions and teams with a "Show archived" view, and see a team's card when you hover over it.
- **Workforce.** Studio pages for appraisal workflows and stages, leave types, training programs, payroll periods, employee types and job titles, plus gig and employer lifecycle actions.
- **Accounting.** Budget lines in Studio, a trial balance per book at the period-end rate, and an income statement summary.
- **Courses.** Set a course's price and currency in Studio and see each enrollment's status.
- **Banners.** Change a banner assignment's placement and portal without recreating it.

### Improved

- Order status follows the order's real life cycle, and the remaining Logistics and deal unit routes now work.
- GraphQL errors use the same stable codes as the REST API.
- Production alerts fire on new kinds of errors and on bursts.

### Security

- Payment links and payment starts are rate-limited, and live collection can be switched off at once if needed.
- Every attempt to delete a workspace leaves an audit record that the deletion cannot remove.
- Email tracking and provider feedback are bound to the delivery they belong to, and malformed tracking links are refused early.
- Agents can never pass as people anywhere a person's identity is required.
- Time intervals, shifts and training events link only to schedules, employees and programs in your own workspace.

### Coming

- **Sign up, choose a plan and pay by card on your own**, with an invoice-ready email, a receipt, a welcome email when your workspace is active, and renewal reminders, in English or Spanish.
- **Card payments with 3-D Secure through PayPal, and the Wompi payment rail.**
- **Paying the invoices you received**, from the buyer pay page in Nucleus Web.
- **A payment link the buyer can reopen** to continue paying, and provider refunds that are posted for you and credited to their invoice exactly once.
- **Electronic invoicing for Colombia (DIAN)**, enabled per workspace.
- **More AI models:** Google Gemini and Mistral AI.
- **Changing your plan online**, with a preview and credit for unused time.
- **Monthly AI allowances per plan, usage limits and prepaid AI credit packs.**
- **Connecting Claude, ChatGPT or Grok to Alliance Business Suite over MCP.**
- **Scheduled agent runs.**
- **Agents acting on your behalf (token exchange).**

## [2.4.1] - 2026-10-13

A security update for 2.4.0. Update to it if you run 2.4.0.

### Security fixes

- Improved protection of sign-in applications between workspaces.

## [2.4.0] - 2026-10-13

The commercial release. It reached production on 2026-10-13, followed the same day by 2.4.1.

### Added

- **Get paid through your own payment provider.** Connect your own Stripe or Mercado Pago account, and send a payment link for an invoice. The payer pays on the provider's own checkout, and you can refund a completed payment. In this release your workspace's provider connections run in test mode; live payments for your workspace are coming. See [Payments](~/Services/Reference/Payments.md).
- **Credit and debit notes.** You can issue a credit note or a debit note against an issued invoice. Each note takes the next number in your own note series, a credit note can never exceed what is still creditable on the invoice, and, when automatic journal posting is turned on, the reduction is posted to your accounts once the original invoice's entry is in your books. Colombian notes carry the reason and the full reference to the original invoice that DIAN requires.
- **Positions with several holders.** A position can now hold more than one person, up to a capacity you set, and belongs to a department. Each holder's assignment is recorded with its dates, and a position cannot be deleted while someone holds it.
- **Archive notifications.** In the Tools inbox you can archive and unarchive notifications, one at a time or a whole page, and switch to an Archived view. Archiving is per reader and never deletes anything.
- **AI advice on approvals, only if you turn it on.** Advice is off by default. An approvals manager opts the workspace in after seeing exactly which provider and model would be used and which approval fields are shared. Any later change to those suspends advice until the workspace confirms again, and opting out hides advice at once.
- **See what your workspace uses, and what it costs.** A new usage view in Studio shows your workspace's usage and its cost, and administrators can set limits on it.
- **Order numbers, and orders from quotes.** Every order gets a number in your own series, for example ORD-000123, that cannot be edited. You can place an order directly from a quote you received while the quote is open and not expired.
- **Selling courses.** When the buyer pays for a course, they are enrolled, and a full refund ends the enrollment. Each enrollment is active or revoked. **Not available yet:** selling courses is coming; today you enroll learners yourself.
- **Banners.** Create banner sets in Studio and place them on your site's pages and posts. A visitor who clicks a banner is taken to its link.
- **Invoice-number range health.** Your invoice-number ranges show when they are expiring or nearly used up, and your billing administrators are notified when a range runs low and when no usable range is left for an automatic invoice.
- **Bulletins read per reader.** On your workspace's bulletin board, a bulletin shows as read only for the people who have read it.
- **Gigs and the employer directory.** Gigs move through a status lifecycle, and an employer profile is listed in the public employer directory only when its owner turns that on.

### Changed

- **Signing in uses your email address.** You sign in with your email; an account that was given a generated handle signs in with its email too. Every email address can belong to only one account.
- **For developers: the legacy token endpoint is turned off.** `/api/v2/OAuth/Token`, which issued tokens for a client ID and secret, is off by default. There is no replacement for machine-to-machine sign-in in this release, so an integration that depends on it should contact us before upgrading.
- **Studio has a new look**, built on the latest version of its design system, and its pages now load their data through the platform's API.
- **Grids now show names instead of raw identifiers**, so a related record reads as its name, not a code.
- **Every document keeps its own currency.** The platform no longer falls back to US dollars anywhere a document has a currency of its own, and public item prices are given in the item's own currency.
- **New workspaces choose their currency.** When you create a workspace you pick its currency, and its carts and documents use it.
- **Approvals are always decided by a person.** An approver must be a person, not an automated account, and each approver holds one seat per approval stage.
- The order summary now shows the workspace, the total and the date, and the sales and logistics pages use consistent icons.
- **Invoices are issued from Studio.** The Close and Mark as paid actions, which never saved, are removed. A payment you record does not mark an invoice as paid.
- **Pages without code.** In a workspace that is not enabled for code, a page saved from the visual builder or from Live Edit is stored as static HTML.
- **For operators: the health checks dashboard is back.** Administrators of the root workspace can open `/health-ui` and read the detailed feed at `/health-checks`. See [Check health](~/Fundamentals/Hosting.md#check-health).
- **For operators: new installs start in production mode.** The web installer no longer turns on development mode. Development mode is on only for a host that runs in the Development environment.
- **For developers: Mercado Pago card routes.** `PUT /api/v2/Integrations/MercadoPago/Cards/Update` is retired and answers `410 Gone` with a link to its successor, `PUT .../Cards/UpdateByToken`, which updates a saved card from a Mercado Pago card token (`customerId` and `cardId` in the query). `PUT .../Cards/Delete` now takes `customerId` and `cardId` in the query and answers `400` when either is missing.
- **For developers: retired payment routes.** These routes now answer `410 Gone` with a `Deprecation` header and a `Link` to their successor. None of them reads a request body.
  - Mercado Pago refunds: `POST .../MercadoPago/Refunds/Create`, `POST .../MercadoPago/AdvancedPayments/Refund` and `POST .../MercadoPago/AdvancedPayments/RefundAll` (refund through `POST /api/v2/PaymentsService/ProviderOperations/{providerOperationId}/Refund`).
  - Mercado Pago cancellation: `POST .../MercadoPago/AdvancedPayments/Cancel` (cancel through `PUT .../MercadoPago/Cancellations/CancelPayment`).
  - Mercado Pago collections: `POST .../MercadoPago/Payments/Process`, `POST .../MercadoPago/Wrapper/CreatePreference`, `POST .../MercadoPago/Preferences/Create`, `PUT .../MercadoPago/Preferences/Update`, `POST .../MercadoPago/AdvancedPayments/Create`, `POST .../MercadoPago/AdvancedPayments/Capture`, `PUT .../MercadoPago/AdvancedPayments/Update`, `POST .../MercadoPago/Subscriptions/Create`, `PUT .../MercadoPago/Subscriptions/Update` and `PUT .../MercadoPago/InStoreOrders/Create` (payments are collected through the invoice's payment checkout, `/Payments/{token}`).
  - Mercado Pago card tokens: `POST .../MercadoPago/CardTokens/Create` (create card tokens in the payer's browser with MercadoPago.js and your public key).
  - ePayco: `POST .../ePayco/Payments/Process` and `POST .../ePayco/Payments/Global/Process` (payments are collected through the invoice's payment checkout), `POST .../ePayco/Withdraws/Withdraw` (no replacement in this release), and `GET .../ePayco/Syncronization/Sync/Primary` (reconcile a collection through `POST /api/v2/PaymentsService/ProviderOperations/{providerOperationId}/ReconcileOutcome`).
  - ABS never accepts raw card numbers or security codes on any route: the payer enters them on the payment provider's own checkout.

### Fixed

- **Emails sent in a language other than English, for example those you compose in Studio, are now delivered in that language.** Until this fix they arrived in English.
- Deleting a record from Studio works again.
- Every API documentation page renders again.
- Opening your own cart no longer fails.
- A message that was processed at the same moment as another is retried rather than set aside as failed.
- In Studio, the page title sits in the record header, the subheader fits on one line, roles can be revoked from the roles grid again, and amounts no longer clip.
- Row action menus in grids open again.
- The Studio onboarding tour no longer leaves the Studio stuck behind its overlay.
- The administration pages load and save settings correctly, the users list no longer reloads every row, and the server memory gauge no longer slows the server down.
- The workflow details panel no longer shows a developer note.
- The page you are on is now announced to screen readers.
- Quotes, orders and deals show their amounts in the document's own currency. You can create a price list and reopen a quote from Studio, and the orders list shows each order's number.
- Blog posts publish correctly: a post's body, excerpt and search fields are saved, and a post belongs to one of your own portals.
- Analytics totals leave out deleted invoices, contacts and stock items, and never add together payment amounts in different currencies.

### Security

- Sign-in hardening: an account with two-factor authentication can no longer sign in with its password alone on any path, a wrong password is refused on every path, and repeated failures always lock the account.
- Everything read through a wallet, including its balance, is shown only to the wallet's owner.
- A payment can name only an order your workspace owns and an invoice your workspace issued or that was addressed to it, and a named sending wallet must be your own.
- A call that needs a workspace permission is refused when it does not name a workspace.
- A workspace that is not enabled for code can no longer have code compiled or run through any page, preview or saved page.
- Server errors no longer return internal details to API clients.
- Contact records never carry the sign-in provider's access token.
- Sign-in tokens for AI connectors are now checked more strictly.

## [2.3.3] - 2026-10-06

The first 2.3 release with its complete set of packages and container images. It reached production on 2026-10-07, and with it every change in 2.3.0, 2.3.1 and 2.3.2.

### Fixed

- The release build now compiles the Azure Communication integration.

## [2.3.2] - 2026-10-05

Its NuGet packages were published on 2026-10-05. Its container images could not be built, so its fixes reached the images, and production, through 2.3.3.

### Fixed

- **A data list on a page rendered on the server no longer fails.** This fixed the error on the blog posts page.
- Container images are now built from the compiled release output.

## [2.3.1] - 2026-10-05

Its NuGet packages were published on 2026-10-05, carrying 2.3.0's changes as packages for the first time. Its container images could not be built, so its fixes reached the images, and production, through 2.3.3.

### Fixed

- **The Suite home page is now part of the standard platform image**, so every instance serves it.
- Packages are now built from exactly the build that passed validation.

## [2.3.0] - 2026-10-04

Tagged on 2026-10-04. Its NuGet packages were not published: these changes reached you as packages in 2.3.1, and in production through 2.3.3 on 2026-10-07.

### Added

- **Inviting someone no longer fails when the invitation email cannot be sent.** The invitation is kept, and you can resend it once mail is flowing again.
- **AI assistants such as ChatGPT can now connect to your workspace's MCP server.** The server publishes standard OAuth metadata, and the tokens it accepts are issued for that server alone.
- **The Suite home page now ships with the platform.** It appears only when its interface is fully loaded, never as a blank page.
- **For operators:** a new version can be staged beside the live one without both running background work. Background work runs only on the instance you choose.

### Changed

- **Releases are now built, tested, packaged and published by a single pipeline from a single build**, so every package and migration image in a release comes from exactly the same source.
- **Development and QA environments now run the same way as production**: on Azure Container Apps, with their configuration on a mounted share and their infrastructure defined as code. The release pipeline deploys to each one and then runs its tests against it.
- The health checks dashboard is switched off for now. The health endpoints, including the database check, keep working as before.

### Fixed

- **Studio no longer redraws its layout continuously while you are signed in.** Every open Studio tab now does far less work in your browser and on the server.
- In Pocket, a product's price before discount is now shown correctly.
- A page that cannot be found now shows a friendly error page instead of a blank one.
- Installing a new instance no longer fails at startup with an API versioning error.
- An instance now stops within its shutdown time even while background work is running, and pending messages are still flushed first.

### Security

- Invitations are now answered only by the person they were sent to, and managed only by the workspace that sent them.
- Public blog and web page listings now follow the same publication rules as the pages they belong to.

## [2.2.0] - 2026-10-02

Reached production on 2026-10-02.

### Added

- **New businesses start in their own currency.** When a business is created, its currency is set from its country, so a business in Colombia starts in Colombian pesos, and you can change it at any time. Where a country has no single currency, the business starts in US dollars.
- **Assistants and workflows can now search your workspace.** An assistant can draw on what it finds to answer you, through the same permission-checked search you use yourself. **Not available yet:** this ships when the search service is included in a release.
- **Search stays current while it is rebuilt.** A new search index is checked and switched in automatically, even while your data keeps changing, and the changes you make during a rebuild are not lost. **Not available yet:** this ships when the search service is included in a release.
- **Administrators can now see and resolve stuck integration messages** rather than leaving them to retry unseen.
- Licence verification can now run against a configured trust manifest, and refuses every licence if that manifest is missing or unusable.
- **For developers:** release numbers now follow semantic versioning, starting with 2.1.2, and each release is tagged when it is published.

### Fixed

- Subscriptions now identify their subscriber from the subscribed contact, and match each payment to its own invoice.
- An email no longer fails to send when one of its stylesheets cannot be downloaded.
- The approver inbox now lists requests in a fixed order.

### ABS Online

- `www` addresses now redirect to the main address, so every page has one canonical URL.
- Public catalog, blog, job and course pages show only published content.
- Invoices and quotes are now shown only to the people they were sent to.

## [2.1.2] - 2026-10-02: The Composable Platform

The first release under semantic versioning. It gathers everything built since product release 2.8.0, and was published on 2026-10-02. It reached production the same day, as part of 2.2.0.

### Documentation

- **Documentation now ships with the capability, not after it.** A capability is no longer considered finished until the pages describing it are written and published. Documentation is a release condition now, held to the same bar as the code being built and verified — so when something reaches you, the explanation of it reaches you at the same time.
- **Two audiences, written separately and deliberately.** The same change reads differently depending on how you meet it, so we write it twice:
  - **If you build on the platform** — API and SDK reference, module and extension guides, and explicit breaking-change notes, kept in step with what the platform actually exposes.
  - **If you run your business on the platform** — module and capability pages, get-started and how-to content, written in the language of the work rather than the code, so nothing in Studio, Client.Next or Pocket requires reading a developer page to understand.
- **This changelog is the front door to that evolution.** It is written for the people using the platform, in plain terms: what you can now do that you could not do before, and what to do differently. Start here when you return after a while.
- **New page:** [How this documentation is kept current](~/reference/Documentation-Currency.md) — the commitment in full, what to trust, and how to tell us where we fall short.
- **Documentation is written only after a capability is real.** If a page describes something, that thing exists today. Anything planned but not yet built stays on the [roadmap](~/get-started/Roadmap.md), marked as such.

### Added

- **Notifications now decide who to tell before they decide how to send.** When something happens in your workspace, the platform works out who genuinely needs to know, checks that each person is allowed to see what the notification is about, applies their preferences, and only then delivers. Someone who qualifies for several reasons is told once, not once per reason, and the person who caused the event is not notified about their own action.
- **You can now set notification preferences per category and channel**, and administrators can set what a workspace permits and what its members receive by default. Settings you are not allowed to change are shown locked with the reason, rather than appearing editable and being overruled somewhere you cannot see. Categories such as security and legal notices cannot be switched off.
- **Administrators can now ask why somebody was not notified.** Every recipient and channel leaves a recorded decision, allowed or not, so the question is answerable after the fact. It distinguishes two cases that look identical from outside: a person who was considered and ruled out on policy or preference, and a notification that never evaluated anybody at all, which is not a preference problem and needs an administrator rather than a settings change.
- Notifications reach you **in the app and by email**. Mobile push, web push and SMS are not available yet, and delivery feedback from your mail provider is not yet connected; see [Notifications](~/Capabilities/Notifications.md) for the current boundary stated in full.
- **AI agents as workflow steps** — invoke a governed AI agent from inside a [workflow](~/Modules/WORKFLOWS.md): hand it a question or a task, let it run to an answer, and use the result in later steps. The agent runs under the workflow's own identity, is permission-checked, and leaves a durable audit record.
- **Assistants that remember.** An assistant can durably remember useful details about the person it is helping and draw on them in later conversations, so you do not repeat yourself. What it remembers is private to that assistant and that person, stays within your tenant, and is governed like every other AI action. An administrator can turn it off for the whole environment.
- **Suite UI Kit** — a unified component design system across the Studio.
- **Platform-wide role-based access control**, with per-feature and per-action permissions.
- **Human Resources / Workforce** management — employee types, job titles, schedules, time intervals and rounding policies.
- **OpenAPI server** with parallelized, multi-language SDK generation.
- Tenant-scoped media upload; batch and domain-routed APIs.
- Expanded entity selectors, applets, grids and preview components across the SDK.
- **Signing keys can now be created inside their vault and never leave it.** The platform can mint a key that cannot be exported and link it to its certificate, so signing happens in place.
- **Signatures and trust records now name both parties.** Who performed the signing and who it was done for are both on the record, across all four signing providers.
- **Every accounting entry now records who made it and on whose behalf.** When an assistant or an automation posts on behalf of a person, both are recorded, and both are visible when the entry is read back.
- **Assistants now leave a step-by-step record of what they did.** Each run keeps its own identity and its sequence of steps, so a completed piece of agent work can be read back afterwards.
- **Work started by a workflow or an assistant runs once, even across interruptions.** If a step pauses for approval or the process restarts, the platform holds a single claim on that work rather than repeating it.
- **Delivery attempts that never resolved are now reconciled.** A notification whose outcome was never confirmed is swept up and settled, so the delivery record reflects what really happened.
- **Invoices now show when they expire and the effective rate applied**, computed by the server so every surface shows the same figure, with a matching summary view for payments.
- **Apps can now revoke their own sign-in tokens.** A client that signs a person out can tell the platform to retire that session's tokens straight away, rather than waiting for them to expire.
- **Developers get tenant-scoped entry points for wallet data.** Service clients can now ask for a business or contact wallet's locations, accounts and related records within a named tenant, the same way the Studio screens do.
- **Invoices are now issued as a deliberate step.** When you issue an invoice, its prices are frozen and it takes the next number in your own gap-free invoice sequence. Only an issued invoice can be paid.
- **Exchange rates tell you when they are out of date**, and missing historical rate sets can be rebuilt from a published rate history.
- **Colombian electronic invoices issued in another currency now carry the exchange rate to pesos that DIAN requires.** A document whose rate cannot be stated is refused rather than sent incomplete.
- **With ePayco, you can now refund a collected payment from the platform.** The refund is recorded before ePayco is contacted, so repeating the request never refunds twice. You can also list the bank accounts your own ePayco account pays out to, with account numbers masked.
- **Overdue approval requests are now escalated or expired on schedule**, and every decision is tied to the evidence it was made on.
- Rejoining a live communication session after leaving it. **Not available yet:** this ships when the communications service is included in a release.
- **Anonymous traffic can now be rate limited per client address**, with limits you configure. Signed-in use is not limited.
- Email images and styles are now served by your own instance, so emails look the same wherever the platform runs.
- **For developers:** every API operation has one stable, predictable operation id; the Colombian e-invoicing API now describes its responses in full; and OpenAPI snapshots can be compared to catch breaking changes before release.

### Changed

- Standardized the platform-wide result and error-handling model.
- Unified CQRS dispatch behind a single mediator.
- Standardized DTO mapping conventions across the SDK.
- Enhanced multi-currency billing and overall UI consistency.
- Setting up a development environment is faster and works on Linux as well as Windows, and the platform's repositories clone over HTTPS without extra credentials.
- **Wallet screens for businesses and contacts now read through tenant-scoped calls**, so the records you see are always the ones that belong to the wallet you opened.
- **A record's type is now fixed once it is created.** Contact, workforce and account relation edit forms show the type for reference but no longer change it, which keeps every record in the lists where you expect to find it.
- **Payment confirmations now arrive through one processing path**, with automatic recovery for any that are interrupted, so a payment is settled once and settled consistently.
- **An invoice always states its currency.** It never falls back to US dollars without saying so.
- Every automatic journal entry now goes through a single governed posting path.
- **The point of sale terminal loads through your workspace's own data**, on a reworked point of sale page.
- Apply voucher in the Studio cart now checks the code against your seller's coupons and tells you plainly whether it applies.

### Fixed

- **An edit form no longer saves when the record failed to load**, so an interrupted load can never blank out the record behind it.
- For API users, asking for a record that does not exist now returns not found rather than a server error.
- **Invoices now carry the right lines and quantities.** Order quantities flow through to invoice lines, and lines from a child order are invoiced once.
- Sign-in no longer fails with a server error when an account needs to complete a step first; the person is guided to that step instead.
- **The workflow designer now runs under a strict browser security policy**, so it loads in environments that enforce one.
- **Health checks now speak up about configuration they cannot find.** Missing module setup, a missing options manifest, and a notification reconciliation sweep that is switched off are all reported as degraded rather than passing quietly.
- **Workflows no longer open a fresh database connection on every background check.** Under load this had been slowing database access for everything else on the instance. Since the fix, database timeouts in production have fallen to zero.
- Workflows no longer change the database structure when the application starts.
- A percentage discount is now read as a percentage, so 10 means 10 percent, and it is checked when it is saved.
- Balancing an account whose parent accounts form a loop now returns a clear error naming the loop, so you can correct it, instead of stopping the service.
- The Studio cart no longer shows raw checkout errors.
- The JavaScript SDK formats amounts correctly again.

### Security

- Accounts now lock after repeated failed sign-in attempts, on every password sign-in path.
- Stored payment methods and bank accounts are now scoped to the wallet that owns them.
- Confidential learning records are confined to the tenant making the request.
- Approvals now allow one vote per approver at each stage, and an approval is refused if the policy it was granted under changed in the meantime.
- Requests arriving through a proxy are now trusted only within an explicit boundary.
- Developer tooling keeps certificate validation on, using the machine's own trusted roots.
- **Tenant isolation hardening** across AI agents and skills, the agent runtime, Learning, point of sale and order lines, Social, notifications, CRM contacts, system options, and the order and quote viewers in Studio.
- **Anonymous endpoints now return only public fields.** The public catalogue, public pricing, the merchant directory and the public course catalogue each show only what a business has chosen to publish.
- Learning certificates can be read only by the person who holds them.
- Guest cart merging is confined to the visitor's own cart, and cart data no longer carries the visitor's network address.
- Approval lists show a summary without the stored ticket details, and a decision is accepted only while the ticket is still at the stage it was made for.
- Sign-in requires the stronger S256 method for proof-key exchange on every client.
- Hardened how containers handle configuration secrets at startup.
- **Tenant isolation hardening** across files and storage, the catalog, payments, accounting, billing, licensing, subscriptions, CRM, marketing, digital assets, learning, content, sales and logistics, social, support and identity.
- Avatar uploads are type-checked and scanned before they are stored, and uploaded documents are no longer displayed inline on public pages.
- Only a person can decide an approval. Assistants and automations can request one, never grant it.
- Workflows refuse to be saved, published or installed with a secret written into them.
- Logs no longer record identities, network addresses or query strings where they are not needed.
- The public blog shows only published posts, without management fields or author details.

## Product release 2.8.0 - 2026-01-07 — .NET 10 LTS & Asset Management

### Added
- **Asset management** with multi-currency cost tracking.
- Operations tooling for instance backup and restore.

### Changed
- Upgraded to **.NET 10 (LTS)**.
- Unified data and service namespaces.
- Streamlined messaging configuration.

## Product release 2.7.0 - 2025-11-10 — Domain Model, Messaging & Payments

### Added
- **Payment Allocation**.
- Resilient messaging — health checks, circuit breakers and configurable consumers.
- Published licensing and trademark terms.

### Changed
- Domain-driven design refactor across services and repositories.

### Security
- Hardened identity-provider key handling.

### Removed
- Module and integration packaging from the SDK distribution pipeline.

## Product release 2.6.0 - 2025-05-26 — Billing, Pricing, Email & MCP

### Added
- **Model Context Protocol (MCP) server** support.
- **Apple** sign-in.
- A new **email engine** for quotes, orders and invoices.
- Cart state-change events.

### Changed
- Improved quote calculation and multi-currency forex conversion.
- Improved pricing and billing.

### Removed
- Authorize.Net integration.

### Fixed
- OpenID Connect sign-in, guest-cart persistence and API-documentation generation.

## Product release 2.5.0 - 2024-12-21 — Platform Hardening & .NET 9

### Added
- **MercadoPago** payment integration.
- API documentation across all controllers.

### Changed
- Upgraded to **.NET 9**.
- Renamed portal configuration to `PortalSettings`.
- Improved the storage service and portal initialization.

### Removed
- Legacy API authorization; obsolete projects.

### Fixed
- Portal context when no tenant is selected; logging and error handling.

## Product release 2.4.0 - 2024-08-23 — REST/OData Migration & New Verticals

### Added
- **Human Resources (HRMS)** service; **Logistics** service.
- Support and Accounting REST endpoints.

### Changed
- Migrated module pages onto REST/OData service clients (Sales, Accounting, Marketing, Invoices, Orders, Quotes).
- Strengthened the OData engine; refactored strongly-typed identifiers.
- Refactored monetary types to decimal precision.
- Improved invoice, order and quote grids.

### Fixed
- Cart-management, data-grid and request-header defects.

## Product release 2.3.0 - 2024-06-13 — Microservices & SDK Platform

### Added
- **Commerce, Catalog, Licensing and Learning** services; the **Forex V3** multi-currency service.
- A **C# API client generator** with OpenAPI/Swagger annotations; Postman collections.
- Item images, category management, and merchant & blog features.

### Changed
- Centralized business logic in the Application layer (CQRS).
- Moved database providers behind repository interfaces.
- Modernized the codebase (primary constructors, file-scoped namespaces).

### Fixed
- Catalog, cart and tenant-validation defects.

## Product release 2.2.0 - 2024-02-22 — Services & Identity

### Added
- **Marketplace** and **Accounting** services.
- **OpenID Connect** identity with external-provider configuration; identity-management endpoints.
- **GraphQL** server API.
- Postman collections and an OpenAPI server option.

### Changed
- Improved the Holders & Tenants and Security services, and the role/permission system.
- Pipeline reporting and developer tooling.

### Fixed
- GraphQL server, Studio assembly loading and authentication-token defects.

## Product release 2.1.0 - 2023-12-20 — Platform Re-Architecture

### Added
- **CQRS** architecture with use-case dispatch and the **Projections** pattern.
- Repository pattern across all data access.
- **Accounting** module; shopping **Cart** service; theming micro-service.
- **Container (Docker)** support and images; load-test pipeline.
- Dedicated **Development, QA and Testing** environments.
- In-Studio full-text **search**; React + Redux client support.

### Changed
- **Re-architected the platform onto Clean Architecture**.
- Overhauled the Studio UI on **FluentUI**, with a new breadcrumb and navigation system.
- Upgraded to **.NET 8**.
- Improved the domain model, module loading and dependency injection.

### Fixed
- Tenant-initialization and workflow-execution defects; cart creation and persistence.

## [2.0.0] LTS - 2022-08-11

The first long-term-support release. Studio gained management screens for modules, enrollments, applications, security roles, permissions and certificates, licensing and subscriptions became services in their own right, and the interface was translated into five more languages.

### Added

- [ABS] In-Studio UI Improvements.
- [ABS] In-Studio Module Management Engine.
- [ABS] Business Enrollments Management Engine.
- [ABS] Business Applications Management Engine.
- [ABS] Business Security Roles Management Engine.
- [ABS] Business Security Permissions Management Engine.
- [ABS] Business Security Certificates Management Engine.
- [ABM] `ILicensingService` and default implementation (`LicensingService`).
- [ABM] `ISubscriptionsService` and default implementation (`LicensingService`).
- [ABM] `ISecurityCertificatesService` and default implementation  (`SecurityCertificatesService`).
- [ACL] Adds `pt-PT` Translations.
- [ACL] Adds `pt-BR` Translations.
- [ACL] Adds `de-DE` Translations.
- [ACL] Adds `it-IT` Translations.
- [ACL] Adds `fr-FR` Translations.
- [ACL] Enables Licensing Engine (ABS Now requires a license).

### Fixed
- [ABM] COA importing capabilities on Accounting Service.
- [ABS] Error when navigating to the Fiscal Authorities page.
- [ABS] Virtualize License Types List on Licenses Modal Form.
- [ABS] Virtualize Subscription Plans List on Subscriptions Modal Form.
- [ABS] Error when navigating to new created Organization (Contact) details page.

### Changed
- [ABS] Update Studio Base Theme for V2.
- [ABM] Improve `SecurityHelpers` class.
- [ABM] Improve overall performance & memory consumption.

## [1.9.0] - 2022-07-20

A polish release for the Studio interface and the way its services are wired together.

### Fixed
- [ABS] UI Improvements for UI & Core Components.
- [ABS] Contextual Menu showing when no business is selected.
- [ABP] Improve DI Tree for most services.

## [1.8.0] - 2022-07-04

Studio gained a dark theme, REST endpoints gained OData querying, and the platform added services for cookies, data protection and browser storage.

### Added
- [ABS] Dark Theme Support for Studio.
- [ABP] OData Support for REST Endpoints.
- [ABM] `ICookiesService` and default implementation (`CookiesService`).
- [ABM] `IDataProtectionService` and default implementation (`DataProtectionService`).
- [ABM] `IBrowserStorageService` and default implementation (`BrowserStorageService`).

### Changed
- [ABS] Update Studio Base Theme for V2.
- [ABS] Improve Studio Menus & Mobile Layout.

### Fixed
- [APS] NullRedException on SecurityDataService due to DI misconfiguration.

## [1.7.2] - 2022-06-04

Added web and date services, and registered the Fluent UI layout contexts they depend on.

### Added
- [ABM] `IWebUIService` and default implementation (`WebUIService`).
- [ABM] `IDateTimeService` and default implementation (`DateTimeService`).

### Changed
- [ABS] Register Fluent UI & Fast Design Layout Contexts.
- [ABP] Register `IWebUIService` default implementation (`WebUIService`) as Singleton Service.
- [ABP] Register `IDateTimeService` default implementation (`DateTimeService`) as Singleton Service.


## [1.7.1] - 2022-06-04

Fixed quick panels that could lock up the interface.

### Fixed
- [ABS] Quick Panels causing UI deadlocks.

## [1.7.0] - 2022-06-04

Studio began shipping bundled static assets and rendered more quickly.

### Added
- [ABS] Studio Static Asset Bundles

### Changed
- [ABS] Improve Country Flag Rendering.
- [ABS] Improve Country Flag Rendering.
- [ABS] Improve Studio Rendering Process.
- [ABM] Improve Curriculum Relations.
- [ACL] Update dependencies to the latest stable versions.

## [1.6.0] - 2022-05-28

The data model gained gigs and gig applications, the groundwork for job board work.

### Added
- [ABM] Gig Entity to Database Scheme.
- [ABM] GigApplication Entity to Database Scheme.

## [1.5.9] - 2022-05-27

Contact lookups moved onto the CRM data service.

### Fixed
- [ABM] IContactService's default implementation is now using ICrmDataService.

## [1.5.8] - 2022-05-26

Contact operations moved to their own per-operation data contexts.

### Added
- [ABM] IContactService's default implementation is now using per-operation Data Context instances.

## [1.5.7] - 2022-05-25

The portal context gained a contact synchronization strategy.
### Added
- [ABS] ContactSyncronizationStrategy on PortalContext.

## [1.5.6] - 2022-05-23

Fixed Studio module loading, and extended the job board model with migrations for MySQL, SQL Server and Oracle.

### Fixed
- [ABS] Fix error on Studio Modules Loading Process. More assemblies than necessary used to be passed to the router.
- [ABM] Adds additional properties to Alliance Business Model for Job Board Applications.
- [ABM] Adds V1.5.6 ABM Migration for MySQL, MS SQL, and Oracle Data Providers.

## [1.5.5] - 2022-05-22

Service lifetimes were made consistent, and the academy data service became the LMS data service.

### Added
- [ACL] Brazorize Library Dependency.

### Fixed

- [ABP] Improved ServiceLifetime consistency across default service implementations.
- [ABS] Improved Studio Rendering Process.

### Changed

- [ACL] Update dependencies to the latest stable versions.
- [ABS] IAcademyDataService and AcademyDataService are now ILmsDataService and LmsDataService respectively.

## [1.5.4] - 2022-05-19

Academy gained student, instructor, enrollment and certificate lookups, and MySQL migrations were squashed.

### Changed

- [ABM] Squash migrations for MySQL.
- [ABP] Update Service Registration Lifetime.
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Improve Academy Pages to use new methods on IAcademyService.
- [ABM] Use new scoped for Scoped Services used over Singleton Services.
- [ABM] Adds GetStudentCoursesAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetStudentProfilesAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetCourseEnrollmentAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetCourseEnrollmentsAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetInstructorCoursesAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetInstructorProfilesAsync method to IAcademyService and Default Implementation.
- [ABM] Adds GetCourseCompletionCertificatesAsync method to IAcademyService and Default Implementation.


### Fixed

- [ABS] Studio wasn't using the SelectedBusinessID for each holder, thus, when reloaded, business selection used to get override with null.


## [1.5.3] - 2022-05-15

Static assets were reorganised so packages install faster.

### Changed
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Refactor Static Assets to improve package installation time.


## [1.5.1] - 2022-05-14

Interface rendering improvements, with dependencies brought up to date.

### Changed
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Improve UI Rendering Process.


## [1.5.0] - 2022-05-13

Interface rendering improvements, with dependencies brought up to date.

### Changed
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Improve UI Rendering Process.


## [1.4.1] - 2022-05-12

Each portal became an independent module on Studio.Core, the theming engine moved onto model services, and a Monaco based code editor arrived.

### Added
- [ABM] ICmsDataService.
- [ABM] ICrmDataService.
- [ABM] ISocialDataService.
- [ABM] IMarketplaceDataService.
- [ABM] ISecurityDataService.
- [ABM] IGlobalDataService.
- [ABM] IForexDataService.
- [ABS] CodeEditorComponent with Monaco Editor.

### Fixed
- [ABS] Fixed Workflows Studio Designer not displaying on production.
- [ABM] Improve IPricingService implementations to always use the latest data to perform generic/historical/extensible/customizable multi-currency amount calculations.

### Changed
- [ACL] Update dependencies to the latest stable versions.
- [ABS] Theming Engine now relies on interface services on the Alliance Business Model.
- [ABS] Theming Engine now relies on default service implementations on the Alliance Business Model.
- [ABS] PortalContext is now optimized to use DataServices.
- [ABS] StudioContext is now more efficient through PortalContext Optimization.
- [ABS] `Studio.Core` now contains the layout, components, and utilities for the ABS Studio.
- [ABS] Academy Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Admin Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Wallet Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Holders Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Tenants Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Social Network is now an independent dll compatible with `Studio.Core.`
- [ABS] Support Portal is now an independent dll compatible with `Studio.Core`.
- [ABS] Developer Portal is now an independent dll compatible with `Studio.Core`.

### Removed
- [ABM] I 

## [1.4.0] - 2022-01-12

A large release. Cart, store, wallet, academy, networks and job board arrived inside Studio, alongside .NET 6 support, storage across the file system, Azure and AWS, and services for sign-in, reCAPTCHA and certificates.

### Added

- [ACL] .NET 6.0 Support.
- [ABS] In-Studio Cart.
- [ABS] In-Studio Store.
- [ABS] In-Studio Wallet.
- [ABS] In-Studio Academy.
- [ABS] In-Studio Networks.
- [ABS] In-Studio JobBoard.
- [ABS] Lead Form Component.
- [ABS] Newsletter Form Component.
- [ABS] Create Business Modal Form.
- [ABS] Email Template Editor Pages.
- [ABS] Token Management Options Page.
- [ABS] Stock Items Categorizer.
- [APS] EN-US, ES-CO Localizations.
- [APS] Account Mgmt. Email Alerts.
- [APS] Google ReCaptcha Service.
- [APS] Certificates Manager Service.
- [APS] OAuth & IODC Service Support.
- [ABS] Social Feeds & Post Reactions Bar.
- [ABS] PortalContext Country Selector Form.
- [ABS] PortalContext Currency Selector Form.
- [ABS] PortalContext Language Selector Form.
- [ABS] Monaco Editor Component for WebContent.
- [ABM] AccountHolder Birthday & Gender Properties
- [ABM] IPortalContext Interface and default implementation (PortalContext Class)
- [ABM] ISocialDataService Interface and default implementation (SocialDataService Class)
- [ABM] IAssembliesService Interface and default implementation (AssembliesService Class)
- [ABM] IPaymentsService Interface and default implementation (BankTransferPaymentsService Class)
- [ABM] IStorageService Interface & implementation (FileSystemStorageService, AzureStorageStorageService & AwsS3StorageService Classes)

### Changed
- [ACL] Updated Dependencies to the latest version
- [ABM] Improved Queries
- [ABM] Improved MarketplaceData
- [ABM] Improved Memory Allocation
- [ABS] Studio Dashboard Icons.

### Removed
- [ACL] Remove deprecated dependencies

### Fixed
- [ABS] Portal & Tenant Selector.
- [ICX] Duplicated Recently Viewed Product Records.
- [ABS] Fix Invoice Outliner Glitch.
- [ABS] Fix Web Installer Versioning Glitch.
- [ABS] Fix FHIR Server Pooling Glitch.
- [ABS] Fix Portal Domain Bindings.
- [ABS] Fix Network Dashboard Deadlock on IP Verification.

## [1.3.0] - 2021-07-12

Added the Oracle database provider and a service for reading and writing options.

### Added
- [ABM] Oracle Database Provider.
- [ABM] IOptionsService Interface and default implementation (OptionsService)

### Changed
- [ACL] Updated Dependencies to the latest version.

### Removed
- [ACL] Remove deprecated dependencies.

### Fixed
- [ABS] Fix Workflows Data Provider (LiteSQL)
- [ABM] Entities Disambiguation


## [1.2.1] - 2021-07-13

Added a view rendering cache and assembly scoping.

This release carries a date one day later than 1.3.0 below it. Both published dates are preserved as recorded; the order here follows the version number.
### Added
- [ABS] View Rendering Cache
- [ABS] AppDomain Assembly Scoping


## [1.2] - 2021-07-12

The Razor theming engine arrived, with custom portal options and support for Angular and React single-page applications.
### Added
- [ABS] Razor Theming Engine
- [ABS] Custom Options Manager (API)
- [ABS] Portal Option Manager (UI)
- [ABS] Custom Portal Option Definitions
- [ABS] Virtual SPA Support (Angular/React)
- [ABS] Custom Service Endpoint Definitions

## [1.1.9] - 2021-06-30

Themes could be precompiled ahead of serving.
### Added
- [ABS] Theme Precompilation

## [1.1.8] - 2021-06-18

Workflows arrived.

### Added
- [ABS] Workflows Capability


## [1.1.7] - 2021-06-06

Web content authoring arrived: editable pages, components and templates, a blog editor, a drag and drop live editor in preview, invoice tools, and the first localization support.
### Added
- [ABS] Log Viewer
- [ABS] Template Views
- [ABS] View Components
- [ABS] Blog Post Editor
- [ABS] Drag 'n Drop Live Editor. (Preview)
- [ABS] Support for Angular and React+Redux SPAs
- [ABS] Initial Web Content (Editable Pages, Components & Templates)
- [ABS] Internal Web Content (Sys locked Pages, Components & Templates)
- [ABS] Frontend Admin Bar
- [ABS] Invoice Outliner
- [ABS] Invoice Manager
- [ABM] Marketing Module Models
- [ABS] Project Service Models
- [ABM] LMS Service Models
- [ABS] Add support for Bootstrap CSS
- [ABS] Add support for Foundation CSS
- [ABS] Adds support for Fabric JS and Fluent UI.
- [ABS] Ensure non-existence of viral licensed libraries. (e.g GNU)
- [ABS] Adds IViewBuffer, Resx, and Model Resolver to Theming Engine
- [ABS] Adds Localization String Manager. Initial Localization Capabilities.

### Changed
- [ABS] Fix HTTP context access on IIS making the installation process fail.
- [ABS] Fix HTTP context access on IIS when trying to create a new view.
- [ABS] Fix HTTP context access on IIS when trying to edit a new view.
- [ABS] Fix HTTP context access on IIS when trying to create a new post.
- [ABS] Fix HTTP context access on IIS when trying to edit a new post.
- [ABM] Fiscalization document Models
- [ABM] Project Service document Models
- [ABM] Pricing engine Models
- [ABM] Workflow engine Models
- [ABM] Web Content Records now share a single base class
- [ABM] ItemPriceList is now a PriceListRecord.
- [ABS] Fix error when referencing scripts into a Web Content being malformed by Theming engine.
- [ABS] Fix page tree navigation on the live editor.


## [1.1.6] - 2021-04-21

Search engine and analytics integrations arrived, along with view precompilation and dynamic portal metadata.
### Added
- [ABS] View Precompilation
- [ABS] Internal Plugin Support+
- [ABS] Dynamic Portal Metadata
- [ABS] Google Meta Tags Integration
- [ABS] Google Analytics Integration
- [ABS] Google Verification Code Integration
- [ABS] Bing Verification Code Integration
- [ABS] Pinterest Verification Code Integration
- [ABS] Facebook Pixel Verification Code Integration
- [ABS] ICX Taxonomies Creation Blazor Pages.
- [ACL] Store Configuration Objects.
- [APS] External Authentication Provider configuration pages.

### Changed
- [ABP] Fix error while previewing files on File System Explorer.
- [ICX] Fix error where new users got a 500 when visiting the store.
- [ICX] Update Swiper to the latest version.
- [ABS] Monaco editor now lives inside the project instead of as a node module.
- [ICX] ICX Static Files audit, bundling & minification.
- [ICX] Fix UI error on cart record addition/deletion.
- [APS] Fix Auth Error: when users do not belong to any tenant, they used to get an E500 on nested File Retrieval.
- [ABM] Model Modification to support DB-stored precompiled views.
### Removed
- [ICX] Taxonomies Creation Controllers/Views.

## [1.1.4.x] - 2021-04-13

Sign-in through eight external providers, and a wide set of search engine and storefront customizations.
### Added
- [ABS] Extension Updates Page
- [ABS] Razor Theming Engine
- [APS] Google Authentication
- [APS] Facebook Authentication
- [APS] Microsoft Authentication
- [APS] Twitter Authentication
- [APS] LinkedIn Authentication
- [APS] Instagram Authentication
- [APS] Github Authentication
- [SEO] Zift 123 Analytics Script Integration
- [SEO] Facebook Pixel Integration
- [SEO] Facebook Chat Widget Integration
- [SEO] Google Analytics integration
- [SEO] Google Merchant Center integration
- [SEO] Google Verification Code Integration
- [SEO] Google Tag Manager Integration
- [SEO] Bing Verification code integration
- [SEO] Pinterest verification code integration 
- [SEO] Dynamic Structured Metadata
- [UI] Adds Off-Canvas Cart Slider
- [UI] Dynamic Top Bar content
- [UI] Logo size customization options
- [UI] Footer Dynamic Content
- [UI] Footer/Header Dynamic styling


## [1.1.3.x] - 2021-04-09

The dependency set the platform is built on was established.
### Added
- [ACL] Radzen.Blazor is now a project dependency. 
- [ACL] RabbitMQ.Client is now a project dependency. 
- [ACL] Fluid.Core is now a project dependency. 
- [ACL] FluentValidation is now a project dependency. 
- [ACL] NuGet.Packaging is now a project dependency. 
- [ACL] FluentEmail.Core is now a project dependency. 
- [ACL] Flurl.Http is now a project dependency. 
- [ACL] Standard.Licensing is now a project dependency. 
- [ACL] NodaTime is now a project dependency. 
- [ACL] Serilog is now a project dependency. 
- [ACL] Autofac is now a project dependency. 
- [ACL] CsvHelper is now a project dependency. 
- [ACL] Dapper is now a project dependency. 
- [ACL] AngleSharp is now a project dependency. 
- [ACL] IdentityServer4 is now a project dependency. 
- [ACL] DotLiquid is now a project dependency. 
- [ACL] Emitter is now a project dependency. 
- [ACL] MediatR is now a project dependency. 
- [ACL] SixLabors.ImageSharp.Web is now a project dependency. 
- [ACL] RazorLight is now a project dependency. 
- [ACL] MassTransit is now a project dependency. 
- [ACL] ZXing.Net is now a project dependency. 
- [ACL] Z.EntityFramework.Plus.EFCore is now a project dependency. 

### Changed
- [ABP] Fix error where plugin assembly paths always returned null (IPluginManager Implementation)


## [1.1.2.x] - 2021-02-23

The extensions gallery, web installer and admin portal arrived, together with a file manager and antivirus scanning for uploads.
### Added
- Adds ABP Proxy
- Missing ACL configuration Types
- ABS Extensions Gallery
- ABS Extensions Installer
- ABS Web Installer
- ABS Admin Portal
- Dynamic Web Page/Post creation
- Assembly Explorer
- Roles and Permissions Explorer
- Admin Dashboard Initials
- Added support for SixLabors.ImageSharp.Web
- Forex service data is now scraped by Alliance Business Systems.
- Data Services are not coded to replaceable interface implementation.
- ABS.Hub project now contains everything we need to create a new ABS Instance.
- Added support for IdentityServer4 as a replacement for Alliance Passport Services.
- ACL.Licensing is now a part of the Alliance Business Suite.


### Changed

- Extracts interface for ACL configuration Types
- ACS is now ABP.BotEngine
- Plugin Manager is now loosely coupled to IPluginManager
- Adds File Manager and FileSystem Service
- Adds antivirus scanning extension for FileSystem Service (Windows Defender)
- AccountHolder is now the standard identity class.
- Fix minor UI glitches and broken links.
- Fix several bugs on application startup and related extensions.

### Removed
- Data Helpers marked for deprecation.
- ABS.Nucleus was deprecated and is no longer a part of this project.

## [1.1.1.x] - 2021-01-20

Infinity Comex support arrived, with the first set of portal interface components.
### Added
- Adds ABP Proxy
- Adds Infinity Comex Support
- Missing ACL configuration Types

### Changed
- Fix Namespaces
- ABS.Portal.Paperbits is now ABS.Portal.Editor
- Adds ABS.Portal.UI Components (20+ View Components)

### Removed


## [1.1.0.x] - 2021-01-12

The first published packages, and the Blazor admin application at /admin.
### Added
- Nuget Packages @1.1.0
- Initial Portal Admin Blazor Application at route /admin.

### Changed
- Standardize namespace at v1.1.0

### Removed

## [1.0.0.x] - 2020-12-31

The first release. Multi-tenant, multi-portal and modular from the start, with authentication and granular permissions, REST and GraphQL APIs, multi-currency support, storage, notifications and background processing.

### Added
- Authentication / User Management / Profile Management
- Authorization / Roles Management / Granular Permissions
- Blazor Support
- Cross-Platform Database Support ( MySQL, MSSQL )
- Dynamic CSS/Lazy Loading
- Dynamic Page Compositing Model / Site & Page Management
- Dynamic Routing
- Dynamic Swagger Specs
- EF Core Migrations for Database Installation / Upgrade
- Enabled for Infinity Comex (eCommerce Extension)
- Event Logging / Audit Trail
- Extensibility via Custom Modules
- Extensibility via Custom Themes
- Folder / File Management (Azure Storage, File System)
- graphql API with Voyager, GraphiQl y GraphQl Playground
- Headless API with Swagger Support
- HealthCheck Rules with UI Support
- i18n Enabled (Based on GeoAPI and Custom Settings)
- Improved JavaScript reference support
- In-App CLI (Studio Commander)
- Infinity Comex Support (ABS eCommerce Engine)
- JavaScript Lazy Loading
- Modular Architecture
- Multi-Currency Support
- Multi-Portal ( Monolith & Micro-Service Distributed )
- Multi-Tenant ( Shared Database & Isolated Database )
- Notifications / Email Delivery
- Notifications / SMTP Delivery
- Progressive Web Application Support
- Recycle Bin
- REST API with Swagger Support
- Scheduled Flows ( Background Processing )
- Scheduled Jobs ( Background Processing )
- Seamless Upgrade Experience
- Slack integration (OAuth)
- Support For Additional Authentication Providers (OAuth)
