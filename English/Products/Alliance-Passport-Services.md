---
description: >-
  Welcome to the open-source documentation on the Alliance Passport Services Layer.
  Please review this README file to understand how you can get the most out of your Account Holder Credentials.
---

## How to get started?

The Alliance Business Suite enables developers and non-developers alike to easily configure and manage security. The Alliance Passport Services Library contains features for managing authentication, authorization, data protection, HTTPS enforcement, app secrets, XSRF/CSRF prevention, and CORS management. These security features allow you to build robust yet secure Alliance Business Suite apps.

## Alliance Business Suite security features

The Alliance Business Suite provides many tools and libraries to secure your apps including built-in identity providers, but you can use third-party identity services such as Facebook, Twitter, and LinkedIn. With the Alliance Business Suite, you can easily manage app secrets, which are a way to store and use confidential information without having to expose it in the code.

## Authentication vs. Authorization
Authentication is a process in which a user provides credentials that are then compared to those stored in an operating system, database, app, or resource. If they match, users authenticate successfully, and can then perform actions that they're authorized for, during an authorization process. The authorization refers to the process that determines what a user is allowed to do.

Another way to think of authentication is to consider it as a way to enter a space, such as a server, database, app, or resource, while authorization is which actions the user can perform to which objects inside that space (server, database, or app).

## Understanding how APS works
Before you create users, you should understand how APS+IAM works. 

**Alliance Passport Services** (commonly known as "**APS**") is an Identity Framework that provides the infrastructure necessary to control authentication and authorization for the Alliance Business Suite. 

The **Identity and Access Management** Module ("**IAM**") is an extension built on top of the Alliance Passport Services Framework to allow users and applications to connect to certain Alliance Business Suite instances.

The IAM infrastructure includes the following elements:


## Common Terms
Learn more about APS + IAM terms.

**Resources**
The AccountHolder, SecurityGroup, SecurityRole, BusinessPermission, and IdentityProvider objects are stored in ABM. As with other ABM entities, you can add, edit, and remove resources from IAM.

**Identities**
The IAM resource objects are used to identify and group. You can attach a SecurityRole or a BusinessPermission to an IAM identity. These include BusinessProfileRecords, SecurityGroups, and SecurityRoles.

**Entities**
The IAM resource objects that APS uses for authentication. These include AccountHolders, federated users, and assumed IAM roles.

**Holders**
A person or application that uses the ABS Account Holder entity, like the root Holder, an IAM user, or an IAM Application to sign in and make requests to the Alliance Business Platform's APIs.

