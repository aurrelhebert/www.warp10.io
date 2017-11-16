---
title: ">="
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Verify if the first parameter is greater or equal than the second"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9213-function_GE.html.md"]
category: "reference"
---
 

The `>=` operator consumes two parameters *p<sub>1</sub>* and *p<sub>2</sub>* from the top of the stack 
and pushes onto the stack *true* if  *p<sub>1</sub> >= p<sub>2</sub>*, else it pushes *false*.

The two parameters must be of numeric or string types.


## Example ##

WarpScript commands:

    21 23 + 
    42 
    >=

Stack: 

    TOP: true

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">21 23 + 
42 
>=
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">21 23 + 
42 
>= ASSERT
42 42 >= ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
