---
title: "||"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Computes the conditional OR of the two arguments"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9250-function_COND_OR.html.md"]
category: "reference"
---
 

The `||` operator consumes two parameters *p<sub>1</sub>* and *p<sub>2</sub>* from the top of the stack 
and pushes onto the stack *true* if  *p<sub>1</sub> || p<sub>2</sub>*, else it pushes *false*.

The two parameters must be BOOLEAN.


## Example ##

WarpScript commands:

    true true || 
    false true ||

Stack: 

    TOP:  true
    1:    true

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">true true || 
false true ||
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">true true || 
true == ASSERT
false true ||
true == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
