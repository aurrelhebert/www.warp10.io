---
title: "->HEX"
layout: function
desc: "Converts a string to the hexadecimal representation of its UTF-8 encoding."
category: reference
categoryTree: ["reference","functions"]
---

Converts a string to the hexadecimal representaiton of its UTF-8 encoding.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'Hello World!' ->HEX
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'café' ->HEX
'636166c3a9' == ASSERT
</warp10-warpscript-widget>
{% endraw %}    
