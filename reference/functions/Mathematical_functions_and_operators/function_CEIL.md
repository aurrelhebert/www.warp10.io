---
title: "CEIL"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Round a number to the nearest bigger long"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","700-function_CEIL.html.md"]
category: "reference"
---
 

The `CEIL` function consumes a numeric parameter from the top of the stack and pushes back the nearest long number bigger than the parameter.


## Example ##

Initial stack:

    TOP: 42.42


WarpScript commands:

    CEIL

Stack: 

    TOP: 43

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42.42 
CEIL
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42.42 
CEIL
43 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
