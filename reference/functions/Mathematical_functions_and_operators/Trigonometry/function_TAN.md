---
title: "TAN"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculate the tangent"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","808-function_TAN.html.md"]
category: "reference"
---
 

The `TAN` function consumes a floating point number from the top of the stack and pushes back its tangent.

The parameter is considered to be in radians.

## Example ##

Initial stack:

    TOP: 4.2


WarpScript commands:

    TAN

Stack: 

    TOP: 1.7777797745088417

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">4.2 
TAN
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0 TAN
0 == ASSERT
pi TAN
1e-15 < ASSERT // Avec current precision we get tan(pi) == 1.2246467991473532e-16 
pi 2 / TAN
1e15 > ASSERT  // Avec current precision we get tan(pi/2) == 1.633123935319537E16
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
