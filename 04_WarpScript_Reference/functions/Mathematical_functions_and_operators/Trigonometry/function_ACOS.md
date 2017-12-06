---
title: "ACOS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculate the arccosine"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","801-function_ACOS.html.md"]
category: "reference"
---
 

The `ACOS` function consumes a floating point number between -1 and 1 from the top of the stack and pushes back its arccosine in radians.


## Example ##

Initial stack:

    TOP: 0.42


WarpScript commands:

    ACOS

Stack: 

    TOP: 1.1373510067250105

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0.42 
ACOS
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0 ACOS 
pi 2 / == ASSERT  // ~pi/2
1 ACOS 
0 == ASSERT
-1 ACOS
pi == ASSERT 
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
