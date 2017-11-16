---
title: "TOLOWER"
layout: function
desc: "Converts the string on top of the stack to lower case."
category: reference
---

Converts the string on top of the stack to lower case.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'STOP SHOUTING' TOLOWER
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'H4cKme' TOLOWER
'h4ckme' == ASSERT
</warp10-warpscript-widget>
{% endraw %}    
