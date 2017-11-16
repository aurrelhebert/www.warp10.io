---
title: "UNTIL"
layout: "function"
isPage: "true"
link: "/warpscript/function_UNTIL"
desc: "Implement an until loop"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","36-function_UNTIL.html.md"]
category: "reference"
---


The `UNTIL` function implements an *until* loop. 
It takes two [macros]({{ site.baseurl}}/reference/functions/macros) as arguments from the stack :  the code 
to execute until the condition is true and the condition to evaluate after every iteration.

## Example ##

WarpScript commands:

    // Exec macro: we generate a random number between 0 and 1
    <% 'Random number' RAND %>


    // Condition macro:  we loop until it's smaller or equal than 0.1 bigger than 0.1
    <% DUP 0.1 <= %>

    UNTIL

    // Then the las number found should be smaller or equal to 0.1
    'smaller or equal to 0.1'



Possible stack (not deterministic, as we are using random numbers):

    TOP:  "smaller or equal to 0.1"
    1:    0.000031952872846630065
    2:    "Random number"
    3:    0.3446472729940112
    4:    "Random number"
    5:    0.6561975153591558
    6:    "Random number"
    7:    0.8955039990792318
    8:    "Random number"
    9:    0.31481194701963333
    10:   "Random number"

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">5
<%                          // Exec macro: we duplicate the top of the stack and we decrease it by one
DUP
1 - 
%> 
<% DUP 1 <= %>               // Condition macro: top of the stack bigger than 1
UNTIL
'smaller or equal to 1'     // Then the last number found should be smaller or equal to 1
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">5
<%                          // Exec macro: we duplicate the top of the stack and we decrease it by one
DUP
1 - 
%> 
<% DUP 1 <= %>               // Condition macro: top of the stack bigger than 1
UNTIL
'smaller or equal to 1'     // Then the last number found should be smaller or equal to 1
'smaller or equal to 1' == ASSERT   1 == ASSERT
2 == ASSERT         3 == ASSERT
4 == ASSERT         5 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}            
