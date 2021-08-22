# Working with static files.

This topic describes the overall functionality for the Alliance Business Platform | File System Engine, how to upload static files into an Alliance Business Suite instance, and how to retrieve the URL and file name that can be used to request that file.

## About Uploading Files on Studio

The Alliance Business Platform contains a powerful file system engine called ABP-FS. Through ABP-FS, users can upload files and relate them to almost any ABM Record. By exposing several API endpoints on both code and REST APIs, users can upload files of any kind. Default restrictions are provided for security purposes, and files can also be uploaded through FTP or through the Alliance Business Studio (using the GUI file manager).

## File Upload Scopes

By leveraging the ABP-FS APIs, customers and developers can upload files scoped to an Alliance Business Model Record; this allows customers to access, manage, and share files related to, for example, an Account, a Contact, or a Portal, in one place.

## Public Files.

The ABP-FS allows customers to upload public files within the scope of a [Web Portal](/Web-Development/Web-Portals.md). These files are exposed through the `/Public/{PortalID}` endpoint available to every portal.

### Unscoped Public Files

When developing single or multiple portals, customers might want to share common files between them. To do so, they can now upload Unscoped Public Files that will be available through the `/Public` endpoint.

Unscoped files are marked as read-only files by default and can only be uploaded by an Account Holder with `global_admin` [Business Permission](/Components/Alliance-Passport-Service/Business-Permissions.md).

### Public Files URL

Regardless of how you upload a file, you can retrieve the file URL by using the Alliance Business Studio File Manager or by recomposing the URL from the File Path by prepending the `/Public/` endpoint to it, so that it is relative to the `/AppData/Public` folder where both Scoped and Unscoped Public Files are uploaded.