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
- Theme files can be overridden by child theme files and Dynamic Web Content.

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

## Theme Configuration File

``` json
{
    "ID": "Turing",
    "Name": "Turing",
    "AuthorName": "Fenix Alliance Inc.",
    "AuthorUrl": "https://fenix-alliance.com",
    "Version": "0.0.1",
    "Tags": "0.0.1",
    "Description": "Default theme for the Alliance Business Suite Portal."
}
```
