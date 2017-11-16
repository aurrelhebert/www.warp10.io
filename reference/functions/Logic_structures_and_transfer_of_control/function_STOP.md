---
title: "STOP"
layout: function
desc: "Immediately stop executing WarpScript."
category: reference
signature: "'string' ->B64 'encoded'"
---

Stops the WarpScript execution immediately and return.

This function is useful when debugging WarpScript code as it allows you to interrupt your code at specific points of the execution.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">NOW
STOP
PI
</warp10-warpscript-widget>
{% endraw %}    
