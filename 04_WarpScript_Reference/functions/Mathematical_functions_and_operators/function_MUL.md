---
title: "*"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Multiply two numbers"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9203-function_MUL.html.md"]
category: "reference"
---
 

The `*` operator consumes two parameters from the top of the stack and pushes back the result of 
multiplying both of them.

The two parameters must be of numeric types.


## Example ##

WarpScript commands:

    21 2 *

Stack: 

    TOP: 42

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">21 2 *
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">21 2 *
42 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
