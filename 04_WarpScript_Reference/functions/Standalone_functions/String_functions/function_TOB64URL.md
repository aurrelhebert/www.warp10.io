---
title: "->B64URL"
layout: function
desc: "Encodes a string in base64url."
category: reference
---

Encodes the string on top of the stack in [base64url](https://en.wikipedia.org/wiki/Base64#Variants_summary_table).

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'Hello, World!'
->B64URL
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'8fcf0fc0' HEX-> ->B64URL
'77-977-9D--_vQ==' == ASSERT
</warp10-warpscript-widget>
{% endraw %}
