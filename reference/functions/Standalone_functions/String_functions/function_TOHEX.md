---
title: "TOHEX"
layout: function
desc: "Converts a long to its 64 bits hexadecimal representaiton."
category: reference
---

Converts a long to its 64 bits hexadecimal representation.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42
TOHEX
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">-42 TOHEX
'ffffffffffffffd6' == ASSERT
</warp10-warpscript-widget>
{% endraw %}    
