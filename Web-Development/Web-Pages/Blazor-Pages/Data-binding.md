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

Razor attribute binding is case sensitive:

- @bind and @bind:event are valid.
- @Bind/@Bind:Event (capital letters B and E) or @BIND/@BIND:EVENT (all capital letters) are invalid.


# Unparsable values

When a user provides an unparsable value to a data-bound element, the unparsable value is automatically reverted to its previous value when the binding event is triggered.

Consider the following component, where an `<input>` element is bound to an int type with an initial value of 123.

```
@using Microsoft.AspNetCore.Components.Web

<p>
    <input @bind="inputValue" />
</p>

<p>
    <code>inputValue</code>: @inputValue
</p>

@code {
    private int inputValue = 123;
}
```

By default, data binding applies to the element's `onchange` event. If the user updates the value of the text box's entry to 123.45 and changes the focus, the element's value is reverted to 123 when onchange fires. When the value 123.45 is rejected in favor of the original value of 123, the user understands that their value wasn't accepted.

For the oninput event (@bind:event="oninput"), a value reversion occurs after any keystroke that introduces an unparsable value. When targeting the oninput event with an int-bound type, a user is prevented from typing a dot (.) character. A dot (.) character is immediately removed, so the user receives immediate feedback that only whole numbers are permitted. There are scenarios where reverting the value on the oninput event isn't ideal, such as when the user should be allowed to clear an unparsable `<input>` value. Alternatives include:

- Don't use the oninput event. Use the default onchange event, where an invalid value isn't reverted until the element loses focus.
- Bind to a nullable type, such as int? or string and provide custom get and set accessor logic to handle invalid entries.
- Use a form validation component, such as InputNumber<TValue> or InputDate<TValue>. Form validation components provide built-in support to manage invalid inputs. Form validation components:
  - Permit the user to provide invalid input and receive validation errors on the associated EditContext.
  - Display validation errors in the UI without interfering with the user entering additional webform data.

# Format strings
Data binding works with a single DateTime format string using @bind:format="{FORMAT STRING}", where the {FORMAT STRING} placeholder is the format string. Other format expressions, such as currency or number formats, aren't available at this time but might be added in a future release.

```
@using Microsoft.AspNetCore.Components.Web

<p>
    <label>
        <code>yyyy-MM-dd</code> format:
        <input @bind="startDate" @bind:format="yyyy-MM-dd" />
    </label>
</p>

<p>
    <code>startDate</code>: @startDate
</p>

@code {
    private DateTime startDate = new(2020, 1, 1);
}
```
In the preceding code, the `<input>` element's field type (type attribute) defaults to text.

Nullable System.DateTime and System.DateTimeOffset are supported:
```
private DateTime? date;
private DateTimeOffset? dateOffset;

```

Specifying a format for the date field type isn't recommended because Blazor has built-in support to format dates. In spite of the recommendation, only use the yyyy-MM-dd date format for binding to function correctly if a format is supplied with the date field type:
``` razor
<input type="date" @bind="startDate" @bind:format="yyyy-MM-dd">
```

# Custom binding formats
C# get and set accessors can be used to create custom binding format behavior, as the following DecimalBinding component demonstrates. The component binds a positive or negative decimal with up to three decimal places to an `<input>` element by way of a string property (DecimalValue).
```
@using System.Globalization

<p>
    <label>
        Decimal value (&plusmn;0.000 format):
        <input @bind="DecimalValue" />
    </label>
</p>

<p>
    <code>decimalValue</code>: @decimalValue
</p>

@code {
    private decimal decimalValue = 1.1M;
    private NumberStyles style = 
        NumberStyles.AllowDecimalPoint | NumberStyles.AllowLeadingSign;
    private CultureInfo culture = CultureInfo.CreateSpecificCulture("en-US");

    private string DecimalValue
    {
        get => decimalValue.ToString("0.000", culture);
        set
        {
            if (Decimal.TryParse(value, style, culture, out var number))
            {
                decimalValue = Math.Round(number, 3);
            }
        }
    }
}
```
# Additional resources

[Blazor Data Binding](https://docs.microsoft.com/en-us/aspnet/core/blazor/components/data-binding?view=aspnetcore-5.0)
