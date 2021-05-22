[[_TOC_]]

The Alliance Business Suite contains a simple, yet powerful engine for enabling seamless Client-Side Single Page Application development using Angular or React/React+Redux, or really any Client-Side framework.

The ABS SPA Service provides a convenient template to act as a starting point for Client-Side Applications both using Angular or React/React+Redux to implement a rich, client-side user interface (UI) while still taking advantage of the tremendous power of the Alliance Business Suite without the hustle of creating and connecting independent application components, managing authentication and more.

ABS SPA applications offer the convenience of hosting several custom applications inside a single Alliance Business Suite instance, Consequently, your business applications can be perceived, managed, and operated as a single unit.

There are slight differences between the Angular/React/React+Redux app created for the Alliance Business Suite and the one traditionally created by each respective SPA framework tool (via `ng new` or `npx create-react-app` ); however, the app's capabilities are unchanged. The app created by each template contains a Bootstrap-based layout and a basic routing example.

Each ABS SPA template is configured to use the Alliance Business Platform as an API backend and the SPA project to act as a UI. 

# Creating a Single Page Application.

To create a new Client-Side application for the Alliance Business Suite, head over to your ABS Studio, click on integrations from the top right-hand side corner of your state bar. Select Alliance Business Suite > Applications > Create Application.

There, fill out the form, select a name for your application and mark your new application as a Single Page Application. There, you will be prompted with additional required properties for your application.

![image.png](/.attachments/image-a34b452c-027b-4da7-ac6b-ed0ad52751d3.png)
You can customize things like:
- The Application Name
- The NPM Publish Script
- The NPM Start Script
- The SPA Engine

## Managing your Angular Application

## Managing your React Application

The template is equivalent to creating both an ASP.NET Core project to act as an API backend, and a standard CRA React project to act as a UI, but with the convenience of hosting both in a single app project that can be built and published as a single unit.

## Managing your React + Redux Application

# Add pages, images, styles, modules, etc.
The Alliance Business Suite offers an in-app code editor and file manager to allow you to add static files and code changes to your SPA application. However, sometimes customers do prefer to realize extension development using tools like Visual Studio and VS Code on their development desktops.

This is why the Alliance Business Suite allows customers to connect a public/private git repo to each SPA and pull/push updates with the click of a button.

To enable Git Management for your SPA application, head to your application page and Enable Git Repo Management. Provide a Git Repo URL and a [personal access token](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token) if the repo is private.

![image.png](/.attachments/image-3d421c5b-f19d-43a9-958a-b1aefae7840f.png)
# Install npm packages
To install third-party npm packages, use a command prompt on the application page and run the following command:

`
spa -id  packages install --save <package_name>
`
or just add it to your package.json and request the application to execute the publish script, (which will execute `npm install` first) by clicking on the Re-Publish Files button.

![image.png](/.attachments/image-a501d1ed-0f21-4c50-9f14-b535cbb58c2d.png)
# Publish and deploy
In development, ABS SPAs run in a mode optimized for developer convenience. For example, JavaScript bundles include source maps (so that when debugging, you can see your original TypeScript code). The app watches for TypeScript, HTML, and CSS file changes on the SPA Root Files Path and automatically recompiles and reloads when it sees those files change. 

In production, the Alliance Business Suite serves the version of your app that's optimized for performance. This is configured to happen automatically. When you publish, the build configuration emits a minified, ahead-of-time (AoT) compiled build of your client-side code. Unlike the development build, the production build doesn't require Node.js to be installed on the server (unless you have enabled server-side rendering (SSR)).


# Run the SPA independently

The project is configured to start its own instance of the SPA in the background when the Alliance Business Suite starts in development mode. This is convenient because you don't have to run a separate server manually.

There's a drawback to this default setup. Each time you modify your C# code and your Alliance Business Suite instance needs to restart, the SPA server restarts. Around 10 seconds is required to start back up. If you're making frequent updates to your Alliance Business Suite instance (Like installing new applications or modules) and don't want to wait for each SPA process to restart, run the Angular CLI server externally, independently of the ASP.NET Core process. To do so:

![image.png](/.attachments/image-34da8472-569f-46a2-a82f-787c07f51b56.png)

Provide a URL for the running ABS SPA and the Alliance Business Suite will establish a proxy To the SPA Development Server.

# Current limitations

The React project template isn't meant for server-side rendering (SSR). For SSR with React and Node.js, consider [Next.js](https://github.com/zeit/next.js/) or [Razzle](https://github.com/jaredpalmer/razzle).




























