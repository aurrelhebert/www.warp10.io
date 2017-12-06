---
title: "TANH"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculate the hyperbolic tangent"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","808-function_TANH.html.md"]
category: "reference"
---
 

The `TANH` function consumes a floating point number from the top of the stack and pushes back its hyperbolic tangent.

The parameter is considered to be in radians.

## Example ##

Initial stack:

    TOP: 4.2


WarpScript commands:

    TANH

Stack: 

    TOP: 0.9995503664595334

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">4.2 
TANH
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0 TANH
0 == ASSERT
pi TANH
0.99627207622075 == ASSERT 
pi 2 / TANH
0.9171523356672744 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
