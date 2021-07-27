# ABS Web event handling

Specify delegate event handlers in Razor component markup with @on{DOM EVENT}="{DELEGATE}" Razor syntax:

- The {DOM EVENT} placeholder is a [Document Object Model (DOM) event](https://developer.mozilla.org/en-US/docs/Web/Events) (for example, click).
- The {DELEGATE} placeholder is the C# delegate event handler.

For event handling:

- Asynchronous delegate event handlers that return a Task are supported.
- Delegate event handlers automatically trigger a UI render, so there's no need to manually call StateHasChanged.
- Exceptions are logged.

The following code:

- Calls the UpdateHeading method when the button is selected in the UI.
- Calls the CheckChanged method when the checkbox is changed in the UI.

``` razor
<h1>@currentHeading</h1>

<p>
    <label>
        New title
        <input @bind="newHeading" />
    </label>
    <button @onclick="UpdateHeading">
        Update heading
    </button>
</p>

<p>
    <label>
        <input type="checkbox" @onchange="CheckChanged" />
        @checkedMessage
    </label>
</p>

@code {
    private string currentHeading = "Initial heading";
    private string newHeading;
    private string checkedMessage = "Not changed yet";

    private void UpdateHeading()
    {
        currentHeading = $"{newHeading}!!!";
    }

    private void CheckChanged()
    {
        checkedMessage = $"Last changed at {DateTime.Now}";
    }
}
```

In the following example, UpdateHeading:

- Is called asynchronously when the button is selected.
- Waits two seconds before updating the heading.

```razor
<h1>@currentHeading</h1>

<p>
    <label>
        New title
        <input @bind="newHeading" />
    </label>
    <button @onclick="UpdateHeading">
        Update heading
    </button>
</p>

@code {
    private string currentHeading = "Initial heading";
    private string newHeading;

    private async Task UpdateHeading()
    {
        await Task.Delay(2000);

        currentHeading = $"{newHeading}!!!";
    }
}
```

# Event Arguments

For events that support an event argument type, specifying an event parameter in the event method definition is only necessary if the event type is used in the method. In the following example, MouseEventArgs is used in the ReportPointerLocation method to set message text that reports the mouse coordinates when the user selects a button in the UI.

``` razor

@for (var i = 0; i < 4; i++)
{
    <p>
        <button @onclick="ReportPointerLocation">
            Where's my mouse pointer for this button?
        </button>
    </p>
}

<p>@mousePointerMessage</p>

@code {
    private string mousePointerMessage;

    private void ReportPointerLocation(MouseEventArgs e)
    {
        mousePointerMessage = $"Mouse coordinates: {e.ScreenX}:{e.ScreenY}";
    }
}


```

Supported EventArgs are shown in the following table.

# Lambda expressions
Lambda expressions are supported as the delegate event handler.
``` razor

@page "/Pages/EventHandlerExample4"

<h1>@heading</h1>

<p>
    <button @onclick="@(e => heading = "New heading!!!")">
        Update heading
    </button>
</p>

@code {
    private string heading = "Initial heading";
}

```

It's often convenient to close over additional values using C# method parameters, such as when iterating over a set of elements. The following example creates three buttons, each of which calls UpdateHeading and passes the following data:

An event argument (MouseEventArgs) in e.
The button number in buttonNumber.

``` razor

@page "/event-handler-example-5"

<h1>@heading</h1>

@for (var i = 1; i < 4; i++)
{
    var buttonNumber = i;

    <p>
        <button @onclick="@(e => UpdateHeading(e, buttonNumber))">
            Button #@i
        </button>
    </p>
}

@code {
    private string heading = "Select a button to learn its position";

    private void UpdateHeading(MouseEventArgs e, int buttonNumber)
    {
        heading = $"Selected #{buttonNumber} at {e.ClientX}:{e.ClientY}";
    }
}

```

# EventCallback
A common scenario with nested components executes a parent component's method when a child component event occurs. An onclick event occurring in the child component is a common use case. To expose events across components, use an EventCallback. A parent component can assign a callback method to a child component's EventCallback.

The following Child component demonstrates how a button's onclick handler is set up to receive an EventCallback delegate from the sample's ParentComponent. The EventCallback is typed with MouseEventArgs, which is appropriate for an onclick event from a peripheral device.

```
<p>
    <button @onclick="OnClickCallback">
        Trigger a Parent component method
    </button>
</p>

@code {
    [Parameter]
    public string Title { get; set; }

    [Parameter]
    public RenderFragment ChildContent { get; set; }

    [Parameter]
    public EventCallback<MouseEventArgs> OnClickCallback { get; set; }
}
```

The Parent component sets the child's EventCallback<TValue> (OnClickCallback) to its ShowMessage method.
```
@page "/Pages/parent"

<h1>Parent-child example</h1>

<Child Title="Panel Title from Parent" OnClickCallback="@ShowMessage">
    Content of the child component is supplied by the parent component.
</Child>

<p>@message</p>

@code {
    private string message;

    private void ShowMessage(MouseEventArgs e)
    {
        message = $"Blaze a new trail with Blazor! ({e.ScreenX}:{e.ScreenY})";
    }
}

```
When the button is selected in the ChildComponent:

- The Parent component's ShowMessage method is called. the message is updated and displayed in the Parent component.

- A call to StateHasChanged isn't required in the callback's method (ShowMessage). StateHasChanged is called automatically to rerender the Parent component, just as child events trigger component rerendering in event handlers that execute within the child. For more information, see ASP.NET Core Blazor component rendering.

EventCallback and EventCallback<TValue> permit asynchronous delegates. EventCallback is weakly typed and allows passing any type of argument in InvokeAsync(Object). EventCallback<TValue> is strongly typed and requires passing a T argument in InvokeAsync(T) that's assignable to TValue.

``` razor
<ChildComponent 
    OnClickCallback="@(async () => { await Task.Yield(); messageText = "Blaze It!"; })" />
```

Invoke an EventCallback or EventCallback<TValue> with InvokeAsync and await the Task:


``` cs
await OnClickCallback.InvokeAsync(arg);
```

Use EventCallback and EventCallback<TValue> for event handling and binding component parameters.

Prefer the strongly typed EventCallback<TValue> over EventCallback. EventCallback<TValue> provides enhanced error feedback to users of the component. Similar to other UI event handlers, specifying the event parameter is optional. Use EventCallback when there's no value passed to the callback.

# Prevent default actions

Use the @on{DOM EVENT}:preventDefault directive attribute to prevent the default action for an event, where the {DOM EVENT} placeholder is a Document Object Model (DOM) event.

When a key is selected on an input device and the element focus is on a text box, a browser normally displays the key's character in the text box. In the following example, the default behavior is prevented by specifying the @onkeydown:preventDefault directive attribute. When the focus is on the <input> element, the counter increments with the key sequence Shift++. The + character isn't assigned to the <input> element's value. For more information on keydown, see MDN Web Docs: Document: keydown event.

``` razor
<p>
    <input value="@count" @onkeydown="KeyHandler" @onkeydown:preventDefault />
</p>

@code {
    private int count = 0;

    private void KeyHandler(KeyboardEventArgs e)
    {
        if (e.Key == "+")
        {
            count++;
        }
    }
}
```
Specifying the @on{DOM EVENT}:preventDefault attribute without a value is equivalent to @on{DOM EVENT}:preventDefault="true".

An expression is also a permitted value of the attribute. In the following example, shouldPreventDefault is a bool field set to either true or false:

```
<input @onkeydown:preventDefault="shouldPreventDefault" />

...

@code {
    private bool shouldPreventDefault = true;
}

```

# Stop event propagation

Use the @on{DOM EVENT}:stopPropagation directive attribute to stop event propagation, where the {DOM EVENT} placeholder is a Document Object Model (DOM) event.

In the following example, selecting the checkbox prevents click events from the second child <div> from propagating to the parent <div>. Since propagated click events normally fire the OnSelectParentDiv method, selecting the second child <div> results in the parent div message appearing unless the checkbox is selected.

```
@page "/Pages/EventHandlerExample7"

<label>
    <input @bind="stopPropagation" type="checkbox" />
    Stop Propagation
</label>

<div class="m-1 p-1 border border-primary" @onclick="OnSelectParentDiv">
    <h3>Parent div</h3>

    <div class="m-1 p-1 border" @onclick="OnSelectChildDiv">
        Child div that doesn't stop propagation when selected.
    </div>

    <div class="m-1 p-1 border" @onclick="OnSelectChildDiv" 
            @onclick:stopPropagation="stopPropagation">
        Child div that stops propagation when selected.
    </div>
</div>

<p>
    @message
</p>

@code {
    private bool stopPropagation = false;
    private string message; 

    private void OnSelectParentDiv() =>
        message = $"The parent div was selected. {DateTime.Now}";

    private void OnSelectChildDiv() =>
        message = $"A child div was selected. {DateTime.Now}";
}
```

# Focus an element

Call FocusAsync on an element reference to focus an element in code. In the following example, select the button to focus the <input> element.

```
razor

Copy
@page "/Pages/EventHandlerExample8"

<p>
    <input @ref="exampleInput" />
</p>

<button @onclick="ChangeFocus">
    Focus the Input Element
</button>

@code {
    private ElementReference exampleInput;

    private async Task ChangeFocus()
    {
        await exampleInput?.FocusAsync();
    }
}
```