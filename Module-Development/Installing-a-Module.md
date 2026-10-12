# Installing Modules

Alliance Business Suite Modules are .NET Nuget Packages that extend the functionality of the Alliance Business Suite. They can enhance the features of every Alliance Business Suite Component, or add entirely new features to your site. Modules are often developed by third-party organizations and are usually free to the public.

Modules are available via the [Alliance Business Suite Gallery](https://gallery.absuite.net/). 

## Security considerations

The Modules you find at the Gallery are of varying quality and are often works in progress depending on the Module Provider.

## Compatibility Considerations

If a Module hasn’t been updated since the most recent update to the targeted Alliance Business Suite Component, it may be incompatible, or its compatibility may be unknown. We're working to enable just-in-time compatibility information about Modules from the Add Modules page, and from the Installed Modules list.

## Installing Modules

To install a module, copy its .nupkg package into the Modules folder of your Alliance Business Suite server. The server loads it the next time it starts.

## Updating Modules
To update a module, replace its package in the Modules folder with the newer version and restart the server.

# Uninstalling Modules 

To uninstall a module, remove it from the Modules folder on your server.



