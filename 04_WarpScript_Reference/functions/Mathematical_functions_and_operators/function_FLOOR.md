---
title: "FLOOR"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Round a number to the nearest smaller long"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","700-function_FLOOR.html.md"]
category: "reference"
---
 

The `FLOOR` function consumes a numeric parameter from the top of the stack and pushes back the nearest long number smaller than the parameter.


## Example ##

Initial stack:

    TOP: 42.99


WarpScript commands:

    FLOOR

Stack: 

    TOP: 42

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42.99 
FLOOR
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42.99 
FLOOR
42 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
