# Configuring an Alliance Business Suite Instance

## Short Notation for this page

- Acting Business Tenant ("ABT") 
- Current Web Portal ("CWP") 

The Alliance Business Suite is designed to be as easy to use as it can be by abstracting complexity through a clean UI and multiple navigation features designed to take you where you need to perform.

Once installed, your instance will be functional, but not quite yet ready for production. For this reason, new instances are created with a Not Operational Status. This Status means that even new users can be created and pretty much every functionality will work right out of the box, several unconfigured functionalities won't be available until proper setup.

In order to get your instance to an Operational State, you should first configure for the first time the Alliance Passport Service, perform some internal configurations, and properly set up your Root Web Portal. 

## Configuring your instance
One of the most important files in your Alliance Business Suite instance is the suitesettings.json file. This file is located in the root of your instance's file directory and contains your website’s base configuration details, such as database connection information.

When you first download the Alliance Business Suite, this file does not exist, as it will be created during the initial setup process.

Although you can manually provide a suitesettings.json file for your instance (bypassing like so the initial setup process), you will be required to run this initial setup process at least once to create your initial database schema and insert required records.

Once this installation process has been completed, multiple instances can retrieve their configuration files through the ABS Management API from the root instance, and thus sharing the data layer, allowing customers to scale both the data and application layer independently, depending on their specific requirements.

Each Alliance Business Suite instance contains its own administrator portal. Instances are bounded each a Business Tenant's Primary [Web Portal](/English/Web-Development/Web-Portals.md)'s configuration.

The first towards configuring your Root Web Portal is to finish creating information for your Business Tenant. The amount of configuration required will depend on the number of Modules included in your instance. 

Note: Although currently possible, it is not recommended to edit the `suitesettings.json` file directly unless required.

# Administration Flow Optimization

Due to the massive amount of different types of data that the Alliance Business Suite is built to manage, and the tremendous amount of control given to our customers, it can be easy to get lost among all the different options and configurations available. We understand this and We want your workflow to be as fluid as possible, so we've been tackling this issue through several shortcuts and UI optimizations that will help you manage your business tenant's with an incredibly high APM ("Actions per Minute") rate.

These optimizations include:

1. Drastically reducing the number of page loads required to manage everything inside the Alliance Business Suite: Our goal is to bring this number to 1, meaning that once you're into the Alliance Business Studio, 
2. Drastically reducing the number of clicks required to get from point A to point B inside the application: Our goal is to provide multiple ways to get you where you need to be across your business tenants.
3. Optimizing performance and improving both UX/UI to deliver clear, readable interfaces to manage data across Business Tenants.
4. Including accessibility features to improve the way people with limitations interact with the application.
5. Delivering additional interfaces other than the Studio to help Customers to automate and extend 




## Shortcuts List for the Alliance Business Studio

### Studio: Global Shortcuts

- `Shift + H`: Go to the Studio Home
- `Shift + I`: Go to your Account Holder Profile Page
- `Shift + Tab`: Go to the Business Tenant Selection Page
- `Shift + Comma`: Go to the Acting Business Tenant's Profile Page
- `Shift + A`: Go to the Acting Business Tenant's Admin Dashboard Page
- `Shift + U`: Go to the Acting Business Tenant's Users Page
- `Shift + W`: Go to the Portals Selection Page 

### Content Manager Shortcuts

- `Shift + P`: Go to the CWP's Web Pages Index Page 
- `Shift + C`: Go to the CWP's Components Index Page 
- `Shift + T`: Go to the CWP's Templates Index Page 
- `Shift + M`: Go to the CWP's Media Manager Page 

### Network Manager Shortcuts

- `Shift + N`: Go to the Network's Dashboard
- `Shift + L`: Go to the Logs Manager

### Module Related Shortcuts

- `Alt + M`: Go to the ABT's Modules Page 
- `Alt + C`: Go to the ABT's Contact Sight Module Page
- `Alt + A`: Go to the ABT's Accounting Module Page 
- `Alt + S`: Go to the ABT's Sales Module Page 
- `Alt + L`: Go to the ABT's Logistics Module Page 
- `Alt + E`: Go to the ABT's Education Module Page 
- `Alt + H`: Go to the ABT's Helpdesk Module Page 
- `Alt + P`: Go to the ABT's Project Workbench Module Page 
- `Alt + Q`: Go to the ABT's Quality Inspector Module Page 
- `Alt + W`: Go to the ABT's Workplace Module Page
- `Alt + F`: Go to the ABT's Workforce Module Page
- `Alt + I`: Go to the ABT's Marketing Module Page

### Studio: Web Content & Live Editor Pages Shortcuts

- `CTRL + S`: Save Changes
- `CTRL + V`: Validate Code
- `CTRL + F`: Format Code

### Quick Record Shortcuts

- `CTRL + I`: Create Quick Invoice
- `CTRL + A`: Create Quick Account
- `CTRL + O`: Create Quick Order
- `CTRL + Q`: Create Quick Quote
