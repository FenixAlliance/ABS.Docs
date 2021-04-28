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
## Expression encoding
C# expressions that evaluate to a string are HTML encoded. C# expressions that evaluate to IHtmlContent are rendered directly through IHtmlContent.WriteTo. C# expressions that don't evaluate to IHtmlContent are converted to a string by ToString and encoded before they're rendered.
``` cshtml
@("<span>Hello World</span>")
```
The preceding code renders the following HTML:

``` html
&lt;span&gt;Hello World&lt;/span&gt;
```
The HTML is shown in the browser as plain text:
<span>Hello World</span>

`HtmlHelper.Raw` output isn't encoded but rendered as HTML markup.

**Warning:**  Using HtmlHelper.Raw on unsanitized user input is a security risk. User input might contain malicious JavaScript or other exploits. Sanitizing user input is difficult. Avoid using HtmlHelper.Raw with user input.

``` cshtml
@Html.Raw("<span>Hello World</span>")
```
The code renders the following HTML:

``` html
<span>Hello World</span>
```
## Razor code blocks

Razor code blocks start with @ and are enclosed by {}. Unlike expressions, C# code inside code blocks isn't rendered. Code blocks and expressions in a view share the same scope and are defined in order:

``` cshtml
@{
    var quote = "The future depends on what you do today. - Mahatma Gandhi";
}

<p>@quote</p>

@{
    quote = "Hate cannot drive out hate, only love can do that. - Martin Luther King, Jr.";
}

<p>@quote</p>
```

The code renders the following HTML:

``` html
<p>The future depends on what you do today. - Mahatma Gandhi</p>
<p>Hate cannot drive out hate, only love can do that. - Martin Luther King, Jr.</p>
```

In code blocks, declare local functions with markup to serve as templating methods:

``` cshtml
@{
    void RenderName(string name)
    {
        <p>Name: <strong>@name</strong></p>
    }

    RenderName("Mahatma Gandhi");
    RenderName("Martin Luther King, Jr.");
}
```
The code renders the following HTML:

``` html
<p>Name: <strong>Mahatma Gandhi</strong></p>
<p>Name: <strong>Martin Luther King, Jr.</strong></p>
```
## Implicit transitions
The default language in a code block is C#, but the Razor Page can transition back to HTML:

``` cshtml
@{
    var inCSharp = true;
    <p>Now in HTML, was in C# @inCSharp</p>
}
```

## Explicit delimited transition
To define a subsection of a code block that should render HTML, surround the characters for rendering with the Razor <text> tag:
``` cshtml
@for (var i = 0; i < people.Length; i++)
{
    var person = people[i];
    <text>Name: @person.Name</text>
}
```

Use this approach to render HTML that isn't surrounded by an HTML tag. Without an HTML or Razor tag, a Razor runtime error occurs.

The `<text>` tag is useful to control whitespace when rendering content:

- Only the content between the <text> tag is rendered.
- No whitespace before or after the <text> tag appears in the HTML output.

## Explicit line transition
To render the rest of an entire line as HTML inside a code block, use @: syntax:
``` cshtml
@for (var i = 0; i < people.Length; i++)
{
    var person = people[i];
    @:Name: @person.Name
}
```
Without the `@:` in the code, a Razor runtime error is generated.

Extra `@` characters in a Razor file can cause compiler errors at statements later in the block. These compiler errors can be difficult to understand because the actual error occurs before the reported error. This error is common after combining multiple implicit/explicit expressions into a single code block.

