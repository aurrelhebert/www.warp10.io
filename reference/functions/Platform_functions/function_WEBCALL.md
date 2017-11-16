---
title: "WEBCALL"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Makes an outbound HTTP call."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Makes an outbound HTTP call. The function expects the following parameters on the stack:

      4: Valid write token
      3: Method (POST or GET)
      2: URL (supported schemes are http and https)
      1: Map of headers
    TOP: Request body

Note that the hosts which may be reached via `WEBCALL` might have been restricted through the use of the `webcall.host.patterns` Warp 10 configuration parameter.

The call to `WEBCALL` returns a UUID on the stack. The actual request is performed asynchronously, the UUID will appear in the `X-Warp10-WebCall` header or the header configured vi `http.header.webcall.uuid`.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'INSERT_TOKEN_HERE'
'GET'
'http://host:port/path'
{ 'X-Foo' 'Bar' }
'BODY'
WEBCALL
</warp10-warpscript-widget>
{% endraw %}

