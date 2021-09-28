# Welcome to the Alliance Pay Platform Documentation

By leveraging industry-leading APIs from vendors like MasterCard, Visa, and several payment gateways, Alliance Pay Platform provides multi-channel global payment processing services, advanced fraud prevention, and risk management solutions.

## Features

- **Instant activation**: our clients can make transactions in minutes. It also allows for fully online incorporation with minimal documentation.
- **Easy integration**: through SDKs for several languages, integrate, and start using Alliance Payment Platform in less than an hour.
- **API Driven**: Build your business at scale with our full API-based automation that requires no manual intervention.
- **Multiple payment methods**: we have at your disposal more than 22 payment methods available. And others will constantly be added.
- **The best support**: it is based on tickets, telephone, and chat, which are always available to help you solve each step you take.
- **Admin Dashboard** - Refers to real-time data and information in your Alliance Payment Platform dashboard to make informed business decisions.
- **Secure**: based on compliant standard PCI DSS Level 1 transactional processing services.

## Prerequisites

**To receive payments:** To receive payments, you must create a Cloud Business Tenant using the [Merchant Center](https://fenix-alliance.com/merchant). Once created, you'll be able to use the platform in development mode.

## Tutorial

###**To Pay an order:** 

Orders allow customers to create recurring payments for customers using pre-built templated orders (also called "proforma invoices").

- **If the order hasn't been confirmed**: To pay an order using the Alliance Pay Platform you must confirm it first, either through the REST order confirmation endpoint or the Collection Portal.

  To confirm an order using the Collection Portal, navigate to your Dashboard > Orders, select the order you want to confirm, and click on "Generate Invoice". This will generate an Invoice based on the Order.

**To pay an invoice:** 

- **Pay using credit card**: To pay an invoice using the Alliance Pay Platform you can use one of many payment processing methods, such as, either through the REST API endpoint or the Collection Portal.


## Test Credit Cards
### Accepted

```
Franchise: Visa
Number: 4575623182290326
Expiration: 12/2025
CVV: 123
Status: Accepted
Response: Accepted
```


### Insufficient Funds

```
Franchise: Visa
Number: 4151611527583283
Expiration: 12/2025
CVV: 123
Status: Declined
Response: Insufficient Funds
```


### Failed

```
Franchise: Mastercard
Number: 5170394490379427
Expiration: 12/2025
CVV: 123
Status: Failed
Response: Communication error with the authorization center
```


### Pending

```
Franchise: American Express
Number: 373118856457642
Expiration: 12/2025
CVV: 123
Estado: Pendiente
Response: Transaction pending for validation
```

## Collection Portals

With our extensive experience in payment processing, collection solves the main needs of your company when you need to receive payments on the issuance of invoices or provision of services. To learn more about these features visit the page fenix-alliance.com/pay/portals

Collection portals are white-labeled web applications that allow small or large companies to control the payments of their invoices or receive collections in a simplified way through different options and rules.

Below you can learn how to manage the collection portal and get the most out of its functionalities
