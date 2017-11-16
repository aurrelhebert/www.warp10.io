---
title: "TORADIANS"
layout: "function"
isPage: "true"
link: "/warpscript/functions"
desc: "Convert from degrees to radians"
categoryTree: ["reference","functions"]
oldPath: ["30-functions","12-math","809-function_TORADIANS.html.md"]
category: "reference"
---
 

The `TORADIANS` function consumes a floating point number *x* from the top of the stack and pushes back its conversion from degrees to radians.


## Example ##

Initial stack:

    TOP: 90


WarpScript commands:

    TORADIANS

Stack: 

    TOP: 1.5707963267948966


{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">90
TORADIANS
</warp10-warpscript-widget>
{% endraw %}    


## Unit test ##

{% raw %}
<warp10-warpscript-widget backend="{{backend}}"  exec-endpoint="{{execEndpoint}}">90 TORADIANS
pi 2 /
== ASSERT
'unit test successful'
</warp10-warpscript-widget>
{% endraw %}        
