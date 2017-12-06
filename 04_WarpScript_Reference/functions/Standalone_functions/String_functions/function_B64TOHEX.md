---
title: "B64TOHEX"
layout: function
desc: "Decodes a base64 encoded string and immediately re-encode it in hex."
categoryTree: ["reference","functions"]
category: reference
---

Decodes the base64 content on top of the stack and immediately re-encode it in hexadecimal. This enables you to convert encoded content which would not be valid UTF-8 encoding from base64 to hexadecimal. As the string are URL encoded, the symbol `+` have to be replaced by `%2B`, otherwise a `space` will replace the `+` in the string.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'%2B/ABCD'
B64TOHEX
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'%2B/ABCD' B64TOHEX
'fbf00108' == ASSERT
</warp10-warpscript-widget>
{% endraw %}
