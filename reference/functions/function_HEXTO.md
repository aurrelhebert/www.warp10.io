---
title: "HEX->"
layout: function
desc: "Decodes an hex encoded string."
category: reference
categoryTree: ["reference","functions"]
---

Decodes an hex encoded string. If the encoded content is not a valid UTF-8 representation, the resulting string will reflect that.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'6d616b6520697420736f' HEX->
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">
'6d616b6520697420736f' HEX->
'make it so' == ASSERT
</warp10-warpscript-widget>
{% endraw %}    
