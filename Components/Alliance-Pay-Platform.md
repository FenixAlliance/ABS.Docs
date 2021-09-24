# Welcome to the Alliance Pay Platform Documentation

By leveraging industry-leading APIs from vendors like MasterCard, Visa, and several payment gateways, Alliance Pay Platform provides multi-channel global payment processing services, advanced fraud prevention, and risk management solutions.

## Features

- **Instant activation**: our clients can make transactions in 2 minutes. It also allows for fully online incorporation with minimal documentation.
- **Easy integration**: through SDKs for several languages, integrate, and start using Alliance Payment Platform in less than an hour.
- **API Driven**: Build your business at scale with our full API-based automation that requires no manual intervention.
- **Multiple payment methods**: we have at your disposal more than 22 payment methods available. And others will constantly be added.
- **The best support**: it is based on tickets, telephone and chat, which are always available to help you solve each step you take.
- **Admin Dashboard** - Refers to real-time data and information in your Alliance Payment Platform dashboard to make informed business decisions.
- **Secure**: based on compliant standard PCI DSS Level 1 transactional processing services.

## Prerequisites

**To receive payments:** To receive payments, you must create a Cloud Business Tenant using the [Merchant Center](https://fenix-alliance.com/merchant). Once created, you'll be able to use the platform in development mode.

## Tutorial

#**To Pay an order:** 
- **If the order hasn't been confirmed**: To pay an order using the Alliance Pay Platform you must confirm it first, either through the REST order confirmation endpoint or the Collection Portal.

To confirm an order using the Collection Portal, navigate to your Dashboard > Orders, select the order you want to confirm, and click on "Generate Invoice".

**To Pay an invoice:** 

- **Once an I**: To pay an order using the Alliance Pay Platform you must confirm it first, either through the order confirmation endpoint or the Collection Portal.




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


### Pendiente

```
Franchise: American Express
Number: 373118856457642
Expiration: 12/2025
CVV: 123
Estado: Pendiente
Response: Transaction pending for validation
```
