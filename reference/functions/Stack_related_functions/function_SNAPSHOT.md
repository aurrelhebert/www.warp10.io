---
title: "SNAPSHOT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts the content of the stack into WarpScript code."
categoryTree: ["reference","functions"]
category: "reference"
---

The `SNAPSHOT` function converts the content of the stack into WarpScript code which will push onto the stack the same values as those which were on the stack before the call to `SNAPSHOT`. This function is handy to serialize stack content to pass it to a third party or store it into a macro.

Be aware that some types may not be serializable, if one such type is encountered, a STRING reading `UNSUPPORTED:class xxx` will be emitted instead.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 'foo' NOW
SNAPSHOT
</warp10-warpscript-widget>
{% endraw %}      
