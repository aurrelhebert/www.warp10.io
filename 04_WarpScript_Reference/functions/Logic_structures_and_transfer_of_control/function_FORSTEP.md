---
title: "FORSTEP"
layout: "function"
isPage: "true"
link: "/warpscript/function_FORSTEP"
desc: "Implement a for loop with an index step"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","30-function_FORSTEP.html.md"]
category: "reference"
---


The `FORSTEP` function implements *for* loop with an index step. 
It takes for arguments from the stack : the initial and the final values of the loop index,
a [macro]({{ site.baseurl}}/reference/functions/macros) step to evaluate after each iteration and an other one to be executed at each iteration.

For each iteration the loop index is put on top of the stack, and the exec macro is then called.

## Example ##

WarpScript commands:

    // Macro that squares the value on the top of the stack
    <% 2 **  %>
    'SQUARE' STORE
    
    // Macro step, increasing index by two
    <% 2 + %> 
    'STEP' STORE

    // FOR from i=0 to i=20 with a step of 2generate i^2
    0 20 $STEP $SQUARE FORSTEP


Stack:

    TOP:  400
    1:    324
    2:    256
    3:    196
    4:    144
    5:    100
    6:    64
    7:    36
    8:    16
    9:    4
    10:   0

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Macro that squares the value on the top of the stack
<% 2 **  %>
'SQUARE' STORE
// Macro step, increasing index by two
<% 2 + %> 
'STEP' STORE
// FOR from i=0 to i=20 with a step of 2generate i^2
0 20 $STEP $SQUARE FORSTEP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Macro that squares the value on the top of the stack
<% 2 **  %>
'SQUARE' STORE
// Macro step, increasing index by two
<% 2 + %> 
'STEP' STORE
// FOR from i=0 to i=20 with a step of 2generate i^2
0 20 $STEP $SQUARE FORSTEP
400 == ASSERT     324 == ASSERT     256 == ASSERT
196 == ASSERT     144 == ASSERT     100 == ASSERT
64 == ASSERT      36 == ASSERT       16 == ASSERT
4 == ASSERT       0 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}            
