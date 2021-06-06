# Internationalization in the Alliance Business Suite

A multilingual website allows the site to reach a wider audience. The Alliance Business Suite provides convenient, easy-to-use solutions for localizing portals into different languages and cultures.

Internationalization involves Globalization and Localization. Globalization is the process of designing apps that support different cultures. Globalization adds support for the input, display, and output of a defined set of language scripts that relate to specific geographic areas.

Localization is the process of adapting a globalized app, which you have already processed for localizability, to a particular culture/locale. For more information see Globalization and localization terms near the end of this document.

## How to make the app's content localizable
The Alliance Business Suite was architected to allow customers to obtain this functionality right out of the box. Through simple front-end settings for each portal, customers can select a default language for each portal and localize strings and HTML fragments by just calling the `_()` method available through code on every web content entry. (e.g: _("Hello World"))

Once your localizable strings have been placed in code using the String Localizer function. you can [create localization resources using your instance's admin portal](Internationalization/Localization-Strings).

## Implement a strategy to select the language/culture for each request

Localization is already set up using the ACL. Additional supported languages, as well as the primary content language for each portal can be selected on each's portal configuration manager.

### QueryStringRequestCultureProvider
Portals can use a query string to set the Culture Info. For apps that use the cookie or Accept-Language header approach, adding a query string to the URL is useful for debugging and testing code. By default, the QueryStringRequestCultureProvider is registered as the first localization provider in the RequestCultureProvider list. You pass the query string parameters culture and UI-culture. The following example sets the specific culture (language and region) to Spanish/Mexico:

```
http://yourdomain/?culture=es-MX&ui-culture=es-MX
```
If you only pass in one of the two (culture or ui-culture), the query string provider will set both values using the one you passed in. For example, setting just the culture will set both the Culture and the UICulture:

```
http://localhost:5000/?culture=es-MX
```

## CookieRequestCultureProvider
Production apps will often provide a mechanism to set the culture with the ASP.NET Core culture cookie. Use the MakeCookieValue method to create a cookie.

The CookieRequestCultureProvider DefaultCookieName returns the default cookie name used to track the user's preferred culture information. The default cookie name is .AspNetCore.Culture.

The cookie format is c=%LANGCODE%|uic=%LANGCODE%, where c is Culture and uic is UICulture, for example:



``` csharp
@{
	var requestCulture = Context.Features.Get<IRequestCultureFeature>();
	var cultureItems = RequestLocalizationOptions.Value.SupportedUICultures
		.Select(c => new SelectListItem { Value = c.Name, Text = c.DisplayName })
		.ToList();
	var returnUrl = string.IsNullOrEmpty(Context.Request.Path) ? "~/" : $"~{Context.Request.Path.Value}";
}

<li class="nav-item dropdown">
	<a class="nav-link   dropdown-toggle" href="#" id="SelectLang" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		@requestCulture.RequestCulture.Culture.TwoLetterISOLanguageName - <script>document.write(CartCurrencyCode);</script>
	</a>

	<div class="dropdown-menu" aria-labelledby="SelectLang">
		<h6 class="dropdown-header">
			<b>  <i class="fas fa-globe-americas"></i>&nbsp;  @_("Current currency"): </b>
			<b id="CurrencyTip">
				<script>document.write(CartCurrencyCode);</script>
			</b>
		</h6>
		<div class="dropdown-divider"></div>
		<a href="/Currencies/Index" class="dropdown-item">
		<i class="fas fa-dollar-sign"></i>&nbsp; @_("Change currency")
		</a>
		<!-- Language -->
		<h6 class="dropdown-header">
			<b>  <i class="fas fa-globe-americas"></i>&nbsp;  @_("Current Language"): </b>
			<b id="CurrencyTip">
				@requestCulture.RequestCulture.Culture.TwoLetterISOLanguageName
			</b>
		</h6>
				<div class="dropdown-divider"></div>

		@foreach (var item in cultureItems)
		{
			var value = @item.Value;
			<a href="#" onclick="SelectLang('@(value.Replace(" ", ""))')" class="dropdown-item">
				<i class="fas fa-language"></i>&nbsp; @item.Text
			</a>
		}
	</div>
	<script>
		//Select Language
		function SelectLang(value) {
			cookie = "c=" + value.trim() + "|uic=" + value.trim();
			Cookies.set('.AspNetCore.Culture', cookie);
			window.location.reload();
		}
	</script>
</li>
```

## Globalization and localization terms
The process of localizing your portals also requires a basic understanding of relevant character sets commonly used in modern software development and an understanding of the issues associated with them. Although all computers store text as numbers (1's and 0's), different systems store the same text using different numbers. The localization process refers to translating the portal user interface (UI) for a specific culture/locale.

Localizability is an intermediate process for verifying that a globalized app is ready for localization.

The RFC 4646 format for the culture name is {languagecode2}-{country/regioncode2}, where {languagecode2} is the language code and {country/regioncode2} is the subculture code. For example, es-CO for Spanish (Colombia), en-US for English (United States), and en-AU for English (Australia). RFC 4646 is a combination of an ISO 639 two-letter lowercase culture code associated with a language and an ISO 3166 two-letter uppercase subculture code associated with a country or region. 

Internationalization is often abbreviated to "I18N". The abbreviation takes the first and last letters and the number of letters between them, so 18 stands for the number of letters between the first "I" and the last "N". The same applies to Globalization (G11N), and Localization (L10N).

Terms:

- **Globalization (G11N)**: The process of making a piece of software to support different languages and regions.
- **Localization (L10N)**: The process of customizing an app for a given language and region.
- **Internationalization (I18N)**: Describes both globalization and localization.
- **Culture**: It's a language and, optionally, a region.
- **Neutral culture**: A culture that has a specified language, but not a region. (for example "en", "es")
- **Specific culture**: A culture that has a specified language and region. (for example "en-US", "en-GB", "es-CL")
- **Parent Culture**: The neutral culture that contains a specific culture. (for example, "en" is the parent culture of "en-US" and "en-GB")
- **Locale**: A locale is the same as a culture.