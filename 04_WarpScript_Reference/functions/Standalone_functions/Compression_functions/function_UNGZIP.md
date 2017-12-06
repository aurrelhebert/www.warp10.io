---
title: "UNGZIP"
layout: function
desc: "Decompresses a compressed byte array."
category: reference
signature: "'bytesarray' UNGZIP 'bytesarray'"
---

Decompresses a compressed byte array with the [gzip] algorithm and pushes back the decompressed data onto the stack.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
//  STACK SNAPSHOT 
// BYTE ARRAY WITH A Gzip CONTENT ON THE TOP
'6sg7..........hAAPdJmBbEHsRFdMb8yQZ4GPb4lPZd1gJ_GO_tuF.Gdb4Y7V....' OPB64->
//  STACK SNAPSHOT 
UNGZIP
// CONVERT IT BACK INTO STRING
'UTF-8' BYTES->
</warp10-warpscript-widget>
{% endraw %}    