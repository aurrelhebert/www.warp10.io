---
title: "B64->"
layout: function
desc: "Decodes a base64 encoded string."
category: reference
categoryTree: ["reference","functions"]
signature: "'string' ->B64 'encoded'"
---

Decodes the base64 content on top of the stack.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'bGl2ZSBsb25nIGFuZCBwcm9zcGVy'
B64->
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'dGhvc2UgYXJlIG5vdCB0aGUgZW5jb2RpbmdzIHlvdSBhcmUgbG9va2luZyBmb3I='
B64->
'those are not the encodings you are looking for' == ASSERT
</warp10-warpscript-widget>
{% endraw %}
