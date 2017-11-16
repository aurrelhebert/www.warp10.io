---
title: "ATAN"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculate the arctangent"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","809-function_ATAN.html.md"]
category: "reference"
---
 

The `ATAN` function consumes a floating point number between -1 et 1 from the top of the stack and pushes back its arctangent in radians.


## Example ##

Initial stack:

    TOP: 0.42


WarpScript commands:

    ATAN

Stack: 

    TOP: 0.3976279915221293

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0.42 
ASIN
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">0 ATAN 
0 == ASSERT 
1 ATAN 
0.7853981633974483 == ASSERT
-1 ATAN
-0.7853981633974483 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
