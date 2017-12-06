---
title: "SINH"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculate hyperbolic sine"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","805-function_SINH.html.md"]
category: "reference"
---
 

The `SINH` function consumes a floating point number from the top of the stack and pushes back its hyperbolic sine.

The parameter is considered to be in radians.

## Example ##

Initial stack:

    TOP: 4.2


WarpScript commands:

    SINH

Stack: 

    TOP: 33.335667732052336


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">4.2 
SINH
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0 SINH 
0 == ASSERT
pi SINH
11.548739357257748 == ASSERT // Avec current precision we get sin(pi) == 1.2246467991473532e-16 
pi 2 / SINH
2.3012989023072947 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
