# Understanding the GenericOption Table and the Options API.

## The GenericOption Table

To maximize your ability to extend the Alliance Business Suite, we've created the GenericOptions table, which is a table containing a few columns to store optional and configuration data for external applications without the need to modify nor extend the Alliance Business Model Schema, not to bring another data persistence mechanism.

The options table stores a different kind of data from the other tables: instead of storing data about your Web Portal's content, it stores data about the Web Portal itself. Data is written to the options table using the **Options API**, both of which consist of a set of functions used to add, update and delete data from this table. 

## The Options API

To make it easier for developers to create custom configurations, we've created a set of methods specified into the `IOptionsService` interface. This interface comes configured with its default implementation right out of the box, but custom implementations could override this default implementation.

As the GenericOption table stores data which is related to the setup and administration of the site as a whole, access to it is restricted. The Alliance Business Studio gives users the ability to modify the value of each configuration given the proper permissions to do so.

To be able to amend settings and options, users will need to have the manage_options [Business Permission](/Components/Alliance-Passport-Service/Business-Permissions.md). The only default user role with this capability is the root role. 

This means that if you need to add options that other user roles have access to, you'll have to assign the manage_options capability to them. This carries risks, so only do it if you're sure!


## Structure of the GenericOption Table
The options table has a similar structure to the three metadata tables. It has the following fields:

- **ID**: The Global Unique Identifier for every option.
- **Name**: The Option Name for Friendly Access 
- **Value**: The option value, usually stored in JSON format.
- **Autoload**: (boolean) whether or not this option would be loaded on memory cache.
- **Timestamp**: The time for the last option update.
- **Transient**: whether or not this option is a temporal option.
- **WebPortalID**: The ID for the Web Portal who owns this option.
- **Discriminator**: The Option Type.

## Option Types.

GenericOptins have different types (also called scopes). As of v1.3.0, the following types are available:

- **AccountHolderOption**: An option that's bound to an account holder and, optionally, to a Web Portal.
- **BusinessOption**: An option that's bound to a Business Tenant and, optionally, to a Web Portal.
- **BusinessApplicationOption**: An option that's bound to a Business Application and, optionally, to a Web Portal.


### Aditional considerations


One of the important things to understand about the GenericOption table is the autoload field. This contains a boolean value (yes or a no). This essentially controls whether or not it is loaded on cached memory by the `OptionsService.LoadOptions()` function. Autoloaded data is data that is loaded on every page of your Alliance Business Suite instance. Just like we showed you how to disable certain scripts from loading sitewide, the same idea applies here. The autoload attribute is set to “yes” by default for developers, but not every option should be loaded on every page.

