---
title: "ROUND"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Round a number to the closest long"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","700-function_ROUND.html.md"]
category: "reference"
---
 

The `ROUND` function consumes a numeric parameter from the top of the stack and pushes back the long number the closest to the parameter. Ties are rounded in the direction of positive infinity.


## Example ##

Initial stack:

    TOP: 42.42


WarpScript commands:

    ROUND

Stack: 

    TOP: 42


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42.42 
ROUND
42.75
ROUND
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42.42 
ROUND
42 == ASSERT
42.75
ROUND
43 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
