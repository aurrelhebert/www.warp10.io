---
title: "SIN"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculate the sine"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","805-function_SIN.html.md"]
category: "reference"
---
 

The `SIN` function consumes a floating point number from the top of the stack and pushes back its sine.

The parameter is considered to be in radians.

## Example ##

Initial stack:

    TOP: 4.2


WarpScript commands:

    SIN

Stack: 

    TOP: -0.8715757724135882

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">4.2 
SIN
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0 SIN 
0 == ASSERT
pi SIN
1e-15 < ASSERT // Avec current precision we get sin(pi) == 1.2246467991473532e-16 
pi 2 / SIN
1 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
