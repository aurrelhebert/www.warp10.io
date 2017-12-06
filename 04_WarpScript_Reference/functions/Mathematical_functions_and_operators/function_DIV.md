---
title: "/"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Divide a number by another"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9204-function_DIV.html.md"]
category: "reference"
---


The `/` operator consumes two parameters from the top of the stack and pushes back the result of 
dividing the first one by the second one.

The two parameters must be of numeric types.


## Example ##

WarpScript commands:

    84 2 /

Stack:

    TOP: 42

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">84 2 /
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">84 2 /
42 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
