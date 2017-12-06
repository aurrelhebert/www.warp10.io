---
title: "->DOUBLEBITS"
layout: function
desc: "Converts a double to a long value of the raw bits of its float representation."
category: reference
---

Converts a DOUBLE to a FLOAT then to a LONG value of the raw bits of its representation.

Only the lower 32 bits of the LONG value are significant.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42.0
->FLOATBITS
</warp10-warpscript-widget>
{% endraw %}    
