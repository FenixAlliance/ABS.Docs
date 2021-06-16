# Razor Pages Introduction


Pages are very important components for the Alliance Business Suite. They allow customers to implement unique, visually outstanding web pages by using a templating engine that's based on .NET's Razor Syntax.

Pages in the Alliance Business Suite can be added through the Admin Portal of your ABS instance and live edited through the ABS Web Builder.

Pages are WebContent Components, which makes them extremely powerful. They are stored in the Alliance Business Model Database provider and C# is server-side evaluated to then render the output as HTML, CSS, and JavaScript.

Although pages can inject services and even interact with the ABM Database Provider through the DataContext instance present at every page, pages can optionally contain a caller method. This method's responsibility is to produce the model that's going to be used to fill the page's Model property, sort of like a controller method passing a Model to a view.

## Creating a Web Page

To create a Web Page in the Alliance Business Suite you must have Studio Access (access_studio) permission and the create WebContent entities permission (create_webcontent).

- Head to your ABS Instance's Admin Portal at https://{yourdomain}/admin 
- Select the Business Tenant for which you want to create a Web Page.
- Click on the Add button of your Command Bar and Select Web Page
- Give the entry a Title, a Slug, and (optionally) select a template and parent page to use on the page.
- Write some code using the Razor Syntax and the Code Editor.
- Validate your code for errors.
- Save Changes.

Once you've saved changes for your Web Page, the system will automatically redirect you to the Edition page. Here you will be able to edit everything about your page, and new options will be available, such as categorization and tags.

## Page Routing 

Pages must define a "Slug". This relative route gets combined with the parent's page slug to produce the Absolute Slug of the page and defines the route over which your page will be located and invoked. It can be changed at any time.

Currently, Pages other than the Home Page are available at the /Pages/{AbsoluteSlug} route.

## Home Page
Each portal on the Alliance Business Suite must be provided with a Home Page. this can be any page you've created and it will allow each portal to find the page that will be rendered at the root of the portal. Customers can mark a page as the Home Page by ticking the respective option on a portal-related or by setting the page on each Portal's Options Manager.


If you set a portal-related page as the home page by ticking the "Is Home Page" option, that will replace any other Home Page related to that specific portal, becoming, like so, the Active Home Page. 

The above is a legacy method for Home page discovery. To improve consistency across portals, we've implemented a new method to select the Home Page on the Portal's Options Manager. To use the new method, head to your Instance's administration portal and over General Settings, select the page you would like to render at the root of each portal.


## Client-Side UI Frameworks

The Alliance Business Suite is configured to allow customers to use, right out of the box, several UI Frameworks such as:

- [x] [Bootstrap](https://getbootstrap.com/)
- [x] [Foundation](https://get.foundation/)
- [x] [Bulma](https://bulma.io/)
- [x] [Fast](https://www.fast.design/)
- [x] [Fabric](https://developer.microsoft.com/en-us/fabric-js) (deprecated) 
- [x] [Fluent UI](https://developer.microsoft.com/en-us/fluentui#/)
- [x] [Tailwind CSS](https://tailwindcss.com/)
- [x] [Materialize CSS](https://materializecss.com/)
- [x] [Semantic UI](https://semantic-ui.com/)

These frameworks can be enabled or disabled on a template basis to allow customers to create and combine unique experiences with the tools they already use and love.

 
 
