# Signator Module (Digital Trust & E-Signatures)

Welcome to the **Alliance Business Suite | Signator Module** documentation. Signator is the platform's **Digital Trust engine**: the capability that turns your documents and business actions into **tamper-evident, non-repudiable records** that you can verify long after the fact.

Signator delivers the platform's [Trust & Compliance](~/Capabilities/Trust-and-Compliance.md) capability. It works *alongside* [Identity & Access](~/Capabilities/Identity-and-Access.md), but it is a different guarantee. Identity proves **who is signed in right now**; Signator proves that **a specific document or action is authentic and hasn't been altered**.

## Trust as a lifecycle, not a button

Signing is not a single step — it is a lifecycle, and Signator manages the whole of it:

**Author → Freeze → Sign → Verify → Evidence**

1. **Author** the document (from a template, an upload, or another module such as Accounting or Sales).
2. **Freeze** its exact bytes so the thing that gets signed can never quietly change afterward.
3. **Sign** it with a real cryptographic signature, using a key held in secure custody.
4. **Verify** the signature and re-check the content server-side — the platform never simply *trusts* that something was signed.
5. **Evidence** every step — who did what, when, and how — into a tamper-evident trail built for non-repudiation.

Because every stage is governed, a Signator record isn't just "a file with a signature on it" — it's a **provable event**.

## What Signator does for you

### Quick Sign

Prepare, freeze, and sign a document in a single guided flow. Quick Sign is the fastest path from "I have a document" to "I have a signed, sealed, verifiable record." The document is frozen before it is signed, the signature is produced with a key held in custody, and the result is sealed so it can't be altered.

### Signing requests

Request signatures the way you'd expect from a modern e-signature product:

- **Internal signing requests** — route a document to colleagues, track who has signed, and see the request through to completion.
- **External signing** — invite people *outside* your organization to sign through a dedicated portal, using an emailed link, **without needing a Studio account**. External signers get a scoped workspace that shows them only what they need to act on.

### Signature representations

Define **reusable signature representations** (your visual signature, initials, title block) once and reuse them when you sign.

### Certificates & key custody

Signator signs with real digital certificates.

### Trust evidence & verification

Every signing produces an **evidence chain**: a record of who signed, what exact content they signed, when, with which certificate, and the verification result. You can review this chain on screen, and signed-in users can re-check a signed document's signature at any time. Evidence is written by the signing pipeline itself, not editable after the fact, so the trail can be relied on.

### Sealed, tamper-evident records

Once an artifact is **sealed**, it becomes append-only: it cannot be edited or replaced. Signator keeps the reference to the exact sealed bytes together with its evidence, so you can always prove a record wasn't changed after signing. This is the foundation for audit-ready, dispute-ready documentation.

## How Signator fits with the rest of the Suite

- **Accounting & Sales** produce the documents (invoices, orders, quotes) that Signator signs.
- **[Identity & Access](~/Capabilities/Identity-and-Access.md)** establishes who a signer is; Signator makes their signature provable.
- **Storage** holds the frozen and sealed bytes; Signator holds the references and the evidence — the content and the proof stay linked.

## Availability at a glance

| Capability | Status |
|---|---|
| Quick Sign (prepare → freeze → sign → seal) | ✅ Available |
| Internal signing requests | ✅ Available |
| On-screen evidence chain & verification | ✅ Available |
| Signature representations | ✅ Available |
| External signing portal (sign without a Studio account) | ✅ Available |
| Regulated e-invoicing / authority submission (DIAN) | 🧭 On the roadmap |

## Related

- Capability family: **[Trust & Compliance](~/Capabilities/Trust-and-Compliance.md)**
- Works with: **[Identity & Access](~/Capabilities/Identity-and-Access.md)**
