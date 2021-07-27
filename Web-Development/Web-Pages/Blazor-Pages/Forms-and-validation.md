# Forms and validation
The Blazor framework supports web forms with validation using the `EditForm` component bound to a model that uses data annotations.

To demonstrate how an EditForm component works with data annotations validation, consider the following ExampleModel type. The Name property is marked required with the RequiredAttribute and specifies a StringLengthAttribute maximum string length limit and error message.

```cs

using System.ComponentModel.DataAnnotations;

public class ExampleModel
{
    [Required]
    [StringLength(10, ErrorMessage = "Name is too long.")]
    public string Name { get; set; }
}
```

A form is defined using the Blazor framework's EditForm component. The following Razor component demonstrates typical elements, components, and Razor code to render a webform using an EditForm component, which is bound to the preceding ExampleModel type.

```razor

<EditForm Model="@exampleModel" OnValidSubmit="@HandleValidSubmit">
    <DataAnnotationsValidator />
    <ValidationSummary />

    <InputText id="name" @bind-Value="exampleModel.Name" />

    <button type="submit">Submit</button>
</EditForm>

@code {
    private ExampleModel exampleModel = new();

    private void HandleValidSubmit()
    {
        Console.WriteLine("HandleValidSubmit called");

        // Process the valid form
    }
}
```
In the preceding component:

- The EditForm component is rendered where the <EditForm> element appears.
- The model is created in the component's @code block and held in a private field (`exampleModel`). The field is assigned to EditForm.Model's attribute (Model) of the <EditForm> element.
- The `InputText` component (id="name") is an `<input>` component for editing string values. The `@bind-Value` directive attribute binds the `exampleModel.Name` model property to the `InputText` component's Value property.
- The `HandleValidSubmit` method is assigned to `OnValidSubmit`. The handler is called if the form passes validation.
- The data annotations validator (`DataAnnotationsValidator` component†) attaches validation support using data annotations:
   - If the `<input>` form field is left blank when the Submit button is selected, an error appears in the validation summary (`ValidationSummary` component‡) ("The Name field is required.") and `HandleValidSubmit` is not called.
   - If the `<input>` form field contains more than ten characters when the Submit button is selected, an error appears in the validation summary ("Name is too long.") and `HandleValidSubmit` is not called.
   - If the `<input>` form field contains a valid value when the Submit button is selected, HandleValidSubmit is called.

†The `DataAnnotationsValidator` component is covered in the Validator component section. ‡The ValidationSummary component is covered in the Validation Summary and Validation Message components section. For more information on property binding, see [data binding](/Web-Development/Web-Pages/Blazor-Pages/Data-binding.md).




