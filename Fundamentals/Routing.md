# Understanding Request Routing through the Alliance Business Suite

The Alliance Business Suite contains a powerful routing engine based on .NET's Routing  System.

At a high level, routing is responsible for matching incoming HTTP requests and dispatching those requests to the Alliance Business Suite's executable endpoints. Endpoints are the app's units of executable request-handling code. Endpoints are defined in the app and configured when the app starts. The endpoint matching process extracts values from the request's URL and provides those values for request processing. Using endpoint information from the app, routing is also able to generate URLs that map to endpoints.

The Alliance Business Suite's routing configurations abstract the complexities out of the routing process through several techniques depending on the execution context. This means that routing is as simple as providing a relative URL ("Slug") when creating a page.

In cases where customers might want to create a custom Module, they can expose custom endpoints while still taking advantage of the Routing Engine, meaning they can create and manage routing rules through the Alliance Business Studio and apply them to their custom endpoints.


## Rate limiting

The Alliance Business Platform contains a rate-limiting solution designed to control the rate of requests that clients can make to a Web API or MVC app based on IP address or client ID. Through the Alliance Business Studio, you can configure the rate-limiting middleware and set multiple limits for different scenarios like allowing an IP or Client to make a maximum number of calls in a time interval. You can define these limits to address all requests made to an API or you can scope the limits to each executable API URL or HTTP verb and path.

