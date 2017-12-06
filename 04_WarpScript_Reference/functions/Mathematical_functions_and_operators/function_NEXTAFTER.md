---
title: "NEXTAFTER"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Returns the DOUBLE adjacent to the first argument in the direction of the second argument"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9520-function_NEXTAFTER.html.md"]
category: "reference"
---
 

The `NEXTAFTER` function consumes two numeric parameter from the top of the stack and pushes back the DOUBLE adjacent to the first argument in the direction of the second argument.


## Example ##

Initial stack:

    TOP:  42.42
    1:    0


WarpScript commands:

    NEXTAFTER

Stack: 

    TOP: 42.419999999999995


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42.42 
0
NEXTAFTER
42.42
50
NEXTAFTER
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42.42 
0
NEXTAFTER
42.419999999999995 == ASSERT
42.42
50
NEXTAFTER
42.42000000000001 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
