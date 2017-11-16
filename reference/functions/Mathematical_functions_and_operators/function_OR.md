---
title: "OR"
layout: function
desc: "Do a boolean OR between booleans on the stack."
isPage: "true"
link: "/warpscript/functions"
categoryTree: ["reference","functions"]
category: "reference"
---

The `OR` operator is a synonymous for [`||`]({{ site.baseurl }}/reference/functions/function_COND_OR). It consumes two parameters *p<sub>1</sub>* and *p<sub>2</sub>* from the top of the stack and pushes onto the stack *true* if  *p<sub>1</sub> or p<sub>2</sub>* is true, else it pushes *false*.

The two parameters must be BOOLEAN.


## Example ##

WarpScript commands:

    true true OR
    false true OR

Stack: 

    TOP:  true
    1:    true

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">true true OR 
false true OR
</warp10-warpscript-widget>
{% endraw %}    
