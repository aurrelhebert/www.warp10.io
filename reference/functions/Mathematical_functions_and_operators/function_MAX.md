---
title: "MAX"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculates the maximum of two numbers"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9500-function_MAX.html.md"]
category: "reference"
---
 

The `MAX` function consumes two numeric parameters from the top of the stack and pushes back their maximum (the biggest of them).


## Example ##

Initial stack:

    TOP: 42
    1:    7


WarpScript commands:

    MAX

Stack: 

    TOP: 42


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 
7
MAX
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 7 MAX
42 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
