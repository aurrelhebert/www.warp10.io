---
title: "%"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculates the remainder of the division of two numbers"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9205-function_MOD.html.md"]
category: "reference"
---


The `%` operator consumes two parameters from the top of the stack and pushes back the remainder of division of the first one by the second one.

The two parameters must be of numeric types.


## Example ##

WarpScript commands:

    85 43 %

Stack:
 
    TOP: 42

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">85 43 %
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">85 43 %
42 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
