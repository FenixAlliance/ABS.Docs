# Working with Stock Items in the Alliance Business Suite | Logistics Module

At the most basic level, Stock items are goods that you manufacture or trade (sell and purchase). Stock Items are highly inter-related ABM Records, they can be added to Carts, Quotes, Orders, Invoices, Wishlists, and more, as well as related to one or more Categories, Tags, Brands, Price Lists, Suppliers, Warehouses, and more. 

## Stock Items Manager

Some organizations have the need to manage hundreds or even thousands of Stock Items. This process is usually boring and time-consuming. For this reason, we're constantly investing our efforts in building efficient, automatable tools to help customers infuse efficiency into their operations.

The Stock Items Manager is an Alliance Business Studio view designed to make managing stock items as fast and efficient as possible.

Infused with inline and on-page editing tools, customers can create and manage Stock Items and related records without the need for page reloads.

To access the Stock Items Manager View, head to the Studio endpoint on any Web Portal, and navigate to **Modules** > **Logistics** > **Stock Items**.

### Creating Stock Items

Stock Items can be created from the Stock Items Manager View. To do so, clock on the "Quick Create" button. This will open a panel containing the Stock Item Management Form, which contains all the fields available for Stock Items on the Alliance Business Model.

At the very least, Stock Items require a Title as well as a Stock Keeping Unit ("SKU").

![qp9IJQI6Gy.gif](/.attachments/qp9IJQI6Gy-1f8a54a0-ed7f-4e61-980e-58f46e3773a2.gif)

### Updating Stock Items

Stock Items can be filtered and updated either by using the Stock Item Management Form or the In-Line Editing capabilities built into the Stock Items Grid. You can execute any of those through the Action Buttons on every Stock Item Record displayed on the Stock Items Grid.

Updating Stock Items is as straightforward as creating them. In fact, if you use the Stock Item Management Form to update a Stock Item, you'll be using exactly the same form you've used to create it.


## Stock Item Identifiers

Stock Items are identified, at the lowest level, by a Globally Unique Identifier ("Guid") generated by the Alliance Business Model. Nevertheless, the Stock Item Record contains several fields to help customers to correlate this "Guid" with their own standards.


|Field | Description  |
|--|--|
| Barcode | UPN, EAN or ISBN Barcode |
| SKU  | Stock Keeping unit represents the code for a distinct type of item for sale. It must be unique for each [Business Tenant](/Components/Alliance-Passport-Service/Business-Tenants.md)  |
| ISBN | (ISBN-10 or ISBN-13) International Standard Book Number (ISBN)  |
| UPC  | Universal Product Code consists of 12 numeric digits that are uniquely assigned to each trade item.  |
| EAN| International Article Number (also known as European Article Number or EAN) consists of a thirteen-digit code. |
| ASIN| Amazon Standard Identification Number (ASIN) is a ten-digit alphanumeric code that identifies products on Amazon. |
| UNSPSC | United Nations Standard Products and Services Code is a taxonomy of products and services for use in eCommerce. It is a four-level hierarchy coded as an eight-digit number, with an optional fifth level adding two more digits.   |
| GTIN | Global Trade Item Number (GTIN) GTINs consists of eight, 12, 13, or 14 digits |
| MPN | Manufacturer Part Number. It is a unique number that is issued by manufacturers to identify individual products.  |
| Supplier Code | Supplier Code represents the Primary Supplier Code used to correlate each Stock Item with the Primary Supplier Standard. |

### Filtering
The Stock Items Grid contains powerful filtering capabilities. 

### Barcoding

The Stock Items Manager contains Barcoding Capabilities, meaning you can generate and update barcodes for Stock Items and then filter them out using their barcode.

To create or update a barcode, use the Stock Item Management Form and click on the "Scan Barcode" button. This will ask you permission to use your device's camera to start scanning. Once a valid barcode is recognized, the system will automatically fill out the proper fields on the Stock Item Management Form. 

Barcoding in the Logistics module enables other Modules such as Sales, Accounting, POS, and even custom modules to filter out Stock Items using either a desktop or a smartphone camera.


## Bulk Actions

The  Stock Items Management View allows customers to perform bulk actions on Stock Items, such as adding or removing pricing policies (discounts, surcharges, price adjustments), Taxes, Relations, and more.

To perform a bulk action, select the Stock Items you want to update by ticking the checkbox on the left side of each Stock Item. You can check and filter stock items without losing your current selection state. Then click on the "Bulk Actions" button. 

A Modal Prompt will appear. Select the bulk action you want to perform, configure your action and click on the Execute Button. 

Bulk actions are blazing fast (executed in the order of seconds for hundreds of records), but performing bulk actions on thousands of records can take a little while.








