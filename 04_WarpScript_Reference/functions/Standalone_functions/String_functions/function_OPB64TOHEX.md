---
title: "OPB64TOHEX"
layout: function
desc: "Decodes an order preserving base64 encoded string and immediately re-encode it in hex."
category: reference
signature: "'encoded' OPB64TOHEX 'hex'"
---

The `OPB64TOHEX` function decodes the order preserving base64 string on top of the stack and immediately re-encode it in hex string.


OPB64 is a Base64 like encoding which preserves the lexicographic order of the original byte arrays in the encoded ones. This is needed so we can compare encoded byte arrays without having to first decode them.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'H5KgQ5wg74SjRalZ7F'
OPB64TOHEX
</warp10-warpscript-widget>
{% endraw %}    
