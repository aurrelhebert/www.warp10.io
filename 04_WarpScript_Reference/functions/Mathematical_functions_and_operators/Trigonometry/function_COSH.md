---
title: "COSH"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculate the hyperbolic cosine"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","800-function_COSH.html.md"]
category: "reference"
---
 

The `COSH` function consumes a floating point number from the top of the stack and pushes back its hyperbolic cosine.

The parameter is considered to be in radians.

## Example ##

Initial stack:

    TOP: 4.2


WarpScript commands:

    COSH

Stack: 

    TOP: 33.35066330887282

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">4.2 
COSH
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0 COSH 
1 == ASSERT
pi COSH
11.591953275521519 == ASSERT // Avec current precision we get sin(pi) == 1.2246467991473532e-16 
pi 2 / COSH
2.5091784786580567 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
