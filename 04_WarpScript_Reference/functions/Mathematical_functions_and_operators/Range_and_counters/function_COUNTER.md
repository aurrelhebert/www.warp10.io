---
title: "COUNTER"
layout: function
categoryTree: ["reference","functions"]
desc: "Push a counter (AtomicLong) onto the stack."
category: reference
---

The `COUNTER` function pushes a counter (AtomicLong) initialized with the value 0 onto the stack. 

See [COUNTERVALUE]({{ site.baseurl }}/reference/functions/function_COUNTERVALUE) and [COUNTERDELTA]({{ site.baseurl }}/reference/functions/function_COUNTERDELTA) functions for counter manipulations.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Initialize a counter with the value 0
COUNTER
// Push onto the stack the current counter value (as a long)
COUNTERVALUE
</warp10-warpscript-widget>
{% endraw %}  