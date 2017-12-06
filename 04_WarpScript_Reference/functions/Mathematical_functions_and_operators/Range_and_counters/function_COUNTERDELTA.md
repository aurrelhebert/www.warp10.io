---
title: "COUNTERDELTA"
layout: function
desc: "Increment a counter."
categoryTree: ["reference","functions"]
category: reference
---

The `COUNTERDELTA` function increment a counter and push it back onto the stack.

See [COUNTERVALUE]({{ site.baseurl }}/reference/functions/function_COUNTERVALUE) and [COUNTER]({{ site.baseurl }}/reference/functions/function_COUNTER) functions for counter manipulations.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Initialize a counter with the value 0
COUNTER
// Increment the counter
5 COUNTERDELTA
// Push onto the stack the current counter value (as a long)
COUNTERVALUE
</warp10-warpscript-widget>
{% endraw %}  