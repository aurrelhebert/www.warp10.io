---
title: "BINTOHEX"
layout: function
desc: "Decodes a binary encoded string and immediately re-encode it in hex."
categoryTree: ["reference","functions"]
category: reference
---

Decodes the binary content on top of the stack and immediately re-encode it in hexadecimal. This enables you to convert encoded content which would not be valid UTF-8 encoding from binary to hexadecimal.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'01010101'
BINTOHEX
</warp10-warpscript-widget>
{% endraw %}    
