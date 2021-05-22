# Accessing data from the Alliance Business Model engine.
If you've ever had to bring data from multiple systems and applications together, you know what an expensive and time-consuming task that can be. Without being able to share and understand the same data easily, each application or data integration project requires a custom implementation.

The Alliance Business Model simplifies this process by providing a common data model that includes entities that represent commonly used business concepts and activities, such as **Contact**, **Invoice**, and **Account**, to simplify the creation, aggregation, and analysis of data.

## Why use the Alliance Business Model?

Commonly, businesses have more than one application to cover specific business operations such as eCommerce, Accounting, Sales, Marketing, CRM, and more. These are a lot of applications and they consume time and money, but that's not it! they all have different representations for the Contact Entity. This can be frustrating when trying to integrate these applications together to produce better and automated outcomes. To solve this issue, you can build those apps on top of a standardized data schema, allowing you to share the same entities across applications. Of course, your application might have different data requirements between them, so you can extend the predefined schemas and even create new schemas!

One cool thing about this is that when it comes the time to create a new business application, your data schemas will be ready to provide the required data infrastructure for your application and share this data with every other application.

Alliance Business Model simplifies data management and app development by unifying data into a known form and applying structural and semantic consistency across multiple apps and deployments. To summarize the benefits:

- A unified shape, where data integrations can combine existing enterprise data with other sources and use that data holistically to develop apps or derive insights.
- Structural and semantic consistency across applications and deployments.
- Simplified integration and disambiguation of data that's collected from processes, digital interactions, product telemetry, people interactions, and so on.
- The ability to extend the Alliance Business Model schema standard entities to tailor the model to your organization. This is enabled thanks to both the **ABM Mongo Interop Service** and the **ABS Virtual Entities** functionalities.

## Alliance Business Model in action
The Alliance Business Model is influenced by data schemas that are present in both UBL Schema and Common Data Model, covering a range of business areas. If you are a customer or a partner of Fenix Alliance Group, you are already using the Alliance Business Model.

Businesses, institutions, Partners, and independent software vendors (ISVs) use the Alliance Business Model to extend and interoperate with any given Alliance Business Suite instance.

Organizations from industries such as manufacturing, government, and education are working closely with Fenix Alliance Group to extend the Alliance Business Model to their specific business scenarios, and the dynamic ABM Engine allows seamless data integration even when schemas are not exactly the same.  This allows customers from an unlimited range of industries to leverage the benefit of the Alliance Business Model's standard entities and extend to their specific verticals so that industry solutions can interoperate more easily.

```csharp
// Get all the contacts from the configured ABM Provider.
var contacts = await DataContext.Contact.Where(c => c.ID == ).ToListAsync();

foreach(var contact in contacts){
    Console.WriteLine(contact.ID);
}
```