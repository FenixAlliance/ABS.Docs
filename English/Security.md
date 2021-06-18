[[_TOC_]]


# Security Features


If you own an Alliance Business Suite-powered infrastructure or are considering using the Alliance Business Suite as your CMS/CRM/ERP (or any other), you may be concerned about potential Alliance Business Suite security issues. In this post, we’ll outline a few of the most common ABS security vulnerabilities, along with steps you can take to secure and protect your Alliance Business Suite instance.

At Fenix Alliance, we are committed to helping our customers meet their privacy and personal data requirements, as well as General Data Protection Regulation (GDPR). On this page, you will find information and resources to help you understand how the Alliance Business Suite supports protecting and enabling the privacy rights of individuals, and how we provide the information and tools that our customers need in order to define and support their specific obligations. You can read more about the Fenix Alliance commitment to security at the Fenix Alliance Trust Center.


## Is the Alliance Business Suite Secure?
The answer to the question “is the Alliance Business Suite secure?” is it depends. The Alliance Business Suite itself is very secure as long as security best practices are followed.


### Encryption at rest <a id="encryption-at-rest"></a>

All files sent to our applications are automatically encrypted with a 256-bit Advanced Encryption Standard \(AES\) cipher. SSE automatically encrypts data when writing it to Storage. When you read your files, our storage decrypts the data before returning it. This process incurs no additional charges and doesn't degrade performance. This feature can't be disabled.

### Encryption in transit <a id="encryption-in-transit"></a>

We keep your data secure by enabling _transport-level security_ between our applications and the client. We ALWAYS use _HTTPS_ to secure communication over the public internet. When you call the REST APIs to access objects in storage accounts or our databases, we enforce the use of HTTPS by requiring secure transfer, and connections that use HTTP will be refused and redirected.

### CORS support <a id="cors-support"></a>

We store several website asset types in Storage. These types include images and videos. To secure browser apps, we lock GET requests down to specific domains.

Our storage supports cross-domain access through **cross-origin resource sharing \(CORS\).** CORS uses HTTP headers so that a web application at one domain can access resources from a server at a different domain. By using CORS, our web apps ensure that tenants load only authorized content from our sources.

When you create a business application. you will be able to specify your domains in order for us to verify your domains and set CORS flags.

### Role-based access control <a id="role-based-access-control"></a>

To access data in an Alliance ID Tenant account, the client makes a request over HTTP or HTTPS. Every request to a secure resource must be authorized. The service ensures that the client has the permissions required to access the data.

Our applications support role-based access control \(RBAC\) for both resource management and data operations.



## White papers, security reports, penetration tests, and risk assessment tools
To find detailed information about privacy and personal data for the Alliance Business Suite applications and services, visit the Alliance Business Suite Website. This site provides white papers, FAQs, security reports, penetration tests, risk assessment tools, and other resources. In particular, the site provides sales/technical guidance about how you should consider enhancing your data protection capabilities and how you might want to think about compliance as a process that has four stages: discover, manage, protect, and report.

## Data subject requests
The General Data Protection Regulation (GDPR) is fundamentally about protecting and enabling the privacy rights of individuals. The General Data Protection Regulation (GDPR) took effect on 25 May 2018. For information about the challenges and opportunities that GDPR brings for organizations in the context of their business applications, whether there are any specific risks and measures to be taken in the GDPR context, and any potential impact on how business applications need to be used.

The GDPR grants individuals (or data subjects) certain rights in connection with the processing of their personal data. These rights include the right to correct inaccurate data, erase their data or restrict its processing, receive their data, and fulfill a request to transmit their data to another controller. The resources in this section will help Alliance Business Suite customers respond to data subject requests (DSRs).To find information about what the GDPR requires of controllers (you) and processors (Fenix Alliance) when you respond to DSRs, and how Fenix Alliance enables you to do so, see DSRs on the Service Trust Portal.

## Compliance Manager
**Alliance Business Suite - Compliance Manager** is a modular cloud service solution that is designed to help organizations meet complex compliance obligations like the GDPR. It does real-time risk assessment that reflects your compliance posture against data protection regulations when you use Fenix Alliance's cloud services. It also provides recommended actions and step-by-step guidance.

## HTTPS Enforcement in the Alliance Business Suite.

