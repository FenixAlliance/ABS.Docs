# Creating a Module

To create a Module for the Alliance Business Suite you just need to build a Razor Class Library containing your custom Controllers, pages, components, and views. as a NuGet Package and then upload it into your Alliance Business Suite instance. 

If your RCL depends on other Nuget Packages, those DLLs will need to be copied into your Module's NuGet Package for your custom functionality to work.

To do this, you can extract the .nupkg file using something like 7-Zip (NuGet Packages are just Zipped files with a different extension), and then copy into the lib/ folder every non-ABS Dll required for your RCL to work properly. Then, re-compress the files, and change the re-compressed file extension to .nupkg to be uploaded into your Alliance Business Suite Instance as a Module. (The actual path of the dlls into the lib folder makes no difference whatsoever on the discovery process, so feel free to set up your own structure.)

To install a module into your Alliance Business Suite:

- Upload your NuGet Package to the [Alliance Business Suite Gallery](https://gallery.absuite.net) and then install it through the Modules Manager. (This method will make your Module available to every Alliance Business Suite installation out there, and is best suited for those who create commercial modules and integrations)

- Upload the NuGet package right into your Alliance Business Suite instance using your instance's Modules Manager.
- Copy the NuGet Package into the Modules folder at the root of your Alliance Business Suite installation. (If the folder does not exist yet, you can confidently create it) and then enable it through your instance's admin portal.
