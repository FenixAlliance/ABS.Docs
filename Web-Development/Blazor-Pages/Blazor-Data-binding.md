Web Pages/Components marked as .razor Code Type provides data binding features with the @bind Razor directive attribute with a field, property, or Razor expression value.


The following example component binds:

- An `<input>` element value to the C# inputValue field.
- A second `<input>` element value to the C# InputValue property.

When an `<input>` element loses focus, its bound field or property is updated.

``` razor

<p>
    <input @bind="inputValue" />
</p>

<p>
    <label>
        Demonstration of equivalent HTML binding: 
        <input value="@InputValue"
            @onchange="@((ChangeEventArgs __e) => InputValue = __e.Value.ToString())" />
    </label>
</p>


<ul>
    <li><code>inputValue</code>: @inputValue</li>
    <li><code>InputValue</code>: @InputValue</li>
</ul>

@code {
    private string inputValue;

    private string InputValue { get; set; }
}
```

The text box is updated in the UI only when the component is rendered, not in response to changing the field's or property's value. Since components render themselves after event handler code executes, field and property updates are usually reflected in the UI immediately after an event handler is triggered.


As a demonstration of how data binding composes in HTML, the following example binds the InputValue property to the second `<input>` element's value and onchange attributes. The second `<input>` element in the following example is a concept demonstration and isn't meant to suggest how you should bind data in Razor components.

``` razor

@using Microsoft.AspNetCore.Components.Web


<p>
    <label>
        Normal Blazor binding: 
        <input @bind="InputValue" />
    </label>
</p>

<p>
    <label>
        Demonstration of equivalent HTML binding: 
        <input value="@InputValue"
            @onchange="@((ChangeEventArgs __e) => InputValue = __e.Value.ToString())" />
    </label>
</p>

<p>
    <code>InputValue</code>: @InputValue
</p>

@code {
    private string InputValue { get; set; }
}
```

When the previous component is rendered, the value of the HTML `<input>` element comes from the InputValue property. When the user enters a value in the text box and changes element focus, the onchange event is fired and the InputValue property is set to the changed value. In reality, code execution is more complex because @bind handles cases where type conversions are performed. In general, @bind associates the current value of an expression with a value attribute and handles changes using the registered handler.

Bind a property or field on other Document Object Model (DOM) events by including an @bind:event="{EVENT}" attribute with a DOM event for the {EVENT} placeholder. The following example binds the InputValue property to the `<input>` element's value when the element's `oninput` event is triggered. Unlike the onchange event, which fires when the element loses focus, `oninput` fires when the value of the text box changes.

```razor
@using Microsoft.AspNetCore.Components.Web

<p>
    <input @bind="InputValue" @bind:event="oninput" />
</p>

<p>
    <code>InputValue</code>: @InputValue
</p>

@code {
    private string InputValue { get; set; }
}

```