Although no API can prevent a client from sending sensitive data on the first request. the Alliance Business Platform (which serves as a middleware for incoming/outgoing requests, as a rule of thumb, is designed to make sure that: 
- HTTPS is required for all requests.
- All HTTP requests are redirected to HTTPS.

**Note:** 
The Alliance Business platform should not listen on HTTP and will close the connection with status code 400 (Bad Request) and not serve the request.

## Preventing Cross-Site Request Forgery (XSRF/CSRF) attacks.

Cross-site request forgery (also known as XSRF or CSRF) is an attack against web-hosted apps whereby a malicious web app can influence the interaction between a client browser and a web app that trusts that browser. These attacks are possible because web browsers send some types of authentication tokens automatically with every request to a website. This form of exploit is also known as a one-click attack or session riding because the attack takes advantage of the user's previously authenticated session.


An example of a CSRF attack:

A user signs into www.good-banking-site.com using forms authentication. The server authenticates the user and issues a response that includes an authentication cookie. The site is vulnerable to attack because it trusts any request that it receives with a valid authentication cookie.

The user visits a malicious site, www.bad-crook-site.com.

The malicious site, www.bad-crook-site.com, contains an HTML form similar to the following:

HTML

```html
<h1>Congratulations! You're a Winner!</h1>
<form action="https://your-abs-instance.com/api/v2/insecure-banking-module/wallet" method="post">
    <input type="hidden" name="Transaction" value="withdraw">
    <input type="hidden" name="Amount" value="1000000">
    <input type="submit" value="Click to collect your prize!">
</form>
```

Notice that the form's action posts to your Alliance Business Suite instance, not to the malicious site. This is the "cross-site" part of CSRF.

The user selects the submit button. The browser makes the request and automatically includes the authentication cookie for the requested domain, `your-abs-instance.com`.

Without CSFR protection, the request runs on the `your-abs-instance.com` server with the user's cookie authentication context and can perform any action that an authenticated user is allowed to perform.

In addition to the scenario where the user selects the button to submit the form, the malicious site could:

- Run a script that automatically submits the form.
- Send the form submission as an AJAX request.
- Hide the form using CSS.

These alternative scenarios don't require any action or input from the user other than initially visiting the malicious site.

Using HTTPS doesn't prevent a CSRF attacks. The malicious site can send an https://your-abs-instance.com/ request just as easily as it can send an insecure request.

Some attacks target endpoints that respond to GET requests, in which case an image tag can be used to perform the action. This form of attack is common on forum sites that permit images but block JavaScript. Apps that change state on GET requests, where variables or resources are altered, are vulnerable to malicious attacks. GET requests that change state are insecure. A best practice is to never change state on a GET request.

CSRF attacks are possible against web apps that use cookies for authentication because:

Browsers store cookies issued by a web app.
Stored cookies include session cookies for authenticated users.
Browsers send all of the cookies associated with a domain to the web app every request regardless of how the request to app was generated within the browser.
However, CSRF attacks aren't limited to exploiting cookies. For example, Basic and Digest authentication are also vulnerable. After a user signs in with Basic or Digest authentication, the browser automatically sends the credentials until the session† ends.

†In this context, session refers to the client-side session during which the user is authenticated. It's unrelated to server-side sessions or ASP.NET Core Session Middleware.

Users can guard against CSRF vulnerabilities by taking precautions:

- Sign off of web apps when finished using them.
- Clear browser cookies periodically.
- However, CSRF vulnerabilities are fundamentally a problem with the web app, not the end user.


```html
<form action="/api/v2/secure-banking-module/wallet" method="post">
    @Html.AntiForgeryToken()
</form>
```
In each of the preceding cases, ASP.NET Core adds a hidden form field similar to the following:

```html
<input name="__RequestVerificationToken" type="hidden" value="CfDJ8NrAkS ... s2-m9Yw">
```


### Multiple apps hosted at one domain
Shared hosting environments are vulnerable to session hijacking, login CSRF, and other attacks.

Although `portal1.my-abs-instance.net` and `portal2.my-abs-instance.net` are different hosts, there's an implicit trust relationship between hosts under the `*.my-abs-instance.net` domain. This implicit trust relationship **allows potentially untrusted hosts to affect each other's cookies** (the same-origin policies that govern AJAX requests don't necessarily apply to HTTP cookies).

Attacks that exploit trusted cookies between portals hosted on the same Alliance Business Suite instance can be prevented by not sharing domains. When each instance is hosted on its own domain, there is no implicit cookie trust relationship to exploit.

### Require antiforgery validation
`ValidateAntiForgeryToken` is an action filter that can be applied to individual actions, and controllers. Requests made to actions that have this filter applied are blocked unless the request includes a valid antiforgery token.

```csharp
[HttpPost]
[ValidateAntiForgeryToken]
public async Task<IActionResult> RemoveLogin(RemoveLoginViewModel account)
{
    ManageMessageId? message = ManageMessageId.Error;
    var user = await GetCurrentUserAsync();

    if (user != null)
    {
        var result = 
            await _userManager.RemoveLoginAsync(
                user, account.LoginProvider, account.ProviderKey);

        if (result.Succeeded)
        {
            await _signInManager.SignInAsync(user, isPersistent: false);
            message = ManageMessageId.RemoveLoginSuccess;
        }
    }

    return RedirectToAction(nameof(ManageLogins), new { Message = message });
}
```
### Refresh tokens after authentication
### Using JavaScript with AntiForgeryTokens

When you use JavaScript into Dynamic Pages, Components, Templates or any other kind of WebContent, you will be able to access the AntyForgeryToken in several ways. Here's one of them:


```javascript
function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) === ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) === 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

var csrfToken = getCookie("CSRF-TOKEN");

var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function () {
    if (xhttp.readyState === XMLHttpRequest.DONE) {
        if (xhttp.status === 204) {
            alert('Todo item is created successfully.');
        } else {
            alert('There was an error processing the AJAX request.');
        }
    }
};
xhttp.open('POST', '/api/items', true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.setRequestHeader("X-CSRF-TOKEN", csrfToken);
xhttp.send(JSON.stringify({ "name": "Learn C#" }));

```
