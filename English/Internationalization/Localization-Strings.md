A multilingual portal allows the site to reach a wider audience. The Alliance Business Suite provides services and middleware for localizing into different languages and cultures.

Internationalization involves Globalization and Localization. Globalization is the process of designing apps that support different cultures. Globalization adds support for input, display, and output of a defined set of language scripts that relate to specific geographic areas.

Localization is the process of adapting a globalized app, which you have already processed for localizability, to a particular culture/locale. For more information see Globalization and localization terms near the end of this document.

App localization involves the following:

1. Make the app's content localizable
1. Provide localized resources for the languages and cultures you support
1. Implement a strategy to select the language/culture for each request

## Make the app's content localizable
The ABS Razor Engine was architected to improve productivity when developing localized apps. `DynamicComponentBase` uses the ResourceManager and ResourceReader to provide culture-specific resources at run time. The interface has an easy-to-use method and an IEnumerable for returning localized strings. `DynamicComponentBase` retrieves the portal default language from the suite configuration file and then loads localized resources from the Alliance Business Model provider. You can develop an app targeted for localization right out of the box by adding LocalizationStrings and LocalizedStrings through the portal admin center. The code below shows how to wrap the string "About Title" for localization.

``` razor
 @_("Hello World!")
```