---
title: "RESET"
layout: function
desc: "Reset the stack to a specific depth."
category: reference
---

The `RESET` function resets the stack to a specific depth.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Initialize stack with 3 strings
'depth 3'
'depth 2'
'depth 1'

// The stack depth == 3
// Reset at depth 2 
 2 RESET

</warp10-warpscript-widget>
{% endraw %}  