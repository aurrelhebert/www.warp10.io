---
title: "BIN->"
layout: function
desc: "Decode a String in binary."
categoryTree: ["reference","functions"]
category: reference
---

The `->BIN` function decode a binary string into a bytes array.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
// "42" binary encoded
'0011010000110010'
BIN-> 
// bytes array are not displayable, convert it into String
'UTF-8' BYTES->
</warp10-warpscript-widget>
{% endraw %}