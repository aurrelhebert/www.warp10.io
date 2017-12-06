---
title: "B64URL->"
layout: function
desc: "Decodes a base64url encoded string."
categoryTree: ["reference","functions"]
category: reference
---

Decodes the base64url content on top of the stack.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'bGl2ZSBsb25nIGFuZCBwcm9zcGVy'
B64URL->
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'dGhvc2UgYXJlIG5vdCB0aGUgZW5jb2RpbmdzIHlvdSBhcmUgbG9va2luZyBmb3I='
B64URL->
'those are not the encodings you are looking for' == ASSERT
</warp10-warpscript-widget>
{% endraw %}
