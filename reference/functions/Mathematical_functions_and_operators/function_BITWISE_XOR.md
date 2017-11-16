---
title: "^"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Computes the bitwise XOR of the two arguments"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9250-function_BITWISE_XOR.html.md"]
category: "reference"
---
 

The `^` operator consumes two parameters *p<sub>1</sub>* and *p<sub>2</sub>* from the top of the stack 
and pushes onto the stack its bitwise XOR.

The two parameters must be LONG.


## Example ##

WarpScript commands:

    42 24 ^ 

Stack: 

    TOP:  50

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 24 ^ 
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">42 24 ^ 
50 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
