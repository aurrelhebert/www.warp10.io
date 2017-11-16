---
title: "->BYTES"
layout: function
desc: "Converts a string into its bytes given a charset"
category: reference
signature: "'string' 'charset' ->BYTES bytesarray"
---

Converts a string into its bytes given a charset and put the string on top of the stack.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'this is not the string you are looking for'
'UTF-8' ->BYTES
// bytes array are not materialized by default in json
// it will produce [null] on the top on the stack
</warp10-warpscript-widget>
{% endraw %}    

