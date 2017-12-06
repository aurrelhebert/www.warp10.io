---
title: "LOG"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculate the natural logarithm"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","815-function_LOG.html.md"]
category: "reference"
---
 

The `LOG` function consumes a floating point number *x* from the top of the stack and pushes back its natural logarithm, *log<sub>e</sub>x*.


## Example ##

Initial stack:

    TOP: 10


WarpScript commands:

    LOG

Stack: 

    TOP: 2.302585092994046

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">10
LOG
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">10 LOG
EXP 
10 - ABS 10e-15 <= ASSERT   // Due to floating point arythmetic precision, we don't get 0 but some 8e-16
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
