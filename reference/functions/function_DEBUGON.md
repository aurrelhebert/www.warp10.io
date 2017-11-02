---
title: "DEBUGON"
layout: function
desc: "Turns on stack debugging."
categoryTree: ["reference","functions"]
category: reference
---

Turns on stack debugging which returns the stack content in case of error. Stack debugging is off by default.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NOW
DUP
DEBUGON
FAIL
</warp10-warpscript-widget>
{% endraw %}    
