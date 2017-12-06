---
title: "ABS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculates the absolute value of a number"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","400-function_ABS.html.md"]
category: "reference"
---
 

The `ABS` function consumes a numeric value from the top of the stack and pushes back its absolute value.

## Example ##

WarpScript commands:

    -42 
    ABS

Stack: 

    TOP: 42

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">-42
ABS
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">-42 ABS
42 ABS
== ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
