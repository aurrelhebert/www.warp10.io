---
title: "URLFETCH"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Retrieves the content of a URL."
categoryTree: ["reference","functions"]
category: "reference"
---
 
Retrieves the content of a URL or a list of URLs, using the HTTP `GET` method. This function requires the stack to be authenticated using `AUTHENTICATE`.

The function returns on the stack a list of results, each result being a list of response code, maps of header name to header values, and base64 encoded body.

The hosts which can be accessed are governed by the same patterns as those accessible via `WEBCALL`.

Exposing this function on a platform open to the outside world may cause some risks such as bouncing attacks. We recommend you disable it or redefine in in your `bootstrap` code.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// No example is available
</warp10-warpscript-widget>
{% endraw %}

