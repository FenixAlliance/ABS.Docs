# General Services Overview

The Alliance Business Suite provides a wide set of functionalities wrapped as services specially designed to provide our customers with enterprise-class capabilities for common business processes in small and mid-sized companies across industries, enabling them to manage more complex processes, such as assembly, manufacturing, service, and warehouse management.

## Multi-Tenancy Functionality

The Alliance Business Suite isolates into business tenants a set of functionalities such as data access, web portals scoping, record scoping, user enrollment, among others, to allow several businesses to live into the same Alliance Business Suite server. These capabilities also enable customers to create multi-business experiences such as marketplaces, social networks, and more!

## Multi-Currency Functionality
Built-in to the very heart of the Alliance Business Suite is the capability of managing multi-currency operations with live and historical foreign exchange data. The powerful Forex Service is designed to help businesses who manage operations in multiple currencies, giving them the ability to introduce amounts any currency for records such as products, invoices, payments, and more, even accounting records, while still being able to perfectly balance financial statements and accounting reports, displaying records on each user's favorite currency and even creating multi-currency or even multi-national fintech portal capabilities.

Multi-Currency is extremely powerful given its inner behavior: it converts each amount into United States Dollars and takes a snapshot of live forex exchange data on each record upsert. This forex snapshot might or might not be bound to a particular day, and might be regularly updated for the purpose of displaying up to date currency conversions, met the following criteria: 

- Forex Shapshots on Accounting Records such as Invoices, Payments, Account Records, Ledger Records and more won´t be updated unless explicitly requested by a user with "invoice_manage" permission.
- Forex Snapshots on Sales & Logistics Records such as Deal Units, Stock Items (Courses, Licenses, Products, Services, Subscriptions, etc.) will be kept up to date with the latest Forex Exchange data for the purpose of allowing businesses to keep their prices up to date with the current exchange rate, regarding the currency they've selected to input any given financial amount. 




 
