# Logging across the Alliance Business Suite

The Alliance Business Suite contains a powerful logging engine based on Serilog, a popular .NET library that provides diagnostic logging that's built with powerful structured event data in mind.

``` cs
using Serilog;

var position = new { Latitude = 25, Longitude = 134 };
var elapsedMs = 34;

log.Information("Processed {@Position} in {Elapsed:000} ms.", position, elapsedMs);

```

This example records two properties, Position and Elapsed along with the log event. The properties captured in the example, in JSON format, would appear like:

``` js
{"Position": {"Latitude": 25, "Longitude": 134}, "Elapsed": 34}
```

The @ operator in front of Position tells Serilog to serialize the object passed in, rather than convert it using ToString().

The :000 segment following Elapsed is a standard .NET format string that affects how the property is rendered. The console sink included with Serilog will display the above message as:
```
09:14:22 [Information] Processed { Latitude: 25, Longitude: 134 } in 034 ms.
```