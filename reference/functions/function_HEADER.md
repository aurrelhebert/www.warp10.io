---
title: "HEADER"
layout: function
desc: "Set a header which will be returned with the HTTP response."
category: reference
categoryTree: ["reference","functions"]
---

The `HEADER` function sets a header which will be returned with the HTTP response.

The header must starts with `X-`

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'X-WarpScript-Header' 'value' HEADER
// Look at the HTTP response, X-WarpScript-Header header is set
</warp10-warpscript-widget>
{% endraw %}  