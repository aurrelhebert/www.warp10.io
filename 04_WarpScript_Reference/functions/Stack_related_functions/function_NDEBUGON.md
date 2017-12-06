---
title: "NDEBUGON"
layout: function
desc: "Turns on stack debugging, specifying the number of stack levels to return in case of error."
category: reference
signature: "'string' ->B64 'encoded'"
---

Turns on stack debugging to return up to N stack levels in case of error. Stack debugging is off by default.

This function expects a number of levels on top of the stack.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NOW
PI
1 NDEBUGON
FAIL
</warp10-warpscript-widget>
{% endraw %}    
