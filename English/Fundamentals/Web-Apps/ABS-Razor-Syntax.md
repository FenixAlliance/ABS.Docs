# ABS Razor Syntax

Razor is a markup syntax for embedding server-based code into web pages. The Razor syntax consists of Razor markup, C#, and HTML. Files containing Razor generally have a .cshtml file extension. Razor is also found in Razor components files (.razor).

## Razor syntax

Razor supports C# and uses the @ symbol to transition from HTML to C#. Razor evaluates C# expressions and renders them in the HTML output.

When an @ symbol is followed by a Razor reserved keyword, it transitions into Razor-specific markup. Otherwise, it transitions into plain C#.

## Templated Razor delegates

Razor templates allow you to define a UI snippet with the following format:

``` html
@<tag>...</tag>
```
The following example illustrates how to specify a templated Razor delegate as a Func<T,TResult>. The dynamic type is specified for the parameter of the method that the delegate encapsulates. An object type is specified as the return value of the delegate. The template is used with a List<T> of Pet that has a Name property.

```
@using FenixAlliance.ABM.Models.Logistics.Stock.Item
@{
    Func<dynamic, object> itemTemplate = @<p>Item SKU: <strong>@item.SKU</strong>.</p>;

    var items = new List<Item>
    {
        new Item { SKU = "AAD_BASIC" },
        new Item { SKU = "RIGHTSMANAGEMENT" },
        new Item { SKU = "MCOPSTNC" }
    };
}
```
The template is rendered with items supplied by a foreach statement:

```
@foreach (var item in items)
{
    @itemTemplate(item)
}
```

Rendered output:

``` html
<p>Item SKU: <strong>AAD_BASIC</strong>.</p>
<p>Item SKU: <strong>RIGHTSMANAGEMENT</strong>.</p>
<p>Item SKU: <strong>MCOPSTNC</strong>.</p>
```
You can also supply an inline Razor template as an argument to a method. In the following example, the Repeat method receives a Razor template. The method uses the template to produce HTML content with repeats of items supplied from a list:
``` cshtml
@using Microsoft.AspNetCore.Html

@functions {
    public static IHtmlContent Repeat(IEnumerable<dynamic> items, int times,
        Func<dynamic, IHtmlContent> template)
    {
        var html = new HtmlContentBuilder();

        foreach (var item in items)
        {
            for (var i = 0; i < times; i++)
            {
                html.AppendHtml(template(item));
            }
        }

        return html;
    }
}
```

## Razor reserved keywords
### Razor keywords

- namespace
- functions
- inherits
- model
- section

Razor keywords are escaped with @(Razor Keyword) (for example, @(functions)).

### C# Razor keywords
- case
- do
- default
- for
- foreach
- if
- else
- lock
- switch
- try
- catch
- finally
- using
- while

C# Razor keywords must be double-escaped with @(@C# Razor Keyword) (for example, @(@case)). The first @ escapes the Razor parser. The second @ escapes the C# parser.

### Reserved keywords not used by Razor
- class
