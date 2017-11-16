---
title: "MIN"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculates the minimum of two numbers"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9500-function_MIN.html.md"]
category: "reference"
---
 

The `MIN` function consumes two numeric parameters from the top of the stack and pushes back their minimum (the smallest of them).


## Example ##

Initial stack:

    TOP: 42
    1:   77


WarpScript commands:

    MIN

Stack: 

    TOP: 42

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 
77
MIN
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 77 MIN
42 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
