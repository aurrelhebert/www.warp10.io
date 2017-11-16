---
title: "SQRT"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculate the square root"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","810-function_SQRT.html.md"]
category: "reference"
---
 

The `SQRT` function consumes a numeric parameter from the top of the stack and pushes back its square root.

For negative numbers, SQRT returns *NaN*.


## Example ##

Initial stack:

    TOP: 42


WarpScript commands:

    SQRT

Stack: 

    TOP: 6.48074069840786

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 
SQRT
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 SQRT
6.48074069840786 == ASSERT
-1 SQRT
NaN == ASSERT 
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
