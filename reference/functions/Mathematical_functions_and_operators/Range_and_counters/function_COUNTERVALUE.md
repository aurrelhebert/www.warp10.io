---
title: "COUNTERVALUE"
layout: function
desc: "Retrieve the value of a counter."
categoryTree: ["reference","functions"]
category: reference
---

The `COUNTERVALUE` function pushes the counter value onto the stack.

See [COUNTERDELTA]({{ site.baseurl }}/reference/functions/function_COUNTERDELTA) and [COUNTER]({{ site.baseurl }}/reference/functions/function_COUNTER) functions for counter manipulations.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Initialize a counter with the value 0
COUNTER
// Increment the counter
5 COUNTERDELTA
-6 COUNTERDELTA
// Push onto the stack the current counter value (as a long)
COUNTERVALUE
</warp10-warpscript-widget>
{% endraw %}  