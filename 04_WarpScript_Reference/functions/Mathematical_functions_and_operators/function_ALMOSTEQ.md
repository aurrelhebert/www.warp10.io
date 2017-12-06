---
title: "~="
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Verify if the difference between two numbers is lesser than a third argument"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","9208-function_ALMOSTEQ.html.md"]
category: "reference"
---
 

The `~=` operator consumes three parameters from the top of the stack, two operands *p<sub>1</sub>* and *p<sub>2</sub>* 
and a tolerance factor *lambda*, and pushes onto the stack *true* if  *|p<sub>1</sub>-p<sub>2</sub>| < lambda*, i.e. the difference 
between the two operands is lesser than *lambda*.

The two parameters must be of numeric types.

The operator `~=` is useful when making comparaisons betweet doubles, where floating point operations generate rounding errors.

## Example ##

WarpScript commands:

    1.001 
    1
    1e-3
    ~=

Stack: 

    TOP: true

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1.001 
1
1e-3
~=
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1.001 
1
1e-3
~= ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
