---
title: "ELAPSED"
layout: function
desc: "Pushes on the stack the collected timing informations."
category: reference
categoryTree: ["reference","functions"]
---

The `ELAPSED` function pushes onto the stack a list containing timing informations. The first element of the list is the timestamp at which the script was started (in ns). The other elements are the elapsed nanoseconds from the beginning of the script to the end of the execution of the associated script line.

Timing informations are only collected after a call to [`TIMINGS`]({{ site.baseurl }}/reference/functions/function_TIMINGS) (its line included) and before a call to [`NOTIMINGS`]({{ site.baseurl }}/reference/functions/function_NOTIMINGS) (its line excluded).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">TIMINGS
NOW
DROP
ELAPSED // Elapsed has timings for 4 elements and the start timestamp
</warp10-warpscript-widget>
{% endraw %}    
