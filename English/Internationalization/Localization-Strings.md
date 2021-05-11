A multilingual portal allows the site to reach a wider audience. The Alliance Business Suite provides services and middleware for localizing into different languages and cultures.

Internationalization involves Globalization and Localization. Globalization is the process of designing apps that support different cultures. Globalization adds support for input, display, and output of a defined set of language scripts that relate to specific geographic areas.

Localization is the process of adapting a globalized app, which you have already processed for localizability, to a particular culture/locale. For more information see Globalization and localization terms near the end of this document.

App localization involves the following:

1. Make the app's content localizable
1. Provide localized resources for the languages and cultures you support
1. Implement a strategy to select the language/culture for each request

## Make the app's content localizable
The ABS Razor Engine was architected to improve productivity when developing localized apps. `DynamicComponentBase` uses the ResourceManager and ResourceReader to provide culture-specific resources at run time. The interface has an easy-to-use method and an IEnumerable for returning localized strings. `DynamicComponentBase` retrieves the portal default language from the suite configuration file and then loads localized resources from the Alliance Business Model provider. You can develop an app targeted for localization right out of the box by adding LocalizationStrings and LocalizedStrings through the portal admin center. The code below shows how to wrap the string "About Title" for localization.

``` csharp
@{ 
    var localizedString = _("Hello World!");
}
@localizedString 
```

## Creating Localizable/Localized Strings
The Alliance Business Suite offers a convenient way to create localizable resources like strings or HTML fragments.
Localizable/Localized Strings are retrieved and formatted if you need to insert the value of an object, variable, or expression into the localized resource. For example, you can insert the value of a Decimal value into a paragraph to display it to the user as a single string:

``` razor
@{
    var pricePerOunce = 17.36m;
    var localizedString = _("The current price is {0} per ounce.", pricePerOunce); 
}
<!-- Result: The current price is 17.36 per ounce. -->
@localizedString 
```

To create a Localization Resource:
1. Go to your Suite Admin Center, 
1. Select Internationalization > Strings from the left-hand menu.
1. Select your base language and target language.
1. Create or select a new Localization String by selecting the base language variation, providing a Base Value, and optionally leaving a comment for future reference.
1. With your Localization String selected, refer to the Translations panel and there create a new translation by selecting the target language variation, providing a Target Value, and optionally leaving a comment for future reference.

![image.png](/.attachments/image-02d6fb47-7959-4295-817f-992c045afffb.png)




``` csharp
@{ 
 var localizedString = __["Hello World!"];
}
@localizedString 
```