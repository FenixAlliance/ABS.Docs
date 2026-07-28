# Signator Module (Digital Trust & E-Signatures)

Welcome to the **Alliance Business Suite | Signator Module** documentation. Signator is the platform's **Digital Trust engine** — the capability that turns your documents and business actions into **tamper-evident, non-repudiable records** that you, your counterparties, and your regulators can verify long after the fact.

Signator delivers the platform's [Trust & Compliance](~/Capabilities/Trust-and-Compliance.md) capability. It works *alongside* [Identity & Access](~/Capabilities/Identity-and-Access.md) — but it is a different guarantee. Identity proves **who is signed in right now**; Signator proves that **a specific document or action is authentic, hasn't been altered, and can be checked by an outside party** who was never logged into your system.

## Trust as a lifecycle, not a button

Signing is not a single step — it is a lifecycle, and Signator manages the whole of it:

**Author → Freeze → Sign → Verify → Evidence → Submit**

1. **Author** the document (from a template, an upload, or another module such as Accounting or Sales).
2. **Freeze** its exact bytes so the thing that gets signed can never quietly change afterward.
3. **Sign** it with a real cryptographic signature, using a key that stays locked in secure custody.
4. **Verify** the signature and re-check the content server-side — the platform never simply *trusts* that something was signed.
5. **Evidence** every step — who did what, when, and how — into a tamper-evident trail built for non-repudiation.
6. **Submit** it to an external authority when the document is regulated (for example, electronic invoices to a tax authority).

Because every stage is governed, a Signator record isn't just "a file with a signature on it" — it's a **provable event**.

## What Signator does for you

### Quick Sign

Prepare, freeze, and sign a document in a single guided flow. Quick Sign is the fastest path from "I have a document" to "I have a signed, sealed, verifiable record." The document is frozen before it is signed, the signature is produced with a key held in custody, and the result is sealed so it can't be altered.

### Signing requests

Request signatures the way you'd expect from a modern e-signature product:

- **Internal signing requests** — route a document to colleagues, track who has signed, and see the request through to completion.
- **External signing** — invite people *outside* your organization to sign through a dedicated portal, using an emailed link, **without needing a Studio account**. External signers get a scoped workspace that shows them only what they need to act on.

### Signature representations & placement

Define **reusable signature representations** (your visual signature, initials, title block) once, then place them exactly where they belong on the page. Signator stamps the visual representation onto the document **before it is sealed**, so what a reader sees and what is cryptographically protected are one and the same.

### Certificates & key custody

Signator signs with real digital certificates — but **your private keys never leave secure custody**. The key material is held in a hardened key store and the actual signing happens **inside** that store; the platform asks custody to sign a hash and gets a signature back. Keys are never exported, never written to disk in the clear, and never handled by the application layer. This is what makes the signatures both legally meaningful and operationally safe.

### Trust evidence & verification

Every signing produces an **evidence chain** — a record of who signed, what exact content they signed, when, with which certificate, and the verification result. You can review this chain on screen, and an included verification view lets you re-check a signed artifact at any time. Evidence is written by the signing pipeline itself, not editable after the fact — so the trail can be relied on.

### Sealed, tamper-evident records

Once an artifact is **sealed**, it becomes append-only: it cannot be edited or replaced. Signator keeps the reference to the exact sealed bytes together with its evidence, so you can always prove a record wasn't changed after signing. This is the foundation for audit-ready, dispute-ready documentation.

### Regulated e-invoicing & authority submission

For documents that must be filed with an external authority — most notably **electronic invoicing** — Signator extends the same lifecycle with an authority-submission step. The canonical business document (an invoice, credit/debit note, and so on) is translated into the authority's required format, signed to that authority's standard, submitted, and the authority's identifiers and verdict are recorded as evidence.

- See **[DIAN Invoicing](~/Modules/Signator/DIAN-Invoicing.md)** for electronic invoicing in Colombia.

> Signator's authority-submission design is **authority-neutral** — Colombia's DIAN is the first supported authority, and the same engine is built to extend to other jurisdictions without changing how the rest of your documents are signed.

## How Signator fits with the rest of the Suite

- **Accounting & Sales** produce the documents (invoices, orders, quotes) that Signator signs and, when required, submits to an authority.
- **[Identity & Access](~/Capabilities/Identity-and-Access.md)** establishes who a signer is; Signator makes their signature provable.
- **Storage** holds the frozen and sealed bytes; Signator holds the references and the evidence — the content and the proof stay linked.
- **[Sustainability](~/Modules/SUSTAINABILITY.md)** and other compliance reporting draw on the same trustworthy record base.

## Availability at a glance

| Capability | Status |
|---|---|
| Quick Sign (prepare → freeze → sign → seal) | ✅ Available |
| Internal signing requests | ✅ Available |
| On-screen evidence chain & verification | ✅ Available |
| Key custody (keys never leave the key store) | ✅ Available |
| Signature representations & on-page placement | 🔵 Rolling out |
| External signing portal (sign without a Studio account) | 🔵 Rolling out |
| Regulated e-invoicing / authority submission (DIAN) | 🧭 On the roadmap (legacy DIAN edition available today — see [DIAN Invoicing](~/Modules/Signator/DIAN-Invoicing.md)) |

## Related

- Capability family: **[Trust & Compliance](~/Capabilities/Trust-and-Compliance.md)**
- Works with: **[Identity & Access](~/Capabilities/Identity-and-Access.md)**
- Regulated invoicing: **[DIAN Invoicing](~/Modules/Signator/DIAN-Invoicing.md)**
