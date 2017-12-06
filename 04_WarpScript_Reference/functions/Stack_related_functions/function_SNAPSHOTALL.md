---
title: "SNAPSHOTALL"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts the content of the stack and current symbols into WarpScript code."
categoryTree: ["reference","functions"]
category: "reference"
---

The `SNAPSHOTALL` function converts the content of the stack and current symbols into WarpScript code in a manner similar to [SNAPSHOT]({{ site.baseurl}}/reference/functions/function_SNAPSHOT).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 'foo' NOW
'foo' 'bar' STORE
SNAPSHOTALL
</warp10-warpscript-widget>
{% endraw %}      
