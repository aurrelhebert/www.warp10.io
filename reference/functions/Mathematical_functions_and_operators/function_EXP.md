---
title: "EXP"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Return e raised to the power of the argument"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","815-function_EXP.html.md"]
category: "reference"
---
 

The `EXP` function pushed on the stack the Euler's number *e* raised to the power of a floating point value *x* consumed from the top of the stack, i.e. *e<sup>x</sup>*.



## Example ##

Initial stack:

    TOP: 10


WarpScript commands:

    EXP

Stack: 

    TOP: 7.38905609893065

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">2
EXP
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">2 EXP
e e * 
- ABS             // The difference between '2 EXP' and 'e e *' in absolute value
1e-15 <= ASSERT   // Due to floating point arythmetic precision, we don't get 0 but some 8e-16
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
