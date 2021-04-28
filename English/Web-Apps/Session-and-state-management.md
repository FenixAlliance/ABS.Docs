# Session and state management in the Alliance Business Suite

HTTP is a stateless protocol. By default, HTTP requests are independent messages that don't retain user values. This article describes several approaches to preserve user data between requests.

## State management

State for the Alliance Business Suite can be stored using several approaches. Each approach is described later in this topic.

| Storage approach | Storage mechanism |
| ---------------- | ----------------- |
| [Cookies](#cookies) | HTTP cookies. May include data stored using server-side app code. |
| [Session state](#session-state) | HTTP cookies and server-side app code |
| [TempData](#tempdata) | HTTP cookies or session state |
| [Query strings](#query-strings) | HTTP query strings |
| [Hidden fields](#hidden-fields) | HTTP form fields |
| [HttpContext.Items](#httpcontextitems) | Server-side app code |
| [Cache](#cache) | Server-side app code |


## Cookies
Cookies store data across requests. Because cookies are sent with every request, their size should be kept to a minimum. Ideally, only an identifier should be stored in a cookie with the data stored by the ABS Instance. Most browsers restrict cookie size to 4096 bytes. Only a limited number of cookies are available for each domain.

Because cookies are subject to tampering, they must be validated by the app. Cookies can be deleted by users and expire on clients. However, cookies are generally the most durable form of data persistence on the client.

Cookies are often used for personalization, where content is customized for a known user. The user is only identified and not authenticated in most cases. The cookie can store the user's name, account name, or unique user ID such as a GUID. The cookie can be used to access the user's personalized settings, such as their preferred website background color.

See the European Union General Data Protection Regulations (GDPR) when issuing cookies and dealing with privacy concerns. For more information, see General Data Protection Regulation (GDPR) support in ASP.NET Core.

## Session state
Session state is an Alliance Business Suite Instance scenario for the storage of user data while the user browses a web app. Session state uses a store maintained by the app to persist data across requests from a client. The session data is backed by a cache and considered ephemeral data. The site should continue to function without the session data. Critical application data should be stored in the Account Holder database entity and cached in session only as a performance optimization.

The session isn't supported in SignalR functionalities because a SignalR Hub may execute independently of an HTTP context. For example, this can occur when a long polling request is held open by a hub beyond the lifetime of the request's HTTP context.

The Alliance Business Suite maintains the session state by providing a cookie to the client that contains a session ID. The cookie session ID:

- Is sent to the app with each request.
- Is used by the app to fetch the session data.

Session state exhibits the following behaviors:

- The session cookie is specific to the browser. Sessions aren't shared across browsers.
- Session cookies are deleted when the browser session ends.
- If a cookie is received for an expired session, a new session is created that uses the same session cookie.
- Empty sessions aren't retained. The session must have at least one value set to persist the session across requests. When a session isn't retained, a new session ID is generated for each new request.
- The app retains a session for a limited time after the last request. The app either sets the session timeout or uses the default value of 20 minutes. Session state is ideal for storing user data:
- That's specific to a particular session.
- Where the data doesn't require permanent storage across sessions.
- Session data is deleted either when the ISession.Clear implementation is called or when the session expires.
- There's no default mechanism to inform app code that a client browser has been closed or when the session cookie is deleted or expired on the client.
- Session state cookies aren't marked essential by default. Session state isn't functional unless tracking is permitted by the site visitor. For more information, see [General Data Protection Regulation (GDPR) support across the Alliance Business Suite]()

Don't store sensitive data in session state. The user might not close the browser and clear the session cookie. Some browsers maintain valid session cookies across browser windows. A session might not be restricted to a single user. The next user might continue to browse the app with the same session cookie.

The in-memory cache provider stores session data in the memory of the server where the app resides. In a server farm scenario:

Use sticky sessions to tie each session to a specific app instance on an individual server. Azure App Service uses Application Request Routing (ARR) to enforce sticky sessions by default. However, sticky sessions can affect scalability and complicate web app updates. A better approach is to configure the Alliance Business Suite to a Redis or SQL Server by enabling distributed cache, which doesn't require sticky sessions. For more information, see Distributed caching in the Alliance Business Suite.

The session cookie is encrypted via IDataProtector. Data Protection must be properly configured to read session cookies on each machine. For more information, see Alliance Business Suite Data Protection and Key storage providers.

**Warning**

Don't store sensitive data in session state. The user might not close the browser and clear the session cookie. Some browsers maintain valid session cookies across browser windows. A session might not be restricted to a single user. The next user might continue to browse the app with the same session cookie.

The in-memory cache provider stores session data in the memory of the server where the app resides. In a server farm scenario:

Use sticky sessions to tie each session to a specific app instance on an individual server. Alliance Business Cloud uses Application Request Routing (ARR) to enforce sticky sessions by default. However, sticky sessions can affect scalability and complicate web app updates. A better approach is to enable Redis or SQL Server distributed cache, which doesn't require sticky sessions. For more information, see Distributed caching in the Alliance Business Suite.

## Configure session state

To configure session state you'll need to visit your portal's configuration dashboard. The Alliance Business Suite handles the configuration required to add session management through the in-memory session provider with a default in-memory implementation of a Distributed Cache.

You can set the timeout in both development and production environments to simplify testing.

- `HttpContext.Session` is available after session state is configured.
- `HttpContext.Session` can't be accessed before UseSession has been called.

A new session with a new session cookie can't be created after the Alliance Business Suite has begun writing to the response stream. The exception is recorded in the web server log and not displayed in the browser.


## Load session state asynchronously

The default session provider in the Alliance Business Suite loads session records from the underlying IDistributedCache backing store asynchronously only if the `ISession.LoadAsync` method is explicitly called before the TryGetValue, Set, or Remove methods. If LoadAsync isn't called first, the underlying session record is loaded synchronously, which can incur a performance penalty at scale.

To have apps enforce this pattern, wrap the DistributedSessionStore and DistributedSession implementations with versions that throw an exception if the LoadAsync method isn't called before TryGetValue, Set, or Remove. Register the wrapped versions in the services container.

## Session options
To override session defaults, visit your Portal Administration Dashboard.

## HttpContext.Items
The `HttpContext.Items` collection is used to store data while processing a single request. The collection's contents are discarded after a request is processed. The Items collection is often used to allow components or middleware to communicate when they operate at different points in time during a request and have no direct way to pass parameters.

## Cache
Caching is an efficient way to store and retrieve data. The app can control the lifetime of cached items. For more information, see Response caching in the Alliance Business Suite.

Cached data isn't associated with a specific request, user, or session. Do not cache user-specific data that may be retrieved by other user requests.

To cache application-wide data, see Cache in-memory in the Alliance Business Suite.