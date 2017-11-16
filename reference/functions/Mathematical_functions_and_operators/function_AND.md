---
title: "AND"
layout: function
isPage: "true"
link: "/warpscript/functions"
desc: "This is synonymous for &&."
categoryTree: ["reference","functions"]
category: reference
---

The `AND` operator is a synonymous for [`&&`]({{ site.baseurl }}/reference/functions/function_COND_AND). It consumes two parameters *p<sub>1</sub>* and *p<sub>2</sub>* from the top of the stack and pushes onto the stack *true* if both *p<sub>1</sub> and p<sub>2</sub>* are true, else it pushes *false*.

The two parameters must be BOOLEAN.


## Example ##

WarpScript commands:

    true true AND 
    false true AND

Stack: 

    TOP:  false
    1:    true

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">true true AND 
false true AND
</warp10-warpscript-widget>
{% endraw %}     
