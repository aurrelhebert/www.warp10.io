---
title: "TIMINGS"
layout: function
desc: "Turns on timing collection."
category: reference
---

Use of the `TIMINGS` function triggers the collection of timing information for each line of the input script. The timing informations are stored in a list available via the [`ELAPSED`]({{ site.baseurl }}/reference/functions/function_ELAPSED) function.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">TIMINGS
NOW
DROP
ELAPSED
</warp10-warpscript-widget>
{% endraw %}    
