# ABS Razor Syntax

Razor is a markup syntax for embedding server-based code into web pages. The Razor syntax consists of Razor markup, C#, and HTML. Files containing Razor generally have a .cshtml file extension. Razor is also found in Razor components files (.razor).

## Razor syntax

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

 ``` html
<p>@await DoSomething("hello", "world")</p>
```
Implicit expressions cannot contain C# generics, as the characters inside the brackets (<>) are interpreted as an HTML tag. The following code is **not** valid:
``` html
<p>@GenericMethod<int>()</p>
```
The preceding code generates a compiler error similar to one of the following:

- The "int" element wasn't closed. All elements must be either self-closing or have a matching end-tag.
- Cannot convert method group 'GenericMethod' to non-delegate type 'object'. Did you intend to invoke the method?`

Generic method calls must be wrapped in an explicit Razor expression or a Razor code block.
## Templated Razor delegates

Razor templates allow you to define a UI snippet with the following format:
## Explicit Razor expressions

Explicit Razor expressions consist of an @ symbol with balanced parenthesis. To render last week's time, the following Razor markup is used:
```
<p>Last week this time: @(DateTime.Now - TimeSpan.FromDays(7))</p>
```
Any content within the @() parenthesis is evaluated and rendered to the output.

Implicit expressions, described in the previous section, generally can't contain spaces. In the following code, one week isn't subtracted from the current time:

```
<p>Last week: @DateTime.Now - TimeSpan.FromDays(7)</p>
```
The code renders the following HTML:

``` html
<p>Last week: 7/7/2016 4:39:52 PM - TimeSpan.FromDays(7)</p>
```
Explicit expressions can be used to concatenate text with an expression result:

``` cshtml
@{
    var joe = new Person("Joe", 33);
}

<p>Age@(joe.Age)</p>
```

Without the explicit expression, `<p>Age@joe.Age</p>` is treated as an email address, and `<p>Age@joe.Age</p>` is rendered. When written as an explicit expression, <p>Age33</p> is rendered.

Explicit expressions can be used to render output from generic methods in .cshtml files. The following markup shows how to correct the error shown earlier caused by the brackets of a C# generic. The code is written as an explicit expression:


``` cshtml
<p>@(GenericMethod<int>())</p>
```

## Templated Razor delegates

``` html
@<tag>...</tag>
```
The following example illustrates how to specify a templated Razor delegate as a Func<T,TResult>. The dynamic type is specified for the parameter of the method that the delegate encapsulates. An object type is specified as the return value of the delegate. The template is used with a List<T> of Pet that has a Name property.

``` csharp
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
Using the list of items from the prior example, the Repeat method is called with:
- List<T> of Items.
- Number of times to repeat each item.
- Inline template to use for the list items of an unordered list.
``` cshtml
<ul>
    @Repeat(items, 3, @<li>@item.SKU</li>)
</ul>
```
Rendered output:

``` html
<p>Item SKU: <strong>AAD_BASIC</strong>.</p>
<p>Item SKU: <strong>AAD_BASIC</strong>.</p>
<p>Item SKU: <strong>AAD_BASIC</strong>.</p>
<p>Item SKU: <strong>RIGHTSMANAGEMENT</strong>.</p>
<p>Item SKU: <strong>RIGHTSMANAGEMENT</strong>.</p>
<p>Item SKU: <strong>RIGHTSMANAGEMENT</strong>.</p>
<p>Item SKU: <strong>MCOPSTNC</strong>.</p>
<p>Item SKU: <strong>MCOPSTNC</strong>.</p>
<p>Item SKU: <strong>MCOPSTNC</strong>.</p>
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
