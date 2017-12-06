---
title: "->B64"
layout: function
desc: "Encodes a string in base64."
category: reference
signature: "'string' ->B64 'encoded'"
---

Encodes the string on top of the stack in [base64](https://en.wikipedia.org/wiki/Base64).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'Hello, World!'
->B64
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'8fcf0fc0' HEX-> ->B64
'77%2B977%2B9D%2B%2B/vQ==' == ASSERT
</warp10-warpscript-widget>
{% endraw %}
