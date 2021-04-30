View components are similar to page views, but they're much more powerful. View components don't use model binding and only depend on the data provided when calling into it. 


A view component:

- Renders a chunk rather than a whole response.
- Includes the same separation-of-concerns and testability benefits found between a controller and view.
- Can have parameters and business logic.
- Is typically invoked from a layout page.

View components are intended anywhere you have reusable rendering logic that's too complex for a partial view, such as:

- Dynamic navigation menus
- Tag cloud (where it queries the database)
- Login panel
- Shopping cart
- Recently published articles
- Sidebar content on a typical blog
- A login panel that would be rendered on every page and show either the links to log out or log in, depending on the login state of the user

A view component consists of two parts: the class (typically derived from ViewComponent) and the result it returns (typically a view). Like controllers, a view component can be a POCO, but most developers will want to take advantage of the methods and properties available by deriving from ViewComponent.

## Creating a view component
A view component class can be created on your ABS Instance administration dashboard, under **Appearance** > **Components**.


## View component methods
A view component defines its logic in an `InvokeAsync` method that returns a `Task<IViewComponentResult>` or in a synchronous Invoke method that returns an `IViewComponentResult`. Parameters come directly from the invocation of the view component, not from model binding. A view component never directly handles a request. Typically, a view component initializes a model and passes it to it's corresponding view by calling the View method. In summary, view component methods:

- Define an `InvokeAsync` method that returns a `Task<IViewComponentResult>` or a synchronous Invoke method that returns an `IViewComponentResult`.
- Typically initializes a model and passes it to a view by calling the ViewComponent View method.
- Parameters come from the calling method, not HTTP. There's no model binding.
- Are not reachable directly as an HTTP endpoint. They're invoked from your code (usually in a view). A view component never handles a request.
- Are overloaded on the signature rather than any details from the current HTTP request.

## Perform synchronous work
The framework handles invoking a synchronous `Invoke` method if you don't need to perform asynchronous work. The following method creates a synchronous Invoke view component:

``` csharp
public class PriorityList : DynamicComponentBase
{
    public dynamic Invoke(int maxPriority, bool isDone)
    {
        var items = new List<string> { $"maxPriority: {maxPriority}", $"isDone: {isDone}" };
        return items;
    }
}
```

A view component class:

- Fully supports constructor dependency injection

- Doesn't take part in the controller lifecycle, which means you can't use filters in a view component

``` html
@model List<string>

<h3>Priority Items</h3>
<ul>
    @foreach (var item in Model)
    {
        <li>@item</li>
    }
</ul>
```


## Invoking a Web Component
To use a component inside a Page, template, or another component, call `ViewService.InvokeAsync` from anywhere in your view:

``` csharp
@await Component.InvokeAsync("MyComponentNameOrId", Model)
```


## All view component parameters are required
Each parameter in a view component is a required attribute. See this GitHub issue. If any parameter is omitted:

- The InvokeAsync method signature won't match, therefore the method won't execute.
- The ViewComponent won't render any markup.
- No errors will be thrown.