---
title: "GZIP"
layout: function
desc: "Compresses a byte array or String"
category: reference
signature: "'string' or 'bytesarray' GZIP 'bytesarray'"
categoryTree: ["reference","functions"]
---

Compresses a byte array or String with [Gzip](https://en.wikipedia.org/wiki/Gzip) algorithm and pushes back the compressed data into a bytes array onto the stack.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'Very long long uncompressed string'
GZIP
// byte array content is not converted into JSON
// converted into hex string for the example
->HEX
</warp10-warpscript-widget>
{% endraw %}    