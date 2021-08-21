# Hosting the Alliance Business Suite on IIS

Internet Information Services (IIS) is a flexible, secure and manageable Web Server for hosting web apps, including ASP.NET Core.

## Supported platforms
The following operating systems are supported:

- Windows 10 or later
- Windows Server 2012 R2 or later

The Alliance Business Suite is a 64-bit (x64) for the following reasons:

- Requires the larger virtual memory address space available to a 64-bit app.
- Requires the larger IIS stack size.
- Has 64-bit native dependencies.


## Install the ASP.NET Core Module/Hosting Bundle

Download the installer using the following link:

[Current .NET Core Hosting Bundle installer (direct download)](https://dotnet.microsoft.com/permalink/dotnetcore-current-windows-runtime-bundle-installer)

For more detailed instructions on how to install the ASP.NET Core Module, or installing different versions, see [Install the .NET Core Hosting Bundle](https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/iis/hosting-bundle?view=aspnetcore-5.0).


## Publish an Alliance Business Suite instance to IIS

### Create the IIS site

1.  On the IIS server, create a folder to contain the Alliance Business Suite folders and files. In a further step, the folder's path is provided to IIS as the physical path to the app. For more information on an app's deployment folder and file layout, see ASP.NET Core directory structure.

2. In IIS Manager, open the server's node in the Connections panel. Right-click the Sites folder. Select Add Website from the contextual menu.

3. Provide a Site name and set the Physical path to the app's deployment folder that you created. Provide the Binding configuration and create the website by selecting OK.

4. Confirm the process model identity has the proper permissions: If the default identity of the app pool (Process Model > Identity) is changed from ApplicationPoolIdentity to another identity, verify that the new identity has the required permissions to access the app's folder, database, and other required resources. For example, the app pool requires read and write access to folders where the app reads and writes files.

**Warning**

Top-level wildcard bindings (http://*:80/ and http://+:80) should not be used. Top-level wildcard bindings can open up your app to security vulnerabilities. This applies to both strong and weak wildcards. Use explicit hostnames rather than wildcards. Subdomain wildcard binding (for example, *.mysub.com) doesn't have this security risk if you control the entire parent domain (as opposed to *.com, which is vulnerable). 


### Clone the Alliance Business Suite Distributable

The best way to manage the Alliance Business Suite Update Flow is to clone the Alliance Business Suite to the publish directory using Git.

1. Navigate to the Publish Directory, make sure is empty, and open a CLI into it.
1. Run the following command: `git clone https://github.com/fenixalliance/abs.bin .`
    - If you're unable to deploy directly to the IIS site folder on the IIS server, pick your desired ring from the Releases Repo and clone on removable media and physically move them to the IIS site folder on the server, which is the site's Physical path in IIS Manager. Move the contents of the cloned repository to the IIS site folder on the server, which is the site's Physical path in IIS Manager.
1. Restart the IIS Site.

### Browse the website
The app is accessible in a browser after it receives the first request. Make a request to the app at the endpoint binding that you established in IIS Manager for the site.