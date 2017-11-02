---
title: "HEXTOB64"
layout: function
desc: "Decodes a hex encoded string and immediately re-encode it in base64."
category: reference
categoryTree: ["reference","functions"]
---

Decodes the hex encoded content on top of the stack and immediately re-encode it in base64. This enables you to convert encoded content which would not be valid UTF-8 encoding from hexadecimal to base64.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'010203'
HEXTOB64
</warp10-warpscript-widget>
{% endraw %}    
