---
title: "OBP64->"
layout: function
desc: "Decodes an order preserving base64 encoded string."
category: reference
signature: "'encoded' OPB64-> 'bytesarray'"
---

Decodes the order preserving base64 content on top of the stack.


OPB64 is a Base64 like encoding which preserves the lexicographic order of the original byte arrays in the encoded ones. This is needed so we can compare encoded byte arrays without having to first decode them.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'H5KgQ5wg74SjRalZ7F'
OPB64->
// Put a bytes array on the top of the stack
// bytes array -> string conversion
'UTF-8' BYTES->
</warp10-warpscript-widget>
{% endraw %}    

