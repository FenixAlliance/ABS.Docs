# Introduction to Razor Templating Engine

[[_TOC_]]

By [Daniel Lozano](https://twitter.com/DLozanoNavas)

Portal Pages can make coding page-focused scenarios easier and more productive than using controllers and views.

This document provides an introduction to the Alliance Business Suite - Razor Templating Engine

#Rendering HTML
The default Razor language is HTML. Rendering HTML from Razor markup is no different than rendering HTML from an HTML file. HTML markup in .cshtml Razor files is rendered by the server unchanged.

#Razor syntax
Razor supports C# and uses the @ symbol to transition from HTML to C#. Razor evaluates C# expressions and renders them in the HTML output.

When an @ symbol is followed by a Razor reserved keyword, it transitions into Razor-specific markup. Otherwise, it transitions into plain C#.

To escape an @ symbol in Razor markup, use a second @ symbol:

 ```html
<p>@@Username</p>
```

The code is rendered in HTML with a single @ symbol:

 ```html
<p>@Username</p>
```
HTML attributes and content containing email addresses don't treat the @ symbol as a transition character. The email addresses in the following example are untouched by Razor parsing:

 ```html
<a href="mailto:Support@contoso.com">Support@contoso.com</a>
```
# Implicit Razor expressions
Implicit Razor expressions start with @ followed by C# code:

 ```html
<p>@DateTime.Now</p>
<p>@DateTime.IsLeapYear(2016)</p>
```

With the exception of the C# await keyword, implicit expressions must not contain spaces. If the C# statement has a clear ending, spaces can be intermingled:

 ```html
<a href="mailto:Support@contoso.com">Support@contoso.com</a>
```