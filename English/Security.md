# Security Features

### Encryption at rest <a id="encryption-at-rest"></a>

All files sent to our applications are automatically encrypted with a 256-bit Advanced Encryption Standard \(AES\) cipher. SSE automatically encrypts data when writing it to Storage. When you read your files, our storage decrypts the data before returning it. This process incurs no additional charges and doesn't degrade performance. This feature can't be disabled.

### Encryption in transit <a id="encryption-in-transit"></a>

We keep your data secure by enabling _transport-level security_ between our applications and the client. We ALWAYS use _HTTPS_ to secure communication over the public internet. When you call the REST APIs to access objects in storage accounts or our databases, we enforce the use of HTTPS by requiring secure transfer and connections that use HTTP will be refused and redirected.

### CORS support <a id="cors-support"></a>

We store several website asset types in Storage. These types include images and videos. To secure browser apps, we lock GET requests down to specific domains.

Our storage supports cross-domain access through **cross-origin resource sharing \(CORS\).** CORS uses HTTP headers so that a web application at one domain can access resources from a server at a different domain. By using CORS, our web apps ensure that tenants load only authorized content from our sources.

When you create a business application. you will be able to specify your domains in order for us to verify your domains and set CORS flags.

### Role-based access control <a id="role-based-access-control"></a>

To access data in an Alliance ID Tenant account, the client makes a request over HTTP or HTTPS. Every request to a secure resource must be authorized. The service ensures that the client has the permissions required to access the data.

Our applications support role-based access control \(RBAC\) for both resource management and data operations.

