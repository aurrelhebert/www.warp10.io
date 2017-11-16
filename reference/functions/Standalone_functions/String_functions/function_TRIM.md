---
title: "TRIM"
layout: function
desc: "Trims whitespaces from both ends of the string on top of the stack."
category: reference
---

Trims whitespaces from both ends of the string on top of the stack.

## Example ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">' <- remove them -> ' TRIM
</warp10-warpscript-widget>
{% endraw %}    

## Unit Test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'  oops  ' TRIM
'oops' == ASSERT
</warp10-warpscript-widget>
{% endraw %}    
