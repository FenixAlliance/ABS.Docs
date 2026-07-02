# The Business Language

*Expressed through the **Alliance Business Model (ABM)**.*

Accounting, CRM, Commerce, HR, Logistics, Workflow, Marketplace, and Analytics all coexist in ABS for one reason: they speak the same **canonical business language**. That shared vocabulary is the Alliance Business Model — the platform's most important foundation, and the reason the suite behaves like one product rather than a bundle of apps.

## Why it exists

Most software locks each function into its own data model, so your CRM and your accounting system never quite agree on what a "Contact" or an "Order" is. ABS takes the opposite path: **one declarative model of standard business entities** that every capability builds on. Define a concept once, and every module speaks it. This is the *platform, not application* and *capabilities, not features* doctrines made concrete.

## What it is

A declarative model of the standard entities and relationships of a business — Account, Business Unit, Contact, Lead, Opportunity, Case, Item (product or service), Deal Unit — together with the interactions among suppliers, employees, and customers (activities, agreements, service levels). It is **modular, multi-tenant, and extensible**, and it spans domains from accounting and HR to learning and logistics. Explore the full entity reference in the [API reference](https://docs.absuite.net/reference/).

## How it works

- **Records.** Business data is stored as [records](/Components/Alliance-Business-Model/Records.md) — structured, relational data **scoped to a tenant**, composed of one or more related entities.
- **Your database, your choice.** The model runs on the major relational engines — **SQL Server, PostgreSQL, MySQL/MariaDB, and Oracle** — selected during [installation](/Fundamentals/Installation.md); ABS ships and applies the schema migrations for you.
- **Two ways in.** Reach the model through the [platform APIs](/Components/Alliance-Business-Platform.md) (REST, GraphQL, gRPC) or the [.NET SDK](/Components/Alliance-Business-Platform/SDKs.md).

## How to extend it

The model is **yours to extend** — add entities and attributes to capture business-specific scenarios through your own [modules](/Module-Development.md), no fork required. ABS follows **additive versioning**, so extending the model never breaks what already depends on it.

## How it integrates

Because the business language is canonical and shared, integrations map an external system to *one* vocabulary instead of to each module separately — and standards-based exchange (such as UBL e-invoicing) builds on the very same model. See [Integrations](/Integrations.md).

## Lineage

Originally introduced as the **Alliance Business Model** in 2020 — the canonical, declarative data layer of the Suite — the business language is today realized as the platform's **domain model**, with the relational providers supplying persistence. The namespaces evolved across generations; the concept — *one shared business language* — has held since the very first release.

---
<!-- nav -->
*Up: [Components](/Components.md) · [The Platform](/The-Platform.md)*
