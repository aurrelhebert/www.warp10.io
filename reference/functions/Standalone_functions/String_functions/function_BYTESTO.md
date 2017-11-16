---
title: "BYTES->"
layout: function
desc: "Converts a bytes array into a string"
category: reference
categoryTree: ["reference","functions"]
signature: "bytesarray 'charset' BYTES-> 'string'"
---

Converts a bytes array into a string with given a charset and put the string on top of the stack.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// STACK SNAPSHOT WITH A BYTES ARRAY ON THE TOP
'S5WdRm0dRm0iQrFVS5W_76CoRa_iOm0tQrJVNM8_75ljQqhdQaRVOaxm' OPB64->
// STACK SNAPSHOT WITH A BYTES ARRAY ON THE TOP
'UTF-8' BYTES->
</warp10-warpscript-widget>
{% endraw %}    

