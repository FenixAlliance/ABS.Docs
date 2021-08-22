# Understanding the Alliance Business Suite dependency tree

The Alliance Business Suite is designed as a set of Application Layers dependant upon their service predecessor. Each Layer constitutes a [Component](/Components.md) for the Alliance Business Suite. 

Components can be provisioned as Standalone Applications or used and stand-alone libraries. This means that it is possible to bring the Alliance Business Platform (`FenixAlliance.ABP.*`) into a new/existing application without having to include any dependency from the Alliance Business Studio (`FenixAlliance.ABS.*`). The same is true for the Alliance Business Model (`FenixAlliance.ABM.*`), which can be included without any reference to the Alliance Business Platform namespace (`FenixAlliance.ABP.*`).

Components rely on their Service Predecessor through abstractions, allowing customers to override almost every functionality through custom implementations.


Note: Because other services on the Alliance Business Suite instance can rely on default implementations performing some work, it is imperative for customers that bring their own implementations to make sure the implementations follow the required criteria.


![DependencyTree.1.2.0.jpg](/.attachments/DependencyTree.1.2.0-3235684e-1b84-410b-8cae-f6b01f809c4e.jpg)
