---
title: "SNAPSHOTALLTOMARK"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts the content of the stack above a MARK and current symbols into WarpScript code."
categoryTree: ["reference","functions"]
category: "reference"
---

The `SNAPSHOTALLTOMARK` function converts the content of the stack and current symbols into WarpScript code in a manner similar to [SNAPSHOTTOMARK]({{ site.baseurl}}/reference/functions/function_SNAPSHOTTOMARK).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 MARK 'foo' NOW
'foo' 'bar' STORE
SNAPSHOTALL
</warp10-warpscript-widget>
{% endraw %}      
