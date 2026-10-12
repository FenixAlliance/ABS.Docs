# Installing Modules

Alliance Business Suite Modules are .NET Nuget Packages that extend the functionality of the Alliance Business Suite. They can enhance the features of every Alliance Business Suite Component, or add entirely new features to your site. Modules are often developed by third-party organizations.

The instance owner decides which modules are available on the instance. Workspaces (tenants) do not install modules. If your workspace runs on an instance someone else holds, ask the instance owner for the modules you need.

Modules are available via the [Alliance Business Suite Gallery](https://gallery.absuite.net/). 

## Security considerations

A module runs inside the server process with the same access as the Suite itself. Install only packages from sources you trust.

## Compatibility Considerations

Before you install a module, check that it targets your Suite version.

## Installing Modules

To install a module, the instance owner copies its .nupkg package into the Modules folder in the server's application directory, then restarts the server. An administrator must then grant the module to each workspace before its screens appear there.

## Updating Modules
To update a module, delete the old .nupkg package and its unpacked folder of the same name from the Modules folder, copy in the new package, then restart the server. Replacing the package alone is not enough, because the old unpacked folder still loads.

# Uninstalling Modules 

To uninstall a module, remove both its .nupkg package and its unpacked folder of the same name from the Modules folder, then restart the server. No automatic cleanup runs.



