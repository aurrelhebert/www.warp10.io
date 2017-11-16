---
title: "=="
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Verify the equality of two parameters"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9207-function_EQ.html.md"]
category: "reference"
---
 

The `==` operator consumes two parameters *p<sub>1</sub>* and *p<sub>2</sub>* from the top of the stack 
and pushes onto the stack *true* if  *p<sub>1</sub>* and *p<sub>2</sub>* are equal, else it pushes *false*.

The two parameters must be of numeric, boolean or string types.


## Example ##

WarpScript commands:

    21 21 + 
    42 
    ==

Stack: 

    TOP: true

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">21 21 + 
42 
==
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">21 21 + 
42 
== ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
