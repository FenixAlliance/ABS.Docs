
# Alliance Business Model (ABM) Schema
---

In a nutshell, the Alliance Business Model serves as the main dynamic data layer for the entire Alliance Business Suite.

The Alliance Business Model is a declarative schema definition of standard entities representing commonly used concepts and activities across business and productivity applications, and is being extended to observational and analytical data. 

The Alliance Business Model provides well-defined, modular, and extensible business entities such as Account, Deal Unit, Case, Contact, Lead, Opportunity, and Product, as well as interactions with suppliers, employees, and customers, such as activities and service level agreements. 



# Configurations
When installing the Alliance Business Suite on a given server, you'll be required to provide the Connection Strings to the Database that will host the Alliance Business Model Schema.

You can change several configurations using these connections strings to, for example, increase/decrease certain default values or even to point to other database (when migrating, for example) and, Although **not recommended**, you can even change the Database Engine that's providing SQL services to your running instance.


# Providers

The Alliance Business Model was designed to work with several SQL Database providers such as Oracle SQL, Microsoft SQL Server, MySQL, MariaDB, PostgreSQL.

The SQL engine that your Alliance Business Suite's instance is going to use can be selected on the [installation process](/Fundamentals/Installation.md).


# Extensions

We're currently working to let anyone extend the Alliance Business Model definitions to capture additional business-specific scenarios.

As of 1.2.0, Custom engines can be supported by generating the apropiate migrations required for the [Alliance Business platform](/Components/Alliance-Business-Platform.md) in order to work properly.

When building custom engines, you'll be required to manage these migrations yourself, which is kind of a pain, so we're experimenting on in-Database-Database Engine as well as NonSQL interoperability to allow customers to easily extend the Alliance Business Model Schema Specification. Also, we're working on providing Per-Record SQL File-Databases with Distributed File System Support.

We're also currently working on providing even more convenient interfaces for customers extending the Alliance Business Model procedurally or trough the [Alliance Business Studio](/Components/Alliance-Business-Studio.md).


# Entities

Use the [Alliance Business Suite's API reference](https://docs.absuite.net/reference/html/) to explore and learn about all the available [Alliance Business Model entity definitions](https://docs.absuite.net/reference/html/d6/d73/namespace_fenix_alliance_1_1_a_b_m_1_1_models.html), their attributes, and purposes. These entities span several business domains and describe data in different applications and solutions. For example, you can find entity definitions related to Accounting, Learning, Human Resources and more.

We also maintain a Visual Reference Diagram on GitHub to allow customers to easily identify entities on the Alliance Business Model.

