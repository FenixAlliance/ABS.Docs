# Getting Started with Alliance Business Suite Web Portals

The Alliance Business Suite includes a powerful multi-portal CMS to help businesses to offer external-facing websites that allow users outside their organizations to sign in with a wide variety of identities, create and view data in and from the Alliance Business Model, or even browse content anonymously. The full capabilities of Alliance Business Suite Portals are available as of Version 1.2.

You have the ability to create a Portals Web Portals Network ("WPN") for each Business Tenant by using the multi-portal feature. Business tenants can create as many Web Portals under the same instance as they need.

Web Portals are scoped to a Business Tenant to allow customers to deliver experiences that **directly transact data with the Alliance Business Model** and additional Data Sources. This means that users can perform a controlled (yet extensible) number of actions (like adding products to their cart, update their profile, create addresses, generate orders, access quotes, invoices and so much more)

# How do Portals Work?

Web Portals are content sets that belong to a Business Tenant. Portals make use of the powerful Alliance Business Suite Razor Engine to group Web Content under a single domain.

## Configuring Domains

Compared with a typical single-portal ABS instance, a **WPN installation** has additional considerations.

Every fresh Alliance Business Suite instance comes with one default Portal owned by the Business Tenant that was created through the installation process. This Root Portal must exist and is defined by your instance's settings file.

Alliance Business Suite Portals can have additional related domains/subdomains. 

Domains should resolve to your instance's public IP Address. Also, domains should be related to a portal for the multi-tenant data router to work properly.

## Themes and Modules

When you enable a WPN Instance: each Web Portal of a network can activate both modules and themes individually, but installation is done at an instance scope, which means they are available to every Web Portal present on your instance.

You must have access to your domain's DNS settings.

# Configuring a Multi-Portal Network 

## 1. Preparing your instance

Unless this is a fresh install and you have no data to lose, please backup your database and file system.

## 2. Select a Business Tenant

When you create a new portal, you do so under the scope of a Business Tenant. This means that you should have permissions from the Business Tenant to access the Studio and "create_portals" at the very least.

## 3. Create Web Portal

To create a Web Portal, login as an authorized user and select the Business Tenant that will own the Web Portal.

Acting as the selected Business Tenant, click on the cogs icon on the top-right hand side of the Studio Header.

Click on Portals and provide a Title and a root domain (**the Root Domain should be a Subdomain of the Root Portal's Root Domain**. This means that every portal's Root Domain is relative to the domain that you used to install your instance).

E.g: If you installed your instance under the https://example.com domain, each subsequent Web Portal will have a Root Domain that's scoped to the Root Portal's domain, like so: https://NewPortalRootDomain.example.com

## 4. Create a Primary Domain (optional)

In order to set up another domain that's not related to the Root PortalDomain, you should create a security rule to allow traffic through certain domains and then map the rule to your new Web Portal.

## 5. Create Additional Domains (optional)

You can have more than one domain mapping to the same Web Portal. You can choose whether or not this mapping should be performed through an HTTP redirection. To create and map an additional domain to a Web Portal, create the new domain under the Admin section for your Business Tenant, under Admin > Security > Domains. Then, navigate to the portal that this Domain should map to and select it from the domains tab.





