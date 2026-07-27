# Accounting

*The financial truth layer of your business — a governed, double-entry ledger where every financial event becomes a balanced, auditable entry.*

## What it is

Accounting is the core of the **Finance** capability in the Alliance Business Suite. It's a complete **double-entry general ledger**: every movement of value — a sale, a payment, a refund, a transfer — is recorded as a **balanced journal entry**, so your books stay accurate, auditable, and always in balance.

It's not a bolt-on accounting package. Because it shares the platform's one business model, one identity, and one security model, Accounting is the **single source of financial truth** the rest of the Suite posts into: Commerce records a sale, Payments settles it, and Accounting is where it becomes a permanent, balanced entry in your ledger.

## What you can do

- **Maintain your chart of accounts** — organize assets, liabilities, equity, income, and expenses the way your business actually works.
- **Organize your books** — group accounts into ledgers and financial books, and keep separate books of record where you need them.
- **Record journal entries** — capture transactions as debits and credits that always balance.
- **Post with confidence** — posting seals an entry. Once it's posted, it's permanent and part of your official record.
- **Correct by reversal** — a mistake is never quietly erased. It's reversed with a compensating entry, so you keep a complete audit trail.
- **Control your periods** — open and close fiscal periods, so nothing posts into a closed month by accident.
- **Work in any currency** — record in the transaction currency, hold balances in each account's currency, and report in a common one.
- **Run a trial balance** — confirm your books balance, any time.

## Key concepts

| Concept | What it is |
|---|---|
| **Account** | A line in your chart of accounts — an asset, liability, equity, income, or expense. |
| **Ledger / Financial book** | How accounts are grouped into a book of record. |
| **Journal** | A register that groups related entries, bound to a financial book. |
| **Journal entry** | A single balanced transaction — its debits equal its credits. |
| **Posting line** | One side of an entry: a debit or a credit to one account. |
| **Fiscal period** | An accounting period — a month, say — that can be open, closed, or locked. |
| **Posting** | Sealing a draft entry into the permanent record. |
| **Reversal** | The lawful way to correct a posted entry — a compensating entry, never an edit. |
| **Trial balance** | A report that proves total debits equal total credits across your accounts. |

## The guarantees

Accounting is built to be **trustworthy by design**. A few rules hold on every single entry:

- **Every entry balances.** Debits always equal credits, so an unbalanced entry can't be posted.
- **Posted is permanent.** Once an entry is posted, it's immutable. You correct it by **reversal**, so the record of what happened is never rewritten — an audit-grade, append-only history.
- **Closed periods stay closed.** An entry can only post into an **open** fiscal period, so a prior period can't be disturbed once it's closed.
- **Multi-currency is first-class.** Each entry carries its **transaction** amount (the currency of the event), each account holds balances in its **own** currency, and it all rolls up to a common **reporting** currency. Rates are frozen at the moment of posting, so a posted entry never changes value later.
- **Standards-ready.** The mechanics follow international double-entry principles — normal balances, and foreign-currency treatment aligned with IAS 21 — so your books are prepared for standards-based reporting.

## Using it in the Studio

You'll find Accounting in the Studio under **Modules → Accounting**:

- **Accounts** — your chart of accounts, with live balances.
- **Journals & financial books** — organize your books of record.
- **Journal entries** — create, post, and reverse entries.
- **Fiscal periods** — open and close your accounting periods.
- **Reports → Trial balance** — confirm your books balance.
- **Posting executions** — an operator view of automated postings, and any that need attention.

## Works with the rest of the platform

Accounting is where financial events from across the Suite become permanent record:

- **[Billing](~/Modules/Accounting/Billing.md)** — orders, invoices, and payments.
- **Commerce & sales** — a sale becomes a balanced entry, automatically.
- **Payments** — settlements post into the ledger as they're confirmed.
- **Analytics & reporting** — your posted ledger is the trusted source for financial reporting.

## For developers

Accounting is fully available over the platform APIs — the `AccountingService` REST surface, plus GraphQL and the SDKs. See **[Web API Development](~/get-started/Web-API-Development.md)** and the **[API Reference](~/reference/References.md)**.
