---
title: "SNAPSHOTTOMARK"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Converts part of the stack into WarpScript code."
categoryTree: ["reference","functions"]
category: "reference"
---

The `SNAPSHOTTOMARK` function acts like [SNAPSHOT]({{ site.baseurl}}/reference/functions/function_SNAPSHOT) and converts the content of the stack above a [MARK]({{ site.baseurl}}/reference/functions/function_MARK) into WarpScript code which will push onto the stack the same values as those which were above the mark before the call to the function.

Note that the `MARK` is included in the result of `SNAPSHOTTOMARK`.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 MARK 'foo' NOW
SNAPSHOTTOMARK
</warp10-warpscript-widget>
{% endraw %}      