## Control structures
Control structures are an extension of code blocks. All aspects of code blocks (transitioning to markup, inline C#) also apply to the following structures:
### Conditionals `@if, else if, else, and @switch`
`@if` controls when code runs:

``` cshtml
@if (value % 2 == 0)
{
    <p>The value was even.</p>
}
```
`else` and `else if` don't require the @ symbol:
``` cshtml
@if (value % 2 == 0)
{
    <p>The value was even.</p>
}
else if (value >= 1337)
{
    <p>The value is large.</p>
}
else
{
    <p>The value is odd and small.</p>
}
```

The following markup shows how to use a switch statement:
``` cshtml
@switch (value)
{
    case 1:
        <p>The value is 1!</p>
        break;
    case 1337:
        <p>Your number is 1337!</p>
        break;
    default:
        <p>Your number wasn't 1 or 1337.</p>
        break;
}
```
### Looping `@for, @foreach, @while, and @do while`

Templated HTML can be rendered with looping control statements. To render a list of people:

```
@{
    var people = new AccountHolder[]
    {
          new AccountHolder(){...},
          new AccountHolder(){...},
          ...
    };
}
```
The following looping statements are supported:

**`@for`**

``` cshtml
@for (var i = 0; i < people.Length; i++)
{
    var person = people[i];
    <p>Name: @person.Name</p>
    <p>Age: @person.Age</p>
}
```
**`@foreach`**
``` cshtml
@foreach (var person in people)
{
    <p>Name: @person.Name</p>
    <p>Age: @person.Age</p>
}
```
**`@while`**
``` cshtml
@{ var i = 0; }
@while (i < people.Length)
{
    var person = people[i];
    <p>Name: @person.Name</p>
    <p>Age: @person.Age</p>

    i++;
}
```
**`@do while`**
``` cshtml
@{ var i = 0; }
@do
{
    var person = people[i];
    <p>Name: @person.Name</p>
    <p>Age: @person.Age</p>

    i++;
} while (i < people.Length);
```

### Compound `@using`

In C#, a using statement is used to ensure an object is disposed. In Razor, the same mechanism is used to create HTML Helpers that contain additional content. In the following code, HTML Helpers render a <form> tag with the @using statement:


``` cshtml
@using (Html.BeginForm())
{
    <div>
        Email: <input type="email" id="Email" value="">
        <button>Register</button>
    </div>
}
```
### **`@try, catch, finally`**

Exception handling is similar to C#:


``` cshtml
@try
{
    throw new InvalidOperationException("You did something invalid.");
}
catch (Exception ex)
{
    <p>The exception message: @ex.Message</p>
}
finally
{
    <p>The finally statement.</p>
}
```
### **`@lock`**

Razor has the capability to protect critical sections with lock statements:

``` cshtml
@lock (SomeLock)
{
    // Do critical section work
}
```

### Comments
Razor supports C# and HTML comments:

``` cshtml
@{
    /* C# comment */
    // Another C# comment
}
<!-- HTML comment -->
```

The code renders the following HTML:

``` cshtml
<!-- HTML comment -->

```
Razor comments are removed by the server before the webpage is rendered. Razor uses `@* *@` to delimit comments. The following code is commented out, so the server doesn't render any markup:
``` cshtml
@*
    @{
        /* C# comment */
        // Another C# comment
    }
    <!-- HTML comment -->
*@
```
## Directives

Razor directives are represented by implicit expressions with reserved keywords following the @ symbol. A directive typically changes the way a view is parsed or enables different functionality.

Understanding how Razor generates code for a view makes it easier to understand how directives work.

``` cshtml
@{
    var quote = "Getting old ain't for wimps! - Anonymous";
}

<div>Quote of the Day: @quote</div>
```
The code generates a class similar to the following:

``` csharp
public class _Views_Something_cshtml : RazorPage<dynamic>
{
    public override async Task ExecuteAsync()
    {
        var output = "Getting old ain't for wimps! - Anonymous";

        WriteLiteral("/r/n<div>Quote of the Day: ");
        Write(output);
        WriteLiteral("</div>");
    }
}
```
### `@functions`

The `@functions` directive enables adding C# members (fields, properties, and methods) to the generated class:


``` cshtml
@functions {
    // C# members (fields, properties, and methods)
}
```
For example:

``` cshtml

@functions {
    public string GetHello()
    {
        return "Hello";
    }
}

<div>From method: @GetHello()</div> 
```
The code generates the following HTML markup:
``` html
<div>From method: Hello</div>
```
The following code is the generated Razor C# class:

``` csharp

using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.Razor;

public class _Views_Home_Test_cshtml : RazorPage<dynamic>
{
    // Functions placed between here 
    public string GetHello()
    {
        return "Hello";
    }
    // And here.
#pragma warning disable 1998
    public override async Task ExecuteAsync()
    {
        WriteLiteral("\r\n<div>From method: ");
        Write(GetHello());
        WriteLiteral("</div>\r\n");
    }
#pragma warning restore 1998
}
```

@functions methods serve as templating methods when they have markup:

``` cshtml

@{
    RenderName("Mahatma Gandhi");
    RenderName("Martin Luther King, Jr.");
}

@functions {
    private void RenderName(string name)
    {
        <p>Name: <strong>@name</strong></p>
    }
}
```
The code renders the following HTML:

``` html
<p>Name: <strong>Mahatma Gandhi</strong></p>
<p>Name: <strong>Martin Luther King, Jr.</strong></p>
```

### `@implements`
The @implements directive implements an interface for the generated class.

The following example implements System.IDisposable so that the Dispose method can be called:

``` cshtml

@implements IDisposable

<h1>Example</h1>

@functions {
    private bool _isDisposed;

    ...

    public void Dispose() => _isDisposed = true;
}
```

### `@inherits`
The @inherits directive provides full control of the class the view inherits:
``` cshtml
@inherits TypeNameOfClassToInheritFrom
```
The following code is a custom Razor page type:
```
using Microsoft.AspNetCore.Mvc.Razor;

public abstract class CustomRazorPage<TModel> : RazorPage<TModel>
{
    public string CustomText { get; } = 
        "Gardyloo! - A Scottish warning yelled from a window before dumping" +
        "a slop bucket on the street below.";
}
```
The `CustomText` is displayed in a view:
``` cshtml
@inherits CustomRazorPage<TModel>

<div>Custom text: @CustomText</div>
```
The code renders the following HTML:

```html
<div>
    Custom text: Gardyloo! - A Scottish warning yelled from a window before dumping
    a slop bucket on the street below.
</div>
```
The following code is an example of a strongly-typed view:

``` cshtml
@inherits CustomRazorPage<TModel>

<div>The Login Email: @Model.Email</div>
<div>Custom text: @CustomText</div>
```
If "rick@contoso.com" is passed in the model, the view generates the following HTML markup:

```html

<div>The Login Email: rick@contoso.com</div>
<div>
    Custom text: Gardyloo! - A Scottish warning yelled from a window before dumping
    a slop bucket on the street below.
</div>
```
### `@model`

The @model directive specifies the type of the model passed to a view or page:

``` cshtml
@model TypeNameOfModel
```
The class generated inherits from DynamicComponentBase<dynamic>:
```
public class Template : DynamicComponentBase<TypeNameOfModel>
```

Razor exposes a Model property for accessing the model passed to the view:



``` cshtml
<div>The Login Email: @Model.Email</div>
```
The `@model` directive specifies the type of the Model property. The directive specifies the T in RazorPage<T> that the generated class that the view derives from. If the `@model` directive isn't specified, the Model property is of type dynamic. For more information, see C# Strongly typed models and the `@model` keyword.

### `@namespace`
The @namespace directive:

Sets the namespace of the class of the generated Razor page
```cshtml
@namespace Your.Namespace.Here
```


### `@using`
The @using directive adds the C# using directive to the generated view:

``` cshtml
@using System.IO
@{
    var dir = Directory.GetCurrentDirectory();
}
<p>@dir</p>
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
