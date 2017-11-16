---
title: "TOUPPER"
layout: function
desc: "Converts the string on top of the stack to upper case."
category: reference
---

Converts the string on top of the stack to upper case.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'start yelling' TOUPPER
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'H4cKme' TOUPPER
'H4CKME' == ASSERT
</warp10-warpscript-widget>
{% endraw %}    
