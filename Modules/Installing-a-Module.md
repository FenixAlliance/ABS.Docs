# Installing Modules

Alliance Business Suite Modules are .NET Nuget Packages that extend the functionality of the Alliance Business Suite. They can enhance the features of every Alliance Business Suite Component, or add entirely new features to your site. Modules are often developed by third-party organizations and are usually free to the public.

Modules are available via the [Alliance Business Suite Gallery](https://gallery.absuite.net/). 

## Security considerations

Although the Modules you find at the Gallery are thoroughly tested and considered safe to use, they are of varying quality and are often works in progress depending on the Module Provider.

## Compatibility Considerations

If a Module hasn’t been updated since the most recent update to the targeted Alliance Business Suite Component, it may be incompatible, or its compatibility may be unknown. We're working to enable just-in-time compatibility information about Modules from the Add Modules page, and from the Installed Modules list.

## Installing Modules

There are 3 ways to install Alliance Business Suite Modules.

**One-Click Module Install**: Any Module available on the [Alliance Business Suite Gallery](https://gallery.absuite.net/) can be installed via the in-studio Module installer.

**Upload via Alliance Business Studio Network Admin**: You can easily add new Modules by uploading a .nupkg archive of the Module from your local computer.

**Manual Module Installation**: In some cases, you may need to manually upload a module directly to your Alliance Business Suite Server using an SFTP client to the Alliance Business Cloud File Manager.

## Updating Modules
Module developers update their Modules occasionally, and those updates will be visible to you on your Modules Page. To find any Modules installed on your Alliance Business Suite instance that need to be updated:

- Navigate to the Alliance Business Studio.
- Click the "Network Manager" link on the Command Bar.
- On the Left Menu, navigate to the Modules Page.
- Look down the grid of installed Modules for any that include a line reading “There is a new version…”
- Click the “View version…” link in that note to view details about the Module's update.
- Click the “update now” link to update the Module.

# Uninstalling Modules 

Modules have a safe and easy-to-use uninstaller. If that’s unavailable to you for some reason, you can also manually remove them from the Modules folder on your Server instance and we'll use a cached uninstaller whenever we can't find a Module that was previously installed.



