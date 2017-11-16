---
title: "->OPB64"
layout: function
desc: "Encodes a string in order preserving base64."
category: reference
signature: "'string' ->OPB64 'encoded'"
---

Encodes the string on top of the stack in a 'Order Preserving Base64'.


OPB64 is a Base64 like encoding which preserves the lexicographic order of the original byte arrays in the encoded ones. This is needed so we can compare encoded byte arrays without having to first decode them.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'Hello, Small Small World!'
->OPB64

'Hello, World!'
->OPB64

// the string order is respected
</warp10-warpscript-widget>
{% endraw %}    
