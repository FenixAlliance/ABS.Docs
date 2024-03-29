# Working with Web Pages

Web pages are meant to represent content located at a particular URL, scoped to a [Web Portal](/Web-Development/Web-Portals.md) (and therefore to a [Business Tenant](/Components/Alliance-Passport-Services/Business-Tenants.md)), and is based on one of the core tables of the Alliance Business Model Schema. 

Web Pages are related through parent and child relationships to other web pages, this structure forms the hierarchy of a website, and therefore, its site map is automatically generated.

Web pages also form the basis for including other, specialized table types in the portal site map – web files, shortcuts, forums, advanced forms, and blogs are all situated in the portal site map through – and thus derive their URLs from – a relationship to a parent web page.

## Manage web pages
Web pages can be created, edited, and deleted from the [Alliance Business Platform REST API](/Components/Alliance-Business-Platform/APIs/REST-API). However, the Media Portals Module provides advanced customization that can be performed from the Alliance Business Studio.

- Open the [Alliance Business Studio](/Components/Alliance-Business-Studio.md).

- Go to Modules > Media Portals > Web Pages.
   - To edit an existing web page using the standard editor, select the "**Edit**" option below the web page name.
   - To edit an existing web page using the Visual WYSIWYG editor, select the "**Live Edit**" option below the web page name.
   - To create a new Web Page, click on the Create Button.

- Enter appropriate values in, at least, the required fields.

- Select Save & Close.

# Content Engines

The Alliance Business Suite contains a powerful content engine to provide the level of customizability required to give the highest level of control over every bit that's to be presented to a user on a Web Page. These engines are meant to work with Web Content records and they have several capability sets.

## Razor Engine:
The Razor Engine is a derivate from .NET's Server Side Markup Language. Web Content marked as .razor will be compiled and rendered using a Service Abstraction which means that its default can be replaced by a custom implementation.

Razor is a markup syntax that lets you embed server-based code (Visual Basic and C#) into web pages at a very high level.

Server-based code can use every available service inside any given Alliance Business Suite instance to dynamically generate web content on the fly, while a web page is written to the browser.

When a web page is called (either by slug or id), the server executes the server-based code inside the page before it returns the page to the browser. The code can perform complex tasks by running on the server, like accessing the Alliance Business Model or leveraging our extensive set of APIs.

Razor is based on ASP.NET and designed for creating web applications. The ABS Razor Engine has the power of traditional Razor, but it is easier to use.

## Blazor Engine

The Alliance Business Suite lets you build interactive web UIs using C# instead of JavaScript. By using Blazor under the hood, apps are composed of reusable web UI components implemented using C#, HTML, and CSS. Both client and server code is written in C#, allowing you to share code and libraries already present.

## Liquid Engine (Experimental)


The Alliance Business Suite supports Liquid template language, which is a secure template language that is also very accessible for non-programmer audiences.


## HTML Engine

In cases where customers decide to use plain HTML5, the Alliance Business Suite contains the ability to bypass all Content Engines and render HTML fragments whenever they are called. This is also the most efficient type of Web Content.

## Markdown Engine

The last Content Engine, and therefore the least privileged, is the Markdown Engine, which is a lightweight markup language for creating formatted plain text using an embedded markdown-text editor.



