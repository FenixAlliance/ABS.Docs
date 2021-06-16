# Theming Engine
This article contains information about developing themes for the Alliance Business Suite. The product includes a powerful theming engine that allows customers to customize every portal's look and feel.

## Introduction

Alliance Business Suite Themes are groups of files that work together to create the design and functionality of an Alliance Business Suite portal. Each Theme may be different, offering many choices for site owners to instantly change their portal look.

We're building the theme engine to allow customers to create themes for their own use, for a client project or to submit to the ABS Theme Directory. 

## Capabilities

The **ABS Theming Engine** is built on top of the **ABS Razor Templating Engine**, which allows themes to use a combination of C# + HTML, CSS, and JavaScript to build amazing experiences.

- Use a powerful component architecture to avoid code repetition and improve maintainability
- Provide alternative templates for fixed platform functionalities such as the Store & Dashboard.
- Themes can be updated through a mirror ().

## Benefits

- Themes can keep your Business Logic separated from your UI.
- Themes are easily portable to other Alliance Business Suite instances.
- Themes can be enabled on many portals running on the same instance.
- Theme files can be overridden by [child theme files](#Child-Themes) and Dynamic Web Content (pulled from the database).

## Anatomy of a Theme

Alliance Business Suite themes are just files living on a specific folder inside your instance's file system (`/AppData/Themes/{ThemeName}`). Each Theme Folder contains static files (such as JavaScript, CSS, Images, SVGs...) as well as a collection of C#, Razor, and Cshtml files.

The Alliance Business Suite includes a default theme in each new installation. Examine the files in the default theme carefully to get a better idea of how to build your own Theme files.


## Child Themes

A child theme allows you to change small aspects of each theme's appearance while still preserving your theme’s look and functionality. To understand how child themes work it is first important to understand the relationship between parent and child themes.

A parent theme is a regular theme that includes every needed file the theme needs to properly work. This includes static files and business logic (dependencies should be installed through a Module).

Therefore, a Child Theme is just a subset of the parent's files which overrides a small subset of the parent's theme style and/or functionality.

## Benefits of using a Child Theme

- make your modifications portable and replicable;
- keep customization separate from parent theme functions.
- allow parent themes to be updated without destroying your modifications.
- allow you to take advantage of the effort and testing put into the parent theme.
- save on development time as you are not reinventing the wheel; and
- are a great way to start learning about theme development.

## The anatomy of a Theme

Themes contain a specific folder structure used to override the content defaults

```
- /Pages/
- /Components/
- /Public/
- /Templates/
```


Using these template files you can poll dynamic web content within the Main.cshtml master file to include these other files where you want them to appear in the final generated page.

- To include the body, use `@Body`.
- To include the header, use `@await ViewService.InvokeAsync("Header")`.
- To include the sidebar, use `@await ViewService.InvokeAsync("Sidebar")`.
- To include the footer, use `@await ViewService.InvokeAsync("Footer")`.
- To include the search bar, use `@await ViewService.InvokeAsync("Search")`.


Here is an example of a basic Template File:

```
@{Name = "Turing Main Template";}

@await ViewService.InvokeAsync("Header")
@Body
@await ViewService.InvokeAsync("Footer")

```


For more on how these various Templates work and how to generate different information within themes, read the [Templates documentation](/English/Web-Development/Layout.md).


## Theme Configuration File

In addition to your theme, the theme.json file provides details about the Theme in the form of a JSON Object. The file MUST exist and provide details about the Theme in a specific format. No two Themes are allowed to have the same details listed in the properties, as this will lead to problems in the Theme selection process. If you make your own Theme by copying an existing one, make sure you change this information first.


``` json
{
    "ID": "Turing",
    "Name": "Turing",
    "Domain": "Turing",
    "License": "GNU General Public License v2 or later",
    "LicenseUrl": "http://www.gnu.org/licenses/gpl-2.0.html",
    "AuthorName": "Fenix Alliance Inc.",
    "AuthorUrl": "https://fenix-alliance.com",
    "ThemeUrl": "https://fenix-alliance.com",
    "Version": "0.0.1",
    "Tags": "mega-menu, translation-ready",
    "Description": "Default theme for the Alliance Business Suite Portal."
}
```

NB: The name used for the Author is suggested to be the same as the Theme Author's github.com username, in which case it should start with an "@", although it can be the author's real or business name as well.

## Template Files

Templates are ABS Razor source files used to generate the pages requested by visitors and are output as HTML. Template files are made up of HTML, C# and are rendered through ABS Templating Engine.

The Alliance Business Suite defines several template files that control the look and feel of certain parts of each portal.

Templates are rendered based upon the Web Component Hierarchy, which depends on the files that are present on the portal's enabled theme.

Template files should exist inside the Templates folder on your theme.

At the very minimum, an Alliance Business Suite Theme consists of two files:
- theme.json
- /Public/style.css

Both of these files go into the Theme directory. The Main.cshtml template file is very flexible. It can be used to include references to the header, sidebar, footer, body, categories, archives, search, error, and any other components both present in the theme's filesystem or pulled from the Alliance Business Model as Dynamic Web Content.

Or, it can be divided into several template files, each one taking on part of the workload. If you do not provide other template files, the Alliance Business Suite may have default files or functions to perform their jobs. For example, if you do not provide a SearchForm.cshtml template file, the Alliance Business Suite has a default View Component to display the search form.


## Core Templates

- **Main.cshtml**:
The main template. If your Theme provides its own template, Main.cshtml must be present.

- **Blog.cshtml**:
The Blog template.

- **Forum.cshtml**:
The Forum template.

- **Store.cshtml**:
The Store template.

- **Dashboard.cshtml**:
The Dashboard template.


## Core Pages

- **Page.cshtml**:
The page template. Used when an individual Page is queried.

- **Home.cshtml**:
The home page template, which is the front page by default. If you use a static front page this is the template for the page with the latest posts.

- **ForumHome.cshtml**:
The home page template, which is the front page by default. If you use a static front page this is the template for the page with the latest posts.

- **BlogHome.cshtml**:
The home page template, which is the front page by default. If you use a static front page this is the template for the page with the latest posts.

- **StoreHome.cshtml**:
The home page template, which is the front page by default. If you use a static front page this is the template for the page with the latest posts.

- **{ContentType}.cshtml**:
The content template used when a single post from a custom post type is queried. For example, Course.cshtml used for displaying posts from the custom post type named "Course". Archive.cshtml is used if the query template for the custom post type is not present.

- **Single{ContentType}.cshtml**:
The single post template used when a single post from a custom post type is queried. For example, single-book.cshtml used for displaying single posts from the custom post type named "book". Page.cshtml is used if the query template for the custom post type is not present.



- **Category.cshtml**:
The category template. Used when a category is queried.

- **Tag.cshtml**:
The tag template. Used when a tag is queried.

- **Currencies.cshtml**:
The currency selector page template. Used to change the default currency is queried.

- **User.cshtml**:
The account page template. Used on the User Profile Page.

- **Login.cshtml**:
The login page template. Used on the User Login Page.

- **Register.cshtml**:
The register page template. Used on the User Registration Page.

- **Taxonomy.cshtml**:
The taxonomy template. Used when a taxonomy is queried.

- **SocialProfile.cshtml**:
The Social Profile template page. Used when a social profile is queried.

- **Date.cshtml**:
The date/time template. Used when a date or time is queried. Year, month, day, hour, minute, second.

- **Archive.cshtml**:
The archive template. Used when a category, author, or date is queried. Note that this template will be overridden by Category.cshtml, SocialProfile.cshtml, and Date.cshtml for their respective query types.

- **Search.cshtml**:
The search results template. Used when a search is performed.

- **Attachment.cshtml**:
Attachment template. Used when viewing a single attachment.

- **Image.cshtml**:
Image attachment template. Used when viewing a single image attachment. If not present, attachment.php will be used.

- **E404.cshtml**:
The 404 Not Found template. Used when the ABS cannot find a post or page that matches the query.

- **E401.cshtml**:
The 404 Not Authorized template. Used when the ABS cannot allow a user to query some endpoint.

- **E500.cshtml**:
The 500 Error template. Used when the ABS cannot perform some action due to some internal error.

## Core Components

- **Head.cshtml**:
The head component.

- **Footer.cshtml**:
The footer component.

- **Header.cshtml**:
The header component.
