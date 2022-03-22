# Working with Invoices on Accounting Manager.

When a Contact places an order, you can create an invoice to bill them for the upcoming sale. 

## Creating Invoices
Typically, you convert an order into an invoice; however, you can also create an invoice that does not originate from an order. To create an Invoice, you can either navigate to your sales orders, select an existing Order and create an Invoice from it, or you can also create a new invoice that's not related to any order by navigating to Accounting > Billing > Invoices > Create.

### Assigning Invoices to Contacts
As an Accounting Record, Invoices can be related to any Individual/Organization (or both) present on your Contact Sight CRM. To assign an Invoice to a Contact, simply select it from the dropdown list when outlining your new invoice.

**Remarks**: By default, every Individual/Organization on your CRM will be available to be selected as the owner for an Invoice; however, when you select an Individual, the Organizations Dropdown List will be filtered to display only those organizations that are somehow related to the selected Individual. Likewise, if you select an Organization first, the Individuals Dropdown List will be filtered to display only those Individuals that are somehow related to the selected Organization.

### Assigning Invoices to Identities
You can also decide whether or not to relate an identity to your invoices. Identities such as [Account Holders](/Components/Alliance-Passport-Service/Account-Holders.md) or [Business Tenants](/Components/Alliance-Passport-Service/Business-Tenants.md) are users within the Alliance Business Model which can access business applications built with Alliance Business Suite.

When you select an Individual as the Owner for an Invoice, you will be able to select its related Account Holder if you want your invoice to be available through the Studio/API for that particular user. Likewise, when you select an Organization as the owner for your invoice, its related Business Tenant will become available on the Business Dropdown to be selected. (See [Contact Relations](/Modules/Contact-Sight/Contact-Relations.md))


### Adding Invoice Lines
One of our goals is to make it as easy and intuitive as possible to outline Invoices, Debit Notes & Credit Notes.
To add an invoice Line, click on the Add Invoice Line button on your Invoice Outliner & fill out the form.

By default, you will only have to select the Stock Item you want to sell and introduce a quantity. The Accounting Engine will automatically calculate the total amounts depending on the Invoice's Price List (if any) for the invoice line, but total control over these values is made possible through Custom Calculations.

### Customizing Invoice Line Calculations
By default, when you add a new Invoice Line to an Invoice, automatic calculations are made based on the selected Stock Item and the Invoice's Price List. However, you can switch to custom calculations to control the values that contribute to the Total Line's Amount.

### Adding Tax Policies to Invoice Lines
To add a Tax Policy to a Line, the new Policy needs to exist the Accounting Manager. Once it exists, it will be available to be selected when you click on the "Add Tax" button on the Line Outliner Form.

Once you add the tax policy, it will be automatically calculated having as tax base the current Line's Tax Base Amount.

### Understanding Tax Calculations
Applied Tax Policies contribute to the Total Amount of each Line by their respective percentages. e.g If a Tax Policy named VAT with a 19% value is added to a Line, it will increase the Tax Amount by 19& of the Tax Base, therefore increasing the Total Amount for that Line. 

## Updating Invoices
Updating Invoices is as simple as creating them. If an invoice is marked as a draft (hasn't been closed, signed, or reported) every change is allowed (including changing its owner, date, Forex Rate, and more). Nevertheless, once that invoice is no longer a draft, the Accounting Manager won't allow updates or recalculations. Reopening an Invoice requires Global Administrator Privileges.

## Closing Invoices
Once your invoice is perfectly outlined, you will be able to close it. Closed Invoices become permanent, unmutable records. Once you have closed your Invoice, you can export it to multiple formats like JSON, XML, PDF, HTML, UML. Closed Invoices also become available to its Related Identities via the Studio & APIs. 

## Deleting Invoices
To delete an invoice, head to the Invoice Details Page and select Delete from the Actions Bar. Only Draft Invoices can be deleted.

## Getting Payments for Invoices

Once your invoice is closed, you can collect payment for your invoice using any of the Alliance Business Suite's integrations for Payment Gateways.


## Send an Invoice through Email
Once your invoice is marked as closed, a new option to send an email containing a representation for your invoice will become visible. To send an email, simply click on that button, enter an email and click send.
 
## Reporting Invoices to Fiscal Authorities
In some cases, Invoices need to be reported to their respective fiscal identities, either in a statement or through a digital service. Althousg Accounting Manager itself does not contain the capabilities to automatically report Invoices to their Fiscal Authority, several integrations have been created to do so with fiscal entities from several countries such as Colombia, Costa Rica, México & more.

## Adjusting Forex Rates for Invoices
Forex Rates serve to calculate the Foreign Exchange Conversion over which a particular invoice was outlined, when it was outlined. If the currency in which either an Invoice or an Invoice Line was created us equal to USD, the Forex Rate will be 1.0. Otherwise, it will contain the total amount (in the selected currency) needed to exchange 1 USD as of the Invoice's Date.