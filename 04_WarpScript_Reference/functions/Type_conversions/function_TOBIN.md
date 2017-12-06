---
title: "TOBIN"
layout: function
desc: "Converts a long to its binary representation."
category: reference
---

Converts the long on top of the stack to its 64 bits binary representation.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42
TOBIN
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">-42 TOBIN
'1111111111111111111111111111111111111111111111111111111111010110' == ASSERT
</warp10-warpscript-widget>
{% endraw %}    
