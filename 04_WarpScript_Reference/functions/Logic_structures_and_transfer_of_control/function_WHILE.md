---
title: "WHILE"
layout: "function"
isPage: "true"
link: "/warpscript/function_WHILE"
desc: "Implement a while loop"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","30-logic-structures","35-function_WHILE.html.md"]
category: "reference"
---


The `WHILE` function implements a *while* loop. 
It takes two [macros]({{ site.baseurl}}/reference/functions/macros) as arguments from the stack: the condition to evaluate and the code 
to execute while the condition is true.

## Example ##

WarpScript commands:

    // Condition macro: random number between 0 and 1 bigger than 0.1, and we keep the random number in the stack
    <% RAND DUP 0.1 > %>

    // Exec macro: we leave the random number from the stack and we say it's bigger than 0.1
    <% 'bigger than 0.1' %>

    WHILE

    // Then the las number found should be smaller or equal to 0.1
    'smaller or equal to 0.1'



Possible stack (not deterministic, as we are using random numbers):

    TOP:  "smaller or equal to 0.1"
    1:    0.06691183437734372
    2:    "bigger than 0.1"
    3:    0.4794917593917629
    4:    "bigger than 0.1"
    5:    0.13618119749076907
    6:    "bigger than 0.1"
    7:    0.9531093265035696
    8:    "bigger than 0.1"
    9:    0.8502621020132842
    10:   "bigger than 0.1"
    11:   0.592949853240089
    12:   "bigger than 0.1"
    13:   0.9623611479503654
    14:   "bigger than 0.1"
    15:   0.2720082869239986
    16:   "bigger than 0.1"
    17:   0.27160947546611025
    18:   "bigger than 0.1"
    19:   0.15480419084394081
    20:   "bigger than 0.1"
    21:   0.8640616168942384
    22:   "bigger than 0.1"
    23:   0.580184520354567

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">5
<% DUP 1 > %>               // Condition macro: top of the stack bigger than 1
<%                          // Exec macro: we say it's bigger than 1 and we decrement counter by 1
DUP
1 - 'index' STORE 
'bigger than 1'
$index 
%>
WHILE
'smaller or equal to 1'     // Then the last number found should be smaller or equal to 1
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">5
<% DUP 1 > %>               // Condition macro: top of the stack bigger than 1
<%                          // Exec macro: we say it's bigger than 1 and we decrement counter by 1
DUP
1 - 'index' STORE 
'bigger than 1'
$index 
%>
WHILE
'smaller or equal to 1'     // Then the last number found should be smaller or equal to 1
'smaller or equal to 1' == ASSERT   1 == ASSERT
'bigger than 1' == ASSERT           2 == ASSERT
'bigger than 1' == ASSERT           3 == ASSERT
'bigger than 1' == ASSERT           4 == ASSERT
'bigger than 1' == ASSERT           5 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}            
