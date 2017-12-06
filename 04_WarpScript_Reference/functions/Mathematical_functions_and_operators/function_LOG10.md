---
title: "LOG10"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Calculate the common logarithm"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","815-function_LOG10.html.md"]
category: "reference"
---
 

The `LOG10` function consumes a floating point number *x* from the top of the stack and pushes back its common logarithm, *log<sub>10</sub>x*.


## Example ##

Initial stack:

    TOP: 100


WarpScript commands:

    LOG10

Stack: 

    TOP: 2

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">100
LOG10
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">1000 LOG10
3 == ASSERT
42 LOG10
1.6232492903979006 == ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
