---
title: "FROMHEX"
layout: function
desc: "Converts an hexadecimal representation into a long."
category: reference
categoryTree: ["reference","functions"]
---

Converts an hexadecimal representation into a long.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'40' FROMHEX
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'ffffffffffffffd6' FROMHEX
-42 == ASSERT
</warp10-warpscript-widget>
{% endraw %}    
