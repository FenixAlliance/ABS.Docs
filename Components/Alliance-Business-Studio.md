# Alliance Business Studio (ABS Studio) 
---

The Alliance Business Studio is the Graphical Administration Engine for the Alliance Business Suite. It allows users to manage their instances, transact data, generate and consume views, reports, customize and extend the system, and much more.

We're building the Alliance Business Studio to help you manage your entire Alliance Business Suite trough an intuitive, user-friendly interface designed to increase your productivity by using cutting-edge technologies such as Blazor on .NET, allowing us to deliver bazing-fast functionalities.


## Accessing the Studio

The Alliance Business Studio can be used by navigating to the `/Studio` route on an existing Alliance Business Suite installation. To access the Alliance Business Studio, Account Holders are required to, at least, have the `studio_access` [permission](/Components/Alliance-Passport-Services/Business-Permissions). 

By default, business tenant administrators can access the studio independently of whether or not they have the `studio_access` permission. 

We recommend customers to enforce Multi-Factor Authentication on Administrator Accounts to increase security on privileged [account holders](/Components/Alliance-Passport-Services/Account-Holders).

# Extending the Studio

The Alliance Business Studio is built on top of the Alliance Business platform and extends it's functionality through pluggable modules and integrations. In fact, the Alliance Business Studio itself is an Alliance Business Platform Module.

Modules can be hooked to the Alliance Business Studio to allow instance owners to interact with data and functionalities exposed by such module. This is convenient for developers looking to extend the Alliance Business Platform as it provides a clean interface and thousands of ready to use UI components and tools to create data-driven business applications.




