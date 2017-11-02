---
title: "HEXTOBIN"
layout: function
desc: "Decodes a hex encoded string and immediately re-encode it in binary."
category: reference
categoryTree: ["reference","functions"]
---

Decodes the hex encoded content on top of the stack and immediately re-encode it in binary. This enables you to convert encoded content which would not be valid UTF-8 encoding from hexadecimal to binary.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'010203'
HEXTOBIN
</warp10-warpscript-widget>
{% endraw %}    
