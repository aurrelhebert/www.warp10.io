---
title: "EVAL"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Evaluates the string on top of the stack"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","15-function_EVAL.html.md"]
category: "reference"
---
 

The `EVAL` function evaluates the statements contained in the string at the top of the stack as if they had been entered individually.
In the example the string '3 DROPN' will be evaluated wich call the function [`DROPN`]({{ site.baseurl }}/reference/functions/function_DROPN) with a parameter equals to 3. 

Stack:

    
    TOP: '3 DROPN'
    1:   'a'
    2:   'b'
    3:   'c'
    4:   'd'

WarpScript commands:
    
    EVAL

Stack:

    
    TOP: 'd'

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'d' 'c' 'b' 'a' 
'3 DROPN'
EVAL
</warp10-warpscript-widget>
{% endraw %}


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">'d' 'c' 'b' 'a' 
'3 DROPN'
EVAL
'd' == ASSERT 
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}       
