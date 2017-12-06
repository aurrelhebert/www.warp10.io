---
title: "OPS"
layout: function
desc: "Pushes onto the stack the current number of operations which were performed by the WarpScript code execution."
category: "reference"
---

Pushes onto the stack the current number of operations which were performed by the WarpScript code execution.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">OPS
1 1000 <% DROP %> FOR
OPS
</warp10-warpscript-widget>
{% endraw %}    
