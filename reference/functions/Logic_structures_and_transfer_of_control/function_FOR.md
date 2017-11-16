---
title: "FOR"
layout: "function"
isPage: "true"
link: "/warpscript/function_FOR"
desc: "Implement a for loop"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","30-function_FOR.html.md"]
category: "reference"
---


The `FOR` function implements a *for* loop. 
It takes three arguments from the stack : the initial and the final values of the loop index 
and a [macro]({{ site.baseurl}}/reference/functions/macros) to be executed at each iteration.

For each iteration the loop index is put on top of the stack, and the exec macro is then called.

## Example ##

WarpScript commands:

    // Macro that squares the value on the top of the stack
    <% 2 **  %>
    'SQUARE' STORE


    // FOR from i=1 to i=10 generate i^2
    1 10 $SQUARE FOR


Stack:

    TOP:  100
    1:    81
    2:    64
    3:    49
    4:    36
    5:    25
    6:    16
    7:    9
    8:    4
    9:    1

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Macro that squares the value on the top of the stack
<% 2 **  %>
'SQUARE' STORE
// FOR from i=1 to i=10 generate i^2
1 10 $SQUARE FOR
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">// Macro that squares the value on the top of the stack
<% 2 **  %>
'SQUARE' STORE
// FOR from i=1 to i=10 generate i^2
1 10 $SQUARE FOR
100 == ASSERT     81 == ASSERT      64 == ASSERT
49 == ASSERT      36 == ASSERT      25 == ASSERT
16 == ASSERT      9 == ASSERT       4 == ASSERT
1 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}            
