# Alliance Business Cloud Overview

The Alliance Business Cloud is an HTTP-based service for hosting Alliance Business Suite Instances and other kinds of applications. These can be developed in your favorite language, be it .NET, .NET Core, Java, Ruby, Node.js, PHP, or Python. Applications run and scale with ease on both Windows-based environments.

The Alliance Business Cloud not only adds the power of Microsoft Azure to your Alliance Business Suite instance, such as security, load balancing, autoscaling, and automated management features; You can also take advantages of its DevOps capabilities, such as continuous deployment from Azure DevOps, GitHub, Docker Hub, and other sources, package management, staging environments, custom domain, and free/paid TLS/SSL certificates.

With Alliance Business Cloud, you pay for the Azure compute resources you use. The compute resources you use are determined by the App Service plan that you run your instance on. 

## Why use Alliance Business Cloud?

- **Centralized Control Panel**:
Build and manage multiple sites from a single dashboard. You can also run updates, monitor performance, and onboard new portals and applications all from the same place.

- **Certified to hyperscale into the cloud**: Certified to run on the largest cloud players such as Amazon AWS, Microsoft Azure, Google Cloud, and all major virtualization & container platforms. Deploy, automate and manage ABS servers in just a few clicks with a selection of virtual machine images with the most popular configurations.

- **Robust Site & Server Security**: Broad security levels across OS, network, and instances. Built into the Plesk hosting control panel core and enhanced through our class-leading security partners.

- **Compatible across all platforms and hyper-scale options**: You get full root access via SSH on every ABC-powered ABS and dedicated server options are available so you can install any third-party, open-source, or customized application you need.

- **Optimized for the Alliance Business Suite**: The Alliance Business Cloud helps customers to be more productive by allowing them to develop, debug, and monitor Alliance Business Suite instances and Alliance Business Cloud Apps locally, and deploy to production using powerful integration tools. Use the range of features and capabilities to quickly and efficiently create highly secure applications optimized for the cloud.

- **API and mobile features**: Alliance Business Cloud provides turn-key CORS support for RESTful API scenarios, and simplifies mobile app scenarios by enabling authentication, offline data sync, push notifications, and more.
 
## Limitations
- Alliance Bussiness Suite on Linux is not supported on Alliance Business Cloud. Please check Computeworks Hosting for an alternative solution.

- The Alliance Business Cloud shows only features that currently work for Windows apps. As features are enabled, they're activated on the portal.
- When deployed to built-in images, your code and content are allocated a storage volume for web content, backed by Azure Storage. The disk latency of this volume is higher and more variable than the latency of the container filesystem. Apps that require heavy read-only access to content files may benefit from the custom container option, which places files in the container filesystem instead of on the content volume.
