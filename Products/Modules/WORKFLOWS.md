# Workflow Designer Module (CRM)

Welcome to the **Alliance Business Suite | Workflow Designer Module** Documentation. 

These articles will enable you to work with the module to get the most out of your Alliance Business Suite instance. 

The Alliance Business Suite | Workflow Designer is workflows manager that enables workflow execution in any Alliance Business Suite instance. Workflows can be defined using code and using the visual workflow designer.

## Features

- Create workflows using the **Workflow Builder API**.
- Create & manage workflows **visually** using the Alliance Business Studio Dashboard SPA.
- Design **long-running** workflows.
- REST **API Endpoints** to manage and integrate with Elsa from external applications.
- Create higher-level activities using the **Composite Activity API**.
- **Rich set of activities** such as SetVariable, For, ForEach, ParallelForEach, Fork, Join, HttpEndpoint, SendHttpRequest, SendEmail, MessageReceived and much more.
- Create **custom activities**.
- **Workflow Expressions** allow you to configure activity properties with expressions that are evaluated at runtime. Supported syntaxes are JavaScript and Liquid.

## Why Workflow Designer?

One of the main goals of the Workflow Designer Module is to **enable workflows in any Alliance Business Suite instance** with **minimum effort** and **maximum extensibility**. This means that your Alliance Business Suite is workflow-capable right out of the box.

### Azure Logic Apps vs ABS | Workflow Designer?

- As powerful and as complete Azure Logic Apps is, it's available only as a managed service in Azure. The Alliance Business Suite, on the other hand allows you to host it not only on Azure, but on any cloud provider that supports .NET Core. And of course you can host it on-premises.

- Although you can implement long-running workflows with Logic Apps, you would typically do so by splitting your workflow with multiple Logic Apps where one workflow invokes the other. This can make the logic flow a bit hard to follow. with ABS | Workflow Designer, you simply add triggers anywhere in the workflow, making it easier to have a complete view of your application logic. And if you want, you can still invoke other workflows form one workflow.

### ABS | Workflow Designer vs. Windows Workflow Foundation?

I've always liked Windows Workflow Foundation, but unfortunately [development appears to have halted](https://forums.dotnetfoundation.org/t/what-is-the-roadmap-of-workflow-foundation/3066). Here are a few reasons to prefer the  Workflow Designer Module:

- The Workflow Designer Module intrinsically supports triggering events that starts new workflows and resumes halted workflow instances in an easy to use manner. E.g. `workflowHost.TriggerWorkflowAsync("HttpRequestTrigger");"` will start and resume all workflows that either start with or are halted on the `HttpRequestTrigger`.
- The Workflow Designer Module has an In-Studio (web-based) workflow designer and a REST-based API to manage everything you can manage trough the Web Workflow Designer.

### ABS | Workflow Designer vs. Orchard Workflows?

Both [Orchard](http://docs.orchardproject.net/en/latest/Documentation/Workflows/) and [Orchard Core](https://orchardcore.readthedocs.io/en/dev/docs/reference/modules/Workflows/) ship with a powerful workflows module, and both are awesome. In fact, the Workflow Designer Module was inspired from Orchard Core's Workflows module. 

Although Workflow Designer uses a similar model, here are some differences:

- The Workflow Designer Module is completely decoupled from web and relies on the Alliance Business Platform, whereas Orchard Core Workflows is coupled to not only the web, but also the Orchard Core Framework itself.
- The Workflow Designer Module is being built without taking a dependency on any Orchard Core packages.

