---
title: "STACKTOLIST"
layout: function
desc: "Convert the whole stack into a list and push this list on the top of the stack."
category: reference
---

The `STACKTOLIST` converts the whole stack into a list and push this list on the top of the stack.


## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// Initialize stack with 3 strings
'string 3'
'string 2'
'string 1'

// Convert the stack into a list
STACKTOLIST
</warp10-warpscript-widget>
{% endraw %}  