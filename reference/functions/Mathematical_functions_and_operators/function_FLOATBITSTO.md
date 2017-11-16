---
title: "FLOATBITS->"
layout: function
desc: "Converts the long on top of the stack to a double by considering the long value as the raw bits of a float."
category: reference
categoryTree: ["reference","functions"]
---

Converts the LONG on top of the stack to a DOUBLE by considering the 32 lower bits of the LONG value as the raw bits of a FLOAT.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1109917696
FLOATBITS->
</warp10-warpscript-widget>
{% endraw %}    
