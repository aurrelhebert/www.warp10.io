---
title: "NOTIMINGS"
layout: function
desc: "Turns off timing collection."
category: reference
---

Use of the `NOTIMINGS` function disables the collection of timing information for each line of the input script. Use [`TIMINGS`]({{ site.baseurl }}/reference/functions/function_TIMINGS) to enable it again.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">TIMINGS
NOW
NOTIMINGS
DROP
// Elapsed will not show timing information for 'DROP'
ELAPSED
</warp10-warpscript-widget>
{% endraw %}    
