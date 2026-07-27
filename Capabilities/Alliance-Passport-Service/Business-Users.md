# Working with Business Users in the Alliance Business Suite

The Alliance Business Suite includes a powerful Identity and Access Management engine called Alliance Passport System ("APS"). The APS's main function is to provide fine-grained access management over ABS resources. Using APS, you can segregate duties within your business and grant only the amount of access to users that they need to perform their jobs.

Also, though the APS API is provided with every ABS instance, external applications can retrieve permissions for any given Business User.

## Understanding the difference between an Account Holder ("User") and a Business Profile Record ("BPR").

Account Holders are **Identity Users**, which means that an Account Holder is used to authenticate requests to the Alliance Business Platform, either from the Studio, a Portal, or any external application.

Meanwhile, Business Profile Records are **Authorization Users**, meaning that records of such type are **used to grant Security Roles/Permissions to Account Holders over a given Business Tenant**. 

This structure is extremely flexible, as it allows users to have a single Identity Account with separate access specifications over different Business Tenants hosted on the same Alliance Business Suite instance.

Account Holders are created when users (either internal users or external parties) create an account on a Web Portal. By default, Account Holders have no Business Profile Records, which means they can perform no direct actions over any Business Tenant present in the Alliance Business Suite instance.

Nevertheless, Account Holders have a limited set of configurable permissions over their owned data, such as those required for GDPR and other regulations around data privacy and ownership. These permissions are sufficient for users to perform actions such as querying their Cart, create and read Orders, change their password, update their profile, enable TOTP MFA, Comment on posts, Follow/Unfollow Business Tenants and/or other Account Holders, and more.

## Creating a Business Profile Record.

In order to create a new Business Profile Record, an Account Holder and the Business Tenant over which the Profile will be created should already exist on your Alliance Business Suite instance.

If the Account Holder does not exist, you can create it through the Studio and then send an Account Invitation to any CRM Individual or really, to any external user out there in the wild.

Once the Account Holder exists, login to the Studio using your Account Holder Credentials. this account should, at the very least, have the `studio_access`, `view_users`, `view_enrollments`,  and the `create_enrollments` permission over the selected Business Tenant to create the Profile Business Record scoped into it.

Once signed into your desired Business Tenant:

1. Head to your tenant's Administrator Dashboard 
2. Click Users 
3. View All 
4. Select the desired Account Holder 
5. Click on the {Business Name}'s Enrollment Tab  
6. Click on the "Create Enrollment on {Business Name}" button.

Once the Business Profile Record gets created, it will be created as a disabled record. This means that even when Account Holders should now be able to see the new Business Profile Record on its profile, they won't yet be able to act as the Business Tenant. 

By enabling, disabling an Account Holder's Business Profile Record over a certain Business Tenant, you will ensure that no matter the permissions granted to that user, he/she won't be able to perform any action other than viewing that Business Tenant's Public Profile. This feature is useful to restrict Account Holder Permissions over a Business Tenant in cases where access needs to be restricted, but Business Profile Records need to be preserved. (e.g: When Business Collaborators are on vacation, and over their return access should be restored)

## Granting Security Roles/Permissions to Business Profile Records

Granting Security Roles is a rather straightforward process once the Business Profile Record exists. To do so, acting as a Business Tenant, Head to a User's Profile on your Business Tenant's Admin Section and click on {Business Nane}'s Enrollment.

There, you will be able to create a Business Profile Record if does not exists for that particular user, and by checking/unchecking Roles and Permissions from their respective grids.

It is important to note that you will only be able to grant as much as the same level of permissions you're granted over the acting Business Tenant, and for that, you will need to have at the very least the following permissions (or a role that contains them):

- 1. To Grant/Revoke Roles:
    - "create_role_grants" 
    - "delete_role_grants" 

- 2. To Grant/Revoke Permissions:
    - "create_permission_grants" 
    - "delete_permission_grants" 










 